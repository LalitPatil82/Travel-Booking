<%@ Page Title="" Language="VB" MasterPageFile="~/User.master" AutoEventWireup="false" CodeFile="tour_detail.aspx.vb" Inherits="tour_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <header class="header slider">
                <div class="owl-carousel owl-theme">
                    <!-- The opacity on the image is made with "data-overlay-dark="number". You can change it using the numbers 0-9. -->
                    <div class="text-center item bg-img" data-overlay-dark="2" data-background="<%# ("admin/img/Packages/") + Eval("cover_image") %>"></div>
                </div>
                <!-- arrow down -->
                <div class="arrow bounce text-center">
                    <a href="#" data-scroll-nav="1" class=""><i class="ti-arrow-down"></i></a>
                </div>
            </header>
            <section class="tour-page section-padding" data-scroll-index="1">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 mb-30">
                            <div class="section-subtitle">Travel Agency</div>
                            <div class="section-title mb-0"><span><%# Eval("name") %></span></div>
                            <div class="rating mb-30">
                                <i class="star active"></i><i class="star active"></i><i class="star active"></i><i class="star active"></i><i class="star active"></i>
                                <div class="reviews-count color-2">(2 Reviews)</div>
                            </div>
                            <div class="tour-page head-icon">
                                <p><i class="ti-time"></i><%# Eval("duration") %></p>
                                <p><i class="ti-user"></i><%# Eval("max_limit") %> People</p>
                                <p><i class="ti-location-pin"></i><%# Eval("name") %></p>
                                <p><i class="ti-face-smile"></i>9.3 Superb</p>
                                <p><i class="ti-ticket"></i><%# Eval("mode_tsp") %></p>
                            </div>
                            <h6>Information</h6>
                            <p class="mb-30"><%# Eval("description") %></p>
                            <ul class="list-unstyled page-list mb-30">
                                <li>
                                    <div class="page-list-icon"></div>
                                    <div class="page-list-text">
                                        <p style="margin-left:-17px;"><%# Eval("duration") %>, Max-limit: <%# Eval("max_limit") %> People, <%# Eval("name") %></p>
                                    </div>
                                </li>
                            </ul>

                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <div class="tour-page time-table">
                                        <span>Day <%# Eval("sr_no") %></span>
                                        <p style="text-align: justify"><%# Eval("desc") %></p>
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT * FROM [tour_day_wise_scheduling] WHERE ([package_id] = @package_id)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="Label1" PropertyName="Text" DefaultValue="0" Name="package_id" Type="Int32"></asp:ControlParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <br /><br />

                                <!--Book Button-->
                    <div class="col-md-12">
                        <asp:Button ID="btn_book" runat="server" OnClick="btn_book_Click" Text="Book Now" CssClass="butn-dark" />

                      <%--  <button class="butn-dark" id="btn_book" runat="server"><a href="#0"><span>Book Now</span></a></button>--%>
                    </div>

                    <br /><br />
                            <%--Inclusions
                            --%>
                            <h6 class="mb-0">Inclusions</h6>
                            <div class="row">
                                        <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource6">
                                            <ItemTemplate>
                                                <div class="tour-page time-table">
                                                    <p ><i class="ti-check" style="color:green;"></i> <%# Eval("description") %></p><br />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT * FROM [tour_inclu_exclu] WHERE ([pack_id] = @pack_id) AND ([type] = @type)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Label1" PropertyName="Text" DefaultValue="0" Name="pack_id" Type="Int32"></asp:ControlParameter>
                                           <asp:Parameter DefaultValue="Inclusion" Name="type" Type="String"></asp:Parameter>
                                                </SelectParameters>
                                        </asp:SqlDataSource>
                            </div>

                            <br>
                            <br>

                        <%--    Excluction--%>
                             <h6 class="mb-0">Exclusions</h6>
                            <div class="row">
                            
                                        <asp:Repeater ID="Repeater8" runat="server" DataSourceID="SqlDataSource9">
                                            <ItemTemplate>
                                                <div class="tour-page time-table">
                                                <p><i class="ti-close" style="color:red;"></i> <%# Eval("description") %></p><br />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource9" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT * FROM [tour_inclu_exclu] WHERE ([pack_id] = @pack_id) AND ([type] = @type)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Label1" PropertyName="Text" DefaultValue="0" Name="pack_id" Type="Int32"></asp:ControlParameter>
                                           <asp:Parameter DefaultValue="Exclusion" Name="type" Type="String"></asp:Parameter>
                                                </SelectParameters>
                                        </asp:SqlDataSource>
                            </div>

                            <br>
                            <br>

                                <asp:SqlDataSource runat="server" ID="SqlDataSource8" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT * FROM [tour_place] WHERE ([pack_id] = @pack_id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="Label1" PropertyName="Text" DefaultValue="0" Name="pack_id" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            <!-- Gallery -->
                            <h6 class="mb-0">Tour Gallery</h6>
                            <div class="row">
                                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                    <ItemTemplate>
                                        <div class="col-md-4 gallery-item">
                                            <a href="<%# ("admin/img/place_img/") + Eval("place_image") %>" title="" class="img-zoom">
                                                <div class="gallery-box">
                                                    <div class="gallery-img">
                                                        <img src="<%# ("admin/img/place_img/") + Eval("place_image") %>" class="img-fluid mx-auto d-block" alt="work-img" style="width: 200px; height: 200px;">
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>


                                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT * FROM [tour_place] WHERE ([pack_id] = @pack_id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="Label1" PropertyName="Text" DefaultValue="0" Name="pack_id" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </div>
                            <br>
                            <br>

                            <!-- FAQ's -->
                            <h6>Tour Plan</h6>
                            <ul class="accordion-box clearfix">
                                <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                                    <ItemTemplate>
                                        <li class="accordion block">
                                            <div class="acc-btn"><%# Eval("question") %></div>
                                            <div class="acc-content">
                                                <div class="content">
                                                    <div class="text"><%# Eval("answer") %></div>
                                                </div>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>

                                <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT * FROM [tour_faqs] WHERE ([package_id] = @package_id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="Label1" PropertyName="Text" DefaultValue="0" Name="package_id" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </ul>
                        </div>
                        <!-- sidebar -->
                     <!--   <div class="col-md-4">
                            <div class="sidebar">
                                <div class="right-sidebar">
                                    <div class="right-sidebar item">
                                        <h3><span class="right-sidebar item__from">Registration From</span></h3>
                                        <form method="post" class="right-sidebar item-form" action="">
                                            <div class="row">
                                                <div class="col-md-12 form-group">
                                                    <input name="name" type="text" placeholder="Full Name" required>
                                                </div>
                                                <div class="col-md-12 form-group">
                                                    <input name="email" type="email" placeholder="Email Address" required>
                                                </div>
                                                <div class="col-md-12 form-group input1_inner">
                                                    <input type="text" class="form-control input datepicker" placeholder="Travel Date" required>
                                                </div>
                                                <div class="col-md-12 form-group">
                                                    <input name="people" type="text" placeholder="People" required>
                                                </div>
                                                <div class="col-md-12 form-group">
                                                    <textarea name="message" id="message" cols="30" rows="4" placeholder="Your Enquiry"></textarea>
                                                </div>
                                                <div class="col-md-12">
                                                    <button class="butn-dark"><a href="#0"><span>Book Now</span></a></button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                </div>
            </section>
        </ItemTemplate>
    </asp:Repeater>


    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT * FROM [tour_package] WHERE ([id] = @id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" PropertyName="Text" DefaultValue="0" Name="id" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <!--tour details-->
    <div class="tours3 section-padding bg-lightnav">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-subtitle"><span>Choose your place</span></div>
                    <div class="section-title">Popular <span>Tours</span></div>
                </div>
            </div>
            <div class="row">
                <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource5">
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
                                        <p><%# Eval("description") %></p>
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
                                            <asp:LinkButton runat="server" ID="tour_detail" Text="Tour details" CommandArgument='<%# Eval("id") %>'></asp:LinkButton></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT * FROM [tour_package] WHERE ([id] <> @id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" PropertyName="Text" DefaultValue="0" Name="id" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <!-- Hotel -->
    <section class="blog section-padding bg-navy" id="hotel">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-subtitle"><span>Near By Hotel</span></div>
                    <div class="section-title"><span>Hotel</span> Where To Stay</div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="owl-carousel owl-theme">
                        <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource7">
                            <ItemTemplate>
                                <div class="item">
                                    <div class="position-re o-hidden">
                                        <img src="<%# ("admin/img/hotel_img/") + Eval("Image") %>" alt="" style="width: 100%; height: 300px;">
                                    </div>
                                    <div class="con">
                                        <span class="category">
                                            <a href="blog.html"><%# Eval("web_link") %></a>
                                        </span>
                                        <h5><a href="post.html"><%# Eval("name") %></a></h5>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>


                        <asp:SqlDataSource runat="server" ID="SqlDataSource7" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT * FROM [tour_hotel] WHERE ([package_id] = @package_id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="Label1" PropertyName="Text" DefaultValue="0" Name="package_id" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <!-- Testimonials -->
    <section class="testimonials">
        <div class="background bg-img bg-fixed section-padding pb-0" data-background="img/slider/15.jpg" data-overlay-dark="5">
            <div class="container">
                <div class="row">
                    <!-- Call Now  -->
                    <div class="col-md-5 mb-30 mt-30">
                        <p><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i><i class="star-rating"></i></p>
                        <h5>We Provide Top Destinations Expecially For You Book Now and Enjoy!</h5>
                        <div class="phone-call mb-10">
                            <div class="icon color-1"><span class="flaticon-phone-call"></span></div>
                            <div class="text">
                                <p class="color-1">Call Now</p>
                                <a class="color-1" href="tel:855-333-4444">855 333 4444</a>
                            </div>
                        </div>
                        <p><i class="ti-check"></i><small>Call us, it's toll-free.</small></p>
                    </div>
                    <!-- Booking From -->
                    <div class="col-md-5 offset-md-2">
                        <div class="testimonials-box">
                            <div class="head-box">
                                <h6>Testimonials</h6>
                                <h4>Travelers Reviews</h4>
                            </div>
                            <div class="owl-carousel owl-theme">
                                <div class="item">
                                    <p>Travel dapibus asue metus the nec feusiate era the miss hendreri the vemante the lemon insan toleon nectan feugiat erat hendrerit necuis vesaire tours inilla neca ine the sene miss habitan.</p>
                                    <div class="info">
                                        <div class="author-img">
                                            <img src="img/team/04.png" alt="">
                                        </div>
                                        <div class="cont">
                                            <div class="rating"><i class="star active"></i><i class="star active"></i><i class="star active"></i><i class="star active"></i><i class="star active"></i></div>
                                            <h6>Nolan White</h6>
                                            <span>Guest review</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <p>Travel dapibus asue metus the nec feusiate era the miss hendreri the vemante the lemon insan toleon nectan feugiat erat hendrerit necuis vesaire tours inilla neca ine the sene miss habitan.</p>
                                    <div class="info">
                                        <div class="author-img">
                                            <img src="img/team/05.png" alt="">
                                        </div>
                                        <div class="cont">
                                            <div class="rating"><i class="star active"></i><i class="star active"></i><i class="star active"></i><i class="star active"></i><i class="star active"></i></div>
                                            <h6>Emily Brown</h6>
                                            <span>Guest review</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="item">
                                    <p>Travel dapibus asue metus the nec feusiate era the miss hendreri the vemante the lemon insan toleon nectan feugiat erat hendrerit necuis vesaire tours inilla neca ine the sene miss habitan.</p>
                                    <div class="info">
                                        <div class="author-img">
                                            <img src="img/team/06.png" alt="">
                                        </div>
                                        <div class="cont">
                                            <div class="rating"><i class="star active"></i><i class="star active"></i><i class="star active"></i><i class="star active"></i><i class="star active"></i></div>
                                            <h6>Olivia Martin</h6>
                                            <span>Guest review</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--clients-->
    <section class="clients">
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <div class="owl-carousel owl-theme">
                        <div class="clients-logo">
                            <a href="#0">
                                <img src="img/clients/1.png" alt=""></a>
                        </div>
                        <div class="clients-logo">
                            <a href="#0">
                                <img src="img/clients/2.png" alt=""></a>
                        </div>
                        <div class="clients-logo">
                            <a href="#0">
                                <img src="img/clients/3.png" alt=""></a>
                        </div>
                        <div class="clients-logo">
                            <a href="#0">
                                <img src="img/clients/4.png" alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

