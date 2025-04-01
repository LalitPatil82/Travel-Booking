
Partial Class tour_allpack
    Inherits System.Web.UI.Page

    Private Sub Repeater1_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles Repeater1.ItemCommand

        If e.CommandArgument <> "" Then

            Session("package_type2") = e.CommandArgument
            Response.Redirect("tour_detail.aspx")
        End If
    End Sub
End Class
