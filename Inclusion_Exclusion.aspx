<%@ Page Title="" Language="VB" MasterPageFile="~/admin/Admin.master" AutoEventWireup="false" CodeFile="Inclusion_Exclusion.aspx.vb" Inherits="Inclusion_Exclusion" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <!--Main Content-->

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>
            <div class="card mb-3">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style="background-color:#000000;">
                    <h4 class="m-0 "  style="color:#E7B10A;font-weight:bold;">Inclusion Exclusion</h4>
                </div>
                <div class="card-body">

                    <asp:Button ID="btnShowPopup" runat="server" Text="Add Inclusion/Exclusion" CssClass="btn btn-primary" OnClick="btnShowPopup_Click" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />

                    <asp:Panel ID="pnlModal" runat="server" CssClass="modalPopup" Style="display: none; width: 500px;">

                        <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background-color:#eee;">
                                <div class="modal-header" style="background-color:#000000;">
                                    <h5 class="modal-title" id="exampleModalLabel" style="color:#E7B10A;font-weight:bold;">Inclusion Exclusion</h5>
                                    <%--<asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="hotel" Display="Dynamic" Font-Bold="True" BorderColor="Black" ForeColor="Red" />--%>
                                </div>

                                <asp:HiddenField ID="uid" runat="server" />

                                <div class="modal-body">
                                    <div>

                                        <!--Package Name--->

                                        <div class="form-group">
                                            <label for="Pack_name">Package Name</label>
                                            <asp:DropDownList ID="Pack_name" runat="server" CssClass="form-control" DataSourceID="Load_packname" DataTextField="name" DataValueField="id"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="Load_packname" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT [id], [name] FROM [tour_package]"></asp:SqlDataSource>
                                        </div>
                                        <!---Place Image--->
                                        <div class="form-group">

                                            <label for="Select Incl Exclu">Select to give Description</label><br />

                                            <asp:RadioButton ID="rb_in" runat="server" Text="Inclusion" GroupName="inclu_exclu" />&nbsp;&nbsp;&nbsp;&nbsp;
                                         <asp:RadioButton ID="rb_ex" runat="server" Text="Exclusion" GroupName="inclu_exclu" />

                                        </div>
                                        <!--Place Description-->
                                        <div class="form-group">
                                            <label for="Place_Description">Enter Description of Places </label>
                                            <textarea class="form-control" id="txt_placedesc" rows="3" runat="server"></textarea>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDescription" runat="server" ErrorMessage="Enter Valid Description" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txt_placedesc" ValidationGroup="place"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <br />
                                        <asp:Button ID="submit" runat="server" Text="Save" CssClass="btn btn-primary" ValidationGroup="place" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />

                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" CausesValidation="false" OnClick="btnCancel_Click" OnClientClick="clear1()" ValidationGroup="place" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />
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

            <!--Grid Table-->

            <div class="col-lg-12" id="tb1">
                <div class="card-body">
                    <asp:GridView ID="example1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="id,pack_id,type" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" Visible="false" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>

                            <asp:TemplateField HeaderText="Sr. no">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1 %>
                                </ItemTemplate>

                            </asp:TemplateField>
                             <asp:BoundField DataField="package_name" HeaderText="Package Name" />
                           
                            <asp:BoundField DataField="pack_id" Visible="false" HeaderText="pack_id" SortExpression="pack_id"></asp:BoundField>
                            <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type"></asp:BoundField>
                            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description"></asp:BoundField>

                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                                <ItemTemplate>
                                    <asp:ImageButton ID="Edit1" runat="server" CommandName="Edit1" CommandArgument='<%#Eval("id") %>' OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit" ImageUrl="~/admin/img/icons/icons8-edit-40.png" />

                                    &nbsp;&nbsp;                                       
                                

                                     <asp:ImageButton ID="del" runat="server" CommandName="del" CommandArgument='<%#Eval("id") %>' OnClientClick="return message(this);" CausesValidation="false" ToolTip="Delete" ImageUrl="~/admin/img/icons/icons8-delete-40.png" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' DeleteCommand="DELETE FROM [tour_inclu_exclu] WHERE [id] = @id" InsertCommand="INSERT INTO [tour_inclu_exclu] ([pack_id], [type], [description]) VALUES (@pack_id, @type, @description)" SelectCommand="SELECT tour_inclu_exclu.*,tour_package.name as package_name From tour_inclu_exclu
                        JOIN tour_package ON tour_inclu_exclu.pack_id = tour_package.id ORDER BY tour_inclu_exclu.[id] DESC"
                        UpdateCommand="UPDATE [tour_inclu_exclu] SET [pack_id] = @pack_id, [type] = @type, [description] = @description WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="pack_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="type" Type="String"></asp:Parameter>
                            <asp:Parameter Name="description" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="pack_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="type" Type="String"></asp:Parameter>
                            <asp:Parameter Name="description" Type="String"></asp:Parameter>
                            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
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
                     document.getElementById("<%=rb_in.ClientID%>").checked = false;
                     document.getElementById("<%=rb_ex.ClientID%>").checked = false;
                     document.getElementById("<%=txt_placedesc.ClientID%>").value = "";
                     document.getElementById("<%=Pack_name.ClientID%>").selectedIndex = 0;
                 }


             </script>

        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>

