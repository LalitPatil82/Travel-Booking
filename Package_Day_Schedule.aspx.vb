
Partial Class admin_Package_Schedule
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
        txtSRNo.Text = ""
        txtSummary.Text = ""
        uid.Value = ""
    End Sub

    Protected Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click
        If Session("Flag") = 0 Then
            Dim valueExists As Boolean = False
            Dim value1 As String = ddlPackageName.SelectedItem.Text
            Dim value2 As String = txtSRNo.Text

            For Each row As GridViewRow In example1.Rows
                'the below condition will check that the sr_no and package name are already inserted or not
                If row.Cells(3).Text = value1 And row.Cells(4).Text = value2 Then ' check if both values exist in the same row
                    valueExists = True
                    Exit For
                End If
            Next

            If Not valueExists Then
                SqlDataSource1.InsertParameters("sr_no").DefaultValue() = txtSRNo.Text
                SqlDataSource1.InsertParameters("desc").DefaultValue() = txtSummary.Text
                SqlDataSource1.InsertParameters("package_id").DefaultValue() = ddlPackageName.SelectedValue
                SqlDataSource1.Insert()
                popup()
            Else
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "error();", True)
            End If
        Else
            SqlDataSource1.UpdateParameters("sr_no").DefaultValue() = txtSRNo.Text
            SqlDataSource1.UpdateParameters("desc").DefaultValue() = txtSummary.Text
            SqlDataSource1.UpdateParameters("package_id").DefaultValue() = ddlPackageName.SelectedValue
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
            txtSRNo.ReadOnly = False
        End If
    End Sub

    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        ''here we are passing package id also,so that we can use it to store the value,while the name is visible
        ddlPackageName.SelectedValue = Convert.ToInt32(example1.DataKeys(index).Values("package_id"))
        'it will allow us to avoid updating record with duplicate values,but making it readonly
        txtSRNo.ReadOnly = True
        txtSRNo.Text = example1.Rows(index).Cells(4).Text
        txtSummary.Text = example1.Rows(index).Cells(5).Text
        uid.Value = DirectCast(sender, ImageButton).CommandArgument
        Session("Flag") = 1
        ' Trigger the ModalPopupExtender1
        ModalPopupExtender1.Show()
    End Sub
    Private Sub example1_PreRender(sender As Object, e As EventArgs) Handles example1.PreRender
        Try
            example1.UseAccessibleHeader = True
            example1.HeaderRow.TableSection = TableRowSection.TableHeader
        Catch ex As Exception

        End Try

    End Sub
End Class
