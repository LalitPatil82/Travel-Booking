<%@ Page Title="" Language="VB" MasterPageFile="~/admin/login/login-form-20/Login.master" AutoEventWireup="false" CodeFile="Change_Password.aspx.vb" Inherits="admin_login_login_form_20_Change_Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-4">
                    <div class="login-wrap p-0">
                        <h3 class="mb-4 text-center">Change Password</h3>
                        <div class="form-group">
                            <asp:TextBox ID="txtpass" class="form-control" autocomplete="false" runat="server" placeholder="Enter New Password"></asp:TextBox>
                     
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtpass" runat="server" ErrorMessage="Please Fill The Password Feild"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:TextBox ID="txtconformpass" runat="server" class="form-control" TextMode="Password" placeholder="Conform New Password"></asp:TextBox>
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtconformpass" ErrorMessage="Plase Fill The Conform Password Feild"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Button ID="submit" CssClass="form-control btn btn-primary submit px-3" runat="server" Text="Change Password" />
                </div>
                </div>
            </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>



