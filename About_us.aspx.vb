Imports System.Data.SqlClient
Imports System.IO
Partial Class admin_About_Us
    Inherits System.Web.UI.Page

    Private Sub admin_About_Us_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim d As SqlConnection = New SqlConnection("Data Source=103.191.208.118;Persist Security Info=True;User ID=data_stu141;Password=Lovecoding@6750")

            d.Open()
            Dim cmd As SqlCommand = New SqlCommand("select * from tour_about_us", d)
            Dim obj As SqlDataReader = cmd.ExecuteReader()

            While obj.Read
                txt_comp.Text = obj.Item("comp_name")
                txt_address.Text = obj.Item("address")
                txt_phone.Text = obj.Item("ph_no")
                txt_email.Text = obj.Item("email")
                txt_insta.Text = obj.Item("insta_link")
                txt_facebook.Text = obj.Item("facebook_link")
                txt_youtube.Text = obj.Item("youtube_link")
                lblimg.Text = obj.Item("comp_logo")
                id.Value = obj.Item("id")
            End While
        End If
    End Sub
    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        Dim fname As String = lblimg.Text
        If FileUpload1.HasFile Then

            If System.IO.File.Exists(Server.MapPath("img/about_us/") & fname) Then
                System.IO.File.Delete(Server.MapPath("img/about_us/") & fname)
            End If

            fname = FileUpload1.FileName
            If fname.EndsWith("jpg") Or fname.EndsWith("png") Then
                FileUpload1.SaveAs(Server.MapPath("img/about_us/") & fname)
            End If
        End If
        SqlDataSource1.UpdateParameters("comp_name").DefaultValue = txt_comp.Text
            SqlDataSource1.UpdateParameters("address").DefaultValue = txt_address.Text
            SqlDataSource1.UpdateParameters("ph_no").DefaultValue = txt_phone.Text
            SqlDataSource1.UpdateParameters("email").DefaultValue = txt_email.Text
            SqlDataSource1.UpdateParameters("insta_link").DefaultValue = txt_insta.Text
            SqlDataSource1.UpdateParameters("youtube_link").DefaultValue = txt_youtube.Text
            SqlDataSource1.UpdateParameters("facebook_link").DefaultValue = txt_facebook.Text
            SqlDataSource1.UpdateParameters("comp_logo").DefaultValue = fname
            SqlDataSource1.UpdateParameters("id").DefaultValue = id.Value
            SqlDataSource1.Update()
        Response.Redirect(Request.RawUrl)

        txt_comp.Focus()
        id.Value = ""
        lblimg.Text = ""
    End Sub
End Class
