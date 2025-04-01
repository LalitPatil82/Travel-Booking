
Partial Class admin_Tour_guide
    Inherits System.Web.UI.Page

    Public Sub popup()
        example1.DataBind()
        ' show success message using SweetAlert
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)

        Package_Name.SelectedIndex = 0
        txt_guidename.Value = ""
        txt_phno.Value = ""
        txt_email.Value = ""
        uid.Value = ""
    End Sub

    Private Sub admin_Tour_guide_Load(sender As Object, e As EventArgs) Handles Me.Load


        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
            ModalPopupExtender1.Show()
        End If
    End Sub

    Private Sub example1_PreRender(sender As Object, e As EventArgs) Handles example1.PreRender


        If example1.Rows.Count > 0 Then

            example1.UseAccessibleHeader = True
            example1.HeaderRow.TableSection = TableRowSection.TableHeader
        End If

    End Sub

    Private Sub example1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles example1.RowCommand

        If e.CommandName = "del" Then
            SqlDataSource2.DeleteParameters("id").DefaultValue = e.CommandArgument
            SqlDataSource2.Delete()
            example1.DataBind()
        End If

    End Sub

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click

        Try

            If Session("Flag") = 0 Then

                SqlDataSource2.InsertParameters("name").DefaultValue() = txt_guidename.Value
                SqlDataSource2.InsertParameters("email").DefaultValue() = txt_email.Value
                SqlDataSource2.InsertParameters("ph_no").DefaultValue() = txt_phno.Value
                SqlDataSource2.InsertParameters("pack_id").DefaultValue() = Package_Name.SelectedValue
                SqlDataSource2.Insert()
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)

                example1.DataBind()

                Package_Name.SelectedIndex = 0
                txt_phno.Value = ""
                txt_email.Value = ""
                txt_guidename.Value = ""
                uid.Value = ""
            Else
                SqlDataSource2.UpdateParameters("id").DefaultValue() = uid.Value
                SqlDataSource2.UpdateParameters("pack_id").DefaultValue() = Package_Name.SelectedValue
                SqlDataSource2.UpdateParameters("name").DefaultValue() = txt_guidename.Value
                SqlDataSource2.UpdateParameters("email").DefaultValue() = txt_email.Value
                SqlDataSource2.UpdateParameters("ph_no").DefaultValue() = txt_phno.Value

                SqlDataSource1.Update()
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)

                example1.DataBind()

                Package_Name.SelectedIndex = 0
                txt_guidename.Value = ""
                txt_phno.Value = ""
                txt_email.Value = ""
                uid.Value = ""

                Session("Flag") = 0


            End If
        Catch ex As Exception

            MsgBox(ex.Message)
        End Try
    End Sub
    Protected Sub Edit1_Click(sender As Object, e As ImageClickEventArgs)

        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        Package_Name.SelectedValue = Convert.ToInt32(example1.DataKeys(index).Values("pack_id"))
        txt_guidename.Value = example1.Rows(index).Cells(3).Text
        txt_email.Value = example1.Rows(index).Cells(4).Text
        txt_phno.Value = example1.Rows(index).Cells(5).Text
        uid.Value = Convert.ToInt32(example1.DataKeys(index).Values("id"))
        Session("Flag") = 1
        ' Trigger the ModalPopupExtender1
        ModalPopupExtender1.Show()
    End Sub

    Public Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click

        txt_guidename.Value = ""
        txt_email.Value = ""
        txt_phno.Value = ""
    End Sub

    Private Sub btnShowPopup_Click(sender As Object, e As EventArgs) Handles btnShowPopup.Click

        txt_guidename.Value = ""
        txt_email.Value = ""
        txt_phno.Value = ""
    End Sub
End Class
