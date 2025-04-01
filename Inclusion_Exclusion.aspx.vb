Imports System.Data.SqlClient

Partial Class Inclusion_Exclusion
    Inherits System.Web.UI.Page

    Private Sub Inclusion_Exclusion_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)

        End If
    End Sub

    Private Sub example1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles example1.RowDataBound

        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
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
            SqlDataSource1.DeleteParameters("id").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            example1.DataBind()
        End If
    End Sub

    Public Sub insert()
        SqlDataSource1.InsertParameters("pack_id").DefaultValue() = Pack_name.SelectedValue
        SqlDataSource1.InsertParameters("description").DefaultValue() = txt_placedesc.Value
        SqlDataSource1.Insert()
        popup()
    End Sub

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click

        Try
            If Session("Flag") = 0 Then
                If rb_in.Checked Or rb_ex.Checked Then
                    If rb_in.Checked Then
                        SqlDataSource1.InsertParameters("type").DefaultValue() = rb_in.Text
                        insert()
                    ElseIf rb_ex.Checked Then
                        SqlDataSource1.InsertParameters("type").DefaultValue() = rb_ex.Text
                        insert
                    End If
                End If
            Else
                If rb_in.Checked Then
                    SqlDataSource1.UpdateParameters("type").DefaultValue() = rb_in.Text
                    update()
                ElseIf rb_ex.Checked Then
                    SqlDataSource1.UpdateParameters("type").DefaultValue() = rb_ex.Text
                    update()
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

    Public Sub update()
        SqlDataSource1.UpdateParameters("id").DefaultValue() = uid.Value
        SqlDataSource1.UpdateParameters("pack_id").DefaultValue() = Pack_name.SelectedValue
        SqlDataSource1.UpdateParameters("description").DefaultValue() = txt_placedesc.Value
        SqlDataSource1.Update()
        popup()
    End Sub

    Protected Sub Edit1_Click(sender As Object, e As EventArgs)

        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        ''here we are passing package id also,so that we can use it to store the value,while the name is visible
        If example1.DataKeys(index).Values("type") = "Inclusion" Then

            Pack_name.SelectedValue = Convert.ToInt32(example1.DataKeys(index).Values("pack_id"))
            rb_in.Checked = True
            txt_placedesc.Value = example1.Rows(index).Cells(5).Text
            uid.Value = Convert.ToInt32(example1.DataKeys(index).Values("id"))

            'submit.Text = "Save"
            Session("Flag") = 1
            ModalPopupExtender1.Show()

        ElseIf example1.DataKeys(index).Values("type") = "Exclusion" Then

            Pack_name.SelectedValue = Convert.ToInt32(example1.DataKeys(index).Values("pack_id"))
            rb_ex.Checked = True
            txt_placedesc.Value = example1.Rows(index).Cells(5).Text
            uid.Value = Convert.ToInt32(example1.DataKeys(index).Values("id"))
            'submit.Text = "Save"
            Session("Flag") = 1
            ModalPopupExtender1.Show()
        End If
    End Sub

    Public Sub popup()
        example1.DataBind()
        ' show success message using SweetAlert
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)
        'it will clear the values
        Pack_name.SelectedIndex = 0
        rb_in.Checked = False
        rb_ex.Checked = False
        txt_placedesc.Value = ""
        uid.Value = ""
    End Sub


    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click

        Pack_name.SelectedIndex = 0
        rb_in.Checked = False
        rb_ex.Checked = False
        txt_placedesc.Value = ""
        uid.Value = ""

    End Sub

    Protected Sub btnShowPopup_Click(sender As Object, e As EventArgs) Handles btnShowPopup.Click

        Pack_name.SelectedIndex = 0
        rb_in.Checked = False
        rb_ex.Checked = False
        uid.Value = ""
        txt_placedesc.Value = ""

    End Sub
End Class
