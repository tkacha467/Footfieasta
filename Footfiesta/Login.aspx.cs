using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Footfiesta
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnMemberLogin_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Member Login Clicked!');</script>");
            Response.Redirect("User_Login.aspx");
        }

        protected void btnClubLogin_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Member Login Clicked!');</script>");
            Response.Redirect("Admin_login.aspx");
        }
    }
}