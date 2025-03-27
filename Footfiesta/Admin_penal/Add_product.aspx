<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Add_product.aspx.cs" Inherits="Footfiesta.Admin_penal.Add_product" %>

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

            <asp:Label ID="Label1" runat="server" Text="Description:"
                Style="display: block; font-weight: bold; margin-bottom: 5px;"></asp:Label>
            <asp:TextBox ID="txtdesc" TextMode="MultiLine" runat="server" Placeholder="Enter Description"
                Style="width: 100%; padding: 10px; margin-bottom: 15px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px;"></asp:TextBox>

            <asp:Label ID="Label2" runat="server" Text="Category:"
                Style="display: block; font-weight: bold; margin-bottom: 5px;"></asp:Label>
            <asp:DropDownList ID="ddlcategory" runat="server" Style="width: 100%; padding: 10px; margin-bottom: 15px; border: 1px solid #ddd; border-radius: 5px; font-size: 14px;"></asp:DropDownList>



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




   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    CellPadding="10" CellSpacing="0" BorderWidth="1" BorderStyle="Solid" BorderColor="#a5c5b7"
    HeaderStyle-BackColor="#a5c5b7" HeaderStyle-ForeColor="black" HeaderStyle-Font-Bold="true"
    RowStyle-BackColor="#f8f8f8" RowStyle-ForeColor="black" AlternatingRowStyle-BackColor="white"
    AlternatingRowStyle-ForeColor="black" Width="100%" Font-Names="Arial" Font-Size="14px">
    
    <Columns>
        <asp:TemplateField HeaderText="Product ID">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Product_Id") %>' 
                    Style="padding: 10px; display: block;"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Product Name">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Product_Name") %>' 
                    Style="padding: 10px; display: block;"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Description">
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Description") %>' 
                    Style="padding: 10px; display: block;"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Price">
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Price") %>' 
                    Style="padding: 10px; display: block; font-weight: bold;"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Category Id">
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Category_id") %>' 
                    Style="padding: 10px; display: block;"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Images">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image_url") %>' 
                    Style="width: 100px; height: auto; padding: 5px;" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Edit">
            <ItemTemplate>
                <asp:LinkButton ID="edit_btn"
                    runat="server"
                    CommandArgument='<%# Eval("Product_Id") %>'
                    CommandName="cmd_edit"
                    OnCommand="edit_btn_Command"
                    Style="color: #3498db; text-decoration: none; font-weight: bold;">Edit</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
                <asp:LinkButton ID="delete_btn" OnCommand="delete_btn_Command_product" 
                    CommandArgument='<%# Eval("Product_Id") %>' runat="server"
                    Style="color: #e74c3c; text-decoration: none; font-weight: bold;">Delete</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>





</asp:Content>

