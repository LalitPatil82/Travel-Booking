<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <!-- Site favicon -->
    <link rel="shortcut icon" href="images/favicon.png">
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,600,700" rel="stylesheet">
    <!-- Icon Font -->
    <link rel="stylesheet" href="fonts/ionicons/css/ionicons.css">
    <!-- Text Font -->
    <link rel="stylesheet" href="fonts/font.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!-- Normal style CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Normal media CSS -->
    <link rel="stylesheet" href="css/media.css">
    <!-- Waves Effect Css -->
    <link href="~/admin/plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="~/admin/plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Sweetalert Css -->
    <link href="~/admin/plugins/sweetalert/sweetalert.css" rel="stylesheet" />
    <style>
        #uname {
            -webkit-border-radius: 25px;
            -moz-border-radius: 25px;
            width: 100%;
            border-radius: 25px;
            height: 45px;
            background: rgba(255, 255, 255, 0.5);
            border: 0;
            box-shadow: none;
            color: #222222;
            font-size: 20px;
            padding: 0 15px;
            -webkit-transition: all 0.3s ease-in-out;
            -moz-transition: all 0.3s ease-in-out;
            -o-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }

        #upass {
            -webkit-border-radius: 25px;
            -moz-border-radius: 25px;
            width: 100%;
            border-radius: 25px;
            height: 45px;
            background: rgba(255, 255, 255, 0.5);
            border: 0;
            box-shadow: none;
            color: #222222;
            font-size: 20px;
            padding: 0 15px;
            -webkit-transition: all 0.3s ease-in-out;
            -moz-transition: all 0.3s ease-in-out;
            -o-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }

        #submit {
            display: block;
            width: 100%;
            height: 45px;
            color: #ffffff;
            background: -webkit-gradient(linear, left top, right top, from(#17ead9), to(#6078ea));
            background: -webkit-linear-gradient(top, #17ead9, #6078ea);
            background: -moz-linear-gradient(top, #17ead9, #6078ea);
            background: -o-linear-gradient(top, #17ead9, #6078ea);
            background: -ms-linear-gradient(top, #17ead9, #6078ea);
            background: linear-gradient(top, #17ead9, #6078ea);
            background-color: #17ead9;
            border: 0;
            letter-spacing: 0.1em;
            font-style: 20px;
            -webkit-border-radius: 25px;
            -moz-border-radius: 25px;
            border-radius: 25px;
            cursor: pointer;
            font-weight: 500;
            font-family: 'Poppins', sans-serif;
        }
    </style>
</head>
<body>
    <main class="cd-main">
        <section class="cd-section index visible ">
            <div class="cd-content style1">
                <div class="login-box d-md-flex align-items-center">
                    <h1 class="title">Ganesh Travels</h1>
                    <h3 class="subtitle">Have a great journey ahead!</h3>
                    <div class="login-form-box">
                        <div class="login-form-slider">
                            <!-- login slide start -->
                            <div class="login-slide slide login-style1">
                                <form id="Form1" runat="server">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                        <Scripts>
                                            <asp:ScriptReference Path="~/admin/plugins/sweetalert/new.js" />
                                            <asp:ScriptReference Path="~/admin/plugins/sweetalert/sweetalert.min.js" />
                                        </Scripts>
                                    </asp:ScriptManager>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>


                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Tours and Travels %>" SelectCommand="SELECT * FROM [tour_login_mst] WHERE (([uname] = @uname) AND ([upass] = @upass))">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="uname" Name="uname" PropertyName="Text" Type="String" />
                                                    <asp:ControlParameter ControlID="upass" Name="upass" PropertyName="Text" Type="String" />
                                             
                                                    </SelectParameters>
                                            </asp:SqlDataSource>

                                            <div class="form-group">
                                                <label class="label">User name</label>
                                                <asp:TextBox ID="uname" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Font-Bold="true" ForeColor="Black" SetFocusOnError="true"  ControlToValidate="uname" ErrorMessage="Please Enter UserName"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <label class="label">Password</label>
                                                <asp:TextBox ID="upass" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Font-Bold="true" ForeColor="black" SetFocusOnError="true"  ControlToValidate="upass" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                                                    <label class="custom-control-label" for="customCheck1">Remember me</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <asp:Button ID="submit" runat="server" Text="Submit" />
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </form>
                                <div class="forgot-txt">
                                    <asp:HyperLink ID="HyperLink1" runat="server">
                 <a href="forget_pass.aspx" class="forgot-password-click">Forgot Password</a>
                                    </asp:HyperLink>

                                </div>

                            </div>
                            <!-- login slide end -->

                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <div id="cd-loading-bar" data-scale="1"></div>
</body>
</html>


