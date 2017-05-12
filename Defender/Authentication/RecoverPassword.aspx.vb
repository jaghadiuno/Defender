Public Class RecoverPassword
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        PasswordRecovery1.MailDefinition.CC = ConfigurationManager.AppSettings.Get("EmailFrom").ToString



        PasswordRecovery1.MailDefinition.From = ConfigurationManager.AppSettings.Get("EmailFrom").ToString


    End Sub

End Class