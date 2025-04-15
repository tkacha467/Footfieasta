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
            if (Session["UserId"] == null)
            {
                Response.Redirect("~/User_login.aspx");
                return;
            }
            if (Session["User_Username"] == null) // Check if session is null
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please login to add to cart!');", true);
                Response.Redirect(ResolveUrl("~/Login.aspx")); // Redirect to login page
            }
            if (Session["SelectedProductId"] != null)
            {
                ViewState["PID"] = Session["SelectedProductId"].ToString();
                //LoadProductDetails(productId); // Load and display product details
            }
            // Check if the productId is passed in the QueryString (for direct URL access or navigation)
            else if (Request.QueryString["id"] != null)
            {
                string productId = Request.QueryString["id"];
                //LoadProductDetails(productId); // Load and display product details
            }
            else
            {
                // Redirect to product listing page if no product is selected
                Response.Redirect("Products.aspx");
            }

            fill();
        }
        //private void LoadProductDetails(string productId)
        //{
        //    string query = "SELECT Product_Name, Price, Description, Image_url FROM Products WHERE Product_Id = @ProductId";

        //    using (SqlConnection conn = db.connection())
        //    {
        //        using (SqlCommand cmd = new SqlCommand(query, conn))
        //        {
        //            cmd.Parameters.AddWithValue("@ProductId", productId);

        //            try
        //            {
        //                if (conn.State == ConnectionState.Closed)
        //                {
        //                    conn.Open();
        //                }

        //                // Create a DataAdapter and fill a DataTable
        //                SqlDataAdapter da = new SqlDataAdapter(cmd);
        //                DataTable dt = new DataTable();
        //                da.Fill(dt);

        //                // Check if any data is returned
        //                if (dt.Rows.Count > 0)
        //                {
        //                    // Bind the DataTable to the Repeater
        //                    Repeater1.DataSource = dt;
        //                    Repeater1.DataBind();
        //                }
        //                else
        //                {
        //                    // Handle the case where no data is found for the given productId
        //                    Response.Redirect("~/Products.aspx"); // Or show an error message
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //                // Handle the exception (log it or show an error message)
        //                Response.Write("Error loading product details: " + ex.Message);
        //            }
        //        }
        //    }
        //}

        void fill() {
            Repeater1.DataSource = db.CartItmes(Convert.ToInt32(ViewState["PID"]));
            Repeater1.DataBind();
        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}