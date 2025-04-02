<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Men.aspx.cs" Inherits="Footfiesta.Men" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="bread"><span><a href="<%=ResolveUrl("~/Home.aspx") %>">Home</a></span> / <span>Men</span></p>
                </div>
            </div>
        </div>
    </div>

    <div class="breadcrumbs-two">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="breadcrumbs-img" style="background-image: url(images/cover-img-1.jpg);">
                        <h2>Men's</h2>
                    </div>
                    <div class="menu text-center">
                        <p><%--<a href="#">New Arrivals</a> <a href="#">Best Sellers</a> <a href="#">Extended Widths</a> <a href="#">Sale</a>--%></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    

    <div class="colorlib-product">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 offset-sm-2 text-center colorlib-heading colorlib-heading-sm">
                    <h2>View All Products</h2>
                </div>
            </div>

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
                    CommandName="cmd_viewpage" CssClass="btn btn-view">View Details</asp:LinkButton>

                <asp:LinkButton ID="LinkAdd_to_cart" runat="server" CommandArgument='<%# Eval("Product_Id") %>'
                    CommandName="cmd_adtc" CssClass="btn btn-cart">Add To Cart</asp:LinkButton>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>

</div>

<!-- Pagination Buttons -->
<div style="text-align: center; margin-top: 20px;">
    <asp:Button ID="ButtonPrevious" runat="server" Text="Previous" OnClick="ButtonPrevious_Click"
        CssClass="pagination-btn" Enabled="false" />

    <asp:Button ID="ButtonNext" runat="server" Text="Next" OnClick="ButtonNext_Click"
        CssClass="pagination-btn" />
</div>

<!-- No Products Message -->
<asp:Label ID="NoProductsLabel" runat="server" CssClass="no-products-message" Text="No products available."
    Visible="false"></asp:Label>
    
        </div>
    </div>

    <div class="colorlib-partner">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 offset-sm-2 text-center colorlib-heading colorlib-heading-sm">
                    <h2>Trusted Partners</h2>
                </div>
            </div>
            <div class="row">
                <div class="col partner-col text-center">
                    <img src="images/brand-1.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
                </div>
                <div class="col partner-col text-center">
                    <img src="images/brand-2.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
                </div>
                <div class="col partner-col text-center">
                    <img src="images/brand-3.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
                </div>
                <div class="col partner-col text-center">
                    <img src="images/brand-4.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
                </div>
                <div class="col partner-col text-center">
                    <img src="images/brand-5.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

