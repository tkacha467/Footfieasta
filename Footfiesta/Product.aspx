<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Footfiesta.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:DataList ID="DataList1" runat="server" BorderColor="#003300" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" RepeatDirection="Horizontal">
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" height="200" Width="200" ImageUrl='<%# Eval("ImageUrl") %>' />
            <br />
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ProductID") %>' CommandName="cmd_viewpage">Product_detail</asp:LinkButton>
            <br />
            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("ProductID") %>' CommandName="cmd_adtc">Add To Cart</asp:LinkButton>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <%--data base started--%>
    </asp:Content>

