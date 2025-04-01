<%@ Page Title="" Language="VB" MasterPageFile="~/admin/Admin.master" AutoEventWireup="false" CodeFile="About_Us.aspx.vb" Inherits="admin_About_Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/ruang-admin.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="updatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="submit" />
        </Triggers>
        <ContentTemplate>
            <div class="col-sm-9" style="background-color:#eee;" id="c1">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style="background-color:#000000;">
                    <h4 class="m-0 font-weight-bold" style="color:#E7B10A;font-weight:bold;">Add About Us Info</h4>
                </div>
                <div class="card-body">

                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="aboutus"  runat="server" />
                    <div class="form-group">
                        <label for="User Name">Company Name</label>
                        <asp:TextBox ID="txt_comp" runat="server" CssClass="form-control" required placeholder="Enter Company Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="val_comp" SetFocusOnError="true" display="None" runat="server" ControlToValidate="txt_comp" ErrorMessage="Please enter a company name" ValidationGroup="aboutus"></asp:RequiredFieldValidator>
                    </div>

                    <asp:HiddenField ID="id" runat="server" />

                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" required placeholder="Enter email address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="val_email" runat="server" ControlToValidate="txt_email" ErrorMessage="Please enter an email address" ValidationGroup="aboutus"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="val_email_format" SetFocusOnError="true" display="None" runat="server" ControlToValidate="txt_email" ErrorMessage="Please enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="aboutus"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <label for="User Name">Phone Number</label>
                        <asp:TextBox ID="txt_phone" runat="server" CssClass="form-control" required placeholder="Enter Phone Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="val_phone" SetFocusOnError="true" display="None" runat="server" ControlToValidate="txt_phone" ErrorMessage="Please enter a phone number" ValidationGroup="aboutus"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="val_phone_format" runat="server" ControlToValidate="txt_phone" ErrorMessage="Please enter a valid phone number" ValidationExpression="^[0-9]{10}$" ValidationGroup="aboutus"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <label for="User Name">Address</label>
                        <asp:TextBox ID="txt_address" runat="server" CssClass="form-control" required TextMode="MultiLine" Rows="3" placeholder="Enter Address Of Your Place"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="val_address" SetFocusOnError="true" display="None" runat="server" ControlToValidate="txt_address" ErrorMessage="Please enter an address" ValidationGroup="aboutus"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="User Name">Company Logo</label>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Label ID="lblimg" runat="server" Text=""></asp:Label>
                    </div>

                    <div class="form-group">
                        <label for="User Name">Instagram Link</label>
                        <asp:TextBox ID="txt_insta" runat="server" CssClass="form-control" required placeholder="Enter Instagram Link"></asp:TextBox>
</div>


                    <!--facebook-->
                    <div class="form-group">
                        <label for="User Name">Facebook Link</label>
                         <asp:TextBox ID="txt_facebook" runat="server" CssClass="form-control" required placeholder="Enter Instagram Link"></asp:TextBox>
                         </div>
                    <!--Youtube-->
                    <div class="form-group">
                        <label for="User Name">YouTube Link</label>
                         <asp:TextBox ID="txt_youtube" runat="server" CssClass="form-control" required placeholder="Enter Instagram Link"></asp:TextBox>
                                           </div>
                    <br />

                    <asp:Button ID="submit" runat="server" Text="Submit" CssClass="btn btn-primary " style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"/>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Tours and Travels %>" DeleteCommand="DELETE FROM [tour_about_us] WHERE [id] = @id" InsertCommand="INSERT INTO [tour_about_us] ([address], [ph_no], [email], [comp_name], [insta_link], [facebook_link], [youtube_link], [comp_logo]) VALUES (@address, @ph_no, @email, @comp_name, @insta_link, @facebook_link, @youtube_link, @comp_logo)" SelectCommand="SELECT * FROM [tour_about_us]" UpdateCommand="UPDATE [tour_about_us] SET [address] = @address, [ph_no] = @ph_no, [email] = @email, [comp_name] = @comp_name, [insta_link] = @insta_link, [facebook_link] = @facebook_link, [youtube_link] = @youtube_link, [comp_logo] = @comp_logo WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="ph_no" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="comp_name" Type="String" />
                    <asp:Parameter Name="insta_link" Type="String" />
                    <asp:Parameter Name="facebook_link" Type="String" />
                    <asp:Parameter Name="youtube_link" Type="String" />
                    <asp:Parameter Name="comp_logo" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="ph_no" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="comp_name" Type="String" />
                    <asp:Parameter Name="insta_link" Type="String" />
                    <asp:Parameter Name="facebook_link" Type="String" />
                    <asp:Parameter Name="youtube_link" Type="String" />
                    <asp:Parameter Name="comp_logo" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </ContentTemplate>

    </asp:UpdatePanel>
    <script>
        function BindControls() {
            Sys.Application.add_init(function () {
                $("#ContentPlaceHolder1_example1").DataTable({
                    "responsive": true, "lengthChange": false, "autoWidth": false,
                    "buttons": []
                }).buttons().container().appendTo('#ContentPlaceHolder1_example1_wrapper .col-md-6:eq(0)');

            });
        }

        var req = Sys.WebForms.PageRequestManager.getInstance();
        if (req != null) {

            req.add_endRequest(function () {
                BindControls();
            });
        }

        $(document).ready(function () {

            BindControls();
        });



    </script>
</asp:Content>

