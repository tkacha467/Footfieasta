<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Admin_register.aspx.cs" Inherits="Footfiesta.Admin_register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div style="background-color: #ddf1ef; height: 100vh; display: flex; justify-content: center; align-items: center; margin: 0;">
        <div style="display: flex; background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1); width: 850px; align-items: center;">

            <!-- Left Image Section -->
            <div style="flex: 1; display: flex; justify-content: center; align-items: center;">
                <img src="images/admin-register.jpg" alt="Admin Illustration" style="width: 250px;">
            </div>

            <!-- Right Registration Form Section -->
            <div style="flex: 1; padding: 20px;">
                <h2 style="text-align: center; margin-bottom: 20px; color: #333;">Admin Registration</h2>

                <!-- Full Name -->
                <div style="margin-bottom: 15px;">
                    <asp:TextBox ID="txtFullName" runat="server" placeholder="Full Name"
                        Style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
                </div>

                <!-- Email -->
                <div style="margin-bottom: 15px;">
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" TextMode="Email"
                        Style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
                </div>

                <!-- Username -->
                <div style="margin-bottom: 15px;">
                    <asp:TextBox ID="txtUsername" runat="server" placeholder="Username"
                        Style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
                </div>

                <!-- Password -->
                <div style="margin-bottom: 15px;">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"
                        Style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
                </div>

                <!-- Confirm Password -->
                <div style="margin-bottom: 15px;">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password"
                        Style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
                </div>

                <!-- Contact Number -->
                <div style="margin-bottom: 15px;">
                    <asp:TextBox ID="txtContact" runat="server" placeholder="Contact Number" TextMode="Phone"
                        Style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
                </div>

                <!-- Admin Role Selection -->
                <div style="margin-bottom: 15px;">
                    <asp:DropDownList ID="ddlRole" runat="server"
                        Style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1;">
                        <asp:ListItem Text="Select Role" Value="" />
                        <asp:ListItem Text="Admin" Value="Admin" />
                        <asp:ListItem Text="Manager" Value="Manager" />
                        <asp:ListItem Text="Editor" Value="Editor" />
                    </asp:DropDownList>
                </div>

                <!-- Register Button -->
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click"
                    Style="width: 100%; padding: 12px; background: #7abcb6; color: white; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; transition: 0.3s;"
                    onmouseover="this.style.background='#5fa7a0';" onmouseout="this.style.background='#7abcb6';" OnClientClick="return validateAdminPasswords();" />

                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

                <!-- Already have an account -->
                <div style="text-align: center; margin-top: 15px;">
                    <span>Already have an account? </span>
                    <a href="AdminLogin.aspx" style="color: #7abcb6; text-decoration: none; font-weight: bold;">Sign in</a>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function validateAdminPasswords() {
            var password = document.getElementById('<%= txtPassword.ClientID %>').value;
        var confirmPassword = document.getElementById('<%= txtConfirmPassword.ClientID %>').value;

            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false;
            }
            return true;
        }
    </script>



</asp:Content>

