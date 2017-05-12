Imports Telerik.Web.UI

Public Class CaseMetricsUnits
    Inherits System.Web.UI.UserControl


    Property StartDate As Date
    Property EndDate As Date


    Private Sub CaseMetricsUnits_Init(sender As Object, e As EventArgs) Handles Me.Init


        'dsCaseData.SelectParameters.Clear()
        'dsCaseData.SelectParameters.Add("StartDate", StartDate)
        'dsCaseData.SelectParameters.Add("EndDate", EndDate)


    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        gridMetrics.ExportSettings.FileName = "cpcs-cases-metrics-" & Now()
        gridCaseData.ExportSettings.FileName = "cpcs-cases-" & Now()


        chartArea.ChartTitle.Text = "Case Counts"
        chartArea.ChartTitle.Appearance.Visible = False



    End Sub

    Private Sub gridMetrics_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridMetrics.SelectedIndexChanged

        lblMsg.Text = ""

        Dim item As GridDataItem
        For Each item In gridMetrics.SelectedItems
            lblMsg.Text += item("UnitTypeName").Text
        Next

    End Sub



End Class