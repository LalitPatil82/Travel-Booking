<%@ Page Title="" Language="VB" MasterPageFile="~/admin/Admin.master" AutoEventWireup="false" CodeFile="Place_details.aspx.vb" Inherits="admin_Place_details" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>


    <!--Main Content-->

     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="submit" />
        </Triggers>

        <ContentTemplate>
                <div class="card mb-3">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style="background-color:#000000;">
                        <h4 class="m-0" style="color:#E7B10A;font-weight:bold;">Add Places Details</h4>
                    </div>
                    <div class="card-body">

                        <asp:Button ID="btnShowPopup" runat="server" Text="Add Places" CssClass="btn btn-primary" OnClick="btnShowPopup_Click" OnClientClick="clear() refresh()"  style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"/>&nbsp;
                        &nbsp;

                        <asp:Button ID="btnHotels" runat="server" Text="Add Hotel Details" CssClass="btn btn-primary" OnClick="btnHotels_Click"  style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />

                        <asp:Panel ID="pnlModal" runat="server" CssClass="modalPopup" Style="display: none; width: 500px;">

                             <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background-color:#eee;">
                                <div class="modal-header" style="background-color:#000000;">
                                    <h5 class="modal-title" id="exampleModalLabel" style="color:#E7B10A;font-weight:bold;">Place Details</h5>
                                    <%--<asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="hotel" Display="Dynamic" Font-Bold="True" BorderColor="Black" ForeColor="Red" />--%>

                                </div>

                                <asp:HiddenField ID="uid" runat="server" />

                            <div class="modal-body">
                                <div>
                    

                        
                        <!--Package Name-->
                          
                        <div class="form-group">
                            <label for="Pack_name">Package Name</label>
                            <asp:DropDownList ID="Package_Name" runat="server" DataSourceID="Load_packname_place" DataTextField="name" DataValueField="id" CssClass="form-control"></asp:DropDownList>

                            <asp:SqlDataSource runat="server" ID="Load_packname_place" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT DISTINCT [id], [name] FROM [tour_package]"></asp:SqlDataSource>
                            
                        </div>

                        <!--Place Name-->
                        <div class="form-group">
                            <label for="Place_name">Place to Visit</label>
                            <input type="text" class="form-control" id="txt_placename" placeholder="Enter Place Name to visit" runat="server">

                                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorPlaceName" runat="server" ErrorMessage="Enter Valid Place Name" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txt_placename" ValidationGroup="place"></asp:RequiredFieldValidator>
                        </div>
                               
                        <!--Cover Image-->

                        <div class="form-group">
                        <label for="Cover Image">Place Cover Image</label><br />
                        <asp:FileUpload ID="cover_img" runat="server" /><br /> 

                            <asp:Label runat="server" Text="" ID="lbcover"></asp:Label>

                       
                            
                            </div>

                                

                                


                                 <!--Place Image-->
                                 <div class="form-group">
                        <label for="Place Image">Place Image</label><br />
                        <asp:FileUpload ID="visit_img" runat="server" /> <br />

                                     <asp:Label runat="server" Text="" ID="lbvisit"></asp:Label>
                       
                            </div>

                               

                                 <!--Place Description-->
                         <div class="form-group">
                      <label for="Place_Description">Enter Description of Places </label>
                      <textarea class="form-control" id="txt_placedesc" rows="3" runat="server" ></textarea>
                             
                         <asp:RequiredFieldValidator ID="RequiredFieldValidatorDescription" runat="server" ErrorMessage="Enter Valid Description" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txt_placedesc" ValidationGroup="place"></asp:RequiredFieldValidator>
                       

                    </div>

                                   
                                    <div class="modal-footer">

                                        <br />
                         <asp:Button ID="submit" runat="server" Text="Add" CssClass="btn btn-primary"  ValidationGroup="place"  style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"/>

                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" CausesValidation="false" OnClientClick="clear1()"   style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />

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

            <div class="col-lg-12"  id="tb1">
                <div class="card-body">

                    <asp:GridView ID="example1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="id,pack_id,cover_img,place_image" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id" Visible="false"    ></asp:BoundField>

                            

                            <asp:TemplateField HeaderText="Sr. no">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                               
                            </asp:TemplateField>

                            



                            <asp:BoundField DataField="pack_id" HeaderText="pack_id" SortExpression="pack_id" Visible="false"></asp:BoundField>

                            <asp:BoundField DataField="place_name" HeaderText="Place Name"  SortExpression="place_name"></asp:BoundField>


                             <asp:BoundField DataField="cover_img" HeaderText="Cover Image Text" visible="false" SortExpression="cover_img"></asp:BoundField>

                            <asp:TemplateField HeaderText="Cover Image">
                                 <ItemTemplate>

                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#"../admin/img/place_img/" + Eval("cover_img") %>' Width="100px" />
                                </ItemTemplate>
                            </asp:TemplateField>

                         
                              <asp:BoundField DataField="place_image" Visible="false" HeaderText="Place Image Text" SortExpression="place_image"></asp:BoundField>

                            <asp:TemplateField HeaderText="Place Image">
                                 <ItemTemplate>

                                    <asp:Image ID="Image2" runat="server" ImageUrl='<%#"../admin/img/place_img/" + Eval("place_image") %>' Width="100px" />
                                </ItemTemplate>
                            </asp:TemplateField>

                          

                            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description"></asp:BoundField>



                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                                <ItemTemplate>
                                  
                                    <asp:ImageButton ID="Edit1" runat="server" CommandName="Edit1" CommandArgument='<%#Eval("id") %>' OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit"   ImageUrl="~/admin/img/icons/icons8-edit-40.png" ImageAlign="NotSet" /> 

                                    &nbsp;&nbsp;                                       
                                

                                     <asp:ImageButton ID="del" runat="server" CommandName="del" CommandArgument='<%#Eval("id") %>' OnClientClick="return message(this);" CausesValidation="false" ToolTip="Delete"   ImageUrl="~/admin/img/icons/icons8-delete-40.png" />

                                     &nbsp;&nbsp; 


                                       <asp:ImageButton ID="add_img" runat="server" CommandName="add_img" CommandArgument='<%#Eval("id") %>'  CausesValidation="false" ToolTip="Add Image"   ImageUrl="~/admin/img/icons/icons8-add-image-40.png" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' DeleteCommand="DELETE FROM [tour_place] WHERE [id] = @id" InsertCommand="INSERT INTO [tour_place] ([pack_id], [place_name], [cover_img], [place_image], [description]) VALUES (@pack_id, @place_name, @cover_img, @place_image, @description)" SelectCommand="SELECT tour_place.*,tour_package.name as package_name 
                        From tour_place
                         JOIN tour_package ON tour_place.pack_id = tour_package.id ORDER BY tour_place.[id] DESC"

                         UpdateCommand="UPDATE [tour_place] SET [pack_id] = @pack_id, [place_name] = @place_name, [cover_img] = @cover_img, [place_image] = @place_image, [description] = @description WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="pack_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="place_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="cover_img" Type="String"></asp:Parameter>
                            <asp:Parameter Name="place_image" Type="String"></asp:Parameter>
                            <asp:Parameter Name="description" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="pack_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="place_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="cover_img" Type="String"></asp:Parameter>
                            <asp:Parameter Name="place_image" Type="String"></asp:Parameter>
                            <asp:Parameter Name="description" Type="String"></asp:Parameter>
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
                    document.getElementById("<%=txt_placename.ClientID%>").value = "";
                    document.getElementById("<%=txt_placedesc.ClientID%>").value = "";
                    document.getElementById("<%=cover_img.ClientID%>").value = "";
                      document.getElementById("<%= lbcover.ClientID%>").textContent = "";
                      document.getElementById("<%= visit_img.ClientID%>").value = "";
                      document.getElementById("<%= lbvisit.ClientID%>").textContent = "";
                    document.getElementById("<%=uid.ClientID%>").value = "";
                 }

                 function refresh() {

                     document.getElementById("<%=RequiredFieldValidatorPlaceName.ClientID%>").style.display = 'none';

                     document.getElementById("<%=RequiredFieldValidatorDescription.ClientID%>").style.display = 'none';
                 }

                

               

</script>

            </ContentTemplate>
            </asp:UpdatePanel>
            

</asp:Content>

