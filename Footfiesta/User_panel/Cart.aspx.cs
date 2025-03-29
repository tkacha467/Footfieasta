using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Footfiesta
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_Username"] == null) // Check if session is null
            {
                Response.Redirect("Login.aspx"); // Redirect to login page
            }
        }
    }
}