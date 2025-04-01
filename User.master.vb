Imports System.Net.Http
Imports Newtonsoft.Json
Partial Class User
    Inherits System.Web.UI.MasterPage

    Public Property num As String
    Public Property message As String = "Hey,I want to Know more about your packages!"

    Private Sub User_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim d As New Dao
        Dim ds As New Data.DataSet
        Dim iconUrl, iconfile As String
        ds = d.get_data("select comp_name,comp_logo,ph_no from tour_about_us")

        If ds.Tables(0).Rows.Count <> 0 Then
            'it will refresh the title
            Page.Title = ds.Tables(0).Rows(0).Item("comp_name")

            'it will fetch the file name from the database
            iconfile = ds.Tables(0).Rows(0).Item("comp_logo")

            'it will add phone Number
            num = "91" + ds.Tables(0).Rows(0).Item("ph_no")

            'it will set up the file path
            iconUrl = "admin/img/about_us/" & iconfile

            'it will add a header file with the path of the image
            Page.Header.Controls.Add(New LiteralControl(String.Format("<link rel='icon' href='{0}' type='image/png' />", iconUrl)))

            Label2.Text = "Hey " & Session("client_username")
        End If
    End Sub

    Private Sub whatsapp_button_Click(sender As Object, e As ImageClickEventArgs) Handles whatsapp_button.Click
        Response.Redirect("https://wa.me/" + num + "?text=" + message)
    End Sub






End Class

