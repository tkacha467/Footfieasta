﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Footfiesta
{
    public partial class User_Login : System.Web.UI.Page
    {
        SqlCommand cmd;
        DBConnect db = new DBConnect();

        void conn()
        {
            db.connection();
        }
        protected void Page_Load(object sender, EventArgs e)
        {


            db.connection();

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            conn();
            cmd = new SqlCommand($"Select Count(*) from Users where Username = '{txtUsername.Text}' and Password = '{txtPassword.Text}';",db.connection());
            //int i = Convert.ToInt32(cmd.ExecuteScalar());
            object result = cmd.ExecuteScalar();
            //if (i>0)
            //{
            //    Session["User_Username"] = txtUsername.Text;

            //    Response.Write("User Login Sucessfully....!");
            //    Response.Redirect("Home.aspx");
            //}
            if (result != null)
            {
                int userId = Convert.ToInt32(result);
                Session["UserId"] = userId; // ✅ Store user ID for future
                Session["User_Username"] = txtUsername.Text;

                Response.Redirect("Home.aspx");
            }
            else
            {
                // Invalid login
            }
        }


    }
    }
