<%@ Page Title="" Language="VB" MasterPageFile="~/admin/Admin.master" AutoEventWireup="false" CodeFile="Package_Day_Schedule.aspx.vb" Inherits="admin_Package_Schedule" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
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
                    <h4 class="m-0" style="color:#E7B10A;font-weight:bold;">Day Wise Scheduling</h4>
                </div>
                <div class="card-body">
                    <asp:Button ID="btnShowPopup" class="btn btn-primary" runat="server" Text="Add Day Wise Schedule" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"  />

                    <asp:Panel ID="pnlModal" runat="server" CssClass="modalPopup" Style="display: none; width: 500px;">

                        <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background-color:#eee;">
                                <div class="modal-header" style="background-color:#000000;">
                                    <h4 class="m-0 " style="color:#E7B10A;font-weight:bold;">Day Wise Scheduling</h4>
                                    <h5 class="modal-title" id="exampleModalLabel"></h5>

                                </div>
                                <asp:HiddenField ID="uid" runat="server" />
                                <div class="modal-body">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="hotel" Display="Dynamic" Font-Bold="True" BorderColor="Black" ForeColor="Red" />
                                     <div>
                                        <div class="form-group">
                                            <label for="ddlPackageName" class="col-form-label">Package Name:</label>
                                            <asp:DropDownList ID="ddlPackageName" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id" AutoPostBack="False">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT [id], [name] FROM [tour_package]"></asp:SqlDataSource>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPackageType" runat="server" ErrorMessage="Please Select Package Name" SetFocusOnError="True" Display="None" ValidationGroup="hotel" ControlToValidate="ddlPackageName"></asp:RequiredFieldValidator>
                                        </div>

                                        <div class="form-group">
                                            <label for="txtSRNo">SR No:</label>
                                            <asp:TextBox ID="txtSRNo" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSRNo" runat="server" ErrorMessage="SR No is required." ValidationGroup="hotel" ControlToValidate="txtSRNo" Display="None"></asp:RequiredFieldValidator>
                                        </div>

                                        <div class="form-group">
                                            <label for="txtSummary">Summary:</label>
                                            <asp:TextBox ID="txtSummary" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSummary" runat="server" ErrorMessage="Summary is required." ValidationGroup="hotel" ControlToValidate="txtSummary" Display="None"></asp:RequiredFieldValidator>
                                        </div>

                                        <br />

                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button ID="submit" class="btn btn-primary" runat="server" Text="Save" ValidationGroup="hotel" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />
                                        <asp:Button ID="btnCancel" CausesValidation="false" runat="server" class="btn btn-secondary" Text="Cancel" OnClientClick="clear1()"  style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />
                                    </div>
                                </div>
                            </div>
                    </asp:Panel>


                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                        PopupControlID="pnlModal" TargetControlID="btnShowPopup" CancelControlID="btnCancel"
                        BackgroundCssClass="modalBackground">
                    </ajaxToolkit:ModalPopupExtender>

                </div>
            </div>

            <!-- /.card-header -->

            <div class="col-lg-12" id="tb1">
                <div class="card-body">

                    <asp:GridView ID="example1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="id,package_id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="id" Visible="false" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                            <asp:TemplateField HeaderText="Sr. no">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="package_id" Visible="false" SortExpression="package_id"></asp:BoundField>
                            <asp:BoundField DataField="package_name" HeaderText="Package Name" />
                            <asp:BoundField DataField="sr_no" HeaderText="Day's Number" />
                            <asp:BoundField DataField="desc" HeaderText="desc" SortExpression="desc"></asp:BoundField>
                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                                <ItemTemplate>
                                     <asp:ImageButton ID="Edit1" runat="server" CommandName="Edit1" CommandArgument='<%#Eval("id") %>' OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit"   ImageUrl="~/admin/img/icons/icons8-edit-40.png" />

                                    &nbsp;&nbsp;                                       
                                

                                     <asp:ImageButton ID="del" runat="server" CommandName="del" CommandArgument='<%#Eval("id") %>' OnClientClick="return message(this);" CausesValidation="false" ToolTip="Delete"   ImageUrl="~/admin/img/icons/icons8-delete-40.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>


                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' DeleteCommand="DELETE FROM [tour_day_wise_scheduling] WHERE [id] = @id" InsertCommand="INSERT INTO [tour_day_wise_scheduling] ([package_id], [sr_no], [desc]) VALUES (@package_id, @sr_no, @desc)" SelectCommand="SELECT tour_day_wise_scheduling.*,tour_package.name as package_name 
                   FROM tour_day_wise_scheduling
                   JOIN tour_package ON tour_day_wise_scheduling.package_id = tour_package.id ORDER BY tour_day_wise_scheduling.[id] DESC"
                        UpdateCommand="UPDATE [tour_day_wise_scheduling] SET [package_id] = @package_id, [sr_no] = @sr_no, [desc] = @desc WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="package_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="sr_no" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="desc" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="package_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="sr_no" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="desc" Type="String"></asp:Parameter>
                            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>


                </div>
            </div>

            <script>
                function BindControls() {
                    Sys.Application.add_init(function () {
                        $("#ContentPlaceHolder1_example1").DataTable({
                            "responsive": true, "lengthChange": false, "autoWidth": false, "bDestroy": true,
                            "buttons": []
                        }).buttons().container().appendTo('#ContentPlaceHolder1_example1_wrapper .col-md-6:eq(0)');

                    });
                }


                function clear1() {
                    var control = document.getElementById("<%=txtSRNo.ClientID%>");
                    control.readOnly = false;
                    document.getElementById("<%=txtSRNo.ClientID%>").value = "";
                    document.getElementById("<%=txtSRNo.ClientID%>").Read = "";
                    document.getElementById("<%=txtSummary.ClientID%>").value = "";
                    document.getElementById("<%=uid.ClientID%>").value = "";
                    document.getElementById("<%=ddlPackageName.ClientID%>").value = 0;
                }


            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

