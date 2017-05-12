Imports Telerik.Web.UI

Public Class ProsecutorsList
    Inherits System.Web.UI.Page


    Private Sub Prosecutor_Search(sender As Object, e As SearchBoxEventArgs) Handles ProsecutorSearchBox.Search

        gridProsecutors.DataBind()


    End Sub





End Class