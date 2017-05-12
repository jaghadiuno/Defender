Imports System.Drawing
Imports System.Web.UI.DataVisualization.Charting
Imports Telerik.Web.UI

Public Class Attorney
    Inherits System.Web.UI.Page


    Private Sub Apps_Reports_Attorney_Load(sender As Object, e As EventArgs) Handles Me.Load




        If IsNothing(Request.QueryString("attorneyguid")) AndAlso Request.QueryString("attorneyguid") = "" Then
            Response.Redirect(ConfigurationManager.AppSettings.Item("DefaultLandingPage"))
        End If


        If Not IsNothing(Request.QueryString("attorneyguid")) AndAlso Request.QueryString("attorneyguid") <> "" AndAlso Not Page.IsPostBack Then


            hdnAttorneyName.Value = CPCSAttorneys.getAttorneyName(New Guid(Request.QueryString("attorneyguid")))
            hdnAttorneyID.Value = CPCSAttorneys.getAttorneyID(New Guid(Request.QueryString("attorneyguid")))
            hdnAttorneyGUID.Value = Request.QueryString("attorneyguid")

            Me.Title = hdnAttorneyName.Value & " Case Load"


            dteAssignedEndDate.SelectedDate = Now.Date
            dteUnAssignedEndDate.SelectedDate = Now.Date

            dteAssignedStartDate.SelectedDate = Now.Date.AddYears(-10)
            dteUnAssignedStartDate.SelectedDate = Now.Date.AddYears(-10)

        End If



        gridCaseSearch.ExportSettings.FileName = "cpcs-" & hdnAttorneyName.Value & "-cases-" & Now()
        chartArea.ChartTitle.Text = "" & Server.HtmlEncode(hdnAttorneyName.Value & "'s Case Assignments")

        btnCaseDetails.Text = "" & hdnAttorneyName.Value & ""
        'btnCaseDetails.Text = "<< Back to Case Details"




    End Sub

    Private Sub btnCaseDetails_Click(sender As Object, e As EventArgs) Handles btnCaseDetails.Click
        Response.Redirect("~/apps/peoplesearch/personcase.aspx?attorneyguid=" & Request.QueryString("attorneyguid"))
    End Sub


    Private Sub gridCaseSearch_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles gridCaseSearch.NeedDataSource

        gridCaseSearch.DataSource = dsAttorneyCases


    End Sub

    Private Sub gridCaseSearch_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles gridCaseSearch.ItemDataBound

        If TypeOf e.Item Is GridGroupFooterItem Then
            Dim groupFooter As GridGroupFooterItem = DirectCast(e.Item, GridGroupFooterItem)
            'groupFooter.Style.Add("font-weight", "bold")
            groupFooter.CssClass = "group-footer-text"
        End If


    End Sub



    Private Sub ddlAssignedOptions_PreRender(sender As Object, e As EventArgs) Handles ddlAssignedOptions.PreRender

        If ddlAssignedOptions.SelectedItem.Text = "Assigned Between" Then
            phAssignedEndDate.Visible = True
            lblAssignedEndDate.Visible = True
        Else
            dteAssignedEndDate.SelectedDate = Now.Date
            phAssignedEndDate.Visible = False
            lblAssignedEndDate.Visible = False
        End If

    End Sub



    Private Sub ddlUnAssignedOptions_PreRender(sender As Object, e As EventArgs) Handles ddlUnAssignedOptions.PreRender
        If ddlUnAssignedOptions.SelectedItem.Text = "Un-Assigned Between" Then
            phUnAssignedEndDate.Visible = True
            lblUnAssignedEndDate.Visible = True
        Else
            dteUnAssignedEndDate.SelectedDate = Now.Date
            phUnAssignedEndDate.Visible = False
            lblUnAssignedEndDate.Visible = False
        End If
    End Sub

    Private Sub btnFilter_Click(sender As Object, e As EventArgs) Handles btnFilter.Click

        reloadReports()

    End Sub


    Sub reloadReports()


        dsAttorneyCases.DataBind()
        odsAssignmentCounts.DataBind()
        gridCaseSearch.Rebind()


        chartArea.DataBind()


    End Sub


End Class
