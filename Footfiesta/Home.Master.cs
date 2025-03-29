using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Footfiesta
{
    public partial class Home : System.Web.UI.MasterPage
    {
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

    }
}