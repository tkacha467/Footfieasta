using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Footfiesta
{
    public partial class Home : System.Web.UI.MasterPage
    {
        DBConnect db = new DBConnect();
        protected System.Web.UI.WebControls.LinkButton btnSearch;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            // Clear all session variables
            Session.Clear();
            Session.Abandon();

            // Remove authentication cookies (if applicable)
            Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddDays(-1);

            // Redirect to Home page after logout
            Response.Redirect(ResolveUrl("~/Home.aspx"));
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string searchQuery = txtsearch.Text.Trim(); // Get user input

            if (!string.IsNullOrEmpty(searchQuery))
            {
                SearchProduct(txtsearch.Text.Trim()); // txtSearch is the search box
            }
        }
        private void SearchProduct(string searchQuery)
        {
            using (SqlConnection conn = db.connection())
            {
                string query = "SELECT Product_Id FROM Products WHERE Product_Name LIKE @Search";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Search", "%" + searchQuery + "%");

                    //conn.Open();
                    object result = cmd.ExecuteScalar(); // Get the first matching ProductID

                    if (result != null) // If product found
                    {
                        int productId = Convert.ToInt32(result);
                        Response.Redirect($"~/User_panel/Product_Details.aspx?id={productId}"); // Redirect to product page
                    }
                    else
                    {
                        // Show alert or redirect to 'No Product Found' page
                        Response.Write("<script>alert('Product not found!');</script>");
                    }
                }
            }
        }

        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {

        }
    }

}

