<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Footfiesta.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="bread"><span><a href="<%=ResolveUrl("~/Home.aspx") %>">Home</a></span> / <span>Shopping Cart</span></p>
                </div>
            </div>
        </div>
    </div>




<div class="colorlib-product">
    <div class="container">
        <div class="row row-pb-lg">
            <div class="col-md-10 offset-md-1">
                <div class="process-wrap">
                    <div class="process text-center active">
                        <p><span>01</span></p>
                        <h3>Shopping Cart</h3>
                    </div>
                    <div class="process text-center">
                        <p><span>02</span></p>
                        <h3>Checkout</h3>
                    </div>
                    <div class="process text-center">
                        <p><span>03</span></p>
                        <h3>Order Complete</h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- Cart Table Headings -->
        <div class="row row-pb-lg">
            <div class="col-md-12">
                <div class="product-name d-flex">
                    <div class="one-forth text-left px-4"><span>Product Details</span></div>
                    <div class="one-eight text-center"><span>Price</span></div>
                    <div class="one-eight text-center"><span>Quantity</span></div>
                    <div class="one-eight text-center"><span>Size</span></div>
                    <div class="one-eight text-center"><span>Total</span></div>
                    <div class="one-eight text-center px-4"><span>Remove</span></div>
                </div>

                <!-- Repeater for Cart Items -->
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                        <div class="product-cart d-flex">
                            <div class="one-forth">
                                <asp:Image ID="Image1" class="product-img" ImageUrl='<%# Eval("Image_url") %>' runat="server" />
                            </div>
                            <div class="display-tc">
                                <h3><asp:Label ID="LabelProduct" runat="server" Text='<%# Eval("Product_Name") %>' /></h3>
                            </div>
                            <div class="one-eight text-center">
                                <div class="display-tc">
                                    <asp:Label ID="LabelPrice" CssClass="price" runat="server" Text='<%# Eval("Price", "{0:C}") %>' />
                                </div>
                            </div>
                            <div class="one-eight text-center">
                                <div class="display-tc">
                                    <asp:TextBox ID="TextBoxQuantity" runat="server" CssClass="form-control input-number text-center"
                                        Text='<%# Eval("Quantity") %>' />
                                </div>
                            </div>
                             <div class="one-eight text-center">
                                <div class="display-tc">
                                 <asp:Label ID="lblSize" runat="server" Text='<%# Eval("SizeValue") %>' />
                                </div>
                            </div>
                            <div class="one-eight text-center">
                                <div class="display-tc">
                                    <asp:Label ID="LabelTotal" CssClass="price" runat="server"
                                        Text='<%# String.Format("{0:C}", Convert.ToDecimal(Eval("Price")) * Convert.ToInt32(Eval("Quantity"))) %>' />
                                </div>
                            </div>
                            <div class="one-eight text-center">
                                <div class="display-tc">
                                    <asp:LinkButton ID="LinkButtonRemove" runat="server" CommandName="remove" CommandArgument='<%# Eval("Product_Id") %>' CssClass="closed">X</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <!-- Cart Totals -->
        <div class="row row-pb-lg">
            <div class="col-md-12">
                <div class="total-wrap">
                    <div class="row">
                        <div class="col-sm-4 text-center">
                            <div class="total">
                                <div class="sub">
                                    <p><span>Subtotal:</span> <span><asp:Label ID="lblSubtotal" runat="server" Text="$0.00" /></span></p>
                                    <p><span>Delivery:</span> <span><asp:Label ID="lblDelivery" runat="server" Text="$0.00" /></span></p>
                                </div>
                                <div class="grand-total">
                                    <p><span><strong>Total:</strong></span> <span><asp:Label ID="lblTotal" runat="server" Text="$0.00" /></span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
