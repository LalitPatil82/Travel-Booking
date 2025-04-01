Partial Class admin_faqs
    Inherits System.Web.UI.Page

    Protected Sub example1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles example1.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Public Sub popup()
        example1.DataBind()
        ' show success message using SweetAlert
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)
        'it will clear the values
        ddlPackageName.SelectedIndex = 0
        question.Text = ""
        answer.InnerText = ""
        uid.Value = ""
    End Sub

    Protected Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click

        If Session("Flag") = 0 Then
                SqlDataSource1.InsertParameters("question").DefaultValue() = question.Text
                SqlDataSource1.InsertParameters("answer").DefaultValue() = answer.Value
                SqlDataSource1.InsertParameters("package_id").DefaultValue() = ddlPackageName.SelectedValue
                SqlDataSource1.Insert()
                popup()
            Else
                SqlDataSource1.UpdateParameters("package_id").DefaultValue() = ddlPackageName.SelectedValue
                SqlDataSource1.UpdateParameters("question").DefaultValue() = question.Text
                SqlDataSource1.UpdateParameters("answer").DefaultValue() = answer.Value
                SqlDataSource1.UpdateParameters("id").DefaultValue() = uid.Value
                SqlDataSource1.Update()
                popup()
            End If

    End Sub


    Protected Sub example1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles example1.RowCommand
        If e.CommandName = "del" Then
            SqlDataSource1.DeleteParameters("id").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            example1.DataBind()
        End If
    End Sub

    Private Sub admin_faqs_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
    End Sub

    Private Sub example1_PreRender(sender As Object, e As EventArgs) Handles example1.PreRender
        Try
            example1.UseAccessibleHeader = True
            example1.HeaderRow.TableSection = TableRowSection.TableHeader
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        'here we are passing package id also,so that we can use it to store the value,while the name is visible
        ddlPackageName.SelectedValue = Convert.ToInt32(example1.DataKeys(index).Values("package_id"))
        question.Text = example1.Rows(index).Cells(4).Text
        answer.Value = example1.Rows(index).Cells(5).Text
        uid.Value = Convert.ToInt32(example1.DataKeys(index).Values("id"))
        Session("Flag") = 1
        ' Trigger the ModalPopupExtender1
        ModalPopupExtender1.Show()
    End Sub
End Class