
Partial Class _Default
    Inherits System.Web.UI.Page

    Private Sub Repeater2_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles Repeater2.ItemCommand
        If e.CommandArgument <> "" Then
            Session("package_type") = e.CommandArgument
            Dim d As New Dao
            Dim ds As New Data.DataSet
            ds = d.get_data("select package_type from tour_package where id='" & e.CommandArgument & "'")

            If ds.Tables(0).Rows.Count <> 0 Then
                Session("p_type") = ds.Tables(0).Rows(0).Item("package_type")
            End If

            Response.Redirect("tour_detail.aspx")
        End If
    End Sub

    Private Sub View_more_Click(sender As Object, e As EventArgs) Handles View_more.Click

        Response.Redirect("tour_allpack.aspx")
    End Sub
End Class
