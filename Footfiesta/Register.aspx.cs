using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Footfiesta
{
    public partial class Registration : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            db.connection();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            db.connection();
            db.RegisterUser(txtFullName.Text, txtEmail.Text, txtUsername.Text, txtPassword.Text, txtPhoneNumber.Text,txtAddress.Text);
        }

        
    }
}