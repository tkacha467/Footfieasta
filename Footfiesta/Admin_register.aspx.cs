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
    public partial class Admin_register : System.Web.UI.Page
    {
        SqlCommand cmd;
        DBConnect db = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            db.connection();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            db.connection();
            db.RegisterAdmin(txtFullName.Text,txtEmail.Text,txtUsername.Text,txtPassword.Text,ddlRole.SelectedValue,txtContact.Text);
            

        }
    }
}