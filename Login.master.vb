
Partial Class admin_login_login_form_20_Login
    Inherits System.Web.UI.MasterPage

    Private Sub admin_login_login_form_20_Login_Load(sender As Object, e As EventArgs) Handles Me.Load
        load_data()
    End Sub

    Public Sub load_data()
        Dim d As New Dao
        Dim ds As New Data.DataSet
        Dim iconUrl, iconUrl1, iconfile As String
        ds = d.get_data("select comp_name,comp_logo from tour_about_us")

        If ds.Tables(0).Rows.Count <> 0 Then
            'it will refresh the title
            Label1.Text = ds.Tables(0).Rows(0).Item("comp_name")
            Page.Title = ds.Tables(0).Rows(0).Item("comp_name")

            'it will fetch the file name from the database
            iconfile = ds.Tables(0).Rows(0).Item("comp_logo")

            'it will set up the file path
            iconUrl = "../../img/about_us/" & iconfile
            iconUrl1 = "../admin/img/about_us/" & iconfile

            'it will add a header file with the path of the image
            Page.Header.Controls.Add(New LiteralControl(String.Format("<link rel='icon' href='{0}' type='image/png' />", iconUrl)))

            Page.Header.Controls.Add(New LiteralControl(String.Format("<link rel='icon' href='{0}' type='image/png' />", iconUrl1)))
        End If

    End Sub
End Class

