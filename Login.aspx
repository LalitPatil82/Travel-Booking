<%@ Page Title="" Language="VB" MasterPageFile="~/admin/login/login-form-20/Login.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="admin_login_login_form_20_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">  
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Tours and Travels %>" SelectCommand="SELECT * FROM [tour_login_mst] WHERE (([uname] = @uname) AND ([upass] = @upass))">
        <SelectParameters>
            <asp:ControlParameter ControlID="uname" Name="uname" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="upass" Name="upass" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">
            <div class="login-wrap p-0">
                <h3 class="mb-4 text-center">Login</h3>
                <div class="form-group">
                    <asp:TextBox id="uname" runat="server" class="form-control" placeholder="Username" required></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="upass" runat="server" CssClass="form-control" AutoComplete="off" placeholder="Password" required ClientIDMode="Static"></asp:TextBox>
                    <%-- <input id="" runat="server" type="password" class="form-control" placeholder="Password" required>
	             --%> <span toggle="#upass" runat="server" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                </div>
                <div class="form-group">
                    <asp:Button ID="submit" CssClass="form-control btn btn-primary submit px-3" runat="server" Text="Login" />
                </div>
                <div class="form-group d-md-flex">
                    <div class="w-50">
                        <label class="checkbox-wrap checkbox-primary">
                            Remember Me
								<asp:CheckBox ID="remember_me" runat="server" Checked />	 
                           
                            <span class="checkmark"></span>
                        </label>
                    </div>
                    <div class="w-50 text-md-right">
                        <a href="Forget_password.aspx" style="color: #fff">Forgot Password</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
            </ContentTemplate>
       </asp:UpdatePanel>
</asp:Content>

