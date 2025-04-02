using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Footfiesta.Admin_panel
{
    public partial class Message : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            db.connection();
            if (Session["Admin_Username"] == null) // Check if session is null
            {
                Response.Redirect(ResolveUrl("~/Login.aspx")); // Redirect to login page
            }
            fill();

        }
        void fill()
        {
            db.connection();
            
            GridView1.DataSource = db.Select_Contact();
            GridView1.DataBind();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            db.connection();
            db.Delete_Contact(id);

            // Reload GridView after deleting
            fill();
        }
    }
}