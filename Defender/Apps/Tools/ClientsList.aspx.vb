Imports Telerik.Web.UI

Public Class ClientsList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub



    Private Sub ClientSearchBox_Search(sender As Object, e As SearchBoxEventArgs) Handles ClientSearchBox.Search



        If e.DataItem IsNot Nothing Then

            'ClientID = DirectCast(e.DataItem, Dictionary(Of String, Object))("ClientID")
            'hdnClientID.Value = ClientID

            gridClients.Rebind()

        End If



    End Sub
End Class