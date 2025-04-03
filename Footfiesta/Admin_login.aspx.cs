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
    public partial class Admin_login : System.Web.UI.Page
    {
        SqlCommand cmd;
        DBConnect db = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            db.connection();

        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            db.connection();
            cmd = new SqlCommand($"Select Count(*) from Admins where Username='{txtAdminUsername.Text}' and Password='{txtAdminPassword.Text}';", db.connection());
            int i = Convert.ToInt32(cmd.ExecuteScalar());

            if(i>0)
            {
                Session["Admin_Username"] = txtAdminUsername.Text;
                Response.Write("Admin Login Sucessfully...!");
                Response.Redirect("Home.aspx");
            }

        }
    }
}