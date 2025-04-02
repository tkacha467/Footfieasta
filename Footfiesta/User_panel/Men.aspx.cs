using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Footfiesta
{
    public partial class Men : System.Web.UI.Page
    {
        DataSet ds;
        SqlDataAdapter da;
        PagedDataSource pg;
        DBConnect db = new DBConnect();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_Username"] == null) // Check if session is null
            {
                Response.Redirect(ResolveUrl("~/Login.aspx")); // Redirect to login page
            }
            if (!IsPostBack)
            {
                ViewState["id"] = 0; // Reset pagination
                DisplayMenProducts(); // Load products for Men category (ID = 2)
            }
        }

        void DisplayMenProducts()
        {
            db.connection();
            string query = "SELECT * FROM Products WHERE Category_Id = 2"; // Only Men's Category

            using (SqlCommand cmd = new SqlCommand(query, db.connection()))
            {
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
            }

            // If no products exist, show a message
            if (ds.Tables[0].Rows.Count == 0)
            {
                NoProductsLabel.Visible = true;
                Repeater1.Visible = false;
                return;
            }
            else
            {
                NoProductsLabel.Visible = false;
                Repeater1.Visible = true;
            }

            pg = new PagedDataSource
            {
                DataSource = ds.Tables[0].DefaultView,
                AllowPaging = true,
                PageSize = 12
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

        protected void ButtonPrevious_Click(object sender, EventArgs e)
        {
            if (ViewState["id"] == null)
            {
                ViewState["id"] = 0;
            }

            int p = Convert.ToInt32(ViewState["id"]) - 1;
            ViewState["id"] = p < 0 ? 0 : p;

            DisplayMenProducts();
        }

        protected void ButtonNext_Click(object sender, EventArgs e)
        {
            if (ViewState["id"] == null)
            {
                ViewState["id"] = 0;
            }

            int p = Convert.ToInt32(ViewState["id"]) + 1;
            ViewState["id"] = p;

            DisplayMenProducts();
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
       

    }
}
