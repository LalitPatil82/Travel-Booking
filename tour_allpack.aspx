<%@ Page Title="" Language="VB" MasterPageFile="~/User.master" AutoEventWireup="false" CodeFile="tour_allpack.aspx.vb" Inherits="tour_allpack" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="tours3 section-padding bg-lightnav" id="tour">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-subtitle"><span>Choose your place</span></div>
                    <div class="section-title">Popular <span>Tours</span></div>
                </div>
            </div>
            <div class="row">
     <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="square-flip">
                                <div class="square bg-img" data-background="<%# ("admin/img/Packages/") + Eval("cover_image") %>">
                                    <span class="category"><a href="#0">india</a></span>
                                    <div class="square-container d-flex align-items-end justify-content-end">
                                        <div class="box-title">
                                            <h4><%# Eval("name") %></h4>
                                            <h6>₹ <%# Eval("price") %> / per person</h6>
                                        </div>
                                    </div>
                                    <div class="flip-overlay"></div>
                                </div>
                                <div class="square2 bg-white">
                                    <div class="square-container2">
                                        <h4><%# Eval("name") %>, India</h4>
                                        <h6>₹ <%# Eval("price") %> / per person</h6>
                                        <p style="text-align: justify;"><%# Eval("description") %></p>
                                        <div class="row tour-list mb-30">
                                            <div class="col col-md-6">
                                                <ul>
                                                    <li><i class="ti-time"></i><%# Eval("duration") %></li>
                                                    <li><i class="ti-user"></i><%# Eval("max_limit") %></li>
                                                </ul>
                                            </div>
                                            <div class="col col-md-6">
                                                <ul>
                                                    <li><i class="ti-location-pin"></i>India

                                                    </li>
                                                    <li><i class="ti-face-smile"></i>9.5 Superb</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="btn-line">
                                            <asp:LinkButton runat="server" ID="tour_detail" Text="Tour details" CommandArgument='<%# Eval("id") %>'></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           </div>
                        
                    </ItemTemplate>
                </asp:Repeater>
               

                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT * FROM [tour_package]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

