<%@ Page Title="" Language="VB" MasterPageFile="~/admin/Admin.master" AutoEventWireup="false" CodeFile="faqs.aspx.vb" Inherits="admin_faqs" %>

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
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between"style="background-color:#000000;">
                    <h4 class="m-0"style="color:#E7B10A;font-weight:bold;">FAQs</h4>
                </div>
                <div class="card-body">

                    <asp:Button ID="btnShowPopup" class="btn btn-primary" runat="server" Text="Add FAQs" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"/>
                    <asp:Panel ID="pnlModal" runat="server" CssClass="modalPopup" Style="display: none; width: 500px;">

                        <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background-color:#eee;">
                                <div class="modal-header" style="background-color:#000000;">
                                    <h5 class="modal-title" id="exampleModalLabel"style="color:#E7B10A;font-weight:bold;" >Add FAQ</h5>
                                </div>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="faq" Display="Dynamic" Font-Bold="True" BorderColor="Black" ForeColor="Red" />
                                <asp:HiddenField ID="uid" runat="server" />
                                <div class="modal-body">
                                    <div>
                                        <div class="form-group">
                                            <label for="ddlPackageName" class="col-form-label">Package Name:</label>
                                            <asp:DropDownList ID="ddlPackageName" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id" AutoPostBack="False">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT [id], [name] FROM [tour_package]"></asp:SqlDataSource>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPackageType" runat="server" ErrorMessage="Please Select Package Name" SetFocusOnError="True" Display="None" ValidationGroup="faq" ControlToValidate="ddlPackageName"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <label for="question" class="col-form-label">Question:</label>
                                            <%--<textarea runat="server" class="form-control" id="question"></textarea>--%>
                                            <asp:TextBox ID="question" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Valid Question" ControlToValidate="question" SetFocusOnError="True" Display="None" ValidationGroup="faq"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
                                            <label for="answer" class="col-form-label">Answer:</label>
                                            <textarea runat="server" class="form-control" id="answer" rows="6"></textarea>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Valid Answer" ControlToValidate="answer" SetFocusOnError="True" Display="None" ValidationGroup="faq"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="submit" class="btn btn-primary" runat="server" Text="Save" ValidationGroup="faq" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />
                                    <asp:Button ID="btnCancel" CausesValidation="false" runat="server" class="btn btn-secondary" Text="Cancel" OnClientClick="clear1()" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"/>

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


                    <asp:GridView ID="example1" runat="server" CssClass="table table-bordered table-striped" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="id,package_id">
                        <Columns>
                            <asp:BoundField DataField="id" Visible="false" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                            <asp:TemplateField HeaderText="Sr. no">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="package_id" Visible="false"   SortExpression="package_id"></asp:BoundField>
                            
                             <asp:BoundField DataField="package_name" HeaderText="Package Name" />
                            <asp:BoundField DataField="question" HeaderText="Question" SortExpression="question"></asp:BoundField>
                            <asp:BoundField DataField="answer" HeaderText="Answer" SortExpression="answer"></asp:BoundField>
                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                                <ItemTemplate>

                                    <asp:ImageButton ID="Edit1" runat="server" CommandName="Edit1" CommandArgument='<%#Eval("id") %>' OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit" ImageUrl="~/admin/img/icons/icons8-edit-40.png" ImageAlign="NotSet" />

                                    &nbsp;&nbsp;                                       
                                

                                     <asp:ImageButton ID="del" runat="server" CommandName="del" CommandArgument='<%#Eval("id") %>' OnClientClick="return message(this);" CausesValidation="false" ToolTip="Delete" ImageUrl="~/admin/img/icons/icons8-delete-40.png" />

                                   <%-- <asp:Button ID="Edit1" runat="server" CssClass="btn btn-success" Text="Edit" CommandName="Edit1" CommandArgument='<%# Eval("id") %>' OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit" />
                                    &nbsp;&nbsp;                                       
                                    <asp:Button ID="del" CausesValidation="false" runat="server" CssClass="btn btn-danger" OnClientClick="return message(this);" CommandName="del" Text="Delete" CommandArgument='<%# Eval("id") %>' />
                           --%>     </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' DeleteCommand="DELETE FROM [tour_faqs] WHERE [id] = @id" InsertCommand="INSERT INTO [tour_faqs] ([question], [answer], [package_id]) VALUES (@question, @answer, @package_id)" SelectCommand="SELECT tour_faqs.*, tour_package.name as package_name 
                   FROM tour_faqs 
                   JOIN tour_package ON tour_faqs.package_id = tour_package.id ORDER BY tour_faqs.[id] DESC"
                        UpdateCommand="UPDATE [tour_faqs] SET [question] = @question, [answer] = @answer, [package_id] = @package_id WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="question" Type="String"></asp:Parameter>
                            <asp:Parameter Name="answer" Type="String"></asp:Parameter>
                            <asp:Parameter Name="package_id" Type="Int32"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="question" Type="String"></asp:Parameter>
                            <asp:Parameter Name="answer" Type="String"></asp:Parameter>
                            <asp:Parameter Name="package_id" Type="Int32"></asp:Parameter>
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
                    document.getElementById("<%=question.ClientID%>").value = "";
                    document.getElementById("<%=answer.ClientID%>").value = "";
                    document.getElementById("<%=uid.ClientID%>").value = "";
                    document.getElementById("<%=ddlPackageName.ClientID%>").value = 0;
                }

</script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
