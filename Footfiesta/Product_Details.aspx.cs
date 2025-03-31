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
        DBConnect db = new DBConnect();

        // Bind size data (if needed for your case)
        private void BindSizeData()
        {
            // Check if rptSizes is null
            if (rptSizes == null)
            {
                Console.WriteLine("Error: rptSizes Repeater control is null.");
                return;
            }

            // List of sizes to display
            List<double> sizes = new List<double> { 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12, 12.5, 13, 13.5, 14 };

            // Creating a list of anonymous objects with the SizeValue property
            var sizeList = sizes.Select(size => new { SizeValue = size }).ToList();

            // Check if sizeList is not null or empty before binding
            if (sizeList != null && sizeList.Count > 0)
            {
                rptSizes.DataSource = sizeList;
                rptSizes.DataBind();
            }
            else
            {
                Console.WriteLine("Error: Size data is empty.");
            }
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if Session contains a valid Product_Id
                if (Session["SelectedProductId"] != null)
                {
                    string productId = Session["SelectedProductId"].ToString();
                    LoadProductDetails(productId); // Load and display product details
                }
                // Check if the productId is passed in the QueryString (for direct URL access or navigation)
                else if (Request.QueryString["id"] != null)
                {
                    string productId = Request.QueryString["id"];
                    LoadProductDetails(productId); // Load and display product details
                }
                else
                {
                    // Redirect to product listing page if no product is selected
                    Response.Redirect("Products.aspx");
                }

                // Bind size data if needed
                BindSizeData();

                // Bind other product details (example)
                
            }
        }

        // Load product details from the database
        private void LoadProductDetails(string productId)
        {
            string query = "SELECT Product_Name, Price, Description, Image_url FROM Products WHERE Product_Id = @ProductId";

            using (SqlConnection conn = db.connection())
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ProductId", productId);

                    try
                    {
                        if (conn.State == ConnectionState.Closed)
                        {
                            conn.Open();
                        }

                        // Create a DataAdapter and fill a DataTable
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        // Check if any data is returned
                        if (dt.Rows.Count > 0)
                        {
                            // Bind the DataTable to the Repeater
                            RepeaterProductDetails.DataSource = dt;
                            RepeaterProductDetails.DataBind();
                        }
                        else
                        {
                            // Handle the case where no data is found for the given productId
                            Response.Redirect("~/Products.aspx"); // Or show an error message
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle the exception (log it or show an error message)
                        lblDescription.Text = "Error loading product details: " + ex.Message;
                    }
                }
            }
        }


        // Add to cart functionality (implement as needed)
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            // Add the product to the user's cart (you can implement cart logic here)
            // For example, store product info in session or database
        }

        // Submit functionality (implement as needed)
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Handle form submission (you can implement form handling here)
        }
    }
}
