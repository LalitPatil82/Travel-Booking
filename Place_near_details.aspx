<%@ Page Title="" Language="VB" MasterPageFile="~/admin/Admin.master" AutoEventWireup="false" CodeFile="Place_near_details.aspx.vb" Inherits="admin_Place_near_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

      <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

         <Triggers>
            <asp:PostBackTrigger ControlID="submit" />
        </Triggers>

        <ContentTemplate>
            <div class="card mb-3">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style="background-color:#000000;">
                        <h4 class="m-0" style="color:#E7B10A;font-weight:bold;">Add Places Details to Visit</h4>
                    </div>

                 <asp:HiddenField ID="uid" runat="server" />

                <!--Main Content-->
                <div class="card-body">
                <div class="form-group">
                            <label for="Place_name">Place Name</label>
                    <%--<asp:DropDownList ID="Place_name" runat="server" CssClass="form-control" DataSourceID="Load_place_name" DataTextField="place_name" DataValueField="id"></asp:DropDownList>

                    <asp:SqlDataSource runat="server" ID="Load_place_name" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT [id], [place_name] FROM [tour_place]"></asp:SqlDataSource>--%>

                    <asp:TextBox ID="Place_name" runat="server" CssClass="form-control" ReadOnly="True" BackColor="White"></asp:TextBox>

                </div>
                   

                <div class="form-group">
                     <label for="Place Image">Nearby Places Image</label><br />
                    <asp:FileUpload ID="near_img" runat="server" />

                    <asp:Label ID="lbvisit_img" runat="server" Text=""></asp:Label>
                   
                </div>

                    <div class="form-group">
                        <label for="Place Descrition">Place Description</label>
                         <textarea class="form-control" id="txt_placedesc" rows="3" runat="server"></textarea>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter the valid Description" ControlToValidate="txt_placedesc" Display="Dynamic" ValidationGroup="place_near" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <hr />
                    <div class="form-group">
                       
                        <asp:Button ID="submit" runat="server" Text="Save" CssClass="btn btn-primary" ValidationGroup="place_near" style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"/>&nbsp;&nbsp;&nbsp;

                        <asp:Button ID="cancel" runat="server" Text="Cancel" CssClass="btn btn-danger"  CausesValidation="false"   style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />

                    </div>
                     </div>
                </div>

            <!--Grid Tabel--->
           
             <div class="col-lg-12"  id="tb1">
                  <div class="card">
                      <div class="card-header" style="background-color:#000000;">
                          <h4 class="card-title" style="color:#E7B10A;font-weight:bold;">Place Image <asp:Label ID="Label1" runat="server" Text=""></asp:Label></h4>
                      </div>
                <div class="card-body">
                    <asp:GridView ID="example1" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id,place_id,place_img" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" Visible="false" SortExpression="id"></asp:BoundField>

                             <asp:TemplateField HeaderText="Sr. no">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                               
                            </asp:TemplateField>

                            <asp:BoundField DataField="place_id" HeaderText="place_id" SortExpression="place_id" Visible="false"></asp:BoundField>

                            

                            <asp:BoundField DataField="place_img" HeaderText="place_img" SortExpression="place_img" Visible="false"></asp:BoundField>

                             <asp:TemplateField HeaderText="Place Image">
                                 <ItemTemplate>

                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#"../admin/img/place_img/" + Eval("place_img") %>' Width="100px" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="place_description" HeaderText="Place Description" SortExpression="place_description"></asp:BoundField>

                            
                            <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                                <ItemTemplate>
                                  
                                      <asp:ImageButton ID="Edit1" runat="server" CommandName="Edit1" CommandArgument='<%#Eval("id") %>' OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit"   ImageUrl="~/admin/img/icons/icons8-edit-40.png" />

                                    &nbsp;&nbsp;                                       
                                

                                     <asp:ImageButton ID="del" runat="server" CommandName="del" CommandArgument='<%#Eval("id") %>' OnClientClick="return message(this);" CausesValidation="false" ToolTip="Delete"   ImageUrl="~/admin/img/icons/icons8-delete-40.png" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' DeleteCommand="DELETE FROM [tour_place_visit] WHERE [id] = @id" InsertCommand="INSERT INTO [tour_place_visit] ([place_id], [place_img], [place_description]) VALUES (@place_id, @place_img, @place_description)" SelectCommand="SELECT * FROM [tour_place_visit] WHERE ([place_id] = @place_id)"
                        UpdateCommand="UPDATE [tour_place_visit] SET [place_id] = @place_id, [place_img] = @place_img, [place_description] = @place_description WHERE [id] = @id "  >
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                           
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="place_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="place_img" Type="String"></asp:Parameter>
                            <asp:Parameter Name="place_description" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter SessionField="add" DefaultValue="0" Name="place_id" Type="Int32"></asp:SessionParameter>
                        </SelectParameters>
                        <UpdateParameters>
                             <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="place_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="place_img" Type="String"></asp:Parameter>
                            <asp:Parameter Name="place_description" Type="String"></asp:Parameter>
                            
                        </UpdateParameters>
                    </asp:SqlDataSource>
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
                   
                    document.getElementById("<%=txt_placedesc.ClientID%>").value = "";
                      document.getElementById("<%=lbvisit_img.ClientID%>").textContent = "";  
                   document.getElementById("<%=uid.ClientID%>").value = "";
                }

                

               

</script>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

