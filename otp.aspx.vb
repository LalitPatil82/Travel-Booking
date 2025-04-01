
Partial Class admin_login_login_form_20_otp
    Inherits System.Web.UI.Page
    Private Sub otp_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "swal('OTP Sent!', 'The OTP Has been Sent to the Specified E-mail!', 'success');", True)
        End If
    End Sub

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        If txtotp.Text = Session("otp") Then
            Response.Redirect("Change_Password.aspx")
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "swal('Wrong OTP!', 'The OTP is Not Correct!', 'error');", True)
        End If
    End Sub
End Class
