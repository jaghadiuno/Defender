Public Class HeaderControl
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub



    Private Sub Controls_Generic_HeaderControl_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        'logic to display the active link as fancy tabs

        If Request.FilePath.Contains("/peoplesearch/") Then linkPeople.Attributes.Add("class", "active")
        If Request.FilePath.Contains("/casemanagement/") Then linkCases.Attributes.Add("class", "active")
        If Request.FilePath.Contains("/reports/") Then linkAssignments.Attributes.Add("class", "active")

        'If Request.FilePath.Contains("/filemanager/") Then linkFileManager.Attributes.Add("class", "active")

        If Request.FilePath.Contains("/authentication/") Or Request.FilePath.Contains("/settings/") Then linkSettings.Attributes.Add("class", "active")


        If Request.FilePath.Contains("/Tools/") Then
            toolsMore.Attributes.Add("class", "active dropdown")
        Else
            toolsMore.Attributes.Add("class", "dropdown")
        End If


    End Sub


End Class
