<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Footfiesta.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="bread"><span><a href="Home.aspx">Home</a></span> / <span>Register</span></p>
                </div>
            </div>
        </div>
    </div>


    <div id="colorlib-contact">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="contact-wrap">
                       <%--<h3>Get In Touch</h3>--%>
                        <div action="#" class="contact-form">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="fname">First Name</label>
                                        <br />
                                        <asp:TextBox ID="fname" class="form-control" placeholder="Enter your First Name" runat="server"></asp:TextBox>
                                        &nbsp;
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="lname">Last Name</label>
                                        <br />
                                        <asp:TextBox ID="lname" class="form-control" placeholder="Enter your Last Name" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <br />
                                        <asp:TextBox ID="email" class="form-control" placeholder="Enter your E-Mail Id" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="subject">Phone No</label>
                                        <br />
                                        <asp:TextBox ID="subject" class="form-control" placeholder="Enter your Phone Number " runat="server"></asp:TextBox>
                                        &nbsp;
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="message">Enter Password</label>
                                        <br />
                                        <asp:TextBox ID="message" class="form-control" runat="server" placeholder="Enter Password" Height="95px"></asp:TextBox>
                                        <br />

                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        &nbsp;<asp:Button ID="Button1" runat="server" Text="Send Message" class="btn btn-primary" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div id="map" class="colorlib-map"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

