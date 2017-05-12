Imports Telerik.Web.UI

Partial Class _Default
    Inherits System.Web.UI.Page

    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            SignIn.Visible = False
        End If

    End Sub

    Private Sub imgSignIn_Click(sender As Object, e As ImageClickEventArgs) Handles imgSignIn.Click

        SignIn.Visible = True
        imgSignIn.Visible = False

    End Sub



End Class
