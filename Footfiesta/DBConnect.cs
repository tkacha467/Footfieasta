using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web;

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

        public int InsertCart(int Pro_id, int User_id, int qty, int sizeid)
        {
            connection();
            cmd = new SqlCommand($"Insert into Cart_tbl (Product_Id,User_Id,Size_id,Quantity) values ('{Pro_id}','{User_id}','{sizeid}','{qty}')", con);
            return cmd.ExecuteNonQuery();
        }

        public DataSet SelectProduct_id(string name)
        {
            connection();
            da = new SqlDataAdapter($"select Product_Id from Products where Product_Name='{name}'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet CartItmes(int User_id)
        {
            connection();
            da = new SqlDataAdapter($@"
        SELECT 
            P.Product_Id,
            P.Product_Name, 
            P.Price, 
            P.Image_url, 
            C.Quantity, 
            C.Size_id, 
            S.SizeValue 
        FROM Products P 
        INNER JOIN Cart_tbl C ON P.Product_Id = C.Product_Id 
        LEFT JOIN Size S ON C.Size_id = S.Size_Id 
        WHERE C.User_Id = '{User_id}'", con);

            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        //for delete product in cart page
        public void ExecuteQuery(string query)
        {
            connection();
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }



        public int Insert_Contact(string fnm, string lnm, string email, string sub, string msg)
        {
            connection();
            cmd = new SqlCommand($"Insert into Contact (First_Name,Last_Name,Email,Subject,Message) Values ('{fnm}','{lnm}','{email}','{sub}','{msg}')", con);
            return cmd.ExecuteNonQuery();
        }

        public DataSet Select_Contact()
        {
            connection();
            da = new SqlDataAdapter("Select * from Contact ", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public int Delete_Contact(int id)
        {
            connection();
            cmd = new SqlCommand($"Delete from Contact Where Id='{id}'", con);
            return cmd.ExecuteNonQuery();
        }

        //public DataSet User_profile(string username)
        //{
        //    connection();
        //    cmd = new SqlCommand($"Select * form Users where Username='{username}'", con);
        //    da = new SqlDataAdapter(cmd);
        //    ds = new DataSet();
        //    da.Fill(ds);
        //    return ds;
        //}

        public DataSet GetUserDetails(string username)
        {
            connection();
            cmd = new SqlCommand($"SELECT FullName, Email, Address FROM Users WHERE Username = '{username}'", con);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();

            con.Open();
            da.Fill(ds);
            con.Close(); // Ensure connection is closed after execution

            return ds;
        }

        //for oder system
        public int InsertOrder(int userId, decimal totalAmount)
        {
             connection();
            string status = "Pending"; // set default status manually
            cmd = new SqlCommand($"INSERT INTO Order_tbl (User_Id, TotalAmount,Status) OUTPUT INSERTED.Order_Id VALUES ('{userId}', '{totalAmount}','{status}')", con);
          
            int Order_Id = (int)cmd.ExecuteScalar();
            con.Close();
            return Order_Id;
        }

        public void InsertOrderItems(int orderId, DataSet cartItems)
        {
            foreach (DataRow row in cartItems.Tables[0].Rows)
            {
                int productId = Convert.ToInt32(row["Product_Id"]);
                int sizeId = Convert.ToInt32(row["Size_Id"]);
                int quantity = Convert.ToInt32(row["Quantity"]);
                decimal price = Convert.ToDecimal(row["Price"]);

                string query = $"INSERT INTO OrderItems_tbl (OrderId, Product_Id, Size_Id, Quantity, Price) " +
                               $"VALUES ('{orderId}', '{productId}', '{sizeId}', '{quantity}', '{price}')";

                cmd = new SqlCommand(query, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public void ClearCart(int userId)
        {
            connection();
            string query = $"DELETE FROM Cart_tbl WHERE User_Id = '{userId}'";
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void InsertBillingDetails(int orderId, string country, string firstName, string lastName, string company, string address1, string address2, string city, string state, string zip, string email, string phone)
        {
            connection();
            cmd = new SqlCommand($"INSERT INTO BillingDetails_tbl (OrderId, Country, FirstName, LastName, CompanyName, Address1, Address2, City, State, ZipCode, Email, Phone) " +
                                 $"VALUES ('{orderId}', '{country}', '{firstName}', '{lastName}', '{company}', '{address1}', '{address2}', '{city}', '{state}', '{zip}', '{email}', '{phone}')", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }


        public DataSet Manage_order()
        {
            connection();
            da = new SqlDataAdapter(@"
        SELECT 
            bd.BillingId, 
            bd.OrderId, 
            bd.FirstName, 
            bd.LastName, 
            bd.CompanyName,
            bd.Address1, 
            bd.Address2, 
            bd.City,
            o.Order_Date, 
            o.TotalAmount, 
            o.Status,
            p.Product_Name AS ProductName,  -- Here we alias it to match your GridView
            oi.Quantity, 
            oi.Price
        FROM BillingDetails_tbl bd 
        JOIN Order_tbl o ON bd.OrderId = o.Order_Id 
        JOIN OrderItems_tbl oi ON o.Order_Id = oi.OrderId 
        JOIN Products p ON oi.Product_Id = p.Product_Id
        ORDER BY o.Order_Date DESC
    ", con);

            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }



        public void ChangeStatus(string orderId, string newStatus)
        {
            connection();
            SqlCommand cmd = new SqlCommand($"UPDATE Order_tbl SET Status = '{newStatus}' WHERE Order_Id = {orderId}", con);
            cmd.ExecuteNonQuery();
        }
    }
}
