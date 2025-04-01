<%@ Page Title="" Language="VB" MasterPageFile="~/User.master" AutoEventWireup="false" CodeFile="Contact_us.aspx.vb" Inherits="Contact_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="admin/plugins/node-waves/waves.css" rel="stylesheet" />
    <!-- Animation Css -->
    <link href="admin/plugins/animate-css/animate.css" rel="stylesheet" />
    <!-- Sweetalert Css -->
    <link href="admin/plugins/sweetalert/sweetalert.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="admin/plugins/sweetalert/sweetalert.min.js" />
            <asp:ScriptReference Path="admin/plugins/sweetalert/new.js" />
        </Scripts>
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <!-- Header Banner -->
            <div class="banner-header section-padding back-position-center valign bg-img bg-fixed" data-overlay-dark="5" data-background="img/slider/15.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 caption mt-90">
                            <h5>Get in touch</h5>
                            <h1>Contact <span>Us</span></h1>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Contact -->
            <section class="contact section-padding">
                <div class="container">
                    <div class="row mb-90">
                        <div class="col-md-6 mb-60">
                            <h3>
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label></h3>
                            <p>we are passionate about travel and creating unforgettable experiences for our clients. Our team of travel experts is dedicated to crafting personalized itineraries that cater to your individual preferences and interests. We believe that travel is not just about visiting new destinations, but also about immersing oneself in the local culture, history, and traditions. That's why we strive to offer unique and authentic experiences that allow you to truly connect with the places you visit.</p>
                            <div class="phone-call mb-30">
                                <div class="icon"><span class="flaticon-phone-call"></span></div>
                                <div class="text">
                                    <p>Phone</p>
                                    <a href="tel:">
                                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label></a>
                                </div>
                            </div>
                            <div class="phone-call mb-30">
                                <div class="icon"><span class="flaticon-message"></span></div>
                                <div class="text">
                                    <p>e-Mail Address</p>
                                    <a href="mailto:">
                                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></a>
                                </div>
                            </div>
                            <div class="phone-call">
                                <div class="icon"><span class="flaticon-placeholder"></span></div>
                                <div class="text">
                                    <p>Location</p>
                                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 mb-30 offset-md-1">
                            <div class="sidebar">
                                <div class="right-sidebar">
                                    <div class="right-sidebar item">
                                        <h2>Get in touch</h2>

                                        <!-- form message -->
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="alert alert-success contact__msg" style="display: none" role="alert">Your message was sent successfully. </div>
                                            </div>
                                        </div>

                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' InsertCommand="INSERT INTO [tour_contact_us] ([name], [email], [purpose], [message], [ph_no]) VALUES (@name, @email, @purpose, @message, @ph_no)">
                                            <InsertParameters>
                                                <asp:Parameter Name="name" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="email" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="purpose" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="message" Type="String"></asp:Parameter>
                                                <asp:Parameter Name="ph_no" Type="String"></asp:Parameter>
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                                        <!-- form elements -->
                                        <div class="row">
                                            <div class="col-md-6 form-group">
                                                <input id="name" runat="server" type="text" placeholder="Your Name *" required>
                                            </div>
                                            <div class="col-md-6 form-group">
                                                <input id="email" runat="server" type="email" placeholder="Your Email *" required>
                                            </div>
                                            <div class="col-md-6 form-group">
                                                <input id="phone" runat="server" maxlength="10" type="text" placeholder="Your Number *" required>
                                            </div>
                                            <div class="col-md-6 form-group">
                                                <input id="subject" runat="server" type="text" placeholder="Subject *" required>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <textarea name="message" runat="server" id="message" cols="30" rows="4" placeholder="Message *" required></textarea>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:Button ID="Button1" runat="server" CssClass="butn-dark" Text="Send Message" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Map Section -->
                    <div class="row">
                        <div class="col-md-12 animate-box" data-animate-effect="fadeInUp">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1573147.7480448114!2d-74.84628175962355!3d41.04009641088412!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25856139b3d33%3A0xb2739f33610a08ee!2s1616%20Broadway%2C%20New%20York%2C%20NY%2010019%2C%20Amerika%20Birle%C5%9Fik%20Devletleri!5e0!3m2!1str!2str!4v1646760525018!5m2!1str!2str" width="100%" height="600" style="border: 0;" allowfullscreen="" loading="lazy"></iframe>
                        </div>
                    </div>
                </div>
            </section>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

