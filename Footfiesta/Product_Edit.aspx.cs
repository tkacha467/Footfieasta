using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

namespace Footfiesta
{
    public partial class Product_Edit : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        Edit_product ep;
        string image;

        void connection()
        {
            ep = new Edit_product();
            ep.connection();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            connection();
        }
        void clear()
        {
            txtProductName.Text = "";
            txtPrice.Text = "";
            txtImageUrl.Text = "";
        }
        void dlbind()
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            connection();
            if (fileUploadImage.HasFiles)
            {
                try
                {
                    string extension = Path.GetExtension(fileUploadImage.FileName);
                    if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
                    {
                        if (fileUploadImage.PostedFile.ContentLength <= 1024000)
                        {
                            string fname = Path.GetFileName(fileUploadImage.FileName);
                            connection();
                            fileUploadImage.SaveAs(Server.MapPath("Images/datalist/" + fname));
                            ep = new Edit_product();
                            ep.insert(fname, txtPrice.Text,txtProductName.Text);
                            int t = cmd.ExecuteNonQuery();
                            if (t > 0)
                            {
                                Response.Write("<script>alert('file uploaded successfully!')</script>");
                                clear();
                                dlbind();
                            }
                        }

                    }
                }
                catch (Exception ex)
                {
                    // Log the error for debugging (optional)
                    System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);

                    // Show an alert message to the user
                    Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                }

            }
        }
    }
}
