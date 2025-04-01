<%@ Page Title="" Language="VB" MasterPageFile="~/admin/Admin.master" AutoEventWireup="false" CodeFile="User_Master.aspx.vb" Inherits="admin_User_Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="css/ruang-admin.min.css" rel="stylesheet">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Form Basic -->
    <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>

            <!-- Form Basic -->

           <div class="card mb-3" id="c1">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style="background-color:#000000;">
                    <h4 class="m-0" style="color:#E7B10A;font-weight:bold;">Users</h4>
                </div>
                <div class="card-body">

                    <asp:Button ID="btnShowPackagePopup" CausesValidation="false" class="btn btn-primary" runat="server" Text="Add User"  style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"/>
                    <asp:Panel ID="pnlModal" runat="server" CssClass="modalPopup" Style="display: none; width: 500px;">

                        <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background-color:#eee;">
                                <div class="modal-header" style="background-color:#000000;">
                                    <h5 class="modal-title" id="exampleModalLabel" style="color:#E7B10A;font-weight:bold;">Add User</h5>
                                </div>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="pck_type" Display="Dynamic" Font-Bold="True" BorderColor="Black" ForeColor="Red" />
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <div class="modal-body">
                                    <div>
                                        <!--User Name-->
                                        <div class="form-group">
                                            <label for="User Name">User Name</label>
                                            <input type="text" class="form-control" id="txt_user"
                                                placeholder="Enter User Name" runat="server">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txt_user" ErrorMessage="Please Enter Name"></asp:RequiredFieldValidator>
                                        </div>

                                        <!--Password-->
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Password</label>
                                            <input type="password" class="form-control" id="txt_pass" placeholder="Password" runat="server"><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txt_pass" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>
                                        </div>

                                        <asp:HiddenField ID="uid" runat="server" />

                                        <!--Email ID-->
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input type="text" class="form-control" id="txtemail" aria-describedby="emailHelp"
                                                placeholder="Enter email address" runat="server" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" SetFocusOnError="true" ForeColor="Red" ControlToValidate="txtemail" ErrorMessage="Please Enter Email"></asp:RequiredFieldValidator>
                                            <small id="emailHelp" class="form-text text-muted">We'll never share your
                        email with anyone else.</small>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputUsertype">User Type</label>
                                            <asp:DropDownList ID="txt_utype" runat="server" CssClass="form-control">
                                                <asp:ListItem>Admin</asp:ListItem>
                                                <asp:ListItem>User</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>

                                        <br />

                                        <asp:Button ID="submit" runat="server" Text="Save" CssClass="btn btn-primary"  style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"/>
                                    </div>
                            </div>

                            <div class="modal-footer">
                                <asp:Button ID="btnCancel" CausesValidation="false"  runat="server" class="btn btn-secondary" Text="Cancel" OnClientClick="clear1()"  style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"/>
                            </div>


                        </div>
                </div>

                </asp:Panel>
            </div>
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                PopupControlID="pnlModal" TargetControlID="btnShowPackagePopup" CancelControlID="btnCancel"
                BackgroundCssClass="modalBackground">
            </ajaxToolkit:ModalPopupExtender>
            </div>

            <!-- /.card-header -->
            <div class="col-lg-12" id="tb1">
                <div class="card-body">

                    <asp:GridView ID="example1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="id,upass" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr. no">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="uname" HeaderText="User Name" SortExpression="uname"></asp:BoundField>
                            <asp:BoundField DataField="upass" Visible="false" HeaderText="User Pass" SortExpression="upass"></asp:BoundField>
                            <asp:BoundField DataField="email" HeaderText="Eamil" SortExpression="email"></asp:BoundField>
                            <asp:BoundField DataField="utype" HeaderText="User Type
                              "
                                SortExpression="utype"></asp:BoundField>
                            <asp:BoundField DataField="id" HeaderText="U Code" Visible="false" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>

                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                                <ItemTemplate>
                                    <asp:ImageButton ID="Edit1" runat="server" Text="Edit" CommandName="Edit1" OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit User" ImageUrl="~/admin/img/icons/icons8-edit-40.png" Width="35px" Height="35px" />
                                    &nbsp;&nbsp;
                                          
                               <asp:ImageButton ID="del" runat="server" CommandName="del" CausesValidation="false" OnClientClick="return message(this);" Text="Delete" CommandArgument='<%# Eval("id") %>' Height="35px" Width="35px" ImageUrl="~/admin/img/icons/icons8-delete-40.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>


                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' DeleteCommand="DELETE FROM [tour_login_mst] WHERE [id] = @id" InsertCommand="INSERT INTO [tour_login_mst] ([uname], [upass], [email], [utype]) VALUES (@uname, @upass, @email, @utype)" SelectCommand="SELECT * FROM [tour_login_mst]" UpdateCommand="UPDATE [tour_login_mst] SET [uname] = @uname, [upass] = @upass, [email] = @email, [utype] = @utype WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="uname" Type="String"></asp:Parameter>
                            <asp:Parameter Name="upass" Type="String"></asp:Parameter>
                            <asp:Parameter Name="email" Type="String"></asp:Parameter>
                            <asp:Parameter Name="utype" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="uname" Type="String"></asp:Parameter>
                            <asp:Parameter Name="upass" Type="String"></asp:Parameter>
                            <asp:Parameter Name="email" Type="String"></asp:Parameter>
                            <asp:Parameter Name="utype" Type="String"></asp:Parameter>
                            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

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

        function clear1() {
            document.getElementById("<%=txtemail.ClientID%>").value = "";
            document.getElementById("<%=txt_pass.ClientID%>").value = "";
            document.getElementById("<%=txt_user.ClientID%>").value = "";
             document.getElementById("<%=txt_utype.ClientID%>").value = "Admin";
        }
    </script>

</asp:Content>

