
Partial Class tour_detail
    Inherits System.Web.UI.Page

    Private Sub tour_detail_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Session("package_type") Then

            Label1.Text = Session("package_type")

        Else
            Label1.Text = Session("package_type2")
        End If

    End Sub

    Private Sub Repeater5_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles Repeater5.ItemCommand
        If e.CommandArgument <> "" Then
            Session("package_type") = e.CommandArgument

            Response.Redirect("tour_detail.aspx")
            End If
    End Sub

    Protected Sub btn_book_Click(sender As Object, e As EventArgs)

        If Session("client_username") <> "" Then
            Dim d As New Dao
            Dim ds As New Data.DataSet
            ds = d.get_data("select price from tour_package where id='" & Session("package_type") & "'")

            If ds.Tables(0).Rows.Count <> 0 Then
                Session("amount") = ds.Tables(0).Rows(0).Item("price")
            End If
            Response.Redirect("tour_book.aspx")
        Else
            Response.Redirect("~/login-form-20/Login.aspx")
        End If

    End Sub
End Class
