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
    public partial class Cart : System.Web.UI.Page
    {
        
        DBConnect db = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User_Username"] == null) // Check if session is null
                {
                    Response.Redirect(ResolveUrl("~/Login.aspx")); // Redirect to login page
                }
                try
                {
                    LoadCart();
                }
                catch (Exception ex)
                {
                    // Log the error or display a message for debugging
                    Response.Write("Error Loading cart: " + ex.Message);
                }
                if (Session["UserId"] == null)
                {
                    Response.Write("You'r not loged in!");
                }


            }
        }
       
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "remove")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                int userId = Convert.ToInt32(Session["UserId"]);

                // Delete from cart based on product and user
                db.ExecuteQuery($"DELETE FROM Cart_tbl WHERE Product_Id = '{productId}' AND User_Id = '{userId}'");

                // Reload cart
                LoadCart();
            }
        }

        protected void btnOrderNow_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                int userId = Convert.ToInt32(Session["UserId"]);
                DataSet cartItems = db.CartItmes(userId);

                if (cartItems.Tables[0].Rows.Count > 0)
                {
                    decimal total = 0;
                    foreach (DataRow row in cartItems.Tables[0].Rows)
                    {
                        decimal price = Convert.ToDecimal(row["Price"]);
                        int quantity = Convert.ToInt32(row["Quantity"]);
                        total += price * quantity;
                    }

                    // Store cart items and total in Session
                    Session["CartItems"] = cartItems;
                    Session["CartTotal"] = total;

                    // Redirect to checkout form page
                    Response.Redirect(ResolveUrl("~/User_panel/checkout.aspx"));
                }
            }

        }
        public void ClearCart(int userId)
        {
            string query = "DELETE FROM Cart_tbl WHERE User_Id = @UserId";
            SqlCommand cmd = new SqlCommand(query, db.connection());
            cmd.Parameters.AddWithValue("@UserId", userId);
            db.connection().Open();
            cmd.ExecuteNonQuery();
            db.connection().Close();
        }


        private void LoadCart()
        {
            if (Session["UserId"] != null)
            {
                int userId = Convert.ToInt32(Session["UserId"]);
                DataSet ds = db.CartItmes(userId);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    // Add a label or log here to check if no data is returned
                    Response.Write("No item Found");
                }
                else
                {
                    Repeater1.DataSource = ds;
                    Repeater1.DataBind();
                }

                decimal subtotal = 0;
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    decimal price = Convert.ToDecimal(row["Price"]);
                    int quantity = Convert.ToInt32(row["Quantity"]);
                    subtotal += price * quantity;
                }

                lblSubtotal.Text = subtotal.ToString("C");
                lblDelivery.Text = "$0.00";
                lblTotal.Text = subtotal.ToString("C"); // Since delivery is 0
            }
        }

    }
}