using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Footfiesta
{
    public partial class Product_Details : System.Web.UI.Page
    {
        private void BindSizeData()
        {
            List<double> sizes = new List<double> { 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12, 12.5, 13, 13.5, 14 };

            // Convert list of doubles to list of objects with a property
            var sizeList = sizes.Select(size => new { SizeValue = size }).ToList();

            rptSizes.DataSource = sizeList;
            rptSizes.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSizeData();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {

        }
    }
}
