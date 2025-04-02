<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Product_Details.aspx.cs" Inherits="Footfiesta.Product_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-weight: normal;
        }

        .auto-style2 {
            display: block;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
            background-clip: padding-box;
            border-radius: .25rem;
            transition: none;
            border: 1px solid #ced4da;
            background-color: #fff;
        }
        /* Additional Styling */
        .product-container {
            border: 1px solid #ccc;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 8px;
            background-color: #f9f9f9;
        }

        .product-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }

        .product-price {
            font-size: 18px;
            color: #28a745;
            font-weight: bold;
        }

        .size-option {
            padding: 10px 15px;
            border: 1px solid #ccc;
            background-color: #ddd;
            cursor: pointer;
            text-align: center;
            width: 50px;
            font-size: 16px;
            transition: 0.3s;
        }

            .size-option:hover {
                background-color: #444;
                color: white;
            }

        .quantity-btn {
            background-color: #B0B0B0;
            color: white;
            border: none;
            width: 40px;
            height: 40px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            cursor: pointer;
            text-decoration: none;
        }

        .addtocart {
            margin-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="bread"><span><a href="Home.aspx">Home</a></span> / <span>Product Details</span></p>
                </div>
            </div>
        </div>
    </div>


    <asp:Label ID="lblDescription" runat="server" Text="Loading..."></asp:Label>

    <asp:Repeater ID="RepeaterProductDetails" runat="server">
        <ItemTemplate>
            <div class="product-container">
                <div>
                    <a href="#">
                        <img src='<%# Eval("Image_url") %>' alt="<%# Eval("Product_Name") %>" class="auto-style2">
                    </a>
                </div>

                <div>
                    <h3 class="product-title"><%# Eval("Product_Name") %></h3>
                    <p>
                        <span class="product-price"><%# Eval("Price", "{0:C}") %></span>
                        <span>
                            <i></i><i></i><i></i><i></i><i></i>
                            (74 Rating)
                        </span>
                    </p>
                    <p><%# Eval("Description") %></p>

                    <h4>SIZE</h4>
                    <div id="sizeOptions" style="display: flex; flex-wrap: wrap; gap: 8px;">
                        <asp:Repeater ID="rptSizes" runat="server">
                            <ItemTemplate>
                                <div class="size-option" onclick="selectSize(this)" data-size='<%# Eval("SizeValue") %>'>
                                    <%# Eval("SizeValue") %>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <h4>QUANTITY</h4>
                    <div style="display: flex; align-items: center; gap: 5px;">
                        <asp:LinkButton ID="btnDecrease" runat="server" CssClass="quantity-btn" OnClientClick="changeQuantity(this, -1); return false;">-</asp:LinkButton>

                        <asp:TextBox ID="txtQuantity" runat="server" Text="1" ReadOnly="true" CssClass="auto-style2" Style="text-align: center; width: 50px; height: 40px;"></asp:TextBox>

                        <asp:LinkButton ID="btnIncrease" runat="server" CssClass="quantity-btn" OnClientClick="changeQuantity(this, 1); return false;">+</asp:LinkButton>

                    </div>

                    <div class="addtocart text-center">
                        <asp:LinkButton ID="btnAddToCart" runat="server" CssClass="btn btn-primary btn-addtocart" OnClick="btnAddToCart_Click" CommandArgument='<%# Eval("Product_Name") %>' OnCommand="btnAddToCart_Command1">
                            <i class="icon-shopping-cart"></i> Add to Cart
                        </asp:LinkButton>
                    </div>

                    <asp:HiddenField ID="selectedSize" runat="server" />
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <script type="text/javascript">
        function selectSize(element) {
            var sizeElements = element.closest(".product-container").querySelectorAll('.size-option');
            sizeElements.forEach(el => {
                el.style.backgroundColor = "#ddd";
                el.style.color = "black";
            });

            element.style.backgroundColor = "#444";
            element.style.color = "white";

            var hiddenField = element.closest(".product-container").querySelector("input[type='hidden']");
            if (hiddenField) {
                hiddenField.value = element.getAttribute('data-size');
            }
        }


        function changeQuantity(button, amount) {
            var container = button.closest(".product-container");
            var quantityInput = container.querySelector("input[type='text']");

            if (quantityInput) {
                var currentValue = parseInt(quantityInput.value, 10);
                if (currentValue + amount > 0) {
                    quantityInput.value = currentValue + amount;
                }
            }
        }

    </script>



    <asp:Repeater ID="rptSizes" runat="server">
        <ItemTemplate>
            <div onclick="selectSize(this)" data-size='<%# Eval("SizeValue") %>'
                style="padding: 10px 15px; border: 1px solid #ccc; background-color: #ddd; cursor: pointer; text-align: center; width: 50px; font-size: 16px; transition: 0.3s;">
                <%# Eval("SizeValue") %>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
