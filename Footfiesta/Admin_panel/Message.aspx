<%@ Page Title="Messages" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" 
    CodeBehind="Message.aspx.cs" Inherits="Footfiesta.Admin_panel.Message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .contact-grid {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            text-align: center;
            font-family: Arial, sans-serif;
            background: #fff;
        }

        .grid-header {
            background-color: #88c8bc;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        .grid-row {
            background-color: #f9f9f9;
            color: #333;
        }

        .grid-alt-row {
            background-color: #e6f7f5;
        }

        .contact-grid th, .contact-grid td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        .delete-btn {
            background-color: red;
            color: white;
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
            border: none;
        }

        .delete-btn:hover {
            background-color: darkred;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="text-align: center; color: #88c8bc;">Messages</h2>
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="contact-grid"
        DataKeyNames="Id"
        HeaderStyle-CssClass="grid-header" RowStyle-CssClass="grid-row" AlternatingRowStyle-CssClass="grid-alt-row"
        Width="100%" CellPadding="10" BorderStyle="Solid" BorderWidth="1px"
        OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
            <asp:BoundField DataField="First_Name" HeaderText="First Name" />
            <asp:BoundField DataField="Last_Name" HeaderText="Last Name" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" />
            <asp:BoundField DataField="Message" HeaderText="Message" />
            <asp:BoundField DataField="ContactAt" HeaderText="Submitted On" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />

            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:LinkButton ID="btnDelete" runat="server" Text="Remove" CssClass="delete-btn"
                        CommandName="Delete" CommandArgument='<%# Eval("Id") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
