<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Footfiesta.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div style="border: 1px solid #003300; padding: 15px; border-radius: 10px; background-color: #f7fdfc; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); display: inline-block; width: 220px; height: 500px; margin: 10px; text-align: center; vertical-align: top; overflow: hidden;">

                <asp:Image ID="Image1" runat="server" Height="200" Width="200"
                    ImageUrl='<%# Eval("Image_url") %>' Style="border-radius: 10px;" />
                <br />
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Product_Name") %>'
                    Style="font-size: 16px; font-weight: bold; color: #333;"></asp:Label>
                <br />

                <br />
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price", "{0:C}") %>'
                    Style="font-size: 18px; font-weight: bold; color: #008080;"></asp:Label>
                <br />
                <br />

                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Product_Id") %>'
                    CommandName="cmd_viewpage"
                    Style="display: block; padding: 8px 15px; background-color: #008080; color: white; text-decoration: none; border-radius: 5px; font-size: 14px; margin-bottom: 5px;">
                View Details
                </asp:LinkButton>

                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Product_Id") %>'
                    CommandName="cmd_adtc"
                    Style="display: block; padding: 8px 15px; background-color: #004d4d; color: white; text-decoration: none; border-radius: 5px; font-size: 14px;">
                Add To Cart
                </asp:LinkButton>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <div style="text-align: center; margin-top: 20px;">
        <asp:Button ID="btnPrev" runat="server" Text="Previous" OnClick="btnPrev_Click"
            Style="padding: 10px 20px; background-color: #008080; color: white; border: none; border-radius: 5px; font-size: 16px; margin-right: 10px; cursor: pointer;" />
        <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click"
            Style="padding: 10px 20px; background-color: #008080; color: white; border: none; border-radius: 5px; font-size: 16px; cursor: pointer;" />
    </div>

</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <%--data base started--%>
</asp:Content>

