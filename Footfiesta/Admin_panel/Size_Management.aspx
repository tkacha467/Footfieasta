<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Size_Management.aspx.cs" Inherits="Footfiesta.Size_Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <center>
        <div class="form-container">
            <h2>Manage Sizes</h2>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false" />

            <table class="form-table">
                <tr>
                    <td>
                        <label for="txtSize">Size:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSize" runat="server" CssClass="form-control" MaxLength="4" Placeholder="Enter size (e.g., 7.5)" />
                    </td>
                </tr>

                <tr>
                    <td colspan="2" style="text-align: center;">
                        <asp:Button ID="btnAddSize" runat="server" Text="Add Size" CssClass="btn btn-primary" OnClick="btnAddSize_Click" />
                        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary" OnClick="btnClear_Click" />
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <h3>Existing Sizes:</h3>
                    </td>
                </tr>
            </table>
        </div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="Size ID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Size_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Size Value">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("SizeValue") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton ID="edit_btn" CommandArgument='<%# Eval("Size_Id") %>' CommandName='<%# Eval("SizeValue") %>' OnCommand="edit_btn_Command" runat="server">Edit</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="delete_btn" OnCommand="delete_btn_Command" CommandArgument='<%# Eval("Size_Id") %>' runat="server">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </center>
</asp:Content>

