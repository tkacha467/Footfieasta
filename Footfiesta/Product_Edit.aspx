<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Product_Edit.aspx.cs" Inherits="Footfiesta.Product_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <center>
    <div style="width: 400px; text-align: left; font-family: 'Arial', sans-serif; color: #333;">
        <h2 style="color: #222; font-weight: bold; margin-bottom: 20px;">Add New Product</h2>

       

        <asp:Label ID="lblProductName" runat="server" Text="Product Name:" 
            Style="display: block; font-weight: bold; margin-bottom: 5px;"></asp:Label>
        <asp:TextBox ID="txtProductName" runat="server" Placeholder="Enter product name"
            Style="width: 100%; padding: 10px; margin-bottom: 15px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px;"></asp:TextBox>

        <asp:Label ID="lblPrice" runat="server" Text="Price:" 
            Style="display: block; font-weight: bold; margin-bottom: 5px;"></asp:Label>
        <asp:TextBox ID="txtPrice" runat="server" Placeholder="Enter price"
            Style="width: 100%; padding: 10px; margin-bottom: 15px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px;"></asp:TextBox>

         <!-- Image URL Option -->
        <asp:Label ID="lblImageUrl" runat="server" Text="Image URL:" 
            Style="display: block; font-weight: bold; margin-bottom: 5px;"></asp:Label>
        <asp:TextBox ID="txtImageUrl" runat="server" Placeholder="Enter image URL"
            Style="width: 100%; padding: 10px; margin-bottom: 15px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px; box-shadow: inset 0 1px 3px rgba(0,0,0,0.1);"></asp:TextBox>

        <p style="text-align: center; font-weight: bold; margin: 10px 0;">OR</p>

        <!-- File Upload Option -->
        <asp:Label ID="lblUploadImage" runat="server" Text="Upload Image:" 
            Style="display: block; font-weight: bold; margin-bottom: 5px;"></asp:Label>
        <asp:FileUpload ID="fileUploadImage" runat="server"
            Style="width: 100%; padding: 10px; margin-bottom: 15px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px;"></asp:FileUpload>

        <asp:Button ID="btnSubmit" runat="server" Text="Add Product" OnClick="btnSubmit_Click"
            Style="width: 100%; padding: 12px; background-color: #6CB3A9; color: white; border: none; border-radius: 5px; font-size: 16px; cursor: pointer; font-weight: bold; text-transform: uppercase;" />

        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"
            Style="display: block; font-weight: bold; margin-top: 15px;"></asp:Label>
    </div>
</center>


</asp:Content>

