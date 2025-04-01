
Imports Razorpay.Api
Imports System.Collections.Generic
Imports Newtonsoft.Json
Imports Newtonsoft.Json.Linq
Imports System.Net
Imports System.IO

Partial Class tour_book
    Inherits System.Web.UI.Page

    Public people_num As Integer = 0
    Public amount1 As Integer = 0
    Dim formName As String

    Private Sub btn_addmore_Click(sender As Object, e As EventArgs) Handles btn_addmore.Click

        ModalPopupExtender1.Show()
    End Sub

    Private Sub tour_book_Load(sender As Object, e As EventArgs) Handles Me.Load

        'If Session("payId") <> "" Then

        '    If txt_name.Text <> "" Then

        '        If txt_age.Text <> "" Then

        '            If txt_contact.Text <> "" Then

        '                If txt_pnum.Text <> "" Then

        '                    Try

        '                        Dim d As New Dao

        '                        d.modifyData("insert into tour_booking(pack_id,name,age,email,contact,travel_date,people_count) values('" & Session("package_type") & "','" & txt_name.Text & "','" & txt_age.Text & "','" & txt_email.Text & "','" & txt_contact.Text & "','" & txt_date.SelectedValue & "','" & txt_pnum.Text & "')")

        '                        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)


        '                    Catch ex As Exception

        '                    End Try

        '                End If
        '            End If
        '        End If
        '    End If

        'End If
        If Session("done") <> "true" Then
            Session("done") = "false"
            If Request.HttpMethod = "POST" Then

                If IsPostBack Then
                    Response.Redirect("http://localhost:63873/tour_book.aspx")

                End If

                If Not IsPostBack Then
                    Dim json As String = New StreamReader(Request.InputStream).ReadToEnd()
                    ' Process the JSON data as needed
                    Try

                        Dim d As New Dao

                        d.modifyData("insert into tour_booking(pack_id,name,age,email,contact,travel_date,people_count) values('" & Session("package_type") & "','" & Session("formName") & "','" & txt_age.Text & "','" & txt_email.Text & "','" & txt_contact.Text & "','" & txt_date.SelectedValue & "','" & txt_pnum.Text & "')")

                        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)


                    Catch ex As Exception

                    End Try
                End If
            End If
        End If
    End Sub

    Public Sub test()
        MsgBox("")
    End Sub


    Public Sub btn_book_Click(sender As Object, e As EventArgs) Handles btn_book.Click


        Try
            Session("pnum") = txt_pnum.Text

            Dim name As String = txt_name.Text

            people_num = Session("pnum")
            amount1 = Session("amount")
            Session("done") = "true"
            Session("formName") = txt_name.Text
            Try
                ServicePointManager.Expect100Continue = True
                ' ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls Or SecurityProtocolType.Ssl3
                ServicePointManager.SecurityProtocol = CType(3072, SecurityProtocolType)
                Dim key As String = "rzp_test_igWcu0vvCwZk1f"
                Dim amount As Integer = ((amount1 * 100) * people_num) ' The amount in paisa, so 100 represents 1 INR
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
                Dim razorpayCallbackUrl As String = "http://localhost:63873/tour_book.aspx"

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
                razorpayOptions.Add("callback_url", razorpayCallbackUrl)
                razorpayOptions.Add("order_id", razorpayOrderId)
                razorpayOptions.Add("handler", "paymentSuccessful")

                razorpayOptions.Add("callback_method", "POST")

                razorpayOptions.Add("prefill", New Dictionary(Of String, Object) From {{"name", "Customer Name"}, {"email", "customer@email.com"}, {"contact", "9999999999"}})
                razorpayOptions.Add("notes", razorpayNotes)
                razorpayOptions.Add("theme", New Dictionary(Of String, Object) From {{"color", razorpayThemeColor}})
                Dim razorpayScript As String = "var rzp1 = new Razorpay(" & JsonConvert.SerializeObject(razorpayOptions) & ");  rzp1.open();"
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "razorpay-script", razorpayScript, True)




            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        Catch ex As Exception

        End Try



    End Sub

    Public Function paymentSuccessful() As Object
        Try
            ' Retrieve the payment details


            ' Insert the data into the database
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "payment-successful-script", "paymentSuccessful();", True)

            Dim d As New Dao

            d.modifyData("insert into tour_booking(pack_id,name,age,email,contact,travel_date,people_count) values('" & Session("package_type") & "','" & txt_name.Text & "','" & txt_age.Text & "','" & txt_email.Text & "','" & txt_contact.Text & "','" & txt_date.SelectedValue & "','" & txt_pnum.Text & "')")


            Return "success();"
        Catch ex As Exception

        End Try

        Return "error();"
    End Function






End Class


