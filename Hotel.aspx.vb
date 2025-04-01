Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Partial Class Hotel
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
        txthtlname.Value = ""
        txthtlphn.Value = ""
        txthtldesc.Value = ""
        txturl.Value = ""
        uid.Value = ""
    End Sub

    Protected Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click

        Try


            If Session("Flag") = 0 Then
                lb_img.Text = ""
                lb_img.ForeColor = Drawing.Color.Black

                If h_img.HasFile Then
                    Dim fname As String = h_img.FileName
                    If fname.EndsWith("jpg") Or fname.EndsWith("jpeg") Or fname.EndsWith("png") Then

                        h_img.SaveAs(Server.MapPath("img/hotel_img/") & fname)

                        SqlDataSource1.InsertParameters("name").DefaultValue() = txthtlname.Value
                        SqlDataSource1.InsertParameters("ph_no").DefaultValue() = txthtlphn.Value
                        SqlDataSource1.InsertParameters("Image").DefaultValue() = fname
                        SqlDataSource1.InsertParameters("desc").DefaultValue() = txthtldesc.Value
                        SqlDataSource1.InsertParameters("web_link").DefaultValue() = txturl.Value
                        SqlDataSource1.InsertParameters("package_id").DefaultValue() = ddlPackageName.SelectedValue
                        SqlDataSource1.InsertParameters("place_id").DefaultValue() = ddPlaceName.SelectedValue
                        SqlDataSource1.Insert()
                        popup()
                    Else
                        lb_img.ForeColor = Drawing.Color.Red
                        lb_img.Text = "Select Valid Image"
                        ModalPopupExtender1.Show()
                    End If
                End If
            Else
                Dim fname As String = lb_img.Text
                If h_img.HasFile Then
                    If System.IO.File.Exists(Server.MapPath("../admin/img/hotel_img/") & fname) Then
                        System.IO.File.Delete(Server.MapPath("../admin/img/hotel_img/") & fname)
                    End If
                End If
                fname = h_img.FileName

                If h_img.HasFile Then
                    If fname.EndsWith("jpg") Or fname.EndsWith("png") Or fname.EndsWith("jpeg") Then
                        h_img.SaveAs(Server.MapPath("../admin/img/hotel_img") & fname)
                    End If
                End If

                SqlDataSource1.UpdateParameters("package_id").DefaultValue() = ddlPackageName.SelectedValue
                SqlDataSource1.UpdateParameters("place_id").DefaultValue() = ddPlaceName.SelectedValue
                SqlDataSource1.UpdateParameters("name").DefaultValue() = txthtlname.Value
                SqlDataSource1.UpdateParameters("Image").DefaultValue() = lb_img.Text
                SqlDataSource1.UpdateParameters("ph_no").DefaultValue() = txthtlphn.Value
                SqlDataSource1.UpdateParameters("desc").DefaultValue() = txthtldesc.Value
                SqlDataSource1.UpdateParameters("web_link").DefaultValue() = txturl.Value
                SqlDataSource1.UpdateParameters("id").DefaultValue() = uid.Value
                SqlDataSource1.Update()
                popup()
            End If

        Catch ex As Exception

            MsgBox(ex.Message)
        End Try


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
            ModalPopupExtender1.Show()

        End If
    End Sub





    Protected Sub Edit1_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        ''here we are passing package id also,so that we can use it to store the value,while the name is visible
        ddlPackageName.SelectedValue = Convert.ToInt32(example1.DataKeys(index).Values("package_id"))
        txthtlname.Value = example1.Rows(index).Cells(6).Text
        lb_img.Text = example1.DataKeys(index).Values("Image")
        txthtlphn.Value = example1.Rows(index).Cells(9).Text
        txthtldesc.Value = example1.Rows(index).Cells(10).Text
        txturl.Value = example1.Rows(index).Cells(11).Text

        uid.Value = DirectCast(sender, ImageButton).CommandArgument
        Session("Flag") = 1
        ' Trigger the ModalPopupExtender1
        ModalPopupExtender1.Show()
    End Sub
    Private Sub example1_PreRender(sender As Object, e As EventArgs) Handles example1.PreRender

        If example1.Rows.Count > 0 Then
            example1.UseAccessibleHeader = True
            example1.HeaderRow.TableSection = TableRowSection.TableHeader
        End If

    End Sub

    Protected Sub ddlPackageName_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPackageName.SelectedIndexChanged

        ModalPopupExtender1.Show()

    End Sub
End Class
