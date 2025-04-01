<%@ Page Title="" Language="VB" MasterPageFile="~/admin/Admin.master" AutoEventWireup="false" CodeFile="Tour_guide.aspx.vb" Inherits="admin_Tour_guide" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

              <ContentTemplate>
        
            <div class="card mb-3" id="c1">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" style="background-color:#000000;">
                    <h4 class="m-0"  style="color:#E7B10A;font-weight:bold;">Add Tour Guide Details</h4>

                </div>
                <div class="card-body">

                        <asp:Button ID="btnShowPopup" runat="server" Text="Add Guide" OnClientClick="clear() refresh()" CssClass="btn btn-primary"  style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"/>&nbsp;
                        &nbsp;

                       

                        <asp:Panel ID="pnlModal" runat="server" CssClass="modalPopup" Style="display: none; width: 500px;">

                             <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background-color:#eee;">
                                <div class="modal-header" style="background-color:#000000;">
                                    <h5 class="modal-title" id="exampleModalLabel" style="color:#E7B10A;font-weight:bold;">Tour Guide Details</h5>
                                  
                                </div>

                                 <asp:HiddenField ID="uid" runat="server" />

                                 <div class="modal-body">
                                <div>
                    

                        
                        <!--Package Name-->
                          
                        <div class="form-group">
                            <label for="Pack_name">Package Name</label>
                            <asp:DropDownList ID="Package_Name" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id"></asp:DropDownList>

                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT [id], [name] FROM [tour_package]"></asp:SqlDataSource>
                        </div>

                                    <!--Guide Name-->
                                    <div class="form-group">
                            <label for="Guide_name">Guide Name</label>
                            <input type="text" class="form-control" id="txt_guidename" placeholder="Enter Guide Name" runat="server">

                                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorGuideName" runat="server" ErrorMessage="Enter Valid Guide Name" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txt_guidename" ValidationGroup="guide"></asp:RequiredFieldValidator>
                        </div>
                               

                              <!--Guide email-->
                                    <div class="form-group">
                            <label for="Guide_email">Guide Email Id</label>
                            <input type="text" class="form-control" id="txt_email" placeholder="Enter Guide Email Id" runat="server">

                                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorGuideEmail" runat="server" ErrorMessage="Enter Valid Guide Email" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txt_email" ValidationGroup="guide"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorGuideEmail" runat="server" ErrorMessage="Enter Valid Guide Email" Display="Dynamic" ValidationGroup="guide" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" ForeColor="Red"></asp:RegularExpressionValidator>

                        </div>

                                      <!--Guide Contact-->
                                    <div class="form-group">
                            <label for="Guide_name">Guide Contact no</label>
                            <input type="text" class="form-control" id="txt_phno" placeholder="Enter Guide Contact Number" runat="server">

                                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorGuideContact" runat="server" ErrorMessage="Enter Valid Guide Contact Number" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ControlToValidate="txt_phno" ValidationGroup="guide"></asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorGuideContact" runat="server" ErrorMessage="Enter Valid Guide Contact" ControlToValidate="txt_phno" Display="Dynamic" ValidationGroup="guide" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                        </div>


                                      <div class="modal-footer">

                                        <br />
                         <asp:Button ID="submit" runat="server" Text="Save" CssClass="btn btn-primary"  ValidationGroup="guide"  style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;"/>

                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" CausesValidation="false"  OnClientClick="clear1() refresh()"  style="background-color:#000000;border:#000000;color:#E7B10A;font-weight:bold;" />

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

                  <div class="col-lg-12"  id="tb1">
                <div class="card-body">
                    <asp:GridView ID="example1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="id,pack_id" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" Visible="false" SortExpression="id"></asp:BoundField>

                             <asp:TemplateField HeaderText="Sr. no">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                               
                            </asp:TemplateField>

                            <asp:BoundField DataField="pack_id" HeaderText="pack_id" SortExpression="pack_id" ></asp:BoundField>
                            <asp:BoundField DataField="name" HeaderText="Guide Name" SortExpression="name"></asp:BoundField>
                            <asp:BoundField DataField="email" HeaderText="Email Id" SortExpression="email"></asp:BoundField>
                            <asp:BoundField DataField="ph_no" HeaderText="Contact No" SortExpression="ph_no"></asp:BoundField>

                             <asp:TemplateField HeaderText="Actions" ItemStyle-Width="200px">
                                <ItemTemplate>
                                  
                                    <asp:ImageButton ID="Edit1" runat="server" CommandName="Edit1" CommandArgument='<%#Eval("id") %>' OnClick="Edit1_Click" CausesValidation="false" ToolTip="Edit"   ImageUrl="~/admin/img/icons/icons8-edit-40.png" ImageAlign="NotSet" /> 

                                    &nbsp;&nbsp;                                       
                                

                                     <asp:ImageButton ID="del" runat="server" CommandName="del" CommandArgument='<%#Eval("id") %>' OnClientClick="return message(this);" CausesValidation="false" ToolTip="Delete"   ImageUrl="~/admin/img/icons/icons8-delete-40.png" />
                                    </ItemTemplate>
                                 </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' DeleteCommand="DELETE FROM [tour_guide] WHERE [id] = @id" InsertCommand="INSERT INTO [tour_guide] ([pack_id], [name], [email], [ph_no]) VALUES (@pack_id, @name, @email, @ph_no)" SelectCommand="SELECT tour_guide.*,tour_package.name as package_name 
                        From tour_guide
                         JOIN tour_package ON tour_guide.pack_id = tour_package.id ORDER BY tour_guide.[id] DESC" 
                        UpdateCommand="UPDATE [tour_guide] SET [pack_id] = @pack_id, [name] = @name, [email] = @email, [ph_no] = @ph_no WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="pack_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="email" Type="String"></asp:Parameter>
                            <asp:Parameter Name="ph_no" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="pack_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="email" Type="String"></asp:Parameter>
                            <asp:Parameter Name="ph_no" Type="String"></asp:Parameter>
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

                          document.getElementById("<%=txt_guidename.ClientID%>").value = "";
                          document.getElementById("<%=txt_email.ClientID%>").value = "";
                          document.getElementById("<%=txt_phno.ClientID%>").value = "";
                      }

                      function refresh() {

                          document.getElementById("<%=RequiredFieldValidatorGuideContact.ClientID%>").style.display = 'none';

                          document.getElementById("<%=RequiredFieldValidatorGuideEmail.ClientID%>").style.display = 'none';

                          document.getElementById("<%=RequiredFieldValidatorGuideContact.ClientID%>").style.display = 'none';

                          document.getElementById("<%=RegularExpressionValidatorGuideEmail.ClientID%>").style.display = 'none';

                          document.getElementById("<%=RegularExpressionValidatorGuideContact.ClientID%>").style.display = 'none';

                      }

                      </script>
      

</ContentTemplate>

    </asp:UpdatePanel>

</asp:Content>

