Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Net.Mail

Public Class Dao

    Public pnum As Integer = 0

    Dim con As SqlConnection

    Public Sub New()
        '    con = New SqlConnection("Data Source=103.191.208.118;Persist Security Info=True;User ID=data_stu141;Password=Lovecoding@6750")'
    End Sub

    '  Public Function get_data(ByVal qry As String) As Data.DataSet

    '  Dim ds As New Data.DataSet
    ' Dim da As New SqlDataAdapter(qry, con)
    '    con.Open()
    '   da.SelectCommand.ExecuteReader()
    '  con.Close()
    ' da.Fill(ds)

    'Return ds

    '   End Function

    Public Sub modifyData(ByVal str As String)
        Try

            con.Open()

            Dim cmd As New SqlCommand(str, con)

            cmd.ExecuteNonQuery()

            con.Close()
        Catch ex As Exception

            MsgBox(ex.Message)

        End Try
    End Sub
    Public Sub send_mail(send_email As String, msg As String)
        Dim from, pass, to_user, msg_part As String
        'information for sending mail
        Dim message As MailMessage = New MailMessage
        to_user = send_email
        from = "passreset481@gmail.com"
        pass = "rrcoxxrxdkguckps"
        msg_part = msg

        message.To.Add(New MailAddress(send_email))
        message.From = New MailAddress(from)
        message.Body = msg_part
        message.Subject = "code for resseting password"

        'smtp protocol
        Dim smtp As New SmtpClient
        smtp.Host = "smtp.gmail.com"
        smtp.EnableSsl = True
        smtp.Port = 587
        ' smtp.DeliveryMethod = smtp.DeliveryMethod.Network
        smtp.Credentials = New System.Net.NetworkCredential(from, pass)
        smtp.Send(message)
    End Sub
End Class
