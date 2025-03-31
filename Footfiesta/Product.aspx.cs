using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Footfiesta
{
    public partial class Product : System.Web.UI.Page
    {
        DataSet ds;
        SqlDataAdapter da;
        PagedDataSource pg;
        DBConnect db = new DBConnect();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();

                // Set a default category (Men: 2)
                ViewState["selectedCategory"] = 2;
                ViewState["id"] = 0; // Reset pagination
                display(2); // Load products for Men
            }
        }

        void display(int categoryId)
        {
            
            db.connection();
            string query = "SELECT * FROM Products WHERE Category_Id = @CategoryId";

            using (SqlCommand cmd = new SqlCommand(query, db.connection()))
            {
                cmd.Parameters.AddWithValue("@CategoryId", categoryId);
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
            }

            // If no products exist, redirect to Products.aspx
            if (ds.Tables[0].Rows.Count == 0)
            {
                Response.Redirect(ResolveUrl("~/Products.aspx"));
                return;
            }

            pg = new PagedDataSource
            {
                DataSource = ds.Tables[0].DefaultView,
                AllowPaging = true,
                PageSize = 16
            };

            if (ViewState["id"] == null)
            {
                ViewState["id"] = 0;
            }

            pg.CurrentPageIndex = Convert.ToInt32(ViewState["id"]);

            ButtonPrevious.Enabled = pg.CurrentPageIndex > 0;
            ButtonNext.Enabled = pg.CurrentPageIndex < (pg.PageCount - 1);

            Repeater1.DataSource = pg;
            Repeater1.DataBind();
        }

        protected void CategoryTab_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int categoryId = Convert.ToInt32(btn.CommandArgument);

            ViewState["selectedCategory"] = categoryId;
            ViewState["id"] = 0; // Reset pagination when changing categories

            display(categoryId);
        }

        protected void ButtonPrevious_Click(object sender, EventArgs e)
        {
            int categoryId = Convert.ToInt32(ViewState["selectedCategory"]);

            if (ViewState["id"] == null)
            {
                ViewState["id"] = 0;
            }

            int p = Convert.ToInt32(ViewState["id"]) - 1;
            ViewState["id"] = p < 0 ? 0 : p;

            display(categoryId);
        }

        protected void ButtonNext_Click(object sender, EventArgs e)
        {
            int categoryId = Convert.ToInt32(ViewState["selectedCategory"]);

            if (ViewState["id"] == null)
            {
                ViewState["id"] = 0;
            }

            int p = Convert.ToInt32(ViewState["id"]) + 1;
            ViewState["id"] = p;

            display(categoryId);
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
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

        void AddToCart(string productId)
        {
            List<string> cart = Session["Cart"] as List<string> ?? new List<string>();
            cart.Add(productId);
            Session["Cart"] = cart;
        }

        private void LoadCategories()
        {
            using (SqlConnection conn = db.connection())
            {
                string query = "SELECT Category_Id, Category_name FROM Category";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptCategories.DataSource = dt;
                rptCategories.DataBind();
            }
        }
    }
}
