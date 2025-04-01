<%@ Page Title="" Language="VB" MasterPageFile="~/admin/Admin.master" AutoEventWireup="false" CodeFile="Coupan.aspx.vb" Inherits="admin_Coupan" %>

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
                    <h4 class="m-0" style="color:#E7B10A;font-weight:bold;">Coupans</h4>
                </div>
                <div class="card-body">
                    <asp:Button ID="btnShowPopup" class="btn btn-primary" runat="server" Text="Add Coupans" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />

                    <asp:Panel ID="pnlModal" runat="server" CssClass="modalPopup" Style="display: none; width: 500px;">

                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color:#000;">
                                    <h4 class="m-0" style="color:#E7B10A;font-weight:bold;">Coupans</h4>
                                    <h5 class="modal-title" id="exampleModalLabel"></h5>

                                </div>
                                <asp:HiddenField ID="uid" runat="server" />
                                <div class="modal-body">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="hotel" Display="Dynamic" Font-Bold="True" BorderColor="Black" ForeColor="Red" />
                                    <div>
                                        <div class="form-group">
                                            <label for="txtName" class="col-form-label">Name:</label>
                                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ErrorMessage="Please enter a name" SetFocusOnError="True" Display="None" ValidationGroup="hotel" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDiscountCode" class="col-form-label">Discount Code:</label>
                                            <asp:TextBox ID="txtDiscountCode" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDiscountCode" runat="server" ErrorMessage="Please enter a discount code" SetFocusOnError="True" Display="None" ValidationGroup="hotel" ControlToValidate="txtDiscountCode"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtDiscountPercentage" class="col-form-label">Discount Percentage:</label>
                                            <asp:TextBox ID="txtDiscountPercentage" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDiscountPercentage" runat="server" ErrorMessage="Please enter a discount percentage" SetFocusOnError="True" Display="None" ValidationGroup="hotel" ControlToValidate="txtDiscountPercentage"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorDiscountPercentage" runat="server" ControlToValidate="txtDiscountPercentage" ValidationGroup="hotel" Display="None" ErrorMessage="Discount percentage must be a number" SetFocusOnError="True" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                                        </div>
                                        <asp:CompareValidator ID="CompareValidator1" ValidationGroup="hotel" Display="None" runat="server" ErrorMessage="The End Date Cannot be Smaller than Start Date" ControlToCompare="txtend_date" ControlToValidate="txtstart_date" Operator="LessThanEqual"></asp:CompareValidator>
                                        <div class="form-group">
                                            <label for="txtstart_date">Coupan Start Date</label>
                                            <asp:TextBox ID="txtstart_date" runat="server" Type="date" CssClass="form-control"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSRNo" runat="server" ErrorMessage="Please Select Valid Start Date" ValidationGroup="hotel" ControlToValidate="txtstart_date" Display="None"></asp:RequiredFieldValidator>
                                        </div>

                                        <div class="form-group">
                                            <label for="txtend_date">Coupan End Date</label>
                                            <asp:TextBox ID="txtend_date" runat="server" CssClass="form-control" type="date"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Select Valid Start Date" ValidationGroup="hotel" ControlToValidate="txtend_date" Display="None"></asp:RequiredFieldValidator>
                                        </div>
                                        <br />

                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button ID="submit" class="btn btn-primary" runat="server" Text="Save" ValidationGroup="hotel" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"/>
                                        <asp:Button ID="btnCancel" CausesValidation="false" runat="server" class="btn btn-secondary" Text="Cancel" OnClientClick="clear1()" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"/>
                                    </div>
                                </div>
                            </div>
                    </asp:Panel>

                    <asp:Timer ID="DeleteTimer" runat="server" Interval="86400000" />

                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                        PopupControlID="pnlModal" TargetControlID="btnShowPopup" CancelControlID="btnCancel"
                        BackgroundCssClass="modalBackground">
                    </ajaxToolkit:ModalPopupExtender>

                </div>
            </div>

            <!-- /.card-header -->

            <div class="col-lg-12" id="tb1">
                <div class="card-body">

                    <asp:GridView ID="example1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="id" Visible="false" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                            <asp:TemplateField HeaderText="Sr. no">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="name" HeaderText="Name" />
                            <asp:BoundField DataField="code" HeaderText="Code" />
                            <asp:BoundField DataField="discount" HeaderText="Discount (%)" />
                            <asp:BoundField DataField="s_date" HeaderText="Start Date" Visible="false" />

                            <asp:TemplateField HeaderText="Start Date">

                                <ItemTemplate>

                                    <%# Convert.ToDateTime(Eval("s_date")).ToString("dd/MM/yyyy") %>
                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:BoundField DataField="e_Date" HeaderText="End Date" Visible="false"></asp:BoundField>

                            <asp:TemplateField HeaderText="End Date">

                                <ItemTemplate>

                                    <%# Convert.ToDateTime(Eval("e_Date")).ToString("dd/MM/yyyy") %>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                                <ItemTemplate>
                                    <asp:Button ID="Edit1" runat="server" CssClass="btn btn-success" Text="Edit" CommandName="Edit1" CommandArgument='<%# Eval("id") %>' OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit User" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />
                                    &nbsp;&nbsp;                                       
                                    <asp:Button ID="del" CausesValidation="false" runat="server" CssClass="btn btn-danger" OnClientClick="return message(this);" CommandName="del" Text="Delete" CommandArgument='<%# Eval("id") %>' style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>


                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' DeleteCommand="DELETE FROM [tour_coupan] WHERE [id] = @id" InsertCommand="INSERT INTO [tour_coupan] ([name], [code], [discount], [s_date], [e_date]) VALUES (@name, @code, @discount, @s_date, @e_date)" SelectCommand="SELECT * FROM [tour_coupan] ORDER BY [id] DESC"
                        UpdateCommand="UPDATE [tour_coupan] SET [name] = @name, [code] = @code, [discount] = @discount, [s_date] = @s_date, [e_date] = @e_date WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="code" Type="String"></asp:Parameter>
                            <asp:Parameter Name="discount" Type="Int32"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="s_date"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="e_date"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="code" Type="String"></asp:Parameter>
                            <asp:Parameter Name="discount" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="s_date" DbType="Date"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="e_date"></asp:Parameter>
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
                    document.getElementById("<%=txtend_date.ClientID%>").value = "dd/MM/YYYY";
                   document.getElementById("<%=txtstart_date.ClientID%>").value = "dd/MM/YYYY";
                   document.getElementById("<%=uid.ClientID%>").value = "";
                    document.getElementById("<%=txtName.ClientID%>").value = "";
                    document.getElementById("<%=txtDiscountCode.ClientID%>").value = "";
                    document.getElementById("<%=txtDiscountPercentage.ClientID%>").value = "";
                }


            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

