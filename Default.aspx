<%@ Page Title="" Language="VB" MasterPageFile="~/User.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

   
    <!-- Slider -->
    <header class="header slider-fade" id="home">
        <div class="owl-carousel owl-theme">
            <!-- The opacity on the image is made with "data-overlay-dark="number". You can change it using the numbers 0-9. -->

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="text-center item bg-img" data-overlay-dark="5" data-background="<%# ("admin/img/Packages/") + Eval("cover_image") %>">
                        <div class="v-middle caption">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-10 offset-md-1">
                                        <h4>Let's travel the world with us</h4>
                                        <h1><%# Eval("name") %>

                                        </h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT  top 3 * FROM [tour_package]"></asp:SqlDataSource>
        </div>
    </header>
    <!-- About -->
    <section class="about cover section-padding" id="about">
        <div class="container">
            <div class="row">
                <div class="col-md-6 mb-30 animate-box" data-animate-effect="fadeInUp">
                    <div class="section-subtitle">The best travel agency</div>
                    <div class="section-title">Discover the <span>world</span> with our guide</div>
                    <p>You can choose any country with good tourism. Agency elementum sesue the aucan vestibulum aliquam justo in sapien rutrum volutpat. Donec in quis the pellentesque velit. Donec id velit ac arcu posuere blane.</p>
                    <p>Hotel ut nisl quam nestibulum ac quam nec odio elementum ceisue the miss varius natoque penatibus et magnis dis parturient monte.</p>
                    <ul class="list-unstyled about-list mb-30">
                        <li>
                            <div class="about-list-icon"><span class="ti-check"></span></div>
                            <div class="about-list-text">
                                <p>20 Years of Experience</p>
                            </div>
                        </li>
                        <li>
                            <div class="about-list-icon"><span class="ti-check"></span></div>
                            <div class="about-list-text">
                                <p>150+ Tour Destinations</p>
                            </div>
                        </li>
                    </ul>
                    <!-- Info -->
                    <div class="phone-call mb-30">
                        <div class="icon"><span class="flaticon-phone-call"></span></div>
                        <div class="text">
                            <p>For information</p>
                            <a href="tel:855-333-4444">855 333 4444</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 offset-md-1 animate-box" data-animate-effect="fadeInUp">
                    <div class="img-exp">
                        <div class="about-img">
                            <div class="img">
                                <img src="img/about.jpeg" class="img-fluid" alt="">
                            </div>
                        </div>
                        <div id="circle">
                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="300px" height="300px" viewBox="0 0 300 300" enable-background="new 0 0 300 300" xml:space="preserve">
                                <defs>
                                    <path id="circlePath" d=" M 150, 150 m -60, 0 a 60,60 0 0,1 120,0 a 60,60 0 0,1 -120,0 " />
                                </defs>
                                <circle cx="150" cy="100" r="75" fill="none" />
                                <g>
                                    <use xlink:href="#circlePath" fill="none" />
                                    <text fill="#0f2454">
                                        <textPath xlink:href="#circlePath"> . travel agency . travel agency </textPath>
                                    </text>
                                </g>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Tours 3 -->
    <div class="tours3 section-padding bg-lightnav" id="tour">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-subtitle"><span>Choose your place</span></div>
                    <div class="section-title">Popular <span>Tours</span></div>
                </div>
            </div>
            <div class="row">

                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
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
                                        <p style="text-align: justify;overflow:hidden;"><%# Eval("description") %></p>
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
                 <div  >
                                <asp:Button runat="server" ID="View_more" Text="View More" CssClass="btn-dark" />
                     </div>

                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT Top 6* FROM [tour_package]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
    <!-- Numbers -->
    <section class="numbers">
        <div class="section-padding bg-img bg-fixed back-position-center" data-background="img/slider/15.jpg" data-overlay-dark="6">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="item text-center">
                            <span class="icon">
                                <i class="front flaticon-air-freight"></i>
                                <i class="back flaticon-air-freight"></i>
                            </span>
                            <h3 class="count">600</h3>
                            <h6>Flight Booking</h6>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="item text-center">
                            <span class="icon">
                                <i class="font flaticon-house"></i>
                                <i class="back flaticon-house"></i>
                            </span>
                            <h3 class="count">250</h3>
                            <h6>Amazing Tour</h6>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="item text-center">
                            <span class="icon">
                                <i class="front flaticon-ship"></i>
                                <i class="back flaticon-ship"></i>
                            </span>
                            <h3 class="count">100</h3>
                            <h6>Cruises Booking</h6>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="item text-center">
                            <span class="icon">
                                <i class="front flaticon-tag"></i>
                                <i class="back flaticon-tag"></i>
                            </span>
                            <h3 class="count">100</h3>
                            <h6>Ticket Booking</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Destination 1 -->
    <section class="destination1 section-padding bg-lightnav" id="destination">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-subtitle">Top Destination</div>
                    <div class="section-title">Popular <span>Destination</span></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="owl-carousel owl-theme">

                        <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource5">
                            <ItemTemplate>
                                <div class="item">
                                    <div class="position-re o-hidden">
                                        <img src="<%# ("admin/img/place_img/") + Eval("place_img") %>" alt="">
                                    </div>
                                    <span class="category"><a href="#0">New</a></span>
                                    <div class="con">
                                        <h5><a href="tour-details.html"><i class="ti-location-pin"></i>India

                                        </a></h5>
                                        <div class="line"></div>
                                        <div class="row facilities">
                                            <div class="col col-md-8">
                                                <p>4 Tour Packages</p>
                                            </div>
                                            <div class="col col-md-4 text-right">
                                                <div class="permalink"><a href="tour-details.html">Explore <i class="ti-arrow-right"></i></a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT * FROM [tour_place_visit]"></asp:SqlDataSource>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Tour Video -->
    <section class="dynamic-video-wrapper" data-overlay-dark="3">
        <video width="100%" height="100%" autoplay="autoplay" muted preload="auto" loop="loop">
            <source src="travel-video.mp4" type="video/mp4">
        </video>
        <div class="wrap-content v-middle">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 offset-md-2">

                        <h1>Nagva Beach</h1>
                        <h4><i class="ti-location-pin"></i>Diu &nbsp;&nbsp; <i class="ti-timer"></i>4 Days + 3 Nights</h4>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Italy &  France Tours 2 -->
    <section class="tours2 section-padding bg-lightnav" data-scroll-index="1" id="gallery">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-subtitle"><span>Most Popular</span></div>
                    <div class="section-title">Travel <span>Places</span></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="owl-carousel owl-theme">
                        <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                            <ItemTemplate>
                                <div class="tours2 left">
                                    <figure>
                                        <img src="<%# ("admin/img/place_img/") + Eval("cover_img") %>" alt="" class="img-fluid">
                                    </figure>
                                    <div class="caption padding-left">
                                        <div class="country country1">
                                            <h3>Best Tours</h3>
                                            <h4><a href="tour-details.html"><%# Eval("place_name") %>, India</a></h4>
                                            <p style="text-align: justify;"><%# eval("description") %></p>
                                            <div class="row tour-list">
                                            </div>
                                            <hr class="border-2">
                                            <div class="info-wrapper">
                                                <div class="more"><a href="tour-details.html" class="link-btn" tabindex="0">View all places <i class="ti-arrow-right"></i></a></div>
                                                <div class="butn-dark"><a href="#" data-scroll-nav="1"><span>Book Now</span></a> </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT  * FROM [tour_place]"></asp:SqlDataSource>


                    </div>
                </div>
            </div>
        </div>
    </section>
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
                        <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource6">
                            <ItemTemplate>
                                <div class="item">
                                    <div class="position-re o-hidden">
                                        <img src="<%# ("admin/img/hotel_img/") + Eval("Image") %>" alt="" style="width: 100%; height: 300px;">
                                    </div>
                                    <div class="con">
                                        <span class="category">
                                            <a href="blog.html"><%# Eval("name") %></a>
                                        </span>
                                        <h5><a href="post.html"><%# Eval("web_link") %></a></h5>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT * FROM [tour_hotel]"></asp:SqlDataSource>


                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonials -->
    <section class="testimonials" id="blog">
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
    <!-- Clients -->
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

