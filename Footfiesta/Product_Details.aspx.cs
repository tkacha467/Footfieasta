using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Footfiesta
{
    public partial class Product_Details : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        DBConnect db = new DBConnect();


        // Bind size data (if needed for your case)
        void fill()
        {
            // Use your DBConnect's ShowSize() method to fetch size data
            rptSizes.DataSource = db.ShowSize();
            rptSizes.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill(); // Bind size data to the repeater

                // Retrieve the Product_Id from the session
                string productId = Session["SelectedProductId"] as string;

                if (!string.IsNullOrEmpty(productId))
                {
                    // Fetch product details from the database
                    FetchProductDetails(productId);
                }
                else
                {
                    // Handle the case where Product_Id is not available
                    Response.Redirect("~/Products.aspx");
                }
            }
        }

        private void FetchProductDetails(string productId)
        {
           
            try
            {
                db.connection();

                string query = "SELECT Product_Name, Price, Description, Image_url FROM Products WHERE Product_Id = @ProductId";
                SqlCommand cmd = new SqlCommand(query, db.connection());
                cmd.Parameters.AddWithValue("@ProductId", productId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();

                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];
                    lblProductName.Text = row["Product_Name"].ToString();
                    lblPrice.Text = string.Format("{0:C}", row["Price"]);
                    lblDescription.Text = row["Description"].ToString();
                    imgProduct.ImageUrl = row["Image_url"].ToString();
                }
                else
                {
                    // Product not found message or logic
                }
            }
            finally
            {
                if (db.connection().State == ConnectionState.Open)
                {
                    db.connection().Close(); // always close manually if not using `using`
                }
            }

        }

        protected void btnAddToCart_Command1(object sender, CommandEventArgs e)
        {
            // Example logic to handle the "Add to Cart" action
            string productName = e.CommandArgument.ToString();
            // Perform your "Add to Cart" logic here (e.g., add the product to the user's cart session or database)
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            string productId = Session["SelectedProductId"] as string;
            int userId = Convert.ToInt32(Session["UserId"]); // assuming you're storing UserId in session
            int quantity = int.Parse(txtQuantity.Text);
            string selectedSizeValue = hdnSelectedSize.Value;

            if (string.IsNullOrEmpty(selectedSizeValue))
            {
                // Handle case when size is not selected
                // You can show a message or return
                return;
            }

            // Get Size_Id from Size table
            int sizeId = GetSizeIdByValue(selectedSizeValue);
            if (sizeId == -1)
            {
                // Handle invalid size (optional)
                return;
            }

            // Now insert into cart
            db.InsertCart(Convert.ToInt32(productId), userId, quantity, sizeId);

            // Redirect or notify success
            Response.Redirect("~/User_panel/Cart.aspx");
        }

        private int GetSizeIdByValue(string sizeValue)
        {
            db.connection();
            SqlCommand cmd = new SqlCommand("SELECT Size_Id FROM Size WHERE SizeValue = @SizeValue", db.connection());
            cmd.Parameters.AddWithValue("@SizeValue", sizeValue);

            object result = cmd.ExecuteScalar();
            if (result != null)
                return Convert.ToInt32(result);
            else
                return -1;
        }

    }
}
