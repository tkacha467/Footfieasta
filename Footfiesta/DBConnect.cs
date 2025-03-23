using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Footfiesta
{
    public class DBConnect
    {
        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;

        public void connection()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        public int InsertCategory(string c_name)
        {
            
            cmd = new SqlCommand($"INSERT INTO Category (Category_name) VALUES ('{c_name}');", con);
            return cmd.ExecuteNonQuery();
        }
        public DataSet SelectCategory()
        {
            da = new SqlDataAdapter("Select * from Category ", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public int UpdateCategory(int id,string name)
        {
            
            cmd = new SqlCommand($"Update Category set Category_name='{name}' where Category_Id='{id}';", con);
            return cmd.ExecuteNonQuery();
        }
        public void DeleteCategory(int id)
        {
           
            cmd = new SqlCommand($"Delete from Category where Category_Id='{id}';", con);
            cmd.ExecuteNonQuery();
        }
        public int InsertProduct(string p_name, string desc, decimal price,int c_id,string image)
        {
            connection();
            cmd = new SqlCommand($"INSERT INTO Products (Product_Name,Description,Price,Category_id,Image_url) VALUES ('{p_name}', '{desc}', '{price}','{c_id}', '{image}');", con);
            return cmd.ExecuteNonQuery();
        }
    }
}
