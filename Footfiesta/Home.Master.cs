﻿using System;
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
            if (IsPostBack)
            {
                if (Session["User_Username"] != null && !string.IsNullOrEmpty(Session["User_Username"].ToString()))
                {
                    // Safe access to Session variable
                    string username = Session["User_Username"].ToString();

                    da = new SqlDataAdapter($"Select * from Users where Username='{username}'", db.connection());
                    ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0) // Check if data exists
                    {
                        string s = ds.Tables[0].Rows[0][1].ToString();
                        lblUsername.Text = s;
                    }
                    else
                    {
                        // Redirect to login if session is null or empty
                         Response.Redirect(ResolveUrl("~/Login.aspx"));
                    }
                }
         
                display(); // Additional logic
            }

        }

      

        //public void showUser(string username)
        //{
        //    DataSet ds = db.User_profile(username);
        //    if(ds.Tables[0].Rows.Count>0)
        //    {
        //        DataRow dr = ds.Tables[0].Rows[0];
        //        lblFullName.Text = dr["FullName"].ToString();
        //        lblEmail.Text = dr["Email"].ToString();
        //        lblUsername.Text = dr["Username"].ToString();
        //        lblAddress.Text = dr["Address"].ToString();
        //    }

        //}
        protected void lnkChangePassword_Click(object sender, EventArgs e)
        {
            // Try just redirecting for now
            Response.Redirect("~/ChangePassword.aspx");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect(ResolveUrl("~/Home.aspx"));
        }

        protected void rptPagination_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Page")
            {
                ViewState["id"] = Convert.ToInt32(e.CommandArgument) - 1; // Set page index (0-based)
                display();
            }
        }

        void display()
        {
            try
            {
                db.connection();
                da = new SqlDataAdapter("SELECT * FROM Products", db.connection());
                ds = new DataSet();
                da.Fill(ds);

                pg = new PagedDataSource
                {
                    DataSource = ds.Tables[0].DefaultView,
                    AllowPaging = true,
                    PageSize = 8
                };

                if (ViewState["id"] == null)
                {
                    ViewState["id"] = 0;
                }

                int currentPage = Convert.ToInt32(ViewState["id"]);
                pg.CurrentPageIndex = currentPage;

                // Ensure Repeater2 is not null before binding
                if (Repeater2 != null)
                {
                    Repeater2.DataSource = pg;
                    Repeater2.DataBind();
                }
                else
                {
                    Response.Write("<script>console.log('Repeater2 is null. Check its ID and Page_Load logic.');</script>");
                }

                // Bind dynamic page numbers to pagination Repeater
                int totalPages = pg.PageCount;
                if (totalPages > 1 && rptPagination != null)
                {
                    List<int> pages = Enumerable.Range(1, totalPages).ToList();
                    rptPagination.DataSource = pages;
                    rptPagination.DataBind();
                }

                // Update button states
                if (btnPrev != null)
                    btnPrev.Enabled = (currentPage > 0);

                if (btnNext != null)
                    btnNext.Enabled = (currentPage < (pg.PageCount - 1));
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
      


        protected void btnPrev_Click(object sender, EventArgs e)
        {
            if (ViewState["id"] == null)
            {
                ViewState["id"] = 0;
            }

            int currentPage = Convert.ToInt32(ViewState["id"]);
            if (currentPage > 0)
            {
                ViewState["id"] = currentPage - 1;
            }

            display();
        }
        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (ViewState["id"] == null)
            {
                ViewState["id"] = 0;
            }

            int currentPage = Convert.ToInt32(ViewState["id"]);
            int totalPages = pg.PageCount;

            if (currentPage < totalPages - 1)
            {
                ViewState["id"] = currentPage + 1;
            }

            display();
        }

        protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
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
            using (SqlConnection conn = db.connection())  // Ensure you are getting a valid connection
            {
                string query = "SELECT Product_Id FROM Products WHERE Product_Name LIKE @Search";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Search", "%" + searchQuery + "%");

                    try
                    {
                        conn.Open(); // 🔴 Ensure the connection is open before executing

                        object result = cmd.ExecuteScalar(); // Get the first matching ProductID

                        if (result != null) // If product found
                        {
                            int productId = Convert.ToInt32(result);
                            Response.Redirect($"~/Product_Details.aspx?Product_Id={productId}"); // Redirect to product page
                        }
                        else
                        {
                            Response.Write("<script>alert('Product not found!');</script>");
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                    }
                    finally
                    {
                        conn.Close(); // 🔴 Ensure the connection is closed after execution
                    }
                }
            }
        }


        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Repeater2_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "cmd_viewpage")
            {
                // Store Product_Id in Session
                Session["SelectedProductId"] = e.CommandArgument.ToString();

                // Redirect to Product_Details.aspx
                if (Session["SelectedProductId"] != null)
                {
                    Response.Redirect(ResolveUrl("~/Product_Details.aspx"));
                }
                else
                {
                    Response.Redirect(ResolveUrl("~/Products.aspx"));
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/Product.aspx"));
        }



       
    }

}

