<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Footfiesta.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="bread"><span><a href="index.html">Home</a></span> / <span>Contact</span></p>
                </div>
            </div>
        </div>
    </div>


    <div id="colorlib-contact">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h3>Contact Information</h3>
                    <div class="row contact-info-wrap">
                        <div class="col-md-3">
                            <p>
                                <span><i class="icon-location"></i></span>198 West 21th Street,
                                <br>
                                Suite 721 New York NY 10016
                            </p>
                        </div>
                        <div class="col-md-3">
                            <p><span><i class="icon-phone3"></i></span><a href="tel://1234567920">+ 1235 2355 98</a></p>
                        </div>
                        <div class="col-md-3">
                            <p><span><i class="icon-paperplane"></i></span><a href="mailto:info@yoursite.com">info@yoursite.com</a></p>
                        </div>
                        <div class="col-md-3">
                            <p><span><i class="icon-globe"></i></span><a href="#">yoursite.com</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="contact-wrap">
                        <h3>Get In Touch</h3>
                        <form action="#" class="contact-form">
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
                                        <asp:TextBox ID="email" class="form-control"  placeholder="Enter your E-Mail Id" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="subject">Subject</label>
                                        <br />
                                        <asp:TextBox ID="subject" class="form-control"  placeholder="Enter your Subject " runat="server"></asp:TextBox>
                                        &nbsp;
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="message">Message</label>
                                        <br />
                                        <asp:TextBox id="message" class="form-control" runat="server"  placeholder="Message !"  Height="95px"></asp:TextBox>
                                        <br />
                                    
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <input type="submit" value="Send Message" class="btn btn-primary">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-6">
                    <div id="map" class="colorlib-map"></div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
</asp:Content>




