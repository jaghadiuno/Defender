Imports Telerik.Web.UI

Public Class _Default4
    Inherits System.Web.UI.Page


    Private Sub Apps_Reports_Default_Load(sender As Object, e As EventArgs) Handles Me.Load

        gridCPCSCaseSearch.ExportSettings.FileName = "cpcs-case-search-" & Now()


        If Not Page.IsPostBack Then

            dteCaseOpenedFrom.SelectedDate = Now.AddYears(-5).Date
            dteCaseOpenedTo.SelectedDate = Now.Date


            dteCaseClosedFrom.SelectedDate = Now.AddYears(-5).Date
            dteCaseClosedTo.SelectedDate = Now.Date


        End If

    End Sub

    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click

        'We will have to check manually for each paramter to make sure that at least one or more items have been entered to search against

        Dim xStr As String = ""


        If Not IsNothing(dteCaseOpenedFrom.SelectedDate) Then xStr += dteCaseOpenedFrom.SelectedDate
        If Not IsNothing(dteCaseOpenedTo.SelectedDate) Then xStr += dteCaseOpenedTo.SelectedDate

        If Not IsNothing(dteCaseClosedFrom.SelectedDate) Then xStr += dteCaseClosedFrom.SelectedDate
        If Not IsNothing(dteCaseClosedTo.SelectedDate) Then xStr += dteCaseClosedTo.SelectedDate


        xStr += ddlCaseType.Text
        xStr += ddlDivision.Text
        xStr += ddlUnit.Text

        xStr += ddlOffice.Text


        xStr += txtInvestigatorName.Text
        xStr += txtCaseNumber.Text
        xStr += txtCharge.Text


        xStr += txtClientName.Text
        xStr += txtAttorneyName.Text
        xStr += txtParticipantName.Text
        xStr += txtProsecutorName.Text
        xStr += txtJudgeName.Text
        xStr += txtSSAName.Text








        If xStr.ToString.Trim <> "" AndAlso Not String.IsNullOrWhiteSpace(xStr) Then

            gridCPCSCaseSearch.Visible = True
            BindData()
            gridCPCSCaseSearch.Rebind()

            AlertPanel.Visible = False
            lblAlertPanel.Text = ""

        Else

            lblAlertPanel.Text = "Search fields cannot be empty. Please enter at least 1 or 2 criteria to filter against."
            AlertPanel.Visible = True

        End If



    End Sub


    Private Sub gridCPCSCaseSearch_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles gridCPCSCaseSearch.NeedDataSource

        BindData()

    End Sub



    Sub BindData()
        SqlDSSearchResults.DataBind()
    End Sub

    Private Sub ddlClosedFromDate_PreRender(sender As Object, e As EventArgs) Handles ddlClosedFromDate.PreRender
        If ddlClosedFromDate.SelectedItem.Text = "Between" Then
            phCaseClosedTo.Visible = True
        Else
            dteCaseClosedTo.SelectedDate = Nothing
            phCaseClosedTo.Visible = False
        End If
    End Sub

    Private Sub ddlOpenedFromDate_PreRender(sender As Object, e As EventArgs) Handles ddlOpenedFromDate.PreRender

        If ddlOpenedFromDate.SelectedItem.Text = "Between" Then
            phCaseOpenedTo.Visible = True
        Else
            dteCaseOpenedTo.SelectedDate = Nothing
            phCaseOpenedTo.Visible = False
        End If

    End Sub

    Private Sub gridCPCSCaseSearch_Load(sender As Object, e As EventArgs) Handles gridCPCSCaseSearch.Load

    End Sub
End Class