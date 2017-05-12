Imports Telerik.Web.UI

Public Class ParticipantsList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub





    Private Sub ParticipantSearchBox_Search(sender As Object, e As SearchBoxEventArgs) Handles ParticipantSearch.Search


        gridParticipants.Rebind()




    End Sub

End Class