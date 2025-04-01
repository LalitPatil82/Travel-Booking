Imports System.Data
Partial Class Create_Pack
    Inherits System.Web.UI.Page
    Protected Sub example1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles example1.RowDataBound, pck_type_grid.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Public Sub popup()
        example1.DataBind()
        ' show success message using SweetAlert
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)

        lblimage.Text = ""
        uid.Value = ""
        txtPackageName.Text = ""
        txtPackagePrice.Text = ""
        ddlPackageType.SelectedIndex = 0
        txtPackageDuration.Text = ""
        txtPackageSummary.Text = ""
        txtNumberOfPeople.Text = ""
        mode_tsp.SelectedIndex = 0
    End Sub
    Protected Sub submit_Click(sender As Object, e As EventArgs) Handles add_pck_type.Click

        Dim valueExists As Boolean = False
        Dim value As String = pck_type.Text

        For Each row As GridViewRow In pck_type_grid.Rows
            If row.Cells(2).Text = value Then 'here row cell is in the second coloum
                valueExists = True
                Exit For
            End If
        Next

        If Not valueExists Then
            pck_type_ds.InsertParameters("package_type").DefaultValue() = pck_type.Text
            pck_type_ds.Insert()
            pck_type_ds.DataBind()
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)
        Else
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "error();", True)
        End If
        pck_type.Text = ""
    End Sub

    Protected Sub example1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles example1.RowCommand, pck_type_grid.RowCommand
        If e.CommandName = "del" Then
            'it will delete the travel package
            SqlDataSource1.DeleteParameters("id").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            example1.DataBind()
        ElseIf e.CommandName = "del_pck_type" Then
            pck_type_ds.DeleteParameters("id").DefaultValue = e.CommandArgument
            pck_type_ds.Delete()
            pck_type_ds.DataBind()
            ModalPopupExtender1.Show()

        End If
    End Sub

    Private Sub admin_faqs_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
    End Sub

    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        txtPackageName.Text = example1.Rows(index).Cells(2).Text
        txtPackagePrice.Text = example1.Rows(index).Cells(3).Text
        ddlPackageType.SelectedItem.Text = example1.Rows(index).Cells(4).Text
        txtPackageDuration.Text = example1.Rows(index).Cells(5).Text
        txtPackageSummary.Text = example1.Rows(index).Cells(6).Text
        txtNumberOfPeople.Text = example1.Rows(index).Cells(7).Text
        lblimage.Text = example1.DataKeys(index).Values("cover_image")
        mode_tsp.SelectedItem.Text = example1.Rows(index).Cells(10).Text
        uid.Value = DirectCast(sender, ImageButton).CommandArgument
        Session("Flag") = 1
        '' Trigger the ModalPopupExtender1
        AddPackage.Show()
    End Sub

    Protected Sub btnAddPackage_Click(sender As Object, e As EventArgs) Handles btnAddPackage.Click
        Try
            If Session("Flag") = 0 Then
                Dim fname As String = fuPackageImage.FileName
                If fuPackageImage.HasFile Then
                    If fname.EndsWith("jpg") Or fname.EndsWith("png") Or fname.EndsWith("jpeg") Then
                        fuPackageImage.SaveAs(Server.MapPath("img/Packages/") & fname)
                    End If
                    SqlDataSource1.InsertParameters("name").DefaultValue() = txtPackageName.Text
                    SqlDataSource1.InsertParameters("price").DefaultValue() = txtPackagePrice.Text
                    SqlDataSource1.InsertParameters("package_type").DefaultValue() = ddlPackageType.SelectedItem.Text
                    SqlDataSource1.InsertParameters("duration").DefaultValue() = txtPackageDuration.Text
                    SqlDataSource1.InsertParameters("description").DefaultValue() = txtPackageSummary.Text
                    SqlDataSource1.InsertParameters("max_limit").DefaultValue() = txtNumberOfPeople.Text
                    SqlDataSource1.InsertParameters("cover_image").DefaultValue() = fname
                    SqlDataSource1.InsertParameters("mode_tsp").DefaultValue() = mode_tsp.SelectedItem.Text
                    SqlDataSource1.Insert()
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)
                    uid.Value = ""
                    txtPackageName.Text = ""
                    txtPackagePrice.Text = ""
                    ddlPackageType.SelectedIndex = 0
                    txtPackageDuration.Text = ""
                    txtPackageSummary.Text = ""
                    txtNumberOfPeople.Text = ""
                    mode_tsp.SelectedIndex = 0

                Else
                    lblimage.ForeColor = Drawing.Color.Red
                    lblimage.Text = "Select Valid Image"
                End If

            Else
                Dim fname As String = lblimage.Text

                If fuPackageImage.HasFile Then

                    'it will detele the file  if the file is already their
                    If System.IO.File.Exists(Server.MapPath("img/Packages/") & fname) Then
                        System.IO.File.Delete(Server.MapPath("img/Packages/") & fname)
                    End If

                    fname = fuPackageImage.FileName
                    If fuPackageImage.HasFile Then
                        If fname.EndsWith("jpg") Or fname.EndsWith("png") Or fname.EndsWith("jpeg") Then
                            fuPackageImage.SaveAs(Server.MapPath("img/Packages/") & fname)
                        End If
                    End If

                End If

                SqlDataSource1.UpdateParameters("id").DefaultValue() = uid.Value
                    SqlDataSource1.UpdateParameters("name").DefaultValue() = txtPackageName.Text
                    SqlDataSource1.UpdateParameters("price").DefaultValue() = txtPackagePrice.Text
                    SqlDataSource1.UpdateParameters("package_type").DefaultValue() = ddlPackageType.SelectedValue
                    SqlDataSource1.UpdateParameters("duration").DefaultValue() = txtPackageDuration.Text
                    SqlDataSource1.UpdateParameters("description").DefaultValue() = txtPackageSummary.Text
                    SqlDataSource1.UpdateParameters("max_limit").DefaultValue() = txtNumberOfPeople.Text
                    SqlDataSource1.UpdateParameters("cover_image").DefaultValue() = fname

                    SqlDataSource1.UpdateParameters("mode_tsp").DefaultValue() = mode_tsp.SelectedValue
                    SqlDataSource1.Update()
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)

                    lblimage.Text = ""
                    uid.Value = ""
                    txtPackageName.Text = ""
                    txtPackagePrice.Text = ""
                    ddlPackageType.SelectedIndex = 0
                    txtPackageDuration.Text = ""
                    txtPackageSummary.Text = ""
                    txtNumberOfPeople.Text = ""
                    mode_tsp.SelectedIndex = 0



                End If


            example1.DataBind()
        Catch ex As Exception



        End Try

    End Sub

    Private Sub example1_PreRender(sender As Object, e As EventArgs) Handles example1.PreRender

        If example1.Rows.Count > 0 Then
            example1.UseAccessibleHeader = True
            example1.HeaderRow.TableSection = TableRowSection.TableHeader
        End If

    End Sub

    Protected Sub btnPlace_Click(sender As Object, e As EventArgs) Handles btnPlace.Click

        Response.Redirect("Place_details.aspx")

    End Sub

    Private Sub pck_type_grid_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles pck_type_grid.PageIndexChanging
        'it will popup the modal on paging,otherwise the popup will be hide
        ModalPopupExtender1.Show()
    End Sub
End Class
