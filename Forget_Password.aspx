<%@ Page Title="" Language="VB" MasterPageFile="~/admin/login/login-form-20/Login.master" AutoEventWireup="false" CodeFile="Forget_Password.aspx.vb" Inherits="admin_login_login_form_20_Forget_Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT [email] FROM [tour_login_mst] WHERE ([email] = @email)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtEmail" PropertyName="Text" Name="email" Type="String"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="login-wrap p-0">
                        <h3 class="mb-4 text-center">Forget Password?</h3>
                        <div class="form-group">
                            <asp:TextBox ID="txtEmail" autocomplete="off" type="email" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                        
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Font-Bold="true" ForeColor="Black" SetFocusOnError="true"  ControlToValidate="txtEmail" ErrorMessage="Please Enter Email"></asp:RequiredFieldValidator>
</div>

                        <div class="form-group">
                            <asp:Button ID="submit" CssClass="form-control btn btn-primary submit px-3" runat="server" Text="Send OTP" />
                        </div>
                        <div class="form-group d-md-flex">
                            <div class="w-50">
                                <a href="Login.aspx" style="color: #fff">Back To Login?</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

