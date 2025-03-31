<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Product_Details.aspx.cs" Inherits="Footfiesta.Product_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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



    <%--<div class="colorlib-product">
        <div class="container">
            <div class="row row-pb-lg product-detail-wrap">
                <div class="col-sm-8">
                    <asp:Repeater ID="rptProductImages" runat="server">
                        <ItemTemplate>
                            <div class="item">
                                <div class="product-entry border">
                                    <a href="#" class="prod-img">
                                        <asp:Image ID="imgProduct" runat="server" CssClass="img-fluid" ImageUrl='<%# Eval("ImageUrl") %>' AlternateText="Product Image" />
                                    </a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="col-sm-4">
                    <div class="product-desc">
                        <h3>
                            <asp:Label ID="Label4" runat="server" Text="Women's Boots Shoes Maca"></asp:Label></h3>
                        <p class="price">
                            <span>
                                <asp:Label ID="Label5" runat="server" Text="$68.00"></asp:Label></span>
                            <span class="rate">
                                <asp:Label ID="lblRating" runat="server" Text="★★★★★"></asp:Label>
                                (74 Rating)
                            </span>
                        </p>
                        <p>
                            <asp:Label ID="Label6" runat="server" Text="Product description goes here."></asp:Label>
                        </p>
                        <div class="container mt-4">
                            <h4>SIZE</h4>
                            <div id="sizeOptions" style="display: flex; flex-wrap: wrap; gap: 8px;">
                                <!-- Size Options -->
                                <div id="sizeOptions" style="display: flex; flex-wrap: wrap; gap: 8px;">
                                    <asp:Repeater ID="rptSizes" runat="server">
                                        <ItemTemplate>
                                            <div onclick="selectSize(this)" data-size='<%# Eval("SizeValue") %>'
                                                style="padding: 10px 15px; border: 1px solid #ccc; background-color: #ddd; cursor: pointer; text-align: center; width: 50px; font-size: 16px; transition: 0.3s;">
                                                <%# Eval("SizeValue") %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <h4>QUANTITY</h4>
                                <!-- Quantity Selector -->
                                <div style="display: flex; align-items: center; gap: 5px;">
                                    <asp:LinkButton ID="btnDecrease" runat="server" OnClientClick="return changeQuantity(-1);"
                                        Style="background-color: #B0B0B0; color: white; border: none; width: 40px; height: 40px; border-radius: 5px; display: flex; align-items: center; justify-content: center; font-size: 20px; cursor: pointer; text-decoration: none;">-</asp:LinkButton>

                                    <asp:TextBox ID="txtQuantity" runat="server" Text="1" ReadOnly="true"
                                        Style="text-align: center; font-size: 18px; width: 50px; height: 40px; border-radius: 5px; border: 1px solid #ccc;"></asp:TextBox>

                                    <asp:LinkButton ID="btnIncrease" runat="server" OnClientClick="return changeQuantity(1);"
                                        Style="background-color: #B0B0B0; color: white; border: none; width: 40px; height: 40px; border-radius: 5px; display: flex; align-items: center; justify-content: center; font-size: 20px; cursor: pointer; text-decoration: none;">+</asp:LinkButton>
                                </div>

                                <!-- Add to Cart Button -->

                                <div class="row">
                                    <div class="col-sm-12 text-center">
                                        <p class="addtocart">
                                            <asp:LinkButton ID="btnAddToCart" runat="server" CssClass="btn btn-primary btn-addtocart" OnClick="btnAddToCart_Click">
                <i class="icon-shopping-cart"></i> Add to Cart
                                            </asp:LinkButton>
                                        </p>
                                    </div>
                                </div>

                            </div>

                            <!-- HiddenField to store selected size -->
                            <asp:HiddenField ID="selectedSize" runat="server" />

                            <!-- Inline JavaScript -->
                            <script type="text/javascript">
                                function selectSize(element) {
                                    // Reset styles for all size options
                                    var sizeElements = document.querySelectorAll('#sizeOptions div');
                                    for (var i = 0; i < sizeElements.length; i++) {
                                        sizeElements[i].style.backgroundColor = "#ddd";
                                        sizeElements[i].style.color = "black";
                                    }

                                    // Highlight selected size
                                    element.style.backgroundColor = "#444";
                                    element.style.color = "white";

                                    // Store selected value in HiddenField
                                    var hiddenField = document.getElementById('<%= selectedSize.ClientID %>');
                                    if (hiddenField) {
                                        hiddenField.value = element.getAttribute('data-size');
                                    }
                                }

                                function changeQuantity(amount) {
                                    var quantityInput = document.getElementById('<%= txtQuantity.ClientID %>');
                                    var currentValue = parseInt(quantityInput.value, 10);

                                    if (currentValue + amount > 0) {
                                        quantityInput.value = currentValue + amount;
                                    }
                                    return false; // Prevent postback
                                }
                            </script>
                        </div>
                    </div>
                    <script type="text/javascript">
                        function selectSize(element) {
                            var sizeElements = document.querySelectorAll('#sizeOptions div');
                            sizeElements.forEach(el => {
                                el.style.backgroundColor = "#ddd";
                                el.style.color = "black";
                            });
                            element.style.backgroundColor = "#444";
                            element.style.color = "white";
                            document.getElementById('<%= selectedSize.ClientID %>').value = element.getAttribute('data-size');
                        }
                        function changeQuantity(amount) {
                            var quantityInput = document.getElementById('<%= txtQuantity.ClientID %>');
                            var currentValue = parseInt(quantityInput.value, 10);
                            if (currentValue + amount > 0) {
                                quantityInput.value = currentValue + amount;
                            }
                            return false;
                        }
                    </script>
                </div>
            </div>
        </div>--%>

    <asp:Repeater ID="rptProducts" runat="server">
        <ItemTemplate>
            <asp:Label ID="Label1" runat="server" CssClass="product-name" Text='<%# Eval("ProductName") %>'></asp:Label><br />
            <asp:Image ID="Image1" runat="server" CssClass="product-image" ImageUrl='<%# Eval("ProductImage") %>' /><br />
            <asp:Label ID="Label2" runat="server" CssClass="product-price" Text='<%# Eval("ProductPrice") %>'></asp:Label><br />
            <asp:Label ID="Label3" runat="server" CssClass="product-description" Text='<%# Eval("ProductDescription") %>'></asp:Label><br />

            <div class="colorlib-product">
                <div class="container">
                    <div class="row row-pb-lg product-detail-wrap">
                        <div class="col-sm-8">
                            <asp:Repeater ID="rptProductImages" runat="server">
                                <ItemTemplate>
                                    <div class="item">
                                        <div class="product-entry border">
                                            <a href="#" class="prod-img">
                                                <asp:Image ID="imgProduct" runat="server" CssClass="img-fluid" ImageUrl='<%# Eval("ImageUrl") %>' AlternateText="Product Image" />
                                            </a>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="col-sm-4">
                            <div class="product-desc">
                                <h3>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                </h3>
                                <p class="price">
                                    <span>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("ProductPrice") %>'></asp:Label></span>
                                    <span class="rate">
                                        <asp:Label ID="lblRating" runat="server" Text='<%# Eval("ProductRating") %>'></asp:Label>
                                        (74 Rating)
                                    </span>
                                </p>
                                <p>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("ProductDescription") %>'></asp:Label>
                                </p>
                                 <div class="container mt-4">
                            <h4>SIZE</h4>
                            <div id="sizeOptions" style="display: flex; flex-wrap: wrap; gap: 8px;">
                                <!-- Size Options -->
                                <div id="sizeOptions" style="display: flex; flex-wrap: wrap; gap: 8px;">
                                    <asp:Repeater ID="rptSizes" runat="server">
                                        <ItemTemplate>
                                            <div onclick="selectSize(this)" data-size='<%# Eval("SizeValue") %>'
                                                style="padding: 10px 15px; border: 1px solid #ccc; background-color: #ddd; cursor: pointer; text-align: center; width: 50px; font-size: 16px; transition: 0.3s;">
                                                <%# Eval("SizeValue") %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <h4>QUANTITY</h4>
                                <!-- Quantity Selector -->
                                <div style="display: flex; align-items: center; gap: 5px;">
                                    <asp:LinkButton ID="btnDecrease" runat="server" OnClientClick="return changeQuantity(-1);"
                                        Style="background-color: #B0B0B0; color: white; border: none; width: 40px; height: 40px; border-radius: 5px; display: flex; align-items: center; justify-content: center; font-size: 20px; cursor: pointer; text-decoration: none;">-</asp:LinkButton>

                                    <asp:TextBox ID="txtQuantity" runat="server" Text="1" ReadOnly="true"
                                        Style="text-align: center; font-size: 18px; width: 50px; height: 40px; border-radius: 5px; border: 1px solid #ccc;"></asp:TextBox>

                                    <asp:LinkButton ID="btnIncrease" runat="server" OnClientClick="return changeQuantity(1);"
                                        Style="background-color: #B0B0B0; color: white; border: none; width: 40px; height: 40px; border-radius: 5px; display: flex; align-items: center; justify-content: center; font-size: 20px; cursor: pointer; text-decoration: none;">+</asp:LinkButton>
                                </div>

                                <!-- Add to Cart Button -->

                                <div class="row">
                                    <div class="col-sm-12 text-center">
                                        <p class="addtocart">
                                            <asp:LinkButton ID="btnAddToCart" runat="server" CssClass="btn btn-primary btn-addtocart" OnClick="btnAddToCart_Click">
                <i class="icon-shopping-cart"></i> Add to Cart
                                            </asp:LinkButton>
                                        </p>
                                    </div>
                                </div>

                            </div>

                            <!-- HiddenField to store selected size -->
                            <asp:HiddenField ID="selectedSize" runat="server" />

                            <!-- Inline JavaScript -->
                            <script type="text/javascript">
                                function selectSize(element) {
                                    // Reset styles for all size options
                                    var sizeElements = document.querySelectorAll('#sizeOptions div');
                                    for (var i = 0; i < sizeElements.length; i++) {
                                        sizeElements[i].style.backgroundColor = "#ddd";
                                        sizeElements[i].style.color = "black";
                                    }

                                    // Highlight selected size
                                    element.style.backgroundColor = "#444";
                                    element.style.color = "white";

                                    // Store selected value in HiddenField
                                    var hiddenField = document.getElementById('<%= selectedSize.ClientID %>');
                                    if (hiddenField) {
                                        hiddenField.value = element.getAttribute('data-size');
                                    }
                                }

                                function changeQuantity(amount) {
                                    var quantityInput = document.getElementById('<%= txtQuantity.ClientID %>');
                                    var currentValue = parseInt(quantityInput.value, 10);

                                    if (currentValue + amount > 0) {
                                        quantityInput.value = currentValue + amount;
                                    }
                                    return false; // Prevent postback
                                }
                            </script>
                        </div>
                    </div>
                    <script type="text/javascript">
                        function selectSize(element) {
                            var sizeElements = document.querySelectorAll('#sizeOptions div');
                            sizeElements.forEach(el => {
                                el.style.backgroundColor = "#ddd";
                                el.style.color = "black";
                            });
                            element.style.backgroundColor = "#444";
                            element.style.color = "white";
                            document.getElementById('<%= selectedSize.ClientID %>').value = element.getAttribute('data-size');
                        }
                        function changeQuantity(amount) {
                            var quantityInput = document.getElementById('<%= txtQuantity.ClientID %>');
                            var currentValue = parseInt(quantityInput.value, 10);
                            if (currentValue + amount > 0) {
                                quantityInput.value = currentValue + amount;
                            }
                            return false;
                        }
                    </script>
                </div>
            </div>
        </div>
        </ItemTemplate>
    </asp:Repeater>

    <script type="text/javascript">
        function selectSize(element) {
            var sizeElements = document.querySelectorAll('#sizeOptions div');
            sizeElements.forEach(el => {
                el.style.backgroundColor = "#ddd";
                el.style.color = "black";
            });
            element.style.backgroundColor = "#444";
            element.style.color = "white";
            document.getElementById('<%= selectedSize.ClientID %>').value = element.getAttribute('data-size');
                        }
                        function changeQuantity(amount) {
                            var quantityInput = document.getElementById('<%= txtQuantity.ClientID %>');
            var currentValue = parseInt(quantityInput.value, 10);
            if (currentValue + amount > 0) {
                quantityInput.value = currentValue + amount;
            }
            return false;
        }
    </script>


    <%--<div class="colorlib-product">
        <div class="container">
            <div class="row row-pb-lg product-detail-wrap">
                <div class="col-sm-8">
                    <div class="owl-carousel">
                        <asp:Repeater ID="rptImages" runat="server">
                            <ItemTemplate>
                                <div class="item">
                                    <div class="product-entry border">
                                        <a href="#" class="prod-img">
                                            <img src='<%# Eval("ImageUrl") %>' class="img-fluid" alt='<%# Eval("AltText") %>' />
                                        </a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="product-desc">
                        <h3><asp:Literal ID="ltlProductName" runat="server"></asp:Literal></h3>
                        <p class="price">
                            <span><asp:Literal ID="ltlPrice" runat="server"></asp:Literal></span>
                            <span class="rate">
                                <i class="icon-star-full"></i>
                                <i class="icon-star-full"></i>
                                <i class="icon-star-full"></i>
                                <i class="icon-star-full"></i>
                                <i class="icon-star-half"></i>
                                (74 Rating)
                            </span>
                        </p>
                        <p><asp:Literal ID="ltlDescription" runat="server"></asp:Literal></p>
                        <div class="size-wrap">
                            <h4>Size</h4>
                            <asp:Repeater ID="rptSizes" runat="server">
                                <ItemTemplate>
                                    <li><a href="#"><%# Eval("Size") %></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="block-26 mb-4">
                            <h4>Width</h4>
                            <asp:Repeater ID="rptWidths" runat="server">
                                <ItemTemplate>
                                    <li><a href="#"><%# Eval("Width") %></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="input-group mb-4">
                            <span class="input-group-btn">
                                <button type="button" class="quantity-left-minus btn" onclick="DecreaseQuantity();">
                                    <i class="icon-minus2"></i>
                                </button>
                            </span>
                            <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control input-number" Text="1" />
                            <span class="input-group-btn ml-1">
                                <button type="button" class="quantity-right-plus btn" onclick="IncreaseQuantity();">
                                    <i class="icon-plus2"></i>
                                </button>
                            </span>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <asp:Button ID="btnAddToCart" runat="server" CssClass="btn btn-primary btn-addtocart" Text="Add to Cart" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-md-12 pills">
                            <div class="bd-example bd-example-tabs">
                                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="pill" href="#pills-description">Description</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="pill" href="#pills-manufacturer">Manufacturer</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="pill" href="#pills-review">Review</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="pills-description">
                                        <asp:Literal ID="ltlLongDescription" runat="server"></asp:Literal>
                                    </div>
                                    <div class="tab-pane fade" id="pills-manufacturer">
                                        <asp:Literal ID="ltlManufacturerInfo" runat="server"></asp:Literal>
                                    </div>
                                    <div class="tab-pane fade" id="pills-review">
                                        <asp:Repeater ID="rptReviews" runat="server">
                                            <ItemTemplate>
                                                <div class="review">
                                                    <div class="user-img" style='background-image: url(<%# Eval("UserImage") %>)'></div>
                                                    <div class="desc">
                                                        <h4>
                                                            <span class="text-left"><%# Eval("UserName") %></span>
                                                            <span class="text-right"><%# Eval("Date") %></span>
                                                        </h4>
                                                        <p><%# Eval("Comment") %></p>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>


    <%--for testing fatch view details--%>
    <%--  <asp:Label ID="Label1" runat="server" CssClass="product-name"></asp:Label><br />
        <asp:Image ID="Image1" runat="server" CssClass="product-image" /><br />
        <asp:Label ID="Label2" runat="server" CssClass="product-price"></asp:Label><br />
        <asp:Label ID="Label3" runat="server" CssClass="product-description"></asp:Label><br />--%>





    <asp:Label ID="lblProductName" runat="server" Font-Bold="True" Font-Size="24px"></asp:Label>
    <br />
    <asp:Image ID="imgProduct" runat="server" Width="300px" Height="300px" />
    <br />
    <asp:Label ID="lblPrice" runat="server" Font-Bold="True" Font-Size="20px" ForeColor="Red"></asp:Label>
    <br />
    <asp:Label ID="lblDescription" runat="server" Font-Size="16px"></asp:Label>
    <br />
    <asp:Button ID="btnBuyNow" runat="server" Text="Buy Now" CssClass="btn btn-primary" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
