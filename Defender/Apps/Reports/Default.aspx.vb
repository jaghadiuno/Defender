Imports System.Globalization
Imports Telerik.Web.UI
Imports Telerik.Web.UI.Calendar
Imports Defender.Date_Ranges

Public Class _Default6
    Inherits System.Web.UI.Page

    Private Property xCalMonth As Integer
    Private Property xCalYear As Integer
    Private Property xCalMaxDays As Integer
    Private Sub Apps_Reports_Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        dteRange.RangeMinDate = minDateRange
        dteRange.RangeMaxDate = maxDateRange
        If Not IsPostBack Then
            dteStartDate.SelectedDate = defaultStartDate
            dteEndDate.SelectedDate = defaultEndDate
            dteRange.RangeSelectionStartDate = defaultStartDate
            dteRange.RangeSelectionEndDate = defaultEndDate
            ChartAreaUnitCases.Visible = True
            chartAreaUnitAssignments.Visible = True
            ChartLineOfficeCases.Visible = False
            chartLineOfficeAssignments.Visible = False



            ChartAreaUnitCases.PlotArea.Series.Item(2).Visible = False
            ChartAreaUnitCases.PlotArea.Series.Item(3).Visible = False
            ChartAreaUnitCases.PlotArea.Series.Item(4).Visible = False
            ChartAreaUnitCases.PlotArea.Series.Item(5).Visible = False
            ChartAreaUnitCases.PlotArea.Series.Item(6).Visible = False

            chartAreaUnitAssignments.PlotArea.Series.Item(2).Visible = False
            chartAreaUnitAssignments.PlotArea.Series.Item(3).Visible = False
            chartAreaUnitAssignments.PlotArea.Series.Item(4).Visible = False
            chartAreaUnitAssignments.PlotArea.Series.Item(5).Visible = False
            chartAreaUnitAssignments.PlotArea.Series.Item(6).Visible = False

            ChartLineOfficeCases.PlotArea.Series.Item(2).Visible = False
            ChartLineOfficeCases.PlotArea.Series.Item(3).Visible = False
            ChartLineOfficeCases.PlotArea.Series.Item(4).Visible = False
            ChartLineOfficeCases.PlotArea.Series.Item(5).Visible = False
            ChartLineOfficeCases.PlotArea.Series.Item(6).Visible = False

            chartLineOfficeAssignments.PlotArea.Series.Item(2).Visible = False
            chartLineOfficeAssignments.PlotArea.Series.Item(3).Visible = False
            chartLineOfficeAssignments.PlotArea.Series.Item(4).Visible = False
            chartLineOfficeAssignments.PlotArea.Series.Item(5).Visible = False
            chartLineOfficeAssignments.PlotArea.Series.Item(6).Visible = False



        End If
        gridUnitCasesMetrics.ExportSettings.FileName = "cpcs-cases-metrics-" & Now()
        gridUnitCases.ExportSettings.FileName = "cpcs-cases-" & Now()
        chartAreaUnitAssignments.ChartTitle.Text = "Assignment Counts"
        chartAreaUnitAssignments.ChartTitle.Appearance.Visible = False
        ChartAreaUnitCases.ChartTitle.Text = "Case Counts"
        ChartAreaUnitCases.ChartTitle.Appearance.Visible = False
    End Sub
    Private Sub Apps_Reports_Default_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        lblSelectedDateRange.Text = ""
        lblSelectedDateRange.Text += dteRange.RangeSelectionStartDate
        lblSelectedDateRange.Text += " - "
        lblSelectedDateRange.Text += dteRange.RangeSelectionEndDate
        lblSelectedDateRange.Visible = True
    End Sub
    Private Sub gridUnitCasesMetrics_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridUnitCasesMetrics.SelectedIndexChanged
        lblMsg.Text = ""
        Dim item As GridDataItem
        For Each item In gridUnitCasesMetrics.SelectedItems
            lblMsg.Text += item("UnitTypeName").Text
        Next
        gridUnitAssignmentMetrics.SelectedIndexes.Clear()
    End Sub
    Private Sub gridUnitAssignmentMetrics_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridUnitAssignmentMetrics.SelectedIndexChanged
        lblMsg.Text = ""
        Dim item As GridDataItem
        For Each item In gridUnitAssignmentMetrics.SelectedItems
            lblMsg.Text += item("UnitTypeName").Text
        Next
        gridUnitCasesMetrics.SelectedIndexes.Clear()
    End Sub
    Private Sub ddlDateRange_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlDateRange.SelectedIndexChanged
        'Disable all date fields
        dteStartDate.Enabled = False
        dteEndDate.Enabled = False
        dteStartDate.DatePopupButton.Visible = False
        dteEndDate.DatePopupButton.Visible = False
        If ddlDateRange.SelectedValue = "Today" Then
            dteStartDate.SelectedDate = Date.Now
            dteEndDate.SelectedDate = Date.Now
        ElseIf ddlDateRange.SelectedValue = "Yesterday" Then
            dteStartDate.SelectedDate = Date.Now.AddDays(-1)
            dteEndDate.SelectedDate = Date.Now.AddDays(-1)
        ElseIf ddlDateRange.SelectedValue = "Last Week" Then
            Dim dayOfWeekNumber As Integer = CInt(DateTime.Today.DayOfWeek) - CInt(CultureInfo.CurrentCulture.DateTimeFormat.FirstDayOfWeek)
            Dim xCalWeekFirstDay = DateTime.Today.AddDays(-7 - dayOfWeekNumber)
            Dim xCalWeekLastDay = xCalWeekFirstDay.AddDays(6)
            dteStartDate.SelectedDate = xCalWeekFirstDay
            dteEndDate.SelectedDate = xCalWeekLastDay
        ElseIf ddlDateRange.SelectedValue = "Last Month" Then
            xCalMonth = Date.Now.AddMonths(-1).Month
            xCalYear = Now.AddMonths(-1).Year
            xCalMaxDays = Date.DaysInMonth(xCalYear, xCalMonth)
            Dim xMonthMax As Date = Convert.ToDateTime(xCalMonth & "/" & xCalMaxDays & "/" & xCalYear)
            dteStartDate.SelectedDate = Convert.ToDateTime(xCalMonth & "/1/" & xCalYear).Date.ToString
            dteEndDate.SelectedDate = xMonthMax
        ElseIf ddlDateRange.SelectedValue = "Last 7 Days" Then
            dteStartDate.SelectedDate = Date.Now.AddDays(-7)
            dteEndDate.SelectedDate = Date.Now
        ElseIf ddlDateRange.SelectedValue = "Last 30 Days" Then
            dteStartDate.SelectedDate = Date.Now.AddDays(-30)
            dteEndDate.SelectedDate = Date.Now
        Else ' Custom
            dteStartDate.Enabled = True
            dteEndDate.Enabled = True
            dteStartDate.DatePopupButton.Visible = True
            dteEndDate.DatePopupButton.Visible = True
        End If
        dteRange.RangeSelectionStartDate = dteStartDate.SelectedDate
        dteRange.RangeSelectionEndDate = dteEndDate.SelectedDate
    End Sub
#Region "Date related functions and sub routines"
    Private Sub dteStartDate_SelectedDateChanged(sender As Object, e As SelectedDateChangedEventArgs) Handles dteStartDate.SelectedDateChanged
    End Sub
    Private Sub dteEndDate_SelectedDateChanged(sender As Object, e As SelectedDateChangedEventArgs) Handles dteEndDate.SelectedDateChanged
    End Sub
    Private Sub dteRange_SelectionChanged(sender As Object, e As SelectedDatesEventArgs) Handles dteRange.SelectionChanged
        'this is the calender range default dates
        Dim calendarMinDate As New DateTime(1980, 1, 1)
        Dim calendarMaxDate As New DateTime(2099, 12, 30)
        'If RadCalendar2.RangeSelectionStartDate <> calendarMinDate AndAlso RadCalendar2.RangeSelectionEndDate <> calendarMaxDate Then
        If dteRange.RangeSelectionStartDate <> calendarMinDate Then
            dteStartDate.SelectedDate = dteRange.RangeSelectionStartDate
        Else
            dteStartDate.Clear()
        End If
        If dteRange.RangeSelectionEndDate <> calendarMaxDate Then
            dteEndDate.SelectedDate = dteRange.RangeSelectionEndDate
        Else
            dteEndDate.Clear()
        End If
        ddlDateRange.SelectedIndex = 0
    End Sub
    Private Sub dteRange_PreRender(sender As Object, e As EventArgs) Handles dteRange.PreRender
        dteRange.RangeMinDate = minDateRange
        dteRange.RangeMaxDate = maxDateRange
    End Sub
    Private Sub rbCompareTo_PreRender(sender As Object, e As EventArgs) Handles rbCompareTo.PreRender
        If rbCompareTo.Checked Then
            ddlCompareToOptions.Enabled = True
            ddlCompareToOptions.Visible = True
        Else
            ddlCompareToOptions.Enabled = False
            ddlCompareToOptions.Visible = True
        End If
    End Sub
#End Region
    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        dteRange.RangeSelectionStartDate = dteStartDate.SelectedDate
        dteRange.RangeSelectionEndDate = dteEndDate.SelectedDate
        callData()
    End Sub
    Sub callData()
        dsAssignmentsByUnitsMetrics.DataBind()
        dsCasesByUnitsMetrics.DataBind()
        dsAssignmentsByOfficesMetrics.DataBind()
        dsCasesByOfficesMetrics.DataBind()
        dsGroupedAssignments.DataBind()
        dsGroupedCases.DataBind()
        dsCases.DataBind()
        dsAssignments.DataBind()
        dsAttorneyCases.DataBind()
        chartAreaUnitAssignments.DataBind()
        chartLineOfficeAssignments.DataBind()
        ChartAreaUnitCases.DataBind()
        ChartLineOfficeCases.DataBind()
        gridUnitAssignmentMetrics.Rebind()
        gridUnitCasesMetrics.Rebind()
        gridOfficeAssignmentMetrics.Rebind()
        gridOfficeCasesMetrics.Rebind()
        gridOfficeUnitAssignmentMetrics.Rebind()
        gridOfficeUnitsCasesMetrics.Rebind()
        gridUnitOfficeAssignmentMetrics.Rebind()
        gridUnitOfficesCasesMetrics.Rebind()
        gridUnitAssignments.Rebind()
        gridUnitCases.Rebind()
    End Sub
#Region "tabbed region. handles everything to do with metrics grids"
    Private Sub tabstripGroupedMetrics_PreRender(sender As Object, e As EventArgs) Handles tabstripGroupedMetrics.PreRender
    End Sub
    Private Sub tabstripGroupedMetrics_TabClick(sender As Object, e As RadTabStripEventArgs) Handles tabstripGroupedMetrics.TabClick
        If tabstripGroupedMetrics.SelectedTab.PageViewID = "OfficeGroup" Or tabstripGroupedMetrics.SelectedTab.PageViewID = "OfficeUnitGroup" Then
            ChartAreaUnitCases.Visible = False
            chartAreaUnitAssignments.Visible = False
            ChartLineOfficeCases.Visible = True
            chartLineOfficeAssignments.Visible = True
        Else
            'Default view
            ChartAreaUnitCases.Visible = True
            chartAreaUnitAssignments.Visible = True
            ChartLineOfficeCases.Visible = False
            chartLineOfficeAssignments.Visible = False
        End If
    End Sub

#End Region



    Private Sub gridUnitAssignments_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles gridUnitAssignments.ItemCommand

        'If e.CommandName = "RowClick" OrElse e.CommandName = "ExpandCollapse" Then
        '    e.Item.Expanded = Not e.Item.Expanded
        'End If
        If e.CommandName = "RowClick" Then
            e.Item.Expanded = Not e.Item.Expanded
        End If
    End Sub

    Private Sub gridUnitCases_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles gridUnitCases.ItemCommand
        If e.CommandName = "RowClick" Then
            e.Item.Expanded = Not e.Item.Expanded
        End If
    End Sub


End Class