<%@ Page Title="" Language="VB" MasterPageFile="~/User.master" AutoEventWireup="false" CodeFile="tour_book.aspx.vb" Inherits="tour_book" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
   
   
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference  Path="https://checkout.razorpay.com/v1/checkout.js"/>
        </Scripts>
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

              <ContentTemplate>
                     <section class="tour-page section-padding" data-scroll-index="1">
                          
                <div class="container">

                    <div class="row">
                        <div class="col-9" >
                          
                             <div class="right-sidebar item"  id="add" >
                                 <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                     <ItemTemplate>
                                                 <h2 style="width:50%;background-color:darkturquoise;padding:1%"> Booking From<br /> <%# Eval("name") %></h2>
                                     </ItemTemplate>
                                

                                 </asp:Repeater>

                                 <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT [name] FROM [tour_package] WHERE ([id] = @id)">
                                     <SelectParameters>
                                         <asp:SessionParameter SessionField="package_type" DefaultValue="0" Name="id" Type="Int32"></asp:SessionParameter>
                                     </SelectParameters>
                                 </asp:SqlDataSource>
                                 <br />
                                            <div class="row" id="row1">
                                               
                                                <!--Name-->
                                                <div class="col-md-12 form-group" >
                                                  
                                                    <label name="lb_name" runat="server">Full Name</label>

                                                    <asp:TextBox ID="txt_name" runat="server" placeholder="Enter your Name" BorderStyle="Groove" Width="50%" Height="15px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ErrorMessage="Please fill this field" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_name" ValidationGroup="info"></asp:RequiredFieldValidator>

                                                </div>
                                                 <!--Age-->
                                                 <div class="col-md-12 form-group" >
                                                
                                                   <label name="lb_age" runat="server">Enter your Age</label>
                                                     <asp:TextBox ID="txt_age" runat="server" placeholder="Enter Your Age" Width="50%" Height="15px" BorderStyle="Groove"></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorAge" runat="server" ErrorMessage="Please fill this field" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_age" ValidationGroup="info"></asp:RequiredFieldValidator>
                                                </div>

                                                <!--Popup-->
                                                 
                                                 <div class="card-body">
                                                     <div class="col-4 ">
                                                    <asp:LinkButton ID="btn_addmore"   runat="server" style="font-size:16px; padding:2%; color:blue;"> +Add other passenger detalies</asp:LinkButton>
                                                </div>

       
         <asp:Panel ID="pnlModal" runat="server" CssClass="modalPopup" Style="display: none; width: 700px;">
             
                             <div class="modal-dialog" role="document">
                            <div class="modal-content" style="background-color:whitesmoke;">
                                <div class="modal-header" >
                                    <h5 class="modal-title" id="exampleModalLabel" style="color:black;font-weight:bold;">Passenger Details</h5>
                                  
                                </div>

              <div class="modal-dialog" role="document">
                            
                                 <div class="modal-content">
                                <div>
                                    <br /><br />
                                    <!--Passenger Name-->

                                    <div  style="width:500px">
                                        <label for="Name">Passenger Name</label>
                                       
                                        <asp:TextBox ID="txt_pname" placeholder="Enter Passenger Name" BorderStyle="Groove"  Height="15px"  runat="server"></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPName" runat="server" ErrorMessage="Please fill this field" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_pname" ValidationGroup="pop"></asp:RequiredFieldValidator>

                                        <br />

                                        <!--Passgener Age -->
                                        <label for="Age">Passenger Age</label>

                                         <asp:TextBox ID="txt_page" placeholder="Enter Passenger Age" BorderStyle="Groove"  ValidationGroup="pop" Height="15px" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPAge" runat="server" ErrorMessage="Please fill this field" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_page" ValidationGroup="pop"></asp:RequiredFieldValidator>
                                    </div>
                                    <br /><br />
                                    
                                      <div class="modal-footer">

                                       
                         <asp:Button ID="submit" runat="server"  ValidationGroup="pop" Text="Save" CssClass="butn-dark" />
                                          
                                          &nbsp&nbsp&nbsp
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-warning" CausesValidation="false"  style="background-color:red;color:white"/>
                                          <br /><br />
                                          <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                                        </div>
                                    </div>
                                </div>
                  </div>
                                  <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                        PopupControlID="pnlModal" TargetControlID="btn_addmore" 
                        BackgroundCssClass="modalBackground">
                    </ajaxToolkit:ModalPopupExtender>
                                    
                                </div>
                                 </div>
             </asp:Panel>
                                                
                                               

                                                <!--Email-->
                                                <div class="col-md-12 form-group" style="margin-left:1%">
                                                  
                                                     <asp:Label ID="lb_email" runat="server" Text="Email Id" Font-Size="Medium"></asp:Label>
                                                  
                                                    <asp:TextBox ID="txt_email" runat="server" Width="49%" Height="15px" placeholder="Enter Your Email Id" BorderStyle="Groove"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Please fill this field" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_email" ValidationGroup="info"></asp:RequiredFieldValidator>
                                                </div>
                                                    
                                                <!--Contact-->
                                                <div class="col-md-12 form-group" style="margin-left:1%" >
                                                    <asp:Label ID="lb_contact" runat="server" Text="Contact Number" Font-Size="Medium"></asp:Label>
                                                 
                                                    <asp:TextBox ID="txt_contact"  runat="server"  BorderStyle="Groove" Width="49%" Height="15px" placeholder="Enter your Contact Number" MaxLength="10"></asp:TextBox>


                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorContact" runat="server" ErrorMessage="Please fill this field" ControlToValidate="txt_contact" ValidationGroup="info" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorContact" runat="server" ErrorMessage="Please enter only number" ForeColor="Red" ValidationExpression="^\d+$" Display="Dynamic" ControlToValidate="txt_contact" ValidationGroup="info"></asp:RegularExpressionValidator>

                                                </div>

                                                     <!--Date-->
                                                <div class="col-md-12 form-group"style="margin-left:1%">
                                                     <asp:Label ID="lb_date" runat="server" Text="Travel Date" Font-Size="Medium"></asp:Label>
                                                    <br />
                                                   
                                                    <asp:DropDownList ID="txt_date" Width="49%" Height="45px"  runat="server" DataSourceID="SqlDataSource3" DataTextField="s_date" DataValueField="s_date"></asp:DropDownList>

                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT FORMAT(s_date, 'MM/dd/yyyy') AS s_date FROM tour_package_dates WHERE package_id = @package_id">
                                                        <SelectParameters>
                                                            <asp:SessionParameter SessionField="package_type" DefaultValue="0" Name="package_id" Type="Int32"></asp:SessionParameter>
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                                <div class="col-md-12 form-group" style="margin-left:1%">
                                                    <asp:Label ID="lb_pnum" runat="server" Text="Total Number of People" Font-Size="Medium"></asp:Label>
                                                 
                                                      <asp:TextBox ID="txt_pnum" runat="server" Width="49%" Height="15px" BorderStyle="Groove"  placeholder="Enter Number of people"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPeopleNumber" runat="server" ErrorMessage="Please fill this field" ForeColor="Red" Display="Dynamic" ControlToValidate="txt_pnum" ValidationGroup="info"></asp:RequiredFieldValidator>
                                                </div>
                                              
                                            <div class="col-md-12 form-group" style="margin-left:1%">
                                                    
                                                 <asp:Label ID="lb_price" runat="server" Text="Total Price" Font-Size="Medium"></asp:Label>
                                                 
                                                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txt_price" runat="server" Width="49%" Height="15px" BorderStyle="Groove" Text='<%# Eval("price") %>' ReadOnly="True"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Tours and Travels %>' SelectCommand="SELECT [price] FROM [tour_package] WHERE ([id] = @id)">
                                                    <SelectParameters>
                                                        <asp:SessionParameter SessionField="package_type" DefaultValue="0" Name="id" Type="Int32"></asp:SessionParameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>
                                               
                                                <div class="col-md-12 butn-dark">
                                                    <br /><br />
                                                    <%--<button runat="server" id="btn_book" ><a href="#0"><span>Book Now</span></a></button>--%>
                                                    <asp:Button ID="btn_book" runat="server" ValidationGroup="info" Text="Book Now" />
                                                </div>
                                            
                                      </div>
                            </div>
                        </div>
                    </div>
                    </div> 
                    </div>
                         </section>
                  
       </ContentTemplate>
        </asp:UpdatePanel>
   
  
   
  <script>
function paymentSuccessful(response) {
    // Redirect to the success page
    window.location.href = "~/tour_book";
}
  </script>
        
  
</asp:Content>

