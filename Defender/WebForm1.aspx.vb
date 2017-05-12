Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        Dim x = Nothing
        Dim res = TimeSpan.TryParse("00:03:37.1933330", x)

        Label1.Text = ""
        Label1.Text += "Total Absolute Seconds : " & x.TotalSeconds 'New TimeSpan((x)).Seconds.ToString
        Label1.Text += "<br />"
        Label1.Text += "Total Absolute Duration : " & x.ToString
        Label1.Text += "<br /><br />"

        Label1.Text += "Total Converted Seconds : " & Convert.ToInt32(x.TotalSeconds) 'New TimeSpan((x)).Seconds.ToString
        Label1.Text += "<br />"
        Label1.Text += "Total Converted Duration : " & New TimeSpan(x.Hours, x.Minutes, x.Seconds).ToString

    End Sub

End Class