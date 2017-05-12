Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete


        Page.Title = "Sign in to " & ConfigurationManager.AppSettings.Get("WebsiteName").ToString & " "


    End Sub

End Class