<%@ Page Title="" Language="VB" MasterPageFile="~/admin/login/login-form-20/Login.master" AutoEventWireup="false" CodeFile="otp.aspx.vb" Inherits="admin_login_login_form_20_otp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="login-wrap p-0">
                        <h3 class="mb-4 text-center">Verify OTP</h3>
                        <div class="form-group">
                            <asp:TextBox ID="txtotp" autocomplete="off" MaxLength="6" runat="server" class="form-control" placeholder="Enter OTP" required  ></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:Button ID="submit" CssClass="form-control btn btn-primary submit px-3" runat="server" Text="Verify OTP" />
                        </div>
                 
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

