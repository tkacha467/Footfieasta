using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Footfiesta
{
    public partial class Checkout : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_Username"] == null) // Check if session is null
            {
                Response.Redirect(ResolveUrl("~/Login.aspx")); // Redirect to login page
            }
            if (!IsPostBack)
            {
                if (Session["UserId"] != null && Session["CartItems"] != null && Session["CartTotal"] != null)
                {
                    DataSet cartItems = (DataSet)Session["CartItems"];
                    decimal total = Convert.ToDecimal(Session["CartTotal"]);

                    string productListHtml = "";

                    foreach (DataRow row in cartItems.Tables[0].Rows)
                    {
                        string productName = row["Product_Name"].ToString();
                        int quantity = Convert.ToInt32(row["Quantity"]);
                        decimal price = Convert.ToDecimal(row["Price"]);
                        decimal lineTotal = quantity * price;

                        productListHtml += $"<li><span>{quantity} x {productName}</span> <span>₹ {lineTotal.ToString("0.00")}</span></li>";
                    }

                    productList.InnerHtml = productListHtml;
                    subTotal.InnerText = "₹ " + total.ToString("0.00");
                    orderTotal.InnerText = "₹ " + total.ToString("0.00"); // No shipping, so same as subtotal
                }

            }
        }
        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] != null && Session["CartItems"] != null && Session["CartTotal"] != null)
            {
                int userId = Convert.ToInt32(Session["UserId"]);
                DataSet cartItems = (DataSet)Session["CartItems"];
                decimal total = Convert.ToDecimal(Session["CartTotal"]);

                int orderId = db.InsertOrder(userId, total);

                foreach (DataRow row in cartItems.Tables[0].Rows)
                {
                    db.ExecuteQuery($"INSERT INTO OrderItems_tbl (OrderId, Product_Id, Size_Id, Quantity, Price) VALUES ('{orderId}', '{row["Product_Id"]}', '{row["Size_Id"]}', '{row["Quantity"]}', '{row["Price"]}')");
                }

                db.InsertBillingDetails(orderId,ddlCountry.SelectedValue,txtFirstName.Text,  txtLastName.Text,txtCompanyName.Text,txtAddress1.Text,txtAddress2.Text,txtCity.Text,txtState.Text,txtZip.Text,txtEmail.Text,txtPhone.Text);

                db.ExecuteQuery($"DELETE FROM Cart_tbl WHERE User_Id = '{userId}'");

                Session.Remove("CartItems");
                Session.Remove("CartTotal");

                Response.Redirect("~/User_panel/Order_Complete.aspx?orderId=" + orderId);
            }
        }

    }
}