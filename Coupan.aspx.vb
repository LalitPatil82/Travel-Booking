
Partial Class admin_Coupan
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
        txtDiscountCode.Text = ""
        txtDiscountPercentage.Text = ""
        txtName.Text = ""
        txtstart_date.Text = Date.Today
        txtend_date.Text = Date.Today
        uid.Value = ""
    End Sub

    Protected Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click

        If Session("Flag") = 0 Then
            SqlDataSource1.InsertParameters("name").DefaultValue() = txtName.Text
            SqlDataSource1.InsertParameters("discount").DefaultValue() = txtDiscountPercentage.Text
            SqlDataSource1.InsertParameters("code").DefaultValue() = txtDiscountCode.Text
            SqlDataSource1.InsertParameters("s_date").DefaultValue() = txtstart_date.Text
            SqlDataSource1.InsertParameters("e_Date").DefaultValue() = txtend_date.Text
            SqlDataSource1.Insert()
            popup()
        Else
            SqlDataSource1.UpdateParameters("name").DefaultValue() = txtName.Text
            SqlDataSource1.UpdateParameters("discount").DefaultValue() = txtDiscountPercentage.Text
            SqlDataSource1.UpdateParameters("code").DefaultValue() = txtDiscountCode.Text
            SqlDataSource1.UpdateParameters("s_date").DefaultValue() = txtstart_date.Text
            SqlDataSource1.UpdateParameters("e_Date").DefaultValue() = txtend_date.Text
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
        Try
            If Not Page.IsPostBack Then
                Session.Add("Flag", 0)
            End If
        Catch ex As Exception

        End Try

        ' txtstart_date.Attributes("min") = DateTime.Now.ToString("yyyy-MM-dd")
        '  txtend_date.Attributes("min") = DateTime.Now.ToString("yyyy-MM-dd")
    End Sub

    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        txtName.Text = example1.Rows(index).Cells(2).Text
        txtDiscountCode.Text = example1.Rows(index).Cells(3).Text
        txtDiscountPercentage.Text = example1.Rows(index).Cells(4).Text
        txtstart_date.Text = example1.Rows(index).Cells(5).Text
        txtend_date.Text = example1.Rows(index).Cells(7).Text
        uid.Value = DirectCast(sender, Button).CommandArgument
        Session("Flag") = 1
        ' Trigger the ModalPopupExtender1
        ModalPopupExtender1.Show()
    End Sub
    Private Sub example1_PreRender(sender As Object, e As EventArgs) Handles example1.PreRender

        Try
            If example1.Rows.Count > 0 Then
                example1.UseAccessibleHeader = True
                example1.HeaderRow.TableSection = TableRowSection.TableHeader
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DeleteTimer_Tick(ByVal sender As Object, ByVal e As EventArgs)
        For Each row As GridViewRow In example1.Rows
            Try
                Dim index As Integer = row.RowIndex
                If Date.Now > Convert.ToDateTime(example1.Rows(index).Cells(7).Text) Then
                    Dim id As Integer = Convert.ToInt32(example1.DataKeys(index).Value)
                    SqlDataSource1.DeleteParameters("id").DefaultValue = id.ToString()
                    SqlDataSource1.Delete()
                    example1.DataBind()
                End If
            Catch ex As Exception
                ' Handle any errors that occur during deletion
                Response.Write("Error deleting record: " & ex.Message)
            End Try
        Next
    End Sub


End Class
