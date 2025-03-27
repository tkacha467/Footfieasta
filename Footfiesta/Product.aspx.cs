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
                display();
            }
        }
        public string FormatDescription(string description, string productId)
        {
            int maxLength = 50;
            if (!string.IsNullOrEmpty(description) && description.Length > maxLength)
            {
                string shortDesc = description.Substring(0, maxLength) + "... ";
                string moreLink = $"<a href='javascript:void(0);' onclick='showFullDescription(\"desc_{productId}\")' style='color:#008080; text-decoration:none;'>more</a>";
                return $"<span data-full='{description}'>{shortDesc}{moreLink}</span>";
            }
            return description;
        }



        protected void btnNext_Click(object sender, EventArgs e)
        {
            int currentPage = Convert.ToInt32(ViewState["id"]);
            if (currentPage < pg.PageCount - 1)
            {
                ViewState["id"] = currentPage + 1;
                display();
            }
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            int currentPage = Convert.ToInt32(ViewState["id"]);
            if (currentPage > 0)
            {
                ViewState["id"] = currentPage - 1;
                display();
            }
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
            pg.PageSize = 5;

            // Ensure ViewState["id"] is initialized
            if (ViewState["id"] == null)
            {
                ViewState["id"] = 0;
            }

            pg.CurrentPageIndex = Convert.ToInt32(ViewState["id"]);

            // Bind DataList1 to the paged data source
            Repeater1.DataSource = pg;
            Repeater1.DataBind();
        }

    }
}