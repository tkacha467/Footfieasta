using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace Footfiesta
{
    public partial class Product : System.Web.UI.Page
    {



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BindDataList();
            }
        }

        //private void BindDataList()
        //{
        //    string connStr = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
        //    using (SqlConnection conn = new SqlConnection(connStr))
        //    {
        //        string query = "SELECT Product_Id, Product_Name, Description, Price, Category_id, Image_url FROM Products";
        //        SqlDataAdapter da = new SqlDataAdapter(query, conn);
        //        DataTable dt = new DataTable();
        //        da.Fill(dt);
        //        DataList1.DataSource = dt;
        //        DataList1.DataBind();
        //    }
        //}

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_viewpage")
            {
                Response.Redirect("ProductDetails.aspx?ProductId=" + e.CommandArgument);
            }
            else if (e.CommandName == "cmd_adtc")
            {
                // Add to cart logic
            }
        }
    }
}