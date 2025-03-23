using System;
using System.IO;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;

namespace Footfiesta.Admin_penal // Ensure this matches ASPX
{
    public partial class Add_product : System.Web.UI.Page
    {
        string imagename;
        DBConnect db = new DBConnect(); // Instantiate once
        DataSet ds;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Prevent dropdown from resetting on postback
            {
                db.connection();
                ds = db.SelectCategory();
                ddlcategory.DataSource = ds;
                ddlcategory.DataTextField = ds.Tables[0].Columns[1].ColumnName;
                ddlcategory.DataValueField = ds.Tables[0].Columns[0].ColumnName;
                ddlcategory.DataBind();
            }
        }

        void clear()
        {
            txtProductName.Text = "";
            txtPrice.Text = "";
            txtdesc.Text = "";
            ddlcategory.ClearSelection();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (fileUploadImage.HasFile)
            {
                try
                {
                    string extension = Path.GetExtension(fileUploadImage.FileName).ToLower();
                    if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
                    {
                        if (fileUploadImage.PostedFile.ContentLength <= 1024000) // 1MB limit
                        {
                            string folderPath = Server.MapPath("~/Images/datalist/");
                            if (!Directory.Exists(folderPath))
                            {
                                Directory.CreateDirectory(folderPath);
                            }

                            imagename = "../Images/datalist/" + fileUploadImage.FileName;
                            fileUploadImage.SaveAs(Path.Combine(folderPath, fileUploadImage.FileName));

                            // Insert into database
                            int count = db.InsertProduct(txtProductName.Text, txtdesc.Text,
                                Convert.ToDecimal(txtPrice.Text), Convert.ToInt32(ddlcategory.SelectedValue), imagename);

                            if (count > 0)
                            {
                                Response.Write("<script>alert('File uploaded and data inserted successfully!');</script>");
                                clear();
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('File size should be less than 1MB.');</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Only JPG, JPEG, and PNG formats are allowed.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }
    }
}
