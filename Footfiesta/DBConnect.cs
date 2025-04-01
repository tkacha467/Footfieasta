using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;

namespace Footfiesta
{
    public class DBConnect
    {
        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["Connection"].ConnectionString;


        public SqlConnection connection()
        {
            con = new SqlConnection(s);
            con.Open();

            //// Ensure that the connection is closed before returning it
            //if (con.State == ConnectionState.Open)
            //{
            //    con.Close();
            //}

            return con;
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
        public int UpdateCategory(int id, string name)
        {

            cmd = new SqlCommand($"Update Category set Category_name='{name}' where Category_Id='{id}';", con);
            return cmd.ExecuteNonQuery();
        }
        public void DeleteCategory(int id)
        {

            cmd = new SqlCommand($"Delete from Category where Category_Id='{id}';", con);
            cmd.ExecuteNonQuery();
        }
        public int InsertProduct(string p_name, string desc, decimal price, int c_id, string image)
        {
            connection();
            cmd = new SqlCommand($"INSERT INTO Products (Product_Name,Description,Price,Category_id,Image_url) VALUES ('{p_name}', '{desc}', '{price}','{c_id}', '{image}');", con);
            return cmd.ExecuteNonQuery();
        }

        public DataSet SelectProduct(int p_id)
        {
            connection();
            da = new SqlDataAdapter($"Select Product_name,Description,Price,Category_id from Products where Product_id='{p_id}'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet SelectProduct()
        {
            da = new SqlDataAdapter($"Select * from Products", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int updateProduct(int p_id, string p_name, string desc, decimal price, int c_id)
        {
            connection();
            cmd = new SqlCommand($"update Products set Product_name='{p_name}', Description='{desc}', Price='{price}', Category_id='{c_id}' where Product_id='{p_id}';", con);

            return cmd.ExecuteNonQuery();
        }
        public void DeleteProduct(int p_id)
        {
            connection();
            cmd = new SqlCommand($"Delete From Products where Product_Id='{p_id}';", con);
            cmd.ExecuteNonQuery();
        }
        public int RegisterUser(string f_name, string email, string u_name, string pass, string phn, string address)
        {
            connection();
            cmd = new SqlCommand($"Insert into Users (FullName,Email,Username,Password,PhoneNumber,Address) Values ('{f_name}','{email}','{u_name}','{pass}','{phn}','{address}'); ", con);
            return cmd.ExecuteNonQuery();
        }

        public int RegisterAdmin(string f_name, string email, string u_name, string pass, string role, string phn)
        {
            connection();
            cmd = new SqlCommand($"Insert into Admins (FullName,Email,Username,Password,Role,ContactNumber) Values ('{f_name}','{email}','{u_name}','{pass}','{role}','{phn}');", con);
            return cmd.ExecuteNonQuery();
        }

        public int InsertSize(decimal size)
        {
            connection();
            cmd = new SqlCommand($"Insert into Size (SizeValue) Values ('{size}')", con);
            return cmd.ExecuteNonQuery();
        }

        public DataSet SelectSize()
        {
            connection();
            da = new SqlDataAdapter("Select Size_ID,SizeValue from Size", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;

        }
        public DataSet ShowSize()
        {
            connection();
            da = new SqlDataAdapter("Select SizeValue from Size", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;

        }
        public int UpdateSize(int id, decimal size)
        {
            connection();
            cmd = new SqlCommand($"Update Size set SizeValue='{size}' where Size_Id='{id}'", con);
            return cmd.ExecuteNonQuery();
        }

        public int DeleteSize(int id)
        {
            connection();
            cmd = new SqlCommand($"Delete From Size where Size_Id='{id}'", con);
            return cmd.ExecuteNonQuery();

        }
    
        public int InsertCart(int Pro_id,int User_id,int qty)
        {
            connection();
            cmd = new SqlCommand($"Insert into Cart_tbl (Product_Id,User_Id,Quantity) values ('{Pro_id}','{User_id}','{qty}')", con);
            return cmd.ExecuteNonQuery();
        }

        //public DataSet SelectCart()
        //{
        //    connection();
        //}

    }
}
