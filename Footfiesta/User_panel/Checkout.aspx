<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Footfiesta.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="bread"><span><a href="Home.aspx">Home</a></span> / <span>Checkout</span></p>
                </div>
            </div>
        </div>
    </div>


    <div class="colorlib-product">
        <div class="container">
            <div class="row row-pb-lg">
                <div class="col-sm-10 offset-md-1">
                    <div class="process-wrap">
                        <div class="process text-center active">
                            <p><span>01</span></p>
                            <h3>Shopping Cart</h3>
                        </div>
                        <div class="process text-center active">
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

          <div class="row">
    <!-- Billing Details (Left Column) -->
    <div class="col-lg-8">
        <form method="post" class="colorlib-form">
            <h2>Billing Details</h2>

            <div class="form-group">
                <label for="ddlCountry">Select Country</label>
                <div class="form-field">
                    <i class="icon icon-arrow-down3"></i>
                    <asp:DropDownList ID="ddlCountry" CssClass="form-control" runat="server">
                        <asp:ListItem Text="Select country" Value="" />
                        <asp:ListItem>United States</asp:ListItem>
                        <asp:ListItem>Canada</asp:ListItem>
                        <asp:ListItem>United Kingdom</asp:ListItem>
                        <asp:ListItem>Australia</asp:ListItem>
                        <asp:ListItem>India</asp:ListItem>
                        <asp:ListItem>Germany</asp:ListItem>
                        <asp:ListItem>France</asp:ListItem>
                        <asp:ListItem>Italy</asp:ListItem>
                        <asp:ListItem>Spain</asp:ListItem>
                        <asp:ListItem>Mexico</asp:ListItem>
                        <asp:ListItem>Brazil</asp:ListItem>
                        <asp:ListItem>China</asp:ListItem>
                        <asp:ListItem>Japan</asp:ListItem>
                        <asp:ListItem>South Korea</asp:ListItem>
                        <asp:ListItem>Russia</asp:ListItem>
                        <asp:ListItem>Netherlands</asp:ListItem>
                        <asp:ListItem>Switzerland</asp:ListItem>
                        <asp:ListItem>Sweden</asp:ListItem>
                        <asp:ListItem>Norway</asp:ListItem>
                        <asp:ListItem>Denmark</asp:ListItem>
                        <asp:ListItem>Finland</asp:ListItem>
                        <asp:ListItem>New Zealand</asp:ListItem>
                        <asp:ListItem>Singapore</asp:ListItem>
                        <asp:ListItem>Thailand</asp:ListItem>
                        <asp:ListItem>Malaysia</asp:ListItem>
                        <asp:ListItem>South Africa</asp:ListItem>
                        <asp:ListItem>Argentina</asp:ListItem>
                        <asp:ListItem>Philippines</asp:ListItem>
                        <asp:ListItem>Turkey</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <table class="table table-borderless">
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="txtFirstName">First Name</label>
                            <asp:TextBox ID="txtFirstName" CssClass="form-control" Placeholder="Your firstname" runat="server" />
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <label for="txtLastName">Last Name</label>
                            <asp:TextBox ID="txtLastName" CssClass="form-control" Placeholder="Your lastname" runat="server" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="form-group">
                            <label for="txtCompanyName">Company Name</label>
                            <asp:TextBox ID="txtCompanyName" CssClass="form-control" Placeholder="Company Name" runat="server" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="form-group">
                            <label for="txtAddress1">Address</label>
                            <asp:TextBox ID="txtAddress1" CssClass="form-control" Placeholder="Enter Your Address" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtAddress2" CssClass="form-control" Placeholder="Second Address" runat="server" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="form-group">
                            <label for="txtCity">Town/City</label>
                            <asp:TextBox ID="txtCity" CssClass="form-control" Placeholder="Town or City" runat="server" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="txtState">State/Province</label>
                            <asp:TextBox ID="txtState" CssClass="form-control" Placeholder="State Province" runat="server" />
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <label for="txtZip">Zip/Postal Code</label>
                            <asp:TextBox ID="txtZip" CssClass="form-control" Placeholder="Zip / Postal" runat="server" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-group">
                            <label for="txtEmail">E-mail Address</label>
                            <asp:TextBox ID="txtEmail" CssClass="form-control" Placeholder="Email Address" runat="server" />
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <label for="txtPhone">Phone Number</label>
                            <asp:TextBox ID="txtPhone" CssClass="form-control" Placeholder="Phone Number" runat="server" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="form-group">
                            <div class="radio">
                                <label>
                                    <asp:RadioButton ID="rbCreateAccount" GroupName="Options" runat="server" />
                                    Create an Account?
                                </label>
                                <label>
                                    <asp:RadioButton ID="rbDifferentAddress" GroupName="Options" runat="server" Checked="true" />
                                    Ship to different address
                                </label>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <!-- Cart + Payment (Right Column) -->
  <div class="col-lg-4">
    <div class="cart-detail">
        <h2>Cart Total</h2>
        <ul>
            <li>
                <span>Subtotal</span> <span id="subTotal" runat="server"></span>
                <ul id="productList" runat="server">
                    <%-- Dynamic product list will be rendered here from code-behind --%>
                </ul>
            </li>
            <li><span>Shipping</span> <span>$0.00</span></li>
            <li><span>Order Total</span> <span id="orderTotal" runat="server"></span></li>
        </ul>
    </div>

    <div class="cart-detail">
        <h2>Payment Method</h2>
        <div class="form-group">
            <label><input type="radio" name="optradio"> Direct Bank Transfer</label>
        </div>
        <div class="form-group">
            <label><input type="radio" name="optradio"> Check Payment</label>
        </div>
        <div class="form-group">
            <label><input type="radio" name="optradio"> Paypal</label>
        </div>
        <div class="form-group">
            <label><input type="checkbox"> I have read and accept the terms and conditions</label>
        </div>
    </div>

    <div class="text-center">
        <asp:Button ID="btnPlaceOrder" runat="server" CssClass="btn btn-primary" Text="Place an order" OnClick="btnPlaceOrder_Click" />
    </div>
</div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
