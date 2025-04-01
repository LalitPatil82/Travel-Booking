<%@ Page Title="" Language="VB" MasterPageFile="~/admin/Admin.master" AutoEventWireup="false" CodeFile="Create_Pack.aspx.vb" Inherits="Create_Pack" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Form Basic -->
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnAddPackage" />
        </Triggers>
        <ContentTemplate>

            <!-- Form Basic -->

            <div class="card mb-3" id="c1">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style="background-color:#000000;">
                    <h4 class="m-0"  style="color:#E7B10A;font-weight:bold;">Add Package/Package Type</h4>
                </div>
                <div class="card-body">

                    <asp:Button ID="btnShowPopup" class="btn btn-primary" runat="server" Text="Add/Delete Package Type" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />
                    &nbsp;
                   
                    <asp:Button ID="btnShowPackagePopup" class="btn btn-primary" runat="server" Text="Add Package" OnClientClick="refresh()" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />
                    &nbsp;
                      &nbsp;
                    
                    <asp:Button ID="btnPlace" class="btn btn-primary" runat="server" Text="Add Places" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />
                    <%--The Section to add/delete Package type Starts here--%>

                    <asp:Panel ID="pnlModal" runat="server" CssClass="modalPopup" Style="display: none; width: 900px;">

                        <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background-color:#eee;">
                                <div class="modal-header" style="background-color:#000000;">
                                    <h5 class="modal-title" id="exampleModalLabel"  style="color:#E7B10A;font-weight:bold;">Add/Delete Package Type</h5>
                                </div>
                                <%-- <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="pck_type" Display="Dynamic" Font-Bold="True" BorderColor="Black" ForeColor="Red" />--%>
                                <asp:HiddenField ID="uid" runat="server" />
                                <div class="modal-body">
                                    <div>
                                        <div class="form-group">
                                            <label for="pck_type" class="col-form-label">Package Type:</label>

                                            <asp:TextBox ID="pck_type" runat="server" AutoComplete="off" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Valid Package Type" SetFocusOnError="True" Display="Dynamic" ValidationGroup="pck_type" ControlToValidate="pck_type" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>

                                        <asp:Button ID="add_pck_type" class="btn btn-primary" runat="server" Text="Add" AllowSearching="true" ValidationGroup="pck_type" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />
                                        <br />
                                        <br />
                                        <asp:GridView ID="pck_type_grid" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="pck_type_ds" AllowPaging="True" PageSize="3">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sr. no">
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="id" Visible="false" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                                <asp:BoundField DataField="package_type" HeaderText=" Package Type" SortExpression="package_type" />

                                                <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                                                    <ItemTemplate>
                                                        <asp:Button ID="del_pck_type" runat="server" CssClass="btn btn-danger" CommandName="del_pck_type" Text="Delete" CommandArgument='<%# Eval("id") %>' OnClientClick="return message1(this);" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />
                                                    </ItemTemplate>

                                                </asp:TemplateField>


                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="pck_type_ds" runat="server" ConnectionString="<%$ ConnectionStrings:Tours and Travels %>" DeleteCommand="DELETE FROM [tour_package_type] WHERE [id] = @id" InsertCommand="INSERT INTO [tour_package_type] ([package_type]) VALUES (@package_type)" SelectCommand="SELECT * FROM [tour_package_type] ORDER BY [id] DESC" UpdateCommand="UPDATE [tour_package_type] SET [package_type] = @package_type WHERE [id] = @id">
                                            <DeleteParameters>
                                                <asp:Parameter Name="id" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="package_type" Type="String" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="package_type" Type="String" />
                                                <asp:Parameter Name="id" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="btnCancel" CausesValidation="false" runat="server" class="btn btn-secondary" Text="Cancel" OnClientClick="clear1()" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"/>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                        PopupControlID="pnlModal" TargetControlID="btnShowPopup" CancelControlID="btnCancel"
                        BackgroundCssClass="modalBackground">
                    </ajaxToolkit:ModalPopupExtender>
                    <%--The Section to add/delete Package type ends here--%>
                </div>
            </div>

            <%-- the popup to add edit the package section/popup--%>
            <asp:Panel ID="pnlAddPackage" runat="server" CssClass="modalPopup" Style="display: none; width: 1200px;">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="background-color:#eee;">
                        <div class="modal-header" style="background-color:#000000;">
                            <h5 class="modal-title" id="exampleModalLabel1" style="color:#E7B10A;font-weight:bold;" >Add Package</h5>
                        </div>
                        <%--<asp:ValidationSummary ID="ValidationSummaryPackage" runat="server" ValidationGroup="add_package" Display="Dynamic" Font-Bold="True" BorderColor="Black" ForeColor="Red" />--%>
                        <asp:HiddenField ID="HiddenField1" runat="server" />

                        <asp:Label runat="server" Text="" ID="lber"></asp:Label>
                        <div class="modal-body">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="txtPackageName" class="col-form-label">Name:</label>
                                    <asp:TextBox ID="txtPackageName" runat="server" AutoComplete="off" CssClass="form-control"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPackageName"
                                        runat="server"
                                        ErrorMessage="Please enter package name"
                                        SetFocusOnError="True"
                                        Display="Dynamic"
                                        ValidationGroup="add_package"
                                        ControlToValidate="txtPackageName"
                                        ForeColor="Red">

                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="txtPackagePrice" class="col-form-label">Price:</label>
                                    <asp:TextBox ID="txtPackagePrice" runat="server" AutoComplete="off" CssClass="form-control"></asp:TextBox>

                                    <asp:RegularExpressionValidator
                                        ID="RegularExpressionValidator1"
                                        runat="server"
                                        ControlToValidate="txtPackagePrice"
                                        SetFocusOnError="True"
                                        Display="Dynamic"
                                        ValidationGroup="add_package"
                                        ErrorMessage="Please enter a valid Price"
                                        ValidationExpression="\d+"
                                        ForeColor="Red"></asp:RegularExpressionValidator>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPackagePrice"
                                        runat="server"
                                        ErrorMessage="Please enter package price"
                                        SetFocusOnError="True"
                                        Display="Dynamic"
                                        ValidationGroup="add_package"
                                        ControlToValidate="txtPackagePrice"
                                        ForeColor="Red">
                                    </asp:RequiredFieldValidator>

                                </div>


                                <div class="form-group col-md-6">
                                    <label for="txtPackageDuration" class="col-form-label">Duration:</label>
                                    <asp:TextBox ID="txtPackageDuration" placeholder="3 Days 4 Nights" runat="server" AutoComplete="off" CssClass="form-control"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPackageDuration"
                                        runat="server"
                                        ErrorMessage="Please enter package duration" SetFocusOnError="True"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ValidationGroup="add_package" ControlToValidate="txtPackageDuration">

                                    </asp:RequiredFieldValidator>

                                </div>

                                <div class="form-group col-md-6">
                                    <label for="txtPackageSummary" class="col-form-label">Summary:</label>
                                    <asp:TextBox ID="txtPackageSummary" runat="server" AutoComplete="off" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPackageSummary"
                                        runat="server"
                                        ErrorMessage="Please enter package summary" SetFocusOnError="True"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ValidationGroup="add_package" ControlToValidate="txtPackageSummary">

                                    </asp:RequiredFieldValidator>

                                </div>
                                <div class="form-group col-md-6">
                                    <label for="txtNumberOfPeople" class="col-form-label">Number of People:</label>
                                    <asp:TextBox ID="txtNumberOfPeople" runat="server" AutoComplete="off" CssClass="form-control"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNumberOfPeople"
                                        runat="server"
                                        ErrorMessage="Please enter the number of people" SetFocusOnError="True"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ValidationGroup="add_package" ControlToValidate="txtNumberOfPeople">

                                    </asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorNumberOfPeople"
                                        runat="server"
                                        ControlToValidate="txtNumberOfPeople"
                                        SetFocusOnError="True"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ValidationGroup="add_package"
                                        ErrorMessage="Please enter a valid number" ValidationExpression="\d+">

                                    </asp:RegularExpressionValidator>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="fuPackageImage" class="col-form-label">Image:</label>
                                    <ajaxToolkit:AsyncFileUpload ID="fuPackageImage" runat="server" CssClass="form-control-file" />
                                    <%-- <asp:FileUpload ID="fuPackageImage" runat="server" CssClass="form-control-file" />--%>
                                    <asp:Label ID="lblimage" runat="server" Text=""></asp:Label>
                                    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidatorPackageImage" runat="server" ErrorMessage="Please upload package image" SetFocusOnError="True" Display="None" ValidationGroup="add_package" ControlToValidate="fuPackageImage"></asp:RequiredFieldValidator>
                                    --%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="ddlPackageType" class="col-form-label">Package Type:</label>
                                <asp:DropDownList ID="ddlPackageType" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="package_type">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Tours and Travels %>" SelectCommand="SELECT [package_type] FROM [tour_package_type]"></asp:SqlDataSource>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPackageType" runat="server" ErrorMessage="Please select package type" SetFocusOnError="True" Display="None" ValidationGroup="add_package" ControlToValidate="ddlPackageType"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group">
                                <label for="transport" runat="server">Mode of Transport</label>
                                <asp:DropDownList ID="mode_tsp" runat="server" CssClass="form-control">
                                    <asp:ListItem>Rail transport</asp:ListItem>
                                    <asp:ListItem>Air transport</asp:ListItem>
                                    <asp:ListItem>Bus transport</asp:ListItem>
                                    <asp:ListItem>Water transport</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnAddPackage" runat="server" Text="Save" OnClick="btnAddPackage_Click" ValidationGroup="add_package" CssClass="btn btn-success" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"/>
                            <asp:Button ID="btn_pck_cancel" runat="server" OnClientClick="clear1()" Text="Cancel" CssClass="btn btn-danger" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"/>
                        </div>
                    </div>
                </div>

            </asp:Panel>

            <ajaxToolkit:ModalPopupExtender ID="AddPackage" runat="server" PopupControlID="pnlAddPackage" CancelControlID="btn_pck_cancel" TargetControlID="btnShowPackagePopup" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>
            <%-- the add package code will end here--%>
            <!-- /.card-header -->

            <div class="col-lg-12" id="tb1">
                <div class="card-body">


                    <asp:GridView ID="example1" runat="server" CssClass="table table-bordered table-striped" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="id,cover_image">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr. no">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="id" Visible="false" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                            <asp:BoundField DataField="name" HeaderText="Name of Package" SortExpression="name"></asp:BoundField>
                            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price"></asp:BoundField>
                            <asp:BoundField DataField="package_type" HeaderText="Package Type" SortExpression="package_type"></asp:BoundField>
                            <asp:BoundField DataField="duration" HeaderText="Duration" SortExpression="duration"></asp:BoundField>
                            <asp:BoundField DataField="description"  HeaderText="Description" SortExpression="description" HeaderStyle-Wrap="True"></asp:BoundField>
                            <asp:BoundField DataField="max_limit" HeaderText="Total Capacity" SortExpression="max_limit"></asp:BoundField>
                            <asp:BoundField DataField="cover_image" HeaderText="Cover Image" Visible="false" SortExpression="cover_image"></asp:BoundField>


                            <asp:TemplateField HeaderText="CoverImage">

                                <ItemTemplate>
                                    <asp:Image ID="img" ImageUrl='<%# "../admin/img/Packages/" + Eval("cover_image") %>' Width="150px" runat="server" />
                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:BoundField DataField="mode_tsp" HeaderText="Transportation" SortExpression="mode_tsp"></asp:BoundField>

                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                                <ItemTemplate>

                                    <asp:ImageButton ID="Edit1" runat="server" CommandName="Edit1" CommandArgument='<%#Eval("id") %>' OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit" ImageUrl="~/admin/img/icons/icons8-edit-40.png" ImageAlign="NotSet" />

                                    &nbsp;&nbsp;                                       
                                

                                    


                                    <asp:ImageButton ID="del" runat="server" CommandName="del" CommandArgument='<%#Eval("id") %>' OnClientClick="return message(this);" CausesValidation="false" ToolTip="Delete" ImageUrl="~/admin/img/icons/icons8-delete-40.png" />

                                </ItemTemplate>
                            </asp:TemplateField>


                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' DeleteCommand="DELETE FROM [tour_package] WHERE [id] = @id" InsertCommand="INSERT INTO [tour_package] ([name], [price], [package_type], [duration], [description], [max_limit], [cover_image], [mode_tsp]) VALUES (@name, @price, @package_type, @duration, @description, @max_limit, @cover_image, @mode_tsp)" SelectCommand="SELECT * FROM [tour_package]" UpdateCommand="UPDATE [tour_package] SET [name] = @name, [price] = @price, [package_type] = @package_type, [duration] = @duration, [description] = @description, [max_limit] = @max_limit, [cover_image] = @cover_image, [mode_tsp] = @mode_tsp WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="price" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="package_type" Type="String"></asp:Parameter>
                            <asp:Parameter Name="duration" Type="String"></asp:Parameter>
                            <asp:Parameter Name="description" Type="String"></asp:Parameter>
                            <asp:Parameter Name="max_limit" Type="Int16"></asp:Parameter>
                            <asp:Parameter Name="cover_image" Type="String"></asp:Parameter>
                            <asp:Parameter Name="mode_tsp" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="price" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="package_type" Type="String"></asp:Parameter>
                            <asp:Parameter Name="duration" Type="String"></asp:Parameter>
                            <asp:Parameter Name="description" Type="String"></asp:Parameter>
                            <asp:Parameter Name="max_limit" Type="Int16"></asp:Parameter>
                            <asp:Parameter Name="cover_image" Type="String"></asp:Parameter>
                            <asp:Parameter Name="mode_tsp" Type="String"></asp:Parameter>
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


                //it will clear all the value when we will click on cancel
                function clear1() {
                    document.getElementById("<%=txtNumberOfPeople.ClientID%>").value = "";
                    document.getElementById("<%=txtPackageDuration.ClientID%>").value = "";
                    document.getElementById("<%=txtPackageName.ClientID%>").value = "";
                    document.getElementById("<%=txtPackagePrice.ClientID%>").value = "";
                    document.getElementById("<%=txtPackageSummary.ClientID%>").value = "";
                    document.getElementById("<%=ddlPackageType.ClientID%>").selectedIndex = 0;
                    document.getElementById("<%=fuPackageImage.ClientID%>").value = "";
                    document.getElementById("<%= lblimage.ClientID%>").textContent = "";
                    document.getElementById("<%=uid.ClientID%>").value = "";
                }

                //this is the function to ask whether the user is confirm to delete a value
                function message1(del) {
                     $find("<%= ModalPopupExtender1.ClientID %>").hide();
                    if (del.dataset.confirmed) {

                        // The action was already confirmed by the user, proceed with server event
                        del.dataset.confirmed = false;
                        return true;
                    } else {
                        // Ask the user to confirm/cancel the action
                        event.preventDefault();
                        swal({
                            title: 'Are you sure?',
                            text: "Once deleted, you will not be able to recover it!",
                            icon: 'warning',
                            buttons: true,
                            dangerMode: true,
                        }).then(function (willDelete) {
                            if (willDelete) {
                                swal("The Record is Deleted!", {
                                    icon: "success",
                                }).then(function () {
                                    del.dataset.confirmed = true;
                                    // Trigger button click programmatically
                                    del.click();
                                });
                            }
                        });
                    }
                }

            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
