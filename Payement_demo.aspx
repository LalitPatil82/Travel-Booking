<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Payement_demo.aspx.vb" Inherits="Payement_demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Razorpay Payment Gateway</title>
      <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <%-- <h2>Razorpay Payment Gateway</h2>
            <br />
            <label>Amount:</label>
            <asp:TextBox ID="AmountInput" runat="server"></asp:TextBox>
            <br />--%>
            <asp:Button ID="PayButton" runat="server" Text="Pay"  />
        </div>
    </form>
</body>
</html>