using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Footfiesta
{
    public class Edit_product
    {
        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        private readonly string s = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;

        public void connection()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        public void Insert(string imageUrl, string price, string productName)
        {
            connection();
            cmd = new SqlCommand("INSERT INTO Products (ImageUrl, ProductName, Price) VALUES (@ImageUrl, @ProductName, @Price)", con);
            cmd.Parameters.AddWithValue("@ImageUrl", imageUrl);
            cmd.Parameters.AddWithValue("@ProductName", productName);
            cmd.Parameters.AddWithValue("@Price", price);

            cmd.ExecuteNonQuery();
            con.Close(); // Close connection after use
        }
    }
}
