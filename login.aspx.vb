
Imports System.Data

Partial Class login
    Inherits System.Web.UI.Page

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click

        Dim view As DataView = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)

        If view.Count >= 1 Then
            Session("username") = uname.Text
            Response.Redirect("~/admin/default.aspx")
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "swal('Incorrect Password!', 'The Password Did Not Match!', 'error');", True)
        End If
    End Sub
End Class
