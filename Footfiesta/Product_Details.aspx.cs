using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Footfiesta
{
    public partial class Product_Details : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();
        private void BindSizeData()
        {
            List<double> sizes = new List<double> { 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12, 12.5, 13, 13.5, 14 };

            // Convert list of doubles to list of objects with a property
            var sizeList = sizes.Select(size => new { SizeValue = size }).ToList();

            rptSizes.DataSource = sizeList;
            rptSizes.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if Session contains a valid Product_Id
                if (Session["SelectedProductId"] != null)
                {
                    string productId = Session["SelectedProductId"].ToString();
                    LoadProductDetails(productId);
                }
                else
                {
                    // Redirect to product listing page if session is empty
                    Response.Redirect("Products.aspx");
                }
           
                BindSizeData();
                if (Request.QueryString["id"] != null)
                {
                    int productId = Convert.ToInt32(Request.QueryString["id"]);
                    LoadProductDetails(productId); // Load and display product details
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {

        }
        private void LoadProductDetails(string productId)
        {
            string query = "SELECT Product_Name, Price, Description, Image_url FROM Products WHERE Product_Id = @ProductId";

            using (SqlConnection conn = db.connection())
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ProductId", productId);

                    // Check if the connection is already open before opening it
                    if (conn.State == System.Data.ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblProductName.Text = reader["Product_Name"].ToString();
                            lblPrice.Text = Convert.ToDecimal(reader["Price"]).ToString("C");
                            lblDescription.Text = reader["Description"].ToString();
                            imgProduct.ImageUrl = reader["Image_url"].ToString();
                        }
                    }
                }
            }
        }


        private void LoadProductDetails(int productId)
        {
            using (SqlConnection conn = db.connection())
            {
                string query = "SELECT * FROM Products WHERE Product_Id = @ProductID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ProductID", productId);

                    //conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read()) // If product exists
                        {
                            lblProductName.Text = reader["Product_Name"].ToString();
                            lblPrice.Text = "₹" + reader["Price"].ToString();
                            imgProduct.ImageUrl = reader["Image_url"].ToString(); // If storing image URLs
                            lblDescription.Text = reader["Description"].ToString();
                        }
                        else
                        {
                            Response.Write("<script>alert('Product not found!');</script>");
                        }
                    }
                }
            }
        }

    }
}
