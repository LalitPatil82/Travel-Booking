Imports System.Data
Partial Class admin_login_login_form_20_Change_Password
    Inherits System.Web.UI.Page

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        If txtpass.Text = txtconformpass.Text Then
            Dim d As New Dao
            Dim obj As DataSet
            obj = d.get_data("update tour_login_mst set upass='" & txtpass.Text & "' where email='" & Session("email") & "'")

            Response.Redirect("login.aspx")
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "swal('Password Did not Match!', 'The Both Password Are Not Same!', 'error');", True)
        End If
    End Sub

    Private Sub login3_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "swal('Correct OTP!', 'The OTP you Entered is Correct!', 'success');", True)
        End If
    End Sub

End Class
