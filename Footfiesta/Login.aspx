<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Footfiesta.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
  <div style="display: flex; justify-content: center; align-items: center; min-height: 80vh; flex-wrap: wrap; gap: 30px; padding: 20px; background-color: #ddf1ef;">
    
  <asp:Button ID="btnMemberLogin" runat="server" Text="LOGIN AS MEMBER"
                OnClick="btnMemberLogin_Click"
                style="width: 300px; height: 160px; max-width: 90%; background-color: #72B6A1; color: white; font-size: 20px; font-weight: bold; border: none; border-radius: 15px; display: flex; justify-content: center; align-items: center; cursor: pointer; text-align: center; transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;"
                onmouseover="this.style.transform='scale(1.07)'; this.style.boxShadow='0px 7px 20px rgba(0, 0, 0, 0.3)';"
                onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='none';" />

            <asp:Button ID="btnClubLogin" runat="server" Text="LOGIN AS ADMIN"
                OnClick="btnClubLogin_Click"
                style="width: 300px; height: 160px; max-width: 90%; background-color: #72B6A1; color: white; font-size: 20px; font-weight: bold; border: none; border-radius: 15px; display: flex; justify-content: center; align-items: center; cursor: pointer; text-align: center; transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;"
                onmouseover="this.style.transform='scale(1.07)'; this.style.boxShadow='0px 7px 20px rgba(0, 0, 0, 0.3)';"
                onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='none';" />

</div>



</asp:Content>






<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder1">
    
</asp:Content>




