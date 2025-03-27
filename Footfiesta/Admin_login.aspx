<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Admin_login.aspx.cs" Inherits="Footfiesta.Admin_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <div style="background-color: #ddf1ef; height: 100vh; display: flex; justify-content: center; align-items: center; margin: 0;">

    <div style="display: flex; background: #fff; padding: 30px; border-radius: 12px; 
                box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1); width: 850px; align-items: center;">

        <!-- Left Image Section -->
        <div style="flex: 1; display: flex; justify-content: center; align-items: center;">
            <img src="images/Signin-Image.jpg" alt="Admin Illustration" style="width: 250px;">
        </div>

        <!-- Right Login Form Section -->
        <div style="flex: 1; padding: 20px;">
            <h2 style="text-align: center; margin-bottom: 20px; color: #333;">Admin Login</h2>

            <div style="margin-bottom: 15px;">
                <asp:TextBox ID="txtAdminUsername" runat="server" placeholder="Admin Username" 
                             style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
            </div>

            <div style="margin-bottom: 15px;">
                <asp:TextBox ID="txtAdminPassword" runat="server" TextMode="Password" placeholder="Password"
                             style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
            </div>

            <!-- Remember Me & Forgot Password -->
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;">
                <div>
                    <asp:CheckBox ID="chkAdminRememberMe" runat="server" />
                    <label for="chkAdminRememberMe">Remember me</label>
                </div>
                <div>
                    <a href="AdminForgotPassword.aspx" style="color: #7abcb6; text-decoration: none;">Forgot Password?</a>
                </div>
            </div>

            <!-- Login Button -->
            <asp:Button ID="btnAdminLogin" runat="server" Text="Log in" OnClick="btnAdminLogin_Click" 
                        style="width: 100%; padding: 12px; background: #7abcb6; color: white; border: none; 
                               border-radius: 8px; cursor: pointer; font-size: 16px; transition: 0.3s;" 
                        onmouseover="this.style.background='#5fa7a0';" onmouseout="this.style.background='#7abcb6';" />

            <asp:Label ID="lblAdminMessage" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </div>
</div>

<!-- FontAwesome for Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</asp:Content>

