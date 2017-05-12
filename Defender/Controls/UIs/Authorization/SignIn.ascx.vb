Public Class SignIn
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub






    Protected Sub Login1_LoggedIn(sender As Object, e As System.EventArgs) Handles Login1.LoggedIn


        'Try
        '    Account.SetupUser(Membership.GetUser().UserName, Membership.GetUser().ProviderUserKey.ToString())
        'Catch ex As Exception
        'End Try

        HttpContext.Current.Response.AddHeader("Cache-Control", "no-cache, no-store, must-revalidate")
        HttpContext.Current.Response.AddHeader("Pragma", "no-cache")
            HttpContext.Current.Response.AddHeader("Expires", "0")


            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
            Response.Cache.SetCacheability(HttpCacheability.NoCache)
            Response.Cache.SetNoStore()


    End Sub









    End Class
