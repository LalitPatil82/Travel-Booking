Imports Razorpay.Api
Imports Newtonsoft.Json
Imports System.Net

Partial Class Payement_Demo
    Inherits System.Web.UI.Page

    Public people_num As Integer = 0
    Public amount As Integer = 0
    Protected Sub PayButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles PayButton.Click
        'Try
        '    ServicePointManager.Expect100Continue = True
        '    ' ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls Or SecurityProtocolType.Ssl3
        '    ServicePointManager.SecurityProtocol = CType(3072, SecurityProtocolType)
        '    Dim key As String = "rzp_test_igWcu0vvCwZk1f"
        '    Dim amount As Integer = (Val(AmountInput.Text) * people_num) * 100 ' The amount in paisa, so 100 represents 1 INR
        '    Dim currency As String = "INR"
        '    Dim options As New Dictionary(Of String, Object)
        '    options.Add("amount", amount)
        '    options.Add("currency", currency)
        '    options.Add("receipt", "receipt_order_123")
        '    options.Add("payment_capture", 1)
        '    Dim client As New RazorpayClient(key, "GvXBzPZLevOVxMX4H80wGp3w")
        '    Dim order = client.Order.Create(options)
        '    Dim orderId As String = order("id")
        '    Dim razorpayOrderId As String = order("id")
        '    Dim razorpayKeyId As String = key
        '    Dim razorpayAmount As Integer = amount
        '    Dim razorpayCurrency As String = currency
        '    Dim razorpayName As String = "Tours & Travels"
        '    Dim razorpayDescription As String = "Product description"
        '    '  Dim razorpayImage As String = ""
        '    '  Dim razorpayCallbackUrl As String = "http://localhost:8080/your-callback-url"
        '    Dim razorpayNotes As New Dictionary(Of String, Object)
        '    razorpayNotes.Add("address", "Customer Address")
        '    Dim razorpayThemeColor As String = "blue"
        '    Dim razorpayOptions As New Dictionary(Of String, Object)
        '    razorpayOptions.Add("key", razorpayKeyId)
        '    razorpayOptions.Add("amount", razorpayAmount)
        '    razorpayOptions.Add("currency", razorpayCurrency)
        '    razorpayOptions.Add("name", razorpayName)
        '    razorpayOptions.Add("description", razorpayDescription)
        '    '  razorpayOptions.Add("image", razorpayImage)
        '    razorpayOptions.Add("order_id", razorpayOrderId)
        '    razorpayOptions.Add("handler", "onPaymentSuccess")
        '    razorpayOptions.Add("prefill", New Dictionary(Of String, Object) From {{"name", "Customer Name"}, {"email", "customer@email.com"}, {"contact", "9999999999"}})
        '    razorpayOptions.Add("notes", razorpayNotes)
        '    razorpayOptions.Add("theme", New Dictionary(Of String, Object) From {{"color", razorpayThemeColor}})
        '    Dim razorpayScript As String = "var rzp1 = new Razorpay(" & JsonConvert.SerializeObject(razorpayOptions) & "); rzp1.open();"
        '    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "razorpay-script", razorpayScript, True)
        'Catch ex As Exception
        '    MsgBox(ex.Message)
        'End Try
    End Sub

    Private Sub Payement_demo_Load(sender As Object, e As EventArgs) Handles Me.Load

        people_num = Session("pnum")
        amount = Session("amount")

        Try
            ServicePointManager.Expect100Continue = True
            ' ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls Or SecurityProtocolType.Ssl3
            ServicePointManager.SecurityProtocol = CType(3072, SecurityProtocolType)
            Dim key As String = "rzp_test_igWcu0vvCwZk1f"
            Dim amount As Integer = ((amount * 100) * people_num) ' The amount in paisa, so 100 represents 1 INR
            Dim currency As String = "INR"
            Dim options As New Dictionary(Of String, Object)
            options.Add("amount", amount)
            options.Add("currency", currency)
            options.Add("receipt", "receipt_order_123")
            options.Add("payment_capture", 1)
            Dim client As New RazorpayClient(key, "GvXBzPZLevOVxMX4H80wGp3w")
            Dim order = client.Order.Create(options)
            Dim orderId As String = order("id")
            Dim razorpayOrderId As String = order("id")
            Dim razorpayKeyId As String = key
            Dim razorpayAmount As Integer = amount
            Dim razorpayCurrency As String = currency
            Dim razorpayName As String = "Tours & Travels"
            Dim razorpayDescription As String = "Product description"
            '  Dim razorpayImage As String = ""
            '  Dim razorpayCallbackUrl As String = "http://localhost:8080/your-callback-url"
            Dim razorpayNotes As New Dictionary(Of String, Object)
            razorpayNotes.Add("address", "Customer Address")
            Dim razorpayThemeColor As String = "blue"
            Dim razorpayOptions As New Dictionary(Of String, Object)
            razorpayOptions.Add("key", razorpayKeyId)
            razorpayOptions.Add("amount", razorpayAmount)
            razorpayOptions.Add("currency", razorpayCurrency)
            razorpayOptions.Add("name", razorpayName)
            razorpayOptions.Add("description", razorpayDescription)
            '  razorpayOptions.Add("image", razorpayImage)
            razorpayOptions.Add("order_id", razorpayOrderId)
            razorpayOptions.Add("handler", "onPaymentSuccess")
            razorpayOptions.Add("prefill", New Dictionary(Of String, Object) From {{"name", "Customer Name"}, {"email", "customer@email.com"}, {"contact", "9999999999"}})
            razorpayOptions.Add("notes", razorpayNotes)
            razorpayOptions.Add("theme", New Dictionary(Of String, Object) From {{"color", razorpayThemeColor}})
            Dim razorpayScript As String = "var rzp1 = new Razorpay(" & JsonConvert.SerializeObject(razorpayOptions) & "); rzp1.open();"
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "razorpay-script", razorpayScript, True)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class