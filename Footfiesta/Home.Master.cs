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
        DataSet ds;
        SqlDataAdapter da;
        PagedDataSource pg;
        DBConnect db = new DBConnect();
        int p, row;
      
        protected System.Web.UI.WebControls.LinkButton btnSearch;
        protected Repeater Repeater1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                display();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        void display()
        {
            db.connection();
            da = new SqlDataAdapter("SELECT * FROM Products", db.connection());
            ds = new DataSet();
            da.Fill(ds);

            pg = new PagedDataSource();
            pg.DataSource = ds.Tables[0].DefaultView;
            pg.AllowPaging = true;
            pg.PageSize = 8;

            // Ensure ViewState["id"] is initialized
            if (ViewState["id"] == null)
            {
                ViewState["id"] = 0;
            }

            pg.CurrentPageIndex = Convert.ToInt32(ViewState["id"]);

            // Bind DataList1 to the paged data source
            if (Repeater2 != null)
            {
                Repeater2.DataSource = pg;
                Repeater2.DataBind();
            }
        }


        protected void ButtonPrevious_Click(object sender, EventArgs e) // for previous
        {
            // Ensure display() is called before using pg
            display();


            if (pg == null)
            {
                return; // Prevent error if pg is not initialized
            }

            // Ensure ViewState["id"] is properly initialized
            if (ViewState["id"] == null)
            {
                ViewState["id"] = 0;
            }

            // Decrement page index
            int p = Convert.ToInt32(ViewState["id"]) - 1;

            // Ensure it doesn't go below 0
            if (p < 0)
            {
                p = 0;
            }

            ViewState["id"] = p;

            // Disable Previous button when on the first page
            ButtonPrevious.Enabled = (p > 0);

            // Enable Next button when not on the last page
            ButtonNext.Enabled = true;

            // Refresh the display
            display();

        }

        protected void ButtonNext_Click(object sender, EventArgs e) // for next
        {
            // Ensure display() is called before using pg
            display();


            if (pg == null)
            {
                // Prevent error if pg is not properly initialized
                return;
            }

            ButtonPrevious.Enabled = true;

            // Ensure ViewState["id"] is properly initialized
            if (ViewState["id"] == null)
            {
                ViewState["id"] = 0;
            }

            // Increment the page index
            int p = Convert.ToInt32(ViewState["id"]) + 1;
            ViewState["id"] = p;

            // Calculate total number of pages
            int temp = (pg.DataSourceCount / pg.PageSize);

            // Disable the next button when the last page is reached
            if (p >= temp)
            {
                ButtonNext.Enabled = false;
            }

            // Refresh the display
            display();

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
                        Response.Redirect($"~/Product_Details.aspx?id={productId}"); // Redirect to product page
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Product.aspx"));
        }

        protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            
        }
    }

}

