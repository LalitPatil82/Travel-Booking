Imports System.Data

Partial Class admin_login_login_form_20_Login
    Inherits System.Web.UI.Page

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click

        Dim view As DataView = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)

        If view.Count >= 1 Then
            ' Check if the "remember_me" checkbox is checked
            If remember_me.Checked Then
                ' Create a new cookie with the user's information
                Dim cookie As New HttpCookie("UserCookie")
                cookie.Values("username") = uname.Text
                cookie.Expires = DateTime.Now.AddDays(30) ' Set the cookie to expire in 30 days
                Response.Cookies.Add(cookie) ' Add the cookie to the response
            End If

            Session("username") = uname.Text
            Response.Redirect("~/admin/default.aspx")
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "swal('Incorrect Password!', 'The Password Did Not Match!', 'error');", True)
        End If

    End Sub

End Class
