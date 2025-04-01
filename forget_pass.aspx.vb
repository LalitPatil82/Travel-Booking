Imports System.Data
Partial Class login2
    Inherits System.Web.UI.Page

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Dim view As DataView = CType(SqlDataSource2.Select(DataSourceSelectArguments.Empty), DataView)
        If view.Count >= 1 Then
            Dim otp As String
            Dim rand As Random = New Random()
            otp = (rand.Next(999999)).ToString()

            Session("otp") = otp
            Session("email") = txtEmail.Text
            Dim d As New DAO
            d.send_mail(txtEmail.Text, "The OTP for Resetting the password is " & otp & vbCrLf & "Please Do Not Share this OTP With Anyone.")
            Response.Redirect("otp.aspx")
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "swal('E-mail Nor Registered!', 'The Specified Email is not in the Records!', 'error');", True)
        End If
    End Sub
End Class
