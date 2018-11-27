Imports Defender.SiteGeneral
Imports Telerik.Web.UI
Imports Telerik.Web.UI.Calendar
Public Class _Default5
    Inherits System.Web.UI.Page

    Private Sub Apps_Reports_Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        gridCPCSCaseSearch.ExportSettings.FileName = "cpcs-case-search-" & Now()
        If Not Page.IsPostBack Then
            txtPersonName.Focus()
            gridCPCSCaseSearch.Visible = False
        End If
    End Sub
    Private Sub txtPersonName_Search(sender As Object, e As SearchBoxEventArgs) Handles txtPersonName.Search
        processSearch()
    End Sub

    Private Sub txtPersonName_ButtonCommand(sender As Object, e As SearchBoxButtonEventArgs) Handles txtPersonName.ButtonCommand
        processSearch()
    End Sub

    Sub processSearch()
        If Not String.IsNullOrWhiteSpace(txtPersonName.Text.ToString.Trim) Then
            gridCPCSCaseSearch.Visible = True

            gridCPCSCaseSearch.Rebind()
            lblSearchItem.Text = "Search Result For '<span class=text-success bold>" & txtPersonName.Text.ToString.Trim & "</span>'"
            lblSearchItem.Focus()
        Else
            gridCPCSCaseSearch.Visible = False
        End If
    End Sub
    Private Sub lbAdvancedSearch_Click(sender As Object, e As EventArgs) Handles lbAdvancedSearch.Click
        Response.Redirect("advancedsearch.aspx")
    End Sub



End Class