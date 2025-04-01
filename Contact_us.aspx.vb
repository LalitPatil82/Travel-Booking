
Partial Class Contact_us
    Inherits System.Web.UI.Page



    Private Sub Contact_us_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim d As New Dao
            Dim ds As New Data.DataSet
            ds = d.get_data("select comp_name,ph_no,email,address from tour_about_us")

            If ds.Tables(0).Rows.Count <> 0 Then
                'it will refresh the title
                Label1.Text = ds.Tables(0).Rows(0).Item("comp_name")
                Label2.Text = ds.Tables(0).Rows(0).Item("ph_no")
                Label3.Text = ds.Tables(0).Rows(0).Item("email")
                Label4.Text = ds.Tables(0).Rows(0).Item("address")
            End If
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        SqlDataSource1.InsertParameters("name").DefaultValue() = name.Value
        SqlDataSource1.InsertParameters("email").DefaultValue() = email.Value
        SqlDataSource1.InsertParameters("purpose").DefaultValue() = subject.Value
        SqlDataSource1.InsertParameters("message").DefaultValue() = message.Value
        SqlDataSource1.InsertParameters("ph_no").DefaultValue() = phone.Value
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "swal('Message Received!', 'We will contact You as soon as possible!', 'success');", True)
        SqlDataSource1.Insert()

        'clearing the vlaues
        name.Value = ""
        email.value = ""
        subject.Value = ""
        message.Value = ""
        phone.Value = ""
    End Sub
End Class
