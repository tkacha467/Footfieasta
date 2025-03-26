<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Footfiesta.Admin_penal.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <center>
        <table>
            <tr>
                <td>Name :
                </td>
                <td>
                    <asp:TextBox ID="txtC_name" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                </td>
            </tr>
        </table>

       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:TemplateField HeaderText="Category ID">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Category_Id") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Category Name">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Category_name") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Edit">
            <ItemTemplate>
                <asp:LinkButton ID="edit_btn" CommandArgument='<%# Eval("Category_Id") %>' CommandName='<%# Eval("Category_name") %>' OnCommand="edit_btn_Command" runat="server">Edit</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
                <asp:LinkButton ID="delete_btn" OnCommand="delete_btn_Command" CommandArgument='<%# Eval("Category_Id") %>' runat="server">Delete</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

    </center>
</asp:Content>

