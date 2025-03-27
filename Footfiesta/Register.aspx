<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Footfiesta.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div style="background-color: #ddf1ef; min-height: 100vh; display: flex; justify-content: center; align-items: center; margin-top: 5px; padding: 50px;">

        <div style="display: flex; background: #fff; padding: 30px; border-radius: 12px; box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1); width: 850px; align-items: center;">

            <!-- Left Image Section -->
            <div style="flex: 1; display: flex; justify-content: center; align-items: center;">
                <img src="images/signup-image.jpg" alt="Register Illustration" style="width: 250px;">
            </div>

            <!-- Right Registration Form Section -->
            <div style="flex: 1; padding: 20px;">
                <h2 style="text-align: center; margin-bottom: 20px; color: #333;">User Registration</h2>

                <div style="margin-bottom: 15px;">
                    <asp:TextBox ID="txtFullName" runat="server" placeholder="Full Name"
                        Style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
                </div>

                <div style="margin-bottom: 15px;">
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"
                        Style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
                </div>

                <div style="margin-bottom: 15px;">
                    <asp:TextBox ID="txtUsername" runat="server" placeholder="Username"
                        Style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
                </div>

                <div style="margin-bottom: 15px;">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"
                        Style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
                </div>

                <div style="margin-bottom: 15px;">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password"
                        Style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
                </div>


                <div style="margin-bottom: 15px;">
                    <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Phone Number"
                        Style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
                </div>

                <div style="margin-bottom: 15px;">
                    <asp:TextBox ID="txtAddress" runat="server" placeholder="Address" TextMode="MultiLine"
                        Style="width: 100%; padding: 12px; border: none; border-radius: 8px; background: #f1f1f1; outline: none;"></asp:TextBox>
                </div>

                <!-- Register Button -->
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click"
                    Style="width: 100%; padding: 12px; background: #7abcb6; color: white; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; transition: 0.3s;"
                    onmouseover="this.style.background='#5fa7a0';" onmouseout="this.style.background='#7abcb6';" OnClientClick="return validatePasswords();" />

                <asp:Label ID="lblRegisterMessage" runat="server" ForeColor="Red"></asp:Label>

                <!-- Login Redirect -->
                <div style="text-align: center; margin-top: 15px;">
                    <span>Already have an account? </span>
                    <a href="User_LOgin.aspx" style="color: #7abcb6; text-decoration: none; font-weight: bold;">Sign In</a>
                </div>
            </div>
        </div>
    </div>
    <%--for compare both password are same or not--%>
    <script type="text/javascript">
        function validatePasswords() {
            var password = document.getElementById('<%= txtPassword.ClientID %>').value;
        var confirmPassword = document.getElementById('<%= txtConfirmPassword.ClientID %>').value;

            if (password === "") {
                alert("Password cannot be empty.");
                return false;
            }

            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false;
            }

            return true;
        }
    </script>

    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</asp:Content>

