
Partial Class admin_User_Master
    Inherits System.Web.UI.Page

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles example1.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Private Sub example1_PreRender(sender As Object, e As EventArgs) Handles example1.PreRender
        Try
            example1.UseAccessibleHeader = True
            example1.HeaderRow.TableSection = TableRowSection.TableHeader
        Catch ex As Exception

        End Try
    End Sub

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click

        Try
            If Session("Flag") = 0 Then
                SqlDataSource1.InsertParameters("uname").DefaultValue() = txt_user.Value
                SqlDataSource1.InsertParameters("upass").DefaultValue() = txt_pass.Value
                SqlDataSource1.InsertParameters("email").DefaultValue() = txtemail.Value
                SqlDataSource1.InsertParameters("utype").DefaultValue() = txt_utype.SelectedValue
                SqlDataSource1.Insert()
                popup()
            Else
                SqlDataSource1.UpdateParameters("uname").DefaultValue() = txt_user.Value
                SqlDataSource1.UpdateParameters("upass").DefaultValue() = txt_pass.Value
                SqlDataSource1.UpdateParameters("email").DefaultValue() = txtemail.Value
                SqlDataSource1.UpdateParameters("utype").DefaultValue() = txt_utype.SelectedValue
                SqlDataSource1.UpdateParameters("id").DefaultValue() = uid.Value
                SqlDataSource1.Update()
                popup()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub User_master_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
    End Sub

    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        txt_user.Value = example1.Rows(index).Cells(1).Text
        txt_pass.Value = example1.DataKeys(index).Values("upass")
        txtemail.Value = example1.Rows(index).Cells(3).Text
        txt_utype.SelectedValue = example1.Rows(index).Cells(4).Text
        uid.Value = Convert.ToInt32(example1.DataKeys(index).Values("id"))
        Session("Flag") = 1
        ModalPopupExtender1.Show()
        txt_user.Focus()
    End Sub

    Protected Sub example1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles example1.RowCommand
        If e.CommandName = "del" Then
            SqlDataSource1.DeleteParameters("id").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            example1.DataBind()
        End If
    End Sub
    Public Sub popup()
        example1.DataBind()
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)
        txt_user.Value = ""
        txt_pass.Value = ""
        txtemail.Value = ""
        uid.Value = ""
        txt_utype.SelectedValue = "Admin"
    End Sub
End Class