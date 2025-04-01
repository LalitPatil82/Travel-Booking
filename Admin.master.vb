Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class Admin
    Inherits System.Web.UI.MasterPage

    Protected Sub Logout_Click(sender As Object, e As EventArgs)
        Try
            Session.Abandon() 'Clear all session variables
            Response.Cache.SetCacheability(HttpCacheability.NoCache)
            Response.Cache.AppendCacheExtension("no-cache")
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1))
            Response.Cache.SetNoStore()
            Session.Clear()
            Session.RemoveAll()
            FormsAuthentication.SignOut() 'Sign the user out


            Response.Redirect("~/admin/login/login-form-20/login.aspx")

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub


    Private Sub Admin_Load(sender As Object, e As EventArgs) Handles Me.Load
        load_data()
        'If Session("authenticated") Is Nothing OrElse Not Session("authenticated") Then
        '    '' The user is not authenticated, so redirect them to the login page
        '    'Response.Redirect("~/admin/login/login-form-20/login.aspx")
        'Else
        '    load_data()
        'End If
    End Sub

    Public Sub load_data()
        Dim d As New Dao
        Dim ds As New Data.DataSet
        Dim iconUrl, iconfile As String
        ds = d.get_data("select comp_name,comp_logo from tour_about_us")

        If ds.Tables(0).Rows.Count <> 0 Then
            'it will refresh the title
            Label1.Text = ds.Tables(0).Rows(0).Item("comp_name")
            Page.Title = ds.Tables(0).Rows(0).Item("comp_name")


            'it will fetch the file name from the database
            iconfile = ds.Tables(0).Rows(0).Item("comp_logo")

            'it will set up the file path
            iconUrl = "img/about_us/" & iconfile

            'it will add a header file with the path of the image
            Page.Header.Controls.Add(New LiteralControl(String.Format("<link rel='icon' href='{0}' type='image/png' />", iconUrl)))
            'it will set the icone in the sidebar
            Image1.ImageUrl = iconUrl
        End If
        Label2.Text = "Hey," & Session("username")

    End Sub

End Class

