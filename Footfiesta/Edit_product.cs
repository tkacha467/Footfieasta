using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Footfiesta
{
    public class Edit_product
    {
        string s = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;
        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        public void connection()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        public void insert(string url, string price,string pnm )
        {
            connection();
            SqlCommand cmd = new SqlCommand($"insert into Products (ImageUrl,ProductName,Price) values('{url}','{price}','{pnm}')", con);
            cmd.ExecuteNonQuery();
        }
    }
}