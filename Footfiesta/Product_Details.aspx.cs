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

        void fill()
        {
            rptSizes.DataSource = db.ShowSize();
            rptSizes.DataBind();
        }
        // Bind size data (if needed for your case)
       



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
                fill();

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
           
               
            
        }

        // Submit functionality (implement as needed)
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Handle form submission (you can implement form handling here)
        }

        protected void btnAddToCart_Command(object sender, CommandEventArgs e)
        {

            // Store Product_Id in Session
            Session["SelectedProductId"] = e.CommandArgument.ToString();

            // Redirect to Product_Details.aspx
            if (Session["SelectedProductId"] != null)
            {
                db.InsertCart(Convert.ToInt32(Session["SelectedProductId"]), Convert.ToInt32(Session["User_Username"]), Convert.ToInt32(txtQuantity.Text));
                Response.Redirect(ResolveUrl("~/Cart.aspx"));
            }
            else
            {
                Response.Redirect(ResolveUrl("~/Products.aspx"));
            }
        }
    }
}
