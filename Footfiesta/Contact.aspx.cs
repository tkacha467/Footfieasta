using System;
using System.Web.UI;

namespace Footfiesta
{
    public partial class Contact : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();

        protected void Page_Load(object sender, EventArgs e)
        {
            db.connection();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            db.connection();
            int result = db.Insert_Contact(fname.Text, lname.Text, email.Text, subject.Text, message.Text);

            if (result > 0)
            {
                // Show success message using JavaScript
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('Your form has been successfully submitted!');", true);
                clear();
            }
            else
            {
                // Show error message if insertion fails
                ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alert('There was an error submitting your form. Please try again!');", true);
            }
        }

        void clear()
        {
            fname.Text = "";
            lname.Text = "";
            email.Text = "";
            subject.Text = "";
            message.Text = "";
        }
    }
}
