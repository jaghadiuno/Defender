Imports Telerik.Web.UI

Public Class JudgesList
    Inherits System.Web.UI.Page


    Private Sub Judge_Search(sender As Object, e As SearchBoxEventArgs) Handles JudgeSearchBox.Search

        gridJudges.DataBind()


    End Sub






End Class