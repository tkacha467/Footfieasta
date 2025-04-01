using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Footfiesta
{
    public partial class Size_Management : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            db.connection();
            fill();
        }

        void fill()
        {
            GridView1.DataSource = db.SelectSize();
            GridView1.DataBind();

        }

        protected void btnAddSize_Click(object sender, EventArgs e)
        {
            if (btnAddSize.Text == "Add Size")
            {
                int count = db.InsertSize(Convert.ToDecimal(txtSize.Text));

                if (count > 0)
                {
                    Response.Write("Size Added Sucessfully....!");
                }
                txtSize.Text = "";
            }
            else
            {
                int count = db.UpdateSize(Convert.ToInt32(ViewState["id"]), Convert.ToDecimal(txtSize.Text));
                if (count > 0)
                {
                    Response.Write("< script > alert('Size Updated Sucessfully....!');</ script > ");
                }
                txtSize.Text = "";
                btnAddSize.Text = "Add Size";
            }
            fill();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {

        }

        protected void edit_btn_Command(object sender, CommandEventArgs e)
        {
            ViewState["id"] = Convert.ToInt32(e.CommandArgument);
            ViewState["Name"] = e.CommandName.ToString();

            txtSize.Text = ViewState["Name"].ToString();

            btnAddSize.Text = "Update";



        }

        protected void delete_btn_Command(object sender, CommandEventArgs e)
        {
            ViewState["id"] = Convert.ToInt32(e.CommandArgument);

            db.DeleteSize(Convert.ToInt32(ViewState["id"]));
            fill();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}