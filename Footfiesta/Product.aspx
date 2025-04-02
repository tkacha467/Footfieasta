<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Footfiesta.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   
    <ul class="nav nav-tabs" id="productTabs" style="display: flex; align-items: center; justify-content: center; gap: 15px; padding: 10px 0; border-bottom: none;">
    <asp:Repeater ID="rptCategories" runat="server">
        <ItemTemplate>
            <li class="nav-item" style="list-style: none;">
                <asp:LinkButton ID="btnCategory" runat="server" CommandArgument='<%# Eval("Category_Id") %>'
                    OnClick="CategoryTab_Click"
                    CssClass='<%# Container.ItemIndex == 0 ? "nav-link active" : "nav-link" %>'
                    Style="display: flex; align-items: center; justify-content: center; width: 160px; height: 50px; text-align: center; color: #87c0b7; background: white; border: 2px solid #87c0b7; border-radius: 25px; font-weight: bold; text-transform: uppercase; box-shadow: 2px 4px 8px rgba(0,0,0,0.15); transition: all 0.3s ease-in-out;">
                    <%# Eval("Category_name") %>
                </asp:LinkButton>
            </li>
        </ItemTemplate>
    </asp:Repeater>
</ul>



    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var tabs = document.querySelectorAll('.nav-link');
            tabs.forEach(function (tab) {
                tab.addEventListener('click', function () {
                    tabs.forEach(t => {
                        t.style.background = "white";
                        t.style.color = "#87c0b7";
                        t.style.border = "2px solid #87c0b7";
                    });
                    this.style.background = "#87c0b7";
                    this.style.color = "white";
                    this.style.border = "2px solid #87c0b7";
                });
            });
        });
    </script>


    <div class="product-container">
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <div class="product-card">
                    <!-- Product Image -->
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image_url") %>' CssClass="product-image" />

                    <!-- Product Name -->
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Product_Name") %>' CssClass="product-name"></asp:Label>

                    <!-- Product Price -->
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price", "{0:C}") %>' CssClass="product-price"></asp:Label>

                    <!-- Buttons -->
                    <div class="button-container">
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Product_Id") %>'
                            CommandName="cmd_viewpage" OnCommand="LinkButton1_Command" CssClass="btn btn-view">View Details</asp:LinkButton>

                        <asp:LinkButton ID="LinkAdd_to_cart" runat="server" CommandArgument='<%# Eval("Product_Id") %>'
                            CommandName="cmd_adtc" CssClass="btn btn-cart">Add To Cart</asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>


    <div style="text-align: center; margin-top: 20px;">
        <asp:Button ID="ButtonPrevious" runat="server" Text="Previous" OnClick="ButtonPrevious_Click"
            CssClass="pagination-btn" Enabled="false" />

        <asp:Button ID="ButtonNext" runat="server" Text="Next" OnClick="ButtonNext_Click"
            CssClass="pagination-btn" />

    </div>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <%--data base started--%>
</asp:Content>

