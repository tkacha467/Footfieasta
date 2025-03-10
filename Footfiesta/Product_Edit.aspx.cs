using System;
using System.IO;
using System.Web.UI;

namespace Footfiesta
{
    public partial class Product_Edit : System.Web.UI.Page
    {
        Edit_product ep = new Edit_product(); // Instantiate once

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dlbind();
            }
        }

        void clear()
        {
            txtProductName.Text = "";
            txtPrice.Text = "";
            txtImageUrl.Text = "";
        }

        void dlbind()
        {
            // Implement if needed (fetch data and bind to UI control)
        }

        void connection()
        {
            ep.connection();
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
                            string fileName = Path.GetFileName(fileUploadImage.FileName);
                            string filePath = Server.MapPath("~/Images/datalist/" + fileName);
                            fileUploadImage.SaveAs(filePath);

                            // Insert into database
                            ep.Insert(fileName, txtPrice.Text, txtProductName.Text);

                            Response.Write("<script>alert('File uploaded and data inserted successfully!');</script>");
                            clear();
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
                    // Log error
                    System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
                    Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                }
            }
        }
    }
}
