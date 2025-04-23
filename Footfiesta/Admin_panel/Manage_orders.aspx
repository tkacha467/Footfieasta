<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Manage_orders.aspx.cs" Inherits="Footfiesta.Admin_panel.Show_cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridViewOrders" runat="server" AutoGenerateColumns="False"
        CssClass="table table-bordered" DataKeyNames="OrderId">
        <Columns>
            <asp:BoundField DataField="BillingId" HeaderText="Billing ID" />
            <asp:BoundField DataField="OrderId" HeaderText="Order ID" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
            <asp:BoundField DataField="CompanyName" HeaderText="Company" />
            <asp:BoundField DataField="Address1" HeaderText="Address 1" />
            <asp:BoundField DataField="Address2" HeaderText="Address 2" />
            <asp:BoundField DataField="City" HeaderText="City" />
            <asp:BoundField DataField="Order_Date" HeaderText="Order Date" DataFormatString="{0:dd-MM-yyyy}" />
            <asp:BoundField DataField="TotalAmount" HeaderText="Amount" />
            <asp:BoundField DataField="ProductName" HeaderText="Product" />
            <asp:BoundField DataField="Quantity" HeaderText="Qty" />
            <asp:BoundField DataField="Price" HeaderText="Price" />

            <asp:TemplateField HeaderText="Delivered?">
                <ItemTemplate>
                    <asp:CheckBox ID="chkDelivered" runat="server"
                        Checked='<%# Eval("Status").ToString().ToLower() == "delivered" %>'
                        AutoPostBack="true"
                        OnCheckedChanged="chkDelivered_CheckedChanged" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
</asp:Content>

