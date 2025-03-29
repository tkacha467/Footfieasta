using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace Footfiesta.Admin_penal
{
    public partial class Category : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_Username"] == null) // Check if session is null
            {
                Response.Redirect("Login.aspx"); // Redirect to login page
            }
            db.connection();
            fill();
        }
        void fill()
        {
            GridView1.DataSource = db.SelectCategory();
            GridView1.DataBind();

        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (btnsubmit.Text == "Submit")
            {
                int count = db.InsertCategory(txtC_name.Text);

                if (count > 0)
                {
                    Response.Write("Category Added Sucessfully....!");
                }
                txtC_name.Text = "";
            }
            else 
            {
                int count = db.UpdateCategory(Convert.ToInt32(ViewState["id"]), txtC_name.Text);
                if (count > 0)
                {
                    Response.Write("< script > alert('Category Updated Sucessfully....!');</ script > ");
                }
                txtC_name.Text = "";
                btnsubmit.Text = "Submit";
            }
            fill();
        }

        protected void edit_btn_Command(object sender, CommandEventArgs e)
        {
            ViewState["id"] = Convert.ToInt32(e.CommandArgument);
            ViewState["Name"] = e.CommandName.ToString();

            txtC_name.Text = ViewState["Name"].ToString();

            btnsubmit.Text = "Update";

          

        }

        protected void delete_btn_Command(object sender, CommandEventArgs e)
        {
            ViewState["id"] = Convert.ToInt32(e.CommandArgument);

            db.DeleteCategory(Convert.ToInt32(ViewState["id"]));
            fill();
        }
    }
}