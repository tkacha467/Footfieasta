<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="User_Login.aspx.cs" Inherits="Footfiesta.User_Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">

    <div style="background-color: #ddf1ef; height: 100vh; display: flex; justify-content: center; align-items: center; margin: 0;">

        <div style="display: flex; background: #fff; padding: 30px; border-radius: 12px; 
                    box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1); width: 850px; align-items: center;">

            <!-- Left Image Section -->
            <div style="flex: 1; display: flex; justify-content: center; align-items: center;">
                <img src="images/signin-image.jpg" alt="Illustration" style="width: 250px;">
            </div>

            <!-- Right Login Form Section -->
            <div style="flex: 1; padding: 20px;">
                <h2 style="text-align: center; margin-bottom: 20px; color: #333;">Sign In as Member</h2>

                <div style="margin-bottom: 15px;">
                    <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" 
                                 style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
                </div>

                <div style="margin-bottom: 15px;">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"
                                 style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
                </div>

                <!-- Remember Me & Forgot Password -->
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;">
                    <div>
                        <asp:CheckBox ID="chkRememberMe" runat="server" />
                        <label for="chkRememberMe">Remember me</label>
                    </div>
                    <div>
                        <a href="ForgotPassword.aspx" style="color: #7abcb6; text-decoration: none;">Forgot Password?</a>
                    </div>
                </div>

                <!-- Login Button -->
                <asp:Button ID="btnLogin" runat="server" Text="Log in" OnClick="btnLogin_Click" 
                            style="width: 100%; padding: 12px; background: #7abcb6; color: white; border: none; 
                                   border-radius: 8px; cursor: pointer; font-size: 16px; transition: 0.3s;" 
                            onmouseover="this.style.background='#5fa7a0';" onmouseout="this.style.background='#7abcb6';" />

                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

                <!-- Create an Account -->
                <div style="text-align: center; margin-top: 15px;">
                    <span>Don't have an account? </span>
                    <a href="Register.aspx" style="color: #7abcb6; text-decoration: none; font-weight: bold;">Create an account</a>
                </div>

                <!-- Social Media Login -->
                <div style="display: flex; justify-content: center; margin-top: 20px;">
                    <a href="#" style="display: inline-flex; justify-content: center; align-items: center; width: 40px; height: 40px; 
                                      margin: 5px; border-radius: 50%; background: #3b5998; color: white; text-decoration: none; font-size: 20px;">
                        <i class="fa fa-facebook"></i>
                    </a>
                    <a href="#" style="display: inline-flex; justify-content: center; align-items: center; width: 40px; height: 40px; 
                                      margin: 5px; border-radius: 50%; background: #1da1f2; color: white; text-decoration: none; font-size: 20px;">
                        <i class="fa fa-twitter"></i>
                    </a>
                    <a href="#" style="display: inline-flex; justify-content: center; align-items: center; width: 40px; height: 40px; 
                                      margin: 5px; border-radius: 50%; background: #db4437; color: white; text-decoration: none; font-size: 20px;">
                        <i class="fa fa-google"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

</asp:Content>










<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder1">
    
</asp:Content>











