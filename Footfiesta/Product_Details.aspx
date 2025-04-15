<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Product_Details.aspx.cs" Inherits="Footfiesta.Product_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #sizeOptions {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }

        .size-option {
            width: 50px;
            height: 50px;
            background-color: #d3d3d3;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 4px;
            font-size: 16px;
            color: white;
            cursor: pointer;
            transition: all 0.2s ease-in-out;
        }

        .size-option:hover {
            background-color: #bcbcbc;
            transform: scale(1.05);
        }

        .size-option.selected {
            background-color: #333;
            color: #fff;
        }

        .quantity-btn {
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
            font-size: 18px;
        }

        .auto-style2 {
            max-width: 100%;
            height: auto;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="bread"><span><a href="<%=ResolveUrl("~/Home.aspx") %>">Home</a></span> / <span>Product Details</span></p>
                </div>
            </div>
        </div>
    </div>

    <div class="colorlib-product">
        <div class="container">
            <div class="row row-pb-lg product-detail-wrap">
                <div class="col-sm-8">
                    <div class="product-entry border text-center">
                        <asp:Image ID="imgProduct" runat="server" CssClass="auto-style2" />
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="product-desc">
                        <h3 class="product-title"><asp:Label ID="lblProductName" runat="server" /></h3>
                        <p class="price"><span class="product-price"><asp:Label ID="lblPrice" runat="server" /></span></p>
                        <p><asp:Label ID="lblDescription" runat="server" /></p>

                        <div class="size-wrap">
                            <h4>Size</h4>
                            <div id="sizeOptions">
                                <asp:HiddenField ID="hdnSelectedSize" runat="server" />

                                <asp:Repeater ID="rptSizes" runat="server">
                                    <ItemTemplate>
                                        <div class="size-option" onclick="selectSize(this)" data-size='<%# Eval("SizeValue") %>'>
                                            <%# Eval("SizeValue") %>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>

                        <h4>Quantity</h4>
                        <div style="display: flex; align-items: center; gap: 5px;">
                            <asp:LinkButton ID="btnDecrease" runat="server" OnClientClick="changeQuantity(this, -1); return false;">-</asp:LinkButton>
                            <asp:TextBox ID="txtQuantity" runat="server" Text="1" />
                            <asp:LinkButton ID="btnIncrease" runat="server" OnClientClick="changeQuantity(this, 1); return false;">+</asp:LinkButton>
                        </div>

                        <div class="row mt-3">
                            <div class="col-sm-12 text-center">
                                <asp:LinkButton ID="btnAddToCart" runat="server" CssClass="btn btn-primary btn-addtocart" OnClick="btnAddToCart_Click">
                                    <i class="icon-shopping-cart"></i> Add to Cart
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function selectSize(element) {
            const allSizes = document.querySelectorAll('.size-option');
            allSizes.forEach(el => el.classList.remove('selected'));
            element.classList.add('selected');
            const selectedSize = element.getAttribute('data-size');
            document.getElementById('<%= hdnSelectedSize.ClientID %>').value = selectedSize;
        }


        function changeQuantity(button, change) {
            var textbox = button.parentElement.querySelector('input[type="text"]');
            var currentQuantity = parseInt(textbox.value);
            var newQuantity = currentQuantity + change;
            if (newQuantity >= 1) {
                textbox.value = newQuantity;
            }
        }

        document.addEventListener('DOMContentLoaded', function () {
            var textbox = document.querySelector('input[type="text"]');
            textbox.addEventListener('input', function () {
                var value = parseInt(this.value);
                if (isNaN(value) || value < 1) {
                    this.value = 1;
                }
            });
        });
    </script>
</asp:Content>
