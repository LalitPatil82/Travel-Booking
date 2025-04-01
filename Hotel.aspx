<%@ Page Title="" Language="VB" MasterPageFile="~/admin/Admin.master" AutoEventWireup="false" CodeFile="Hotel.aspx.vb" Inherits="Hotel" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <style type="text/css">
        .inline-blk {
            display: inline-block;
            width:49%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Form Basic -->
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="submit" />
        </Triggers>
        <ContentTemplate>


            <!-- Form Basic -->

            <div class="card mb-3" id="c1">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style="background-color: #000000;">
                    <h4 class="m-0 " style="color: #E7B10A; font-weight: bold;">Hotels</h4>
                </div>
                <div class="card-body">
                    <asp:Button ID="btnShowPopup" class="btn btn-primary" runat="server" Text="Add Hotels" OnClientClick="refresh()" Style="background-color: #000000; border: #000000; color: #E7B10A; font-weight: bold;" />

                    <asp:Panel ID="pnlModal" runat="server" CssClass="modalPopup" Style="display: none; width: 500px;">

                        <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background-color: #eee;">
                                <div class="modal-header" style="background-color: #000000;">
                                    <h5 class="modal-title" id="exampleModalLabel" style="color: #E7B10A; font-weight: bold;">Hotels</h5>
                                    <%-- <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="hotel" Display="Dynamic" Font-Bold="True" BorderColor="Black" ForeColor="Red" />--%>
                                </div>
                                <asp:HiddenField ID="uid" runat="server" />
                                <div class="modal-body">
                                    <div>
                                      
                                   <div class="form-group col-6 inline-blk">
                                            <label for="ddlPackageName" class="col-form-label">Package Name:</label>
                                            <asp:DropDownList ID="ddlPackageName" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="id">
                                            </asp:DropDownList>


                                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT [id], [name] FROM [tour_package]"></asp:SqlDataSource>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPackageType"
                                                runat="server"
                                                ErrorMessage="Please Select Package Name"
                                                SetFocusOnError="True"
                                                Display="Dynamic"
                                                ValidationGroup="hotel"
                                                ForeColor="Red"
                                                ControlToValidate="ddlPackageName">

                                            </asp:RequiredFieldValidator>
                                        </div>

                                        <div class="form-group col-6 inline-blk">
                                            <label for="ddPlaceName" class="col-form-label">Place Name</label>
                                            <asp:DropDownList ID="ddPlaceName" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="place_name" DataValueField="id" AutoPostBack="True"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT [id], [place_name], [pack_id] FROM [tour_place] WHERE ([pack_id] = @pack_id)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlPackageName" PropertyName="SelectedValue" DefaultValue="0" Name="pack_id" Type="Int32"></asp:ControlParameter>
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                        <div class="form-group">
                                            <label for="txthtlname">Hotel Name</label>
                                            <input type="text" class="form-control" id="txthtlname" placeholder="Enter Hotel Name" runat="server" />

                                            <asp:RequiredFieldValidator
                                                ID="HotelNameRequiredValidator"
                                                runat="server"
                                                ControlToValidate="txthtlname"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ErrorMessage="Hotel Name is required."
                                                ValidationGroup="hotel">
                                            </asp:RequiredFieldValidator>
                                        </div>

                                        <div class="form-group">
                                            <label for="Hotel Image">Hotel Image</label><br />
                                            <asp:FileUpload ID="h_img" runat="server" /><br />


                                            <asp:Label runat="server" Text="" ID="lb_img"></asp:Label>



                                        </div>

                                        <!--Hotel Contact No.-->
                                        <div class="form-group">
                                            <label for="txthtlphn">Contact No.</label>
                                            <input type="text" class="form-control" id="txthtlphn" placeholder="Enter Hotel Name" runat="server" maxlength="10">

                                            <asp:RequiredFieldValidator
                                                ID="HotelPhoneRequiredValidator"
                                                runat="server"
                                                ControlToValidate="txthtlphn"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ErrorMessage="Hotel Phone is required."
                                                ValidationGroup="hotel">
                                            </asp:RequiredFieldValidator>
                                        </div>

                                        <asp:RegularExpressionValidator
                                            ID="RegularExpressionValidator1"
                                            runat="server"
                                            ControlToValidate="txthtlphn"
                                            SetFocusOnError="True"
                                            Display="Dynamic"
                                            ForeColor="Red"
                                            ValidationGroup="hotel"
                                            ErrorMessage="Please enter a valid Phone Number" ValidationExpression="\d+">

                                        </asp:RegularExpressionValidator>


                                        <!--Hotel Location/Address-->

                                        <div class="form-group">
                                            <label for="txthtldesc">Enter Hotel Description</label>
                                            <textarea class="form-control" id="txthtldesc" rows="3" runat="server"></textarea>

                                            <asp:RequiredFieldValidator
                                                ID="HotelAddressRequiredValidator"
                                                runat="server"
                                                ControlToValidate="txthtldesc"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ErrorMessage="Hotel Address is required."
                                                ValidationGroup="hotel">
                                            </asp:RequiredFieldValidator>
                                        </div>

                                        <!--Hotel WebLink -->
                                        <label for="basic-url">Hotel Website Links</label>
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="basic-addon3">https://example.com/</span>
                                            </div>

                                            <input type="text" class="form-control" id="txturl" aria-describedby="basic-addon3" runat="server" /><br />

                                            <asp:RequiredFieldValidator
                                                ID="HotelWebLinkRequiredValidator"
                                                runat="server"
                                                ControlToValidate="txturl"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ErrorMessage="Hotel Web Link is required." ValidationGroup="hotel">
                                            </asp:RequiredFieldValidator>

                                            <asp:RegularExpressionValidator
                                                ID="urlValidator"
                                                runat="server"
                                                Display="Dynamic"
                                                ForeColor="Red"
                                                ValidationGroup="hotel"
                                                ControlToValidate="txturl"
                                                ValidationExpression="^(http[s]?://)?[^\s]+\.[^\s]+$"
                                                ErrorMessage="Please enter a valid URL"></asp:RegularExpressionValidator>
                                        </div>
                                        <br />

                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button ID="submit" class="btn btn-primary" runat="server" Text="Save" ValidationGroup="hotel" Style="background-color: #000000; border: #000000; color: #E7B10A; font-weight: bold;" />
                                        <asp:Button ID="btnCancel" CausesValidation="false" runat="server" class="btn btn-secondary" Text="Cancel" OnClientClick="clear1()" Style="background-color: #000000; border: #000000; color: #E7B10A; font-weight: bold;" />
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

                    <asp:GridView ID="example1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="id,package_id,place_id,Image" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="id" Visible="false" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                            <asp:TemplateField HeaderText="Sr. no">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="package_id" Visible="false" SortExpression="package_id"></asp:BoundField>
                            <asp:BoundField DataField="package_name" HeaderText="Package Name" />


                            <asp:BoundField DataField="place_id" Visible="false" SortExpression="place_id"></asp:BoundField>
                            <asp:BoundField DataField="place_name" HeaderText="Place Name" />

                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name"></asp:BoundField>

                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>

                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#"../admin/img/hotel_img/" + Eval("Image") %>' Width="100px" />
                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:BoundField DataField="Image" Visible="false" HeaderText="Hotel Image Text" SortExpression="Image"></asp:BoundField>


                            <asp:BoundField DataField="ph_no" HeaderText="Phone No." SortExpression="ph_no"></asp:BoundField>
                            <asp:BoundField DataField="desc" HeaderText="desc" SortExpression="desc"></asp:BoundField>
                            <asp:BoundField DataField="web_link" HeaderText="Url" SortExpression="web_link"></asp:BoundField>
                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                                <ItemTemplate>
                                    <asp:ImageButton ID="Edit1" runat="server" CommandName="Edit1" CommandArgument='<%#Eval("id") %>' OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit" ImageUrl="~/admin/img/icons/icons8-edit-40.png" />

                                    &nbsp;&nbsp;                                       
                                

                                     <asp:ImageButton ID="del" runat="server" CommandName="del" CommandArgument='<%#Eval("id") %>' OnClientClick="return message(this);" CausesValidation="false" ToolTip="Delete" ImageUrl="~/admin/img/icons/icons8-delete-40.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>


                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' DeleteCommand="DELETE FROM [tour_hotel] WHERE [id] = @id" InsertCommand="INSERT INTO [tour_hotel] ([name], [ph_no], [desc], [web_link], [package_id],[place_id],[Image]) VALUES (@name, @ph_no, @desc, @web_link, @package_id,@place_id,@Image)" SelectCommand="SELECT tour_hotel.*, tour_package.name as package_name,tour_place.place_name as place_name
                   FROM tour_hotel 
                   JOIN tour_package ON tour_hotel.package_id = tour_package.id 
                    JOIN tour_place ON tour_hotel.place_id = tour_place.id ORDER BY tour_hotel.[id] DESC"
                        UpdateCommand="UPDATE [tour_hotel] SET [name] = @name, [ph_no] = @ph_no, [desc] = @desc, [web_link] = @web_link, [package_id] = @package_id ,[place_id]=@place_id ,[Image]=@Image WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="ph_no" Type="String"></asp:Parameter>
                            <asp:Parameter Name="desc" Type="String"></asp:Parameter>
                            <asp:Parameter Name="web_link" Type="String"></asp:Parameter>
                            <asp:Parameter Name="package_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="place_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Image" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="ph_no" Type="String"></asp:Parameter>
                            <asp:Parameter Name="desc" Type="String"></asp:Parameter>
                            <asp:Parameter Name="web_link" Type="String"></asp:Parameter>
                            <asp:Parameter Name="package_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="place_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="Image" Type="String"></asp:Parameter>
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
                    document.getElementById("<%=txthtldesc.ClientID%>").value = "";
                    document.getElementById("<%=txthtlname.ClientID%>").value = "";

                    document.getElementById("<%=txthtlphn.ClientID%>").value = "";
                    document.getElementById("<%=txturl.ClientID%>").value = "";
                    document.getElementById("<%=uid.ClientID%>").value = "";
                    document.getElementById("<%=ddlPackageName.ClientID%>").value = 1;
                }



                function refresh() {
                    document.getElementById("<%=HotelNameRequiredValidator.ClientID%>").style.display = "none"
                    document.getElementById("<%=HotelPhoneRequiredValidator.ClientID%>").style.display = "none"
                    document.getElementById("<%=HotelAddressRequiredValidator.ClientID%>").style.display = "none"
                    document.getElementById("<%=HotelWebLinkRequiredValidator.ClientID%>").style.display = "none"
                    document.getElementById("<%=RegularExpressionValidator1.ClientID%>").style.display = "none"
                    document.getElementById("<%=urlValidator.ClientID%>").style.display = "none"
                }

            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

