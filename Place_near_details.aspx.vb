Imports System.Data.SqlClient

Imports System.IO
Partial Class admin_Place_near_details
    Inherits System.Web.UI.Page

    Private Sub admin_Place_near_details_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)

            If Session("add") <> "" Then

                Dim d As New Dao
                Dim ds As New Data.DataSet

                ds = d.get_data("select * from tour_place where id=" & Session("add"))

                If ds.Tables(0).Rows.Count <> 0 Then

                    Label1.Text = ds.Tables(0).Rows(0).Item("place_name")
                    Place_name.Text = Label1.Text
                End If
            End If


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
            SqlDataSource1.DeleteParameters("id").DefaultValue() = e.CommandArgument
            SqlDataSource1.Delete()
            example1.DataBind()
        End If

    End Sub

    Private Sub example1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles example1.RowDataBound

        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If

    End Sub

    Private Sub submit_Click(sender As Object, e As EventArgs) Handles submit.Click

        Try


            If Session("Flag") = 0 Then

                lbvisit_img.ForeColor = Drawing.Color.Black
                lbvisit_img.Text = ""
                If near_img.HasFile Then

                    Dim fname As String = near_img.FileName

                    If fname.EndsWith("jpg") Or fname.EndsWith("png") Or fname.EndsWith("jpeg") Then

                        near_img.SaveAs(Server.MapPath("../admin/img/place_img/") & fname)

                    Else

                        lbvisit_img.ForeColor = Drawing.Color.Red
                        lbvisit_img.Text = "Select a Valid Image Formate"
                    End If

                    SqlDataSource1.InsertParameters("place_id").DefaultValue() = Session("add")
                    SqlDataSource1.InsertParameters("place_img").DefaultValue() = fname
                    SqlDataSource1.InsertParameters("place_description").DefaultValue() = txt_placedesc.Value

                    SqlDataSource1.Insert()
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)


                    txt_placedesc.Value = ""
                    uid.Value = ""

                Else
                    lbvisit_img.ForeColor = Drawing.Color.Red
                    lbvisit_img.Text = "Select Valid Image"
                End If

            Else



                Dim fname As String = lbvisit_img.Text

                If near_img.HasFile Then

                    If System.IO.File.Exists(Server.MapPath("../admin/img/place_img/place_visit") & fname) Then

                        System.IO.File.Delete(Server.MapPath("../admin/img/place_img/place_visit") & fname)
                    End If

                    fname = near_img.FileName

                    If near_img.HasFile Then

                        fname = near_img.FileName

                        If fname.EndsWith("jpg") Or fname.EndsWith("png") Or fname.EndsWith("jpeg") Then

                            near_img.SaveAs(Server.MapPath("../admin/img/place_img/") & fname)

                        Else
                            lbvisit_img.ForeColor = Drawing.Color.Red
                            lbvisit_img.Text = "Select Valid Image"
                        End If

                    End If

                End If

                SqlDataSource1.UpdateParameters("id").DefaultValue() = uid.Value
                SqlDataSource1.UpdateParameters("place_id").DefaultValue() = Session("add")
                SqlDataSource1.UpdateParameters("place_img").DefaultValue() = fname
                SqlDataSource1.UpdateParameters("place_description").DefaultValue() = txt_placedesc.Value

                SqlDataSource1.Update()
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "showalert", "success();", True)


                example1.DataBind()


                lbvisit_img.Text = ""
                txt_placedesc.Value = ""
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
        ''here we are passing place id also,so that we can use it to store the value,while the name is visible

        Place_name.Text = Label1.Text

        lbvisit_img.Text = example1.DataKeys(index).Values("place_img")

        txt_placedesc.Value = example1.Rows(index).Cells(5).Text

        uid.Value = DirectCast(sender, ImageButton).CommandArgument

        Session("Flag") = 1

    End Sub

    Private Sub cancel_Click(sender As Object, e As EventArgs) Handles cancel.Click

        lbvisit_img.Text = ""
        txt_placedesc.Value = ""

    End Sub
End Class
