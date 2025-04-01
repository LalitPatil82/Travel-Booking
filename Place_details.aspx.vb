Imports System.IO
Partial Class admin_Place_details
    Inherits System.Web.UI.Page

    Public Sub popup()
        example1.DataBind()
        ' show success message using SweetAlert
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)

        Package_Name.SelectedIndex = 0
        txt_placename.Value = ""
        txt_placedesc.Value = ""
        uid.Value = ""
    End Sub

    Public Sub clear()
        Package_Name.SelectedIndex = 0
        txt_placename.Value = ""
        txt_placedesc.Value = ""
        uid.Value = ""

    End Sub

    Private Sub admin_Place_details_Load(sender As Object, e As EventArgs) Handles Me.Load


        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
            ModalPopupExtender1.Show()

            submit.Text = "ADD"
        End If
    End Sub

    Protected Sub example1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles example1.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub



    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click



        Try

            If Session("Flag") = 0 Then

                lbcover.Text = ""
                lbvisit.Text = ""
                lbvisit.ForeColor = Drawing.Color.Black
                lbcover.ForeColor = Drawing.Color.Black
                If cover_img.HasFile Then



                    Dim fname As String = cover_img.FileName



                    If fname.EndsWith("jpg") Or fname.EndsWith("png") Or fname.EndsWith("jpeg") Then

                        cover_img.SaveAs(Server.MapPath("../admin/img/place_img/") & fname)

                    Else
                        lbcover.ForeColor = Drawing.Color.Red
                        lbcover.Text = "Select Valid Image"
                        ModalPopupExtender1.Show()


                    End If

                    If visit_img.HasFile Then
                        Dim fname1 As String = visit_img.FileName



                        If fname1.EndsWith("jpg") Or fname1.EndsWith("png") Or fname1.EndsWith("jpeg") Then

                            visit_img.SaveAs(Server.MapPath("../admin/img/place_img/") & fname1)

                        Else
                            lbvisit.ForeColor = Drawing.Color.Red
                            lbvisit.Text = "Select Valid Image"
                            ModalPopupExtender1.Show()


                        End If

                        SqlDataSource1.InsertParameters("place_name").DefaultValue() = txt_placename.Value

                        SqlDataSource1.InsertParameters("cover_img").DefaultValue() = fname

                        SqlDataSource1.InsertParameters("place_image").DefaultValue = fname1

                        SqlDataSource1.InsertParameters("description").DefaultValue = txt_placedesc.Value

                        SqlDataSource1.InsertParameters("pack_id").DefaultValue = Package_Name.SelectedValue

                        SqlDataSource1.Insert()
                        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)

                        example1.DataBind()

                        Package_Name.SelectedIndex = 0
                        txt_placename.Value = ""
                        txt_placedesc.Value = ""
                        uid.Value = ""


                    Else

                        lbvisit.ForeColor = Drawing.Color.Red
                        lbvisit.Text = "Select Valid Image"
                        ModalPopupExtender1.Show()

                    End If

                Else
                    lbcover.ForeColor = Drawing.Color.Red
                    lbcover.Text = "Select Valid Image"
                    ModalPopupExtender1.Show()


                End If


            Else
                Dim fname As String = lbcover.Text
                Dim fname1 As String = lbvisit.Text


                If cover_img.HasFile Then

                    If System.IO.File.Exists(Server.MapPath("../admin/img/place_img/") & fname) Then

                        System.IO.File.Delete(Server.MapPath("../admin/img/place_img/") & fname)
                    End If


                    fname = cover_img.FileName

                    If cover_img.HasFile Then



                        If fname.EndsWith("jpg") Or fname.EndsWith("png") Or fname.EndsWith("jpeg") Then

                            cover_img.SaveAs(Server.MapPath("img/place_img/") & fname)

                        End If
                    End If

                End If


                If visit_img.HasFile Then

                    If System.IO.File.Exists(Server.MapPath("img/place_img/") & fname1) Then

                        System.IO.File.Delete(Server.MapPath("img/place_img/") & fname1)

                    End If
                    fname1 = visit_img.FileName

                    If visit_img.HasFile Then



                        If fname1.EndsWith("jpg") Or fname1.EndsWith("png") Or fname1.EndsWith("jpeg") Then

                            visit_img.SaveAs(Server.MapPath("../admin/img/place_img/") & fname1)

                        End If

                    End If


                End If





                lbcover.Text = fname
                lbvisit.Text = fname1

                SqlDataSource1.UpdateParameters("id").DefaultValue() = uid.Value
                SqlDataSource1.UpdateParameters("pack_id").DefaultValue() = Package_Name.SelectedValue
                SqlDataSource1.UpdateParameters("place_name").DefaultValue() = txt_placename.Value


                SqlDataSource1.UpdateParameters("cover_img").DefaultValue() = lbcover.Text

                SqlDataSource1.UpdateParameters("place_image").DefaultValue() = lbvisit.Text

                SqlDataSource1.UpdateParameters("description").DefaultValue() = txt_placedesc.Value

                SqlDataSource1.Update()
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)

                example1.DataBind()

                Package_Name.SelectedIndex = 0
                txt_placename.Value = ""
                txt_placedesc.Value = ""
                lbcover.Text = ""
                lbvisit.Text = ""

                uid.Value = ""


                Session("Flag") = 0






            End If





        Catch ex As Exception

            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub Edit1_Click(sender As Object, e As EventArgs)

        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        ''here we are passing package id also,so that we can use it to store the value,while the name is visible
        Package_Name.SelectedValue = Convert.ToInt32(example1.DataKeys(index).Values("pack_id"))
        txt_placename.Value = example1.Rows(index).Cells(3).Text
        lbcover.Text = example1.DataKeys(index).Values("cover_img")
        lbvisit.Text = example1.DataKeys(index).Values("place_image")
        txt_placedesc.Value = example1.Rows(index).Cells(8).Text
        uid.Value = Convert.ToInt32(example1.DataKeys(index).Values("id"))

        submit.Text = "Save"
        Session("Flag") = 1
        ' Trigger the ModalPopupExtender1
        ModalPopupExtender1.Show()
    End Sub



    Private Sub example1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles example1.RowCommand

        If e.CommandName = "del" Then
            SqlDataSource1.DeleteParameters("id").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            example1.DataBind()

        ElseIf e.CommandName = "add_img" Then

            Session("add") = e.CommandArgument
            Response.Redirect("Place_near_details.aspx")

        End If
    End Sub

    Private Sub example1_PreRender(sender As Object, e As EventArgs) Handles example1.PreRender

        If example1.Rows.Count > 0 Then

            example1.UseAccessibleHeader = True
            example1.HeaderRow.TableSection = TableRowSection.TableHeader
        End If

    End Sub

    Protected Sub btnShowPopup_Click(sender As Object, e As EventArgs) Handles btnShowPopup.Click

        submit.Text = "ADD"
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click

        submit.Text = "ADD"
    End Sub

    Protected Sub btnHotels_Click(sender As Object, e As EventArgs) Handles btnHotels.Click

        Response.Redirect("Hotel.aspx")
    End Sub
End Class


