using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Footfiesta.Admin_panel
{
    public partial class Show_cart : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        public void BindGrid()
        {
            GridViewOrders.DataSource = db.Manage_order();
            GridViewOrders.DataBind();
        }

        protected void chkDelivered_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;
            GridViewRow row = (GridViewRow)chk.NamingContainer;
            string orderId = GridViewOrders.DataKeys[row.RowIndex].Value.ToString();
            string newStatus = chk.Checked ? "delivered" : "pending";

            db.ChangeStatus(orderId, newStatus);
            BindGrid();
        }

    }
}