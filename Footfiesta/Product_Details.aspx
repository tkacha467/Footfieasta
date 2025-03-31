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


    <div class="colorlib-product">
        <div class="container">
            <div class="row row-pb-lg product-detail-wrap">
                <div class="col-sm-8">
                    <div class="owl-carousel">
                        <div class="item">
                            <div class="product-entry border">
                                <a href="#" class="prod-img">
                                    <img src="images/item-1.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product-entry border">
                                <a href="#" class="prod-img">
                                    <img src="images/item-2.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product-entry border">
                                <a href="#" class="prod-img">
                                    <img src="images/item-3.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="product-entry border">
                                <a href="#" class="prod-img">
                                    <img src="images/item-4.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="product-desc">
                        <h3>Women's Boots Shoes Maca</h3>
                        <p class="price">
                            <span>$68.00</span>
                            <span class="rate">
                                <i class="icon-star-full"></i>
                                <i class="icon-star-full"></i>
                                <i class="icon-star-full"></i>
                                <i class="icon-star-full"></i>
                                <i class="icon-star-half"></i>
                                (74 Rating)
                            </span>
                        </p>
                        <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                        <div class="container mt-4">
                            <h4>SIZE</h4>

                            <div style="display: flex; align-items: center; gap: 15px; flex-wrap: wrap;">

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
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-md-12 pills">
                            <div class="bd-example bd-example-tabs">
                                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

                                    <li class="nav-item">
                                        <a class="nav-link active" id="pills-description-tab" data-toggle="pill" href="#pills-description" role="tab" aria-controls="pills-description" aria-expanded="true">Description</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="pills-manufacturer-tab" data-toggle="pill" href="#pills-manufacturer" role="tab" aria-controls="pills-manufacturer" aria-expanded="true">Manufacturer</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-expanded="true">Review</a>
                                    </li>
                                </ul>

                                <div class="tab-content" id="pills-tabContent">
                                    <div class="tab-pane border fade show active" id="pills-description" role="tabpanel" aria-labelledby="pills-description-tab">
                                        <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                        <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                        <ul>
                                            <li>The Big Oxmox advised her not to do so</li>
                                            <li>Because there were thousands of bad Commas</li>
                                            <li>Wild Question Marks and devious Semikoli</li>
                                            <li>She packed her seven versalia</li>
                                            <li>tial into the belt and made herself on the way.</li>
                                        </ul>
                                    </div>

                                    <div class="tab-pane border fade" id="pills-manufacturer" role="tabpanel" aria-labelledby="pills-manufacturer-tab">
                                        <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                        <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    </div>

                                    <div class="tab-pane border fade" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <h3 class="head">23 Reviews</h3>
                                                <div class="review">
                                                    <div class="user-img" style="background-image: url(images/person1.jpg)"></div>
                                                    <div class="desc">
                                                        <h4>
                                                            <span class="text-left">Jacob Webb</span>
                                                            <span class="text-right">14 March 2018</span>
                                                        </h4>
                                                        <p class="star">
                                                            <span>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-half"></i>
                                                                <i class="icon-star-empty"></i>
                                                            </span>
                                                            <span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
                                                        </p>
                                                        <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
                                                    </div>
                                                </div>
                                                <div class="review">
                                                    <div class="user-img" style="background-image: url(images/person2.jpg)"></div>
                                                    <div class="desc">
                                                        <h4>
                                                            <span class="text-left">Jacob Webb</span>
                                                            <span class="text-right">14 March 2018</span>
                                                        </h4>
                                                        <p class="star">
                                                            <span>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-half"></i>
                                                                <i class="icon-star-empty"></i>
                                                            </span>
                                                            <span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
                                                        </p>
                                                        <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
                                                    </div>
                                                </div>
                                                <div class="review">
                                                    <div class="user-img" style="background-image: url(images/person3.jpg)"></div>
                                                    <div class="desc">
                                                        <h4>
                                                            <span class="text-left">Jacob Webb</span>
                                                            <span class="text-right">14 March 2018</span>
                                                        </h4>
                                                        <p class="star">
                                                            <span>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-half"></i>
                                                                <i class="icon-star-empty"></i>
                                                            </span>
                                                            <span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>
                                                        </p>
                                                        <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="rating-wrap">
                                                    <h3 class="head">Give a Review</h3>
                                                    <div class="wrap">
                                                        <p class="star">
                                                            <span>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-full"></i>
                                                                (98%)
                                                            </span>
                                                            <span>20 Reviews</span>
                                                        </p>
                                                        <p class="star">
                                                            <span>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-empty"></i>
                                                                (85%)
                                                            </span>
                                                            <span>10 Reviews</span>
                                                        </p>
                                                        <p class="star">
                                                            <span>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-empty"></i>
                                                                <i class="icon-star-empty"></i>
                                                                (70%)
                                                            </span>
                                                            <span>5 Reviews</span>
                                                        </p>
                                                        <p class="star">
                                                            <span>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-empty"></i>
                                                                <i class="icon-star-empty"></i>
                                                                <i class="icon-star-empty"></i>
                                                                (10%)
                                                            </span>
                                                            <span>0 Reviews</span>
                                                        </p>
                                                        <p class="star">
                                                            <span>
                                                                <i class="icon-star-full"></i>
                                                                <i class="icon-star-empty"></i>
                                                                <i class="icon-star-empty"></i>
                                                                <i class="icon-star-empty"></i>
                                                                <i class="icon-star-empty"></i>
                                                                (0%)
                                                            </span>
                                                            <span>0 Reviews</span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



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
