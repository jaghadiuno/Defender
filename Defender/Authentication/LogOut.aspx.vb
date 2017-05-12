Public Class LogOut
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init






            Dim myCookie As HttpCookie
            myCookie = New HttpCookie("userInfo")
            myCookie.Expires = DateTime.Now.AddDays(-1D)
            Response.Cookies.Add(myCookie)


            Session.RemoveAll()
            Session.Clear()
            Session.Abandon()



            FormsAuthentication.SignOut()





            HttpContext.Current.Response.AddHeader("Cache-Control", "no-cache, no-store, must-revalidate")
            HttpContext.Current.Response.AddHeader("Pragma", "no-cache")
            HttpContext.Current.Response.AddHeader("Expires", "0")


            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1))
            Response.Cache.SetCacheability(HttpCacheability.NoCache)
            Response.Cache.SetNoStore()


            Response.Redirect("~/default.aspx")


        End Sub









    End Class
