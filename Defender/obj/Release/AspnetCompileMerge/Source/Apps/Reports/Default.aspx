<%@ Page Title="Case Reporting" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="Default.aspx.vb" Inherits="Defender._Default6" %>

<%@ Register Src="~/Controls/UIs/Reports/CaseDetails.ascx" TagPrefix="uc1" TagName="CaseDetails" %>
<%@ Register Src="~/Controls/UIs/Reports/CaseCharges.ascx" TagPrefix="uc1" TagName="CaseCharges" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="Server">
    <script>
        function exportChartToImage() {
            var $ = $telerik.$;
            $find('<%=RadClientExportManager1.ClientID%>').exportImage($(".RadHtmlChart"));
}
function exportChartToPDF() {
    var $ = $telerik.$;
    $find('<%= RadClientExportManager1.ClientID%>').exportPDF($(".RadHtmlChart"));
}
    </script>
    <link href="/Scripts/css/cpcs-calender.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1">
    </telerik:RadClientExportManager>
    <telerik:RadAjaxManager ID="MetricsAjaxManager"
        runat="server"
        ShowLoadingPanelForPostBackControls="False"
        DefaultLoadingPanelID="CPCSDefaultLoadingPanel">
        <AjaxSettings>
           <%-- <telerik:AjaxSetting AjaxControlID="btnSearch">
                <UpdatedControls> 
                    <telerik:AjaxUpdatedControl ControlID="lbSelectedDateRange" LoadingPanelID="CPCSTransparentLoadingPanel"  />
                    <telerik:AjaxUpdatedControl ControlID="Panel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>--%>
            <telerik:AjaxSetting AjaxControlID="tabstripCharts">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="tabstripCharts" LoadingPanelID="CPCSTransparentLoadingPanel" />
                    <telerik:AjaxUpdatedControl ControlID="multipageCharts" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="tabstripGroupedMetrics">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="tabstripGroupedMetrics" LoadingPanelID="CPCSTransparentLoadingPanel" />
                    <telerik:AjaxUpdatedControl ControlID="multipageGroupedMetrics" />
                    <telerik:AjaxUpdatedControl ControlID="multipageCharts" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="tabstripDetails">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="tabstripDetails" LoadingPanelID="CPCSTransparentLoadingPanel" />
                    <telerik:AjaxUpdatedControl ControlID="multipageDetails" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="gridUnitAssignmentMetrics">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="gridUnitAssignmentMetrics" />
                    <telerik:AjaxUpdatedControl ControlID="gridUnitCasesMetrics" />
                    <telerik:AjaxUpdatedControl ControlID="multipageCharts" />
                    <telerik:AjaxUpdatedControl ControlID="gridUnitCases" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="gridUnitCasesMetrics">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="gridUnitCasesMetrics" />
                    <telerik:AjaxUpdatedControl ControlID="gridUnitAssignmentMetrics" />
                    <telerik:AjaxUpdatedControl ControlID="multipageCharts" />
                    <telerik:AjaxUpdatedControl ControlID="gridUnitCases" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="gridUnitCases">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="gridUnitCases" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="gridUnitAssignments">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="gridUnitAssignments" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="ddlDateRange">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="dteStartDate" LoadingPanelID="CPCSTransparentLoadingPanel" />
                    <telerik:AjaxUpdatedControl ControlID="dteEndDate" LoadingPanelID="CPCSTransparentLoadingPanel" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="dteRange">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="dteRange" UpdatePanelCssClass="" />
                    <telerik:AjaxUpdatedControl ControlID="dteStartDate" LoadingPanelID="CPCSTransparentLoadingPanel" />
                    <telerik:AjaxUpdatedControl ControlID="dteEndDate" LoadingPanelID="CPCSTransparentLoadingPanel" />
                    <telerik:AjaxUpdatedControl ControlID="ddlDateRange" LoadingPanelID="CPCSTransparentLoadingPanel" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="rbCompareTo">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ddlCompareToOptions" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <div class="text-center">
        <asp:Label ID="lblMsg" runat="server" CssClass="bold text-danger" Visible="false" />
    </div>
    <div class="row">
        <div class="col-sm-6">
            <button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target=".cpcs-calender-modal-lg" runat="server" id="lbSelectedDateRange">
                <asp:Label ID="lblSelectedDateRange" runat="server" />
                <span class="caret"></span>
            </button>
            <div class="modal fade cpcs-calender-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="panel">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-9">
                                        <telerik:RadCalendar
                                            RenderMode="Classic"
                                            runat="server"
                                            ID="dteRange"
                                            RangeSelectionMode="ConsecutiveClicks"
                                            EnableViewSelector="False"
                                            AutoPostBack="true"
                                            ShowRowHeaders="false"
                                            Width="100%"
                                            MultiViewColumns="3"
                                            ShowOtherMonthsDays="False"
                                            CssClass="smaller">
                                        </telerik:RadCalendar>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <asp:Label ID="lblDateRange" runat="server" Text="Date Range" CssClass="col-sm-4 control-label" AssociatedControlID="ddlDateRange" />
                                                <div class="col-sm-8">
                                                    <asp:DropDownList ID="ddlDateRange" runat="server" CssClass="form-control" AutoPostBack="true">
                                                        <asp:ListItem Text="Custom" />
                                                        <asp:ListItem Text="Today" />
                                                        <asp:ListItem Text="Yesterday" />
                                                        <asp:ListItem Text="Last Week" />
                                                        <asp:ListItem Text="Last Month" />
                                                        <asp:ListItem Text="Last 7 Days" />
                                                        <asp:ListItem Text="Last 30 Days" />
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-6">
                                                    <telerik:RadDatePicker ID="dteStartDate" runat="server" ShowPopupOnFocus="False" DatePopupButton-Visible="true" Width="100%" DateInput-Width="100%" RenderMode="Classic" Calendar-ShowColumnHeaders="true" Calendar-ShowRowHeaders="false"></telerik:RadDatePicker>
                                                </div>
                                                <div class="col-sm-6">
                                                    <telerik:RadDatePicker ID="dteEndDate" runat="server" ShowPopupOnFocus="False" DatePopupButton-Visible="true" Width="100%" DateInput-Width="100%" RenderMode="Classic" Calendar-ShowColumnHeaders="true" Calendar-ShowRowHeaders="false"></telerik:RadDatePicker>
                                                </div>
                                            </div>
                                            <div class="form-group form-group-sm">
                                                <div class="col-md-6">
                                                    <asp:CheckBox
                                                        Text="Compare to:"
                                                        TextAlign="right"
                                                        ID="rbCompareTo"
                                                        runat="server"
                                                        AutoPostBack="true" />
                                                </div>
                                                <div class="col-md-6">
                                                    <asp:DropDownList ID="ddlCompareToOptions" runat="server" CssClass="form-control" Enabled="false" Visible="true">
                                                        <asp:ListItem>Custom</asp:ListItem>
                                                        <asp:ListItem>Previous period</asp:ListItem>
                                                        <asp:ListItem>Previous year</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row-spacer clearfix"></div>
                                        <div>
                                            <asp:LinkButton ID="btnSearch" CssClass="btn btn-primary btn-block bold" runat="server" ><i class="fa fa-fw fa-search-plus" aria-hidden="true"></i>
Apply Filter
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="text-right">
               <%-- <asp:Button runat="server" OnClientClick="exportChartToPDF"
                    Text="Export to PDF" CssClass="btn btn-primary btn-sm" />
                <asp:Button runat="server" OnClientClick="exportChartToImage"
                    Text="Export to Image" CssClass="btn btn-primary btn-sm" />--%>

                <asp:LinkButton ID="LinkButton4" runat="server" ToolTip="Switch to Pie Chart" Enabled="false" Visible="true" ><i class="fa fa-pie-chart" style="font-size:36px"></i></asp:LinkButton>
                <asp:LinkButton ID="LinkButton1" runat="server" ToolTip="Switch to Area Chart" Enabled="false" Visible="true"><i class="fa fa-area-chart" style="font-size:36px"></i></asp:LinkButton>
                
                <asp:LinkButton ID="LinkButton2" runat="server" ToolTip="Switch to Bar Chart" Enabled="false" Visible="true"><i class="fa fa-bar-chart" style="font-size:36px"></i></asp:LinkButton>
                


            </div>
        </div>
    </div>
    <asp:Panel ID="Panel1" runat="server">
    <div class="row-spacer clearfix"></div>
    <telerik:RadTabStrip RenderMode="Classic" ID="tabstripCharts" runat="server" MultiPageID="multipageCharts"
        SelectedIndex="0" AutoPostBack="True">
        <Tabs>
            <telerik:RadTab Text="Assignments" runat="server" PageViewID="pageviewAssignments" SelectedCssClass="bold" Selected="True" ToolTip="Assignment Charts">
            </telerik:RadTab>

            <telerik:RadTab Text="Cases" runat="server" PageViewID="pageviewCases" SelectedCssClass="bold" ToolTip="Cases Charts">
            </telerik:RadTab>

            <telerik:RadTab Text="Distribution" runat="server" PageViewID="pageviewDistribution" SelectedCssClass="bold" ToolTip="Distribution of Cases Charts" Visible="false" Enabled="false" >
                <Tabs>
                    <telerik:RadTab Text="County" ToolTip="Distribution of cases by county"></telerik:RadTab>
                    <telerik:RadTab Text="Gender" ToolTip="Distribution of cases by gender"></telerik:RadTab>
                    <telerik:RadTab Text="Race" ToolTip="Distribution of cases by race"></telerik:RadTab>
                    <telerik:RadTab Text="Nationality" ToolTip="Distribution of cases by nationality"></telerik:RadTab>
                    <telerik:RadTab Text="Age" ToolTip="Distribution of cases by age"></telerik:RadTab>
                    <telerik:RadTab Text="Offence" ToolTip="Distribution of cases by offence type"></telerik:RadTab>
                    <telerik:RadTab Text="Sentence" ToolTip="Distribution of cases by sentence type"></telerik:RadTab>
                </Tabs>
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" ID="multipageCharts" RenderSelectedPageOnly="true" SelectedIndex="0">
        <telerik:RadPageView ID="pageviewAssignments" runat="server" Selected="true">
            <telerik:RadHtmlChart runat="server" Width="100%" ID="chartAreaUnitAssignments"
                DataSourceID="dsAssignmentsByUnitsMetrics" Transitions="true" Height="300px">
                <Appearance>
                    <FillStyle BackgroundColor="Transparent"></FillStyle>
                </Appearance>
                <ChartTitle>
                    <Appearance Align="Center" BackgroundColor="Transparent" Position="Top">
                        <TextStyle Bold="true" FontSize="18px" />
                    </Appearance>
                </ChartTitle>
                <Legend>
                    <Appearance Visible="True" Orientation="Vertical" Position="Bottom">
                    </Appearance>
                </Legend>
                <PlotArea>
                    <Series>
                        <telerik:AreaSeries DataFieldY="ActiveAtStart" Name="Active At Start" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} open assignments at start of period" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                            <LineAppearance LineStyle="Smooth" />

                    <Appearance><FillStyle BackgroundColor="DeepSkyBlue"  />
                        <Overlay Gradient="RoundedBevel"  />
                    </Appearance>
                        </telerik:AreaSeries>
                        <telerik:AreaSeries DataFieldY="Assigned" Name="Assigned" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} new assignments" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                            <LineAppearance LineStyle="Smooth" />

                    <Appearance><FillStyle BackgroundColor="RoyalBlue"  />
                        <Overlay Gradient="RoundedBevel"  />
                    </Appearance>
                        </telerik:AreaSeries>
                        <telerik:AreaSeries DataFieldY="BailOnlyAssigned" Name="Bail Only" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} bail only assignments" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                            <LineAppearance LineStyle="Smooth" />
                        </telerik:AreaSeries>
                        <telerik:AreaSeries DataFieldY="ProbationViolationAssigned" Name="Probation Violations" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} probation violation assignments" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                            <LineAppearance LineStyle="Smooth" />
                        </telerik:AreaSeries>
                        <telerik:AreaSeries DataFieldY="UnAssigned" Name="Un-assignments" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} unassignments" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                            <LineAppearance LineStyle="Smooth" />
                        </telerik:AreaSeries>
                        <telerik:AreaSeries DataFieldY="ActiveAtEnd" Name="Active At End" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} assignments open at end of period" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                            <LineAppearance LineStyle="Smooth" />
                        </telerik:AreaSeries>
                                                 <telerik:AreaSeries DataFieldY="TotalCases" Name="Total" VisibleInLegend="true" Visible="true">
<TooltipsAppearance DataFormatString="{0} total assignments touched" />
<LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
<MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
<LineAppearance LineStyle="Smooth"  />
</telerik:AreaSeries>
                    </Series>
                    <XAxis DataLabelsField="UnitTypeName">
                        <LabelsAppearance Color="#000000">
                            <TextStyle Bold="true" FontSize="14px" />
                            <ClientTemplate></ClientTemplate>
                        </LabelsAppearance>
                        <TitleAppearance Visible="True">
                            <TextStyle Bold="true" />
                        </TitleAppearance>
                    </XAxis>
                    <YAxis>
                        <TitleAppearance Text="Number of Assignments" Visible="True">
                            <TextStyle Bold="true" />
                        </TitleAppearance>
                    </YAxis>
                </PlotArea>
            </telerik:RadHtmlChart>
            <telerik:RadHtmlChart runat="server" Width="100%" ID="chartLineOfficeAssignments"
                DataSourceID="dsAssignmentsByOfficesMetrics" Transitions="true" Height="300px">
                <Appearance>
                    <FillStyle BackgroundColor="Transparent"></FillStyle>
                </Appearance>
                <ChartTitle>
                    <Appearance Align="Center" BackgroundColor="Transparent" Position="Top">
                        <TextStyle Bold="true" FontSize="18px" />
                    </Appearance>
                </ChartTitle>
                <Legend>
                    <Appearance Visible="True" Orientation="Vertical" Position="Bottom">
                    </Appearance>
                </Legend>
                <PlotArea>
                    <Series>
                        <telerik:LineSeries DataFieldY="ActiveAtStart" Name="Active At Start" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} open assignments at start of period" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                        </telerik:LineSeries>
                        <telerik:LineSeries DataFieldY="Assigned" Name="Assigned" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} new assignments" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                        </telerik:LineSeries>
                        <telerik:LineSeries DataFieldY="BailOnlyAssigned" Name="Bail Only" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} bail only assignments" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                        </telerik:LineSeries>
                        <telerik:LineSeries DataFieldY="ProbationViolationAssigned" Name="Probation Violations" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} probation violation assignments" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                        </telerik:LineSeries>
                        <telerik:LineSeries DataFieldY="UnAssigned" Name="Un-assignments" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} unassignments" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                        </telerik:LineSeries>
                        <telerik:LineSeries DataFieldY="ActiveAtEnd" Name="Active At End" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} assignments open at end of period" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                        </telerik:LineSeries>
                         <telerik:LineSeries DataFieldY="TotalCases" Name="Total" VisibleInLegend="true" Visible="false">
<TooltipsAppearance DataFormatString="{0} total assignments touched" />
<LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
<MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
</telerik:LineSeries>
                    </Series>
                    <XAxis DataLabelsField="OfficeName">
                        <LabelsAppearance Color="#000000" RotationAngle="90">
                            <TextStyle Bold="true" FontSize="14px" />
                            <ClientTemplate></ClientTemplate>
                        </LabelsAppearance>
                        <TitleAppearance Visible="True">
                            <TextStyle Bold="true" />
                        </TitleAppearance>
                    </XAxis>
                    <YAxis>
                        <TitleAppearance Text="Number of Assignments" Visible="True">
                            <TextStyle Bold="true" />
                        </TitleAppearance>
                    </YAxis>
                </PlotArea>
            </telerik:RadHtmlChart>
        </telerik:RadPageView>
        <telerik:RadPageView ID="pageviewCases" runat="server">
            <telerik:RadHtmlChart runat="server" Width="100%" ID="ChartAreaUnitCases"
                DataSourceID="dsCasesByUnitsMetrics" Transitions="true" Height="300px">
                <Appearance>
                    <FillStyle BackgroundColor="Transparent"></FillStyle>
                </Appearance>
                <ChartTitle>
                    <Appearance Align="Center" BackgroundColor="Transparent" Position="Top">
                        <TextStyle Bold="true" FontSize="18px" />
                    </Appearance>
                </ChartTitle>
                <Legend>
                    <Appearance Visible="True" Orientation="Vertical" Position="Bottom">
                    </Appearance>
                </Legend>
                <PlotArea>
                    <Series>
                        <telerik:AreaSeries DataFieldY="ActiveAtStart" Name="Active At Start" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} open assignments at start of period" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                            <LineAppearance LineStyle="Smooth" />

                    <Appearance><FillStyle BackgroundColor="RoyalBlue"  />
                        <Overlay Gradient="RoundedBevel"  />
                    </Appearance>
                        </telerik:AreaSeries>
                        <telerik:AreaSeries DataFieldY="Assigned" Name="Assigned" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} new assignments" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                            <LineAppearance LineStyle="Smooth" />

                    <Appearance><FillStyle BackgroundColor="DeepSkyBlue"  />
                        <Overlay Gradient="RoundedBevel"  />
                    </Appearance>
                        </telerik:AreaSeries>
                        <telerik:AreaSeries DataFieldY="BailOnlyAssigned" Name="Bail Only" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} bail only assignments" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                            <LineAppearance LineStyle="Smooth" />
                        </telerik:AreaSeries>
                        <telerik:AreaSeries DataFieldY="ProbationViolationAssigned" Name="Probation Violations" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} probation violation assignments" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                            <LineAppearance LineStyle="Smooth" />
                        </telerik:AreaSeries>
                        <telerik:AreaSeries DataFieldY="UnAssigned" Name="Un-assignments" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} unassignments" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                            <LineAppearance LineStyle="Smooth" />
                        </telerik:AreaSeries>
                        <telerik:AreaSeries DataFieldY="ActiveAtEnd" Name="Active At End" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} assignments open at end of period" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                            <LineAppearance LineStyle="Smooth" />
                        </telerik:AreaSeries>
                                                 <telerik:AreaSeries DataFieldY="TotalCases" Name="Total" VisibleInLegend="true" Visible="true">
<TooltipsAppearance DataFormatString="{0} total assignments touched" />
<LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
<MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
<LineAppearance LineStyle="Smooth"  />
</telerik:AreaSeries>
                    </Series>
                    <XAxis DataLabelsField="UnitTypeName">
                        <LabelsAppearance Color="#000000">
                            <TextStyle Bold="true" FontSize="14px" />
                            <ClientTemplate></ClientTemplate>
                        </LabelsAppearance>
                        <TitleAppearance Visible="True">
                            <TextStyle Bold="true" />
                        </TitleAppearance>
                    </XAxis>
                    <YAxis>
                        <TitleAppearance Text="Number of Cases" Visible="True">
                            <TextStyle Bold="true" />
                        </TitleAppearance>
                    </YAxis>
                </PlotArea>
            </telerik:RadHtmlChart>
            <telerik:RadHtmlChart runat="server" Width="100%" ID="ChartLineOfficeCases"
                DataSourceID="dsCasesByOfficesMetrics" Transitions="true" Height="300px">
                <Appearance>
                    <FillStyle BackgroundColor="Transparent"></FillStyle>
                </Appearance>
                <ChartTitle>
                    <Appearance Align="Center" BackgroundColor="Transparent" Position="Top">
                        <TextStyle Bold="true" FontSize="18px" />
                    </Appearance>
                </ChartTitle>
                <Legend>
                    <Appearance Visible="True" Orientation="Vertical" Position="Bottom">
                    </Appearance>
                </Legend>
                <PlotArea>
                    <Series>
                        <telerik:LineSeries DataFieldY="ActiveAtStart" Name="Active At Start" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} active open cases" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                        </telerik:LineSeries>
                        <telerik:LineSeries DataFieldY="NewCases" Name="New Cases" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} new cases" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                        </telerik:LineSeries>
                        <telerik:LineSeries DataFieldY="BailOnly" Name="Bail Only" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} bail only cases" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                        </telerik:LineSeries>
                        <telerik:LineSeries DataFieldY="ProbationViolation" Name="Probation Violations" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} probation violation cases" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                        </telerik:LineSeries>
                        <telerik:LineSeries DataFieldY="ClosedCases" Name="Closed Cases" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} closed cases" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                        </telerik:LineSeries>
                        <telerik:LineSeries DataFieldY="ActiveAtEnd" Name="Active At End" VisibleInLegend="true" Visible="true">
                            <TooltipsAppearance DataFormatString="{0} active cases at end of period" />
                            <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                            <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                        </telerik:LineSeries>
                             <telerik:LineSeries DataFieldY="TotalCases" Name="Total" VisibleInLegend="true" Visible="false">
<TooltipsAppearance DataFormatString="{0} total cases" />
<LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
<MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
</telerik:LineSeries>
                    </Series>
                    <XAxis DataLabelsField="OfficeName" Type="Category">
                       
                        <LabelsAppearance Color="#000000" RotationAngle="90">
                            <TextStyle Bold="true" FontSize="14px"  />
                            <ClientTemplate></ClientTemplate>
                        </LabelsAppearance>
                        <TitleAppearance Visible="True">
                            <TextStyle Bold="true" />
                        </TitleAppearance>
                    </XAxis>
                    <YAxis>
                        <TitleAppearance Text="Number of Cases" Visible="True">
                            <TextStyle Bold="true" />
                        </TitleAppearance>
                    </YAxis>
                </PlotArea>
            </telerik:RadHtmlChart>
        </telerik:RadPageView>

        <telerik:RadPageView ID="pageviewDistribution" runat="server">
            <div class="alert alert-danger text-danger text-center">The distribution of cases module is not available right now. <br /> <strong>Please try again later.</strong></div>
        </telerik:RadPageView>

    </telerik:RadMultiPage>


    <div class="row-spacer clearfix"></div>
    <telerik:RadTabStrip RenderMode="Classic" ID="tabstripGroupedMetrics" runat="server" MultiPageID="multipageGroupedMetrics"
        SelectedIndex="0" AutoPostBack="True">
        <Tabs>
            <telerik:RadTab Text="Units" runat="server" PageViewID="UnitGroup" SelectedCssClass="bold" Selected="True" ToolTip="Metrics by Units">
            </telerik:RadTab>
            <telerik:RadTab Text="Offices" runat="server" PageViewID="OfficeGroup" SelectedCssClass="bold" ToolTip="Metrics by Offices">
            </telerik:RadTab>
            <telerik:RadTab Text="Offices/Units" runat="server" PageViewID="OfficeUnitGroup" SelectedCssClass="bold" ToolTip="Metrics by Offices Grouped by Units">
            </telerik:RadTab>
            <telerik:RadTab Text="Units/Offices" runat="server" PageViewID="UnitOfficeGroup" SelectedCssClass="bold" ToolTip="Metrics by Units Grouped by Offices">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" ID="multipageGroupedMetrics" RenderSelectedPageOnly="true" SelectedIndex="0" CssClass="ComputedDataTable">
        <telerik:RadPageView ID="UnitGroup" runat="server" Selected="true">
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h1 class="panel-title">Unit Assignments</h1>
                        </div>
                        <telerik:RadGrid ID="gridUnitAssignmentMetrics" runat="server"
                            AllowPaging="False"
                            AllowSorting="False"
                            ShowFooter="True"
                            ShowGroupPanel="False"
                            CellSpacing="0" CellPadding="1"
                            PageSize="100"
                            Width="100%"
                            HorizontalAlign="Center"
                            AllowFilteringByColumn="False"
                            PagerStyle-AlwaysVisible="False"
                            RenderMode="Lightweight"
                            DataSourceID="dsAssignmentsByUnitsMetrics"
                            AllowMultiRowSelection="true"
                            ClientSettings-Selecting-AllowRowSelect="true">
                            <HeaderStyle Wrap="false" CssClass="rgHeader small" Font-Size="Small" />
                            <FooterStyle CssClass="small" Font-Size="Small" Font-Bold="true" />
                            <ClientSettings
                                EnablePostBackOnRowClick="True">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <ExportSettings ExportOnlyData="True"
                                HideStructureColumns="False" IgnorePaging="True"
                                Excel-Format="ExcelML">
                            </ExportSettings>
                            <MasterTableView
                                AutoGenerateColumns="False"
                                GroupLoadMode="Server"
                                EnableGroupsExpandAll="False"
                                CommandItemDisplay="Top"
                                ShowFooter="True"
                                CellSpacing="0" CellPadding="1">
                                <CommandItemSettings
                                    ShowAddNewRecordButton="False"
                                    ShowRefreshButton="false"
                                    ShowExportToCsvButton="True"
                                    ShowExportToExcelButton="True"
                                    ShowExportToPdfButton="True"
                                    ShowExportToWordButton="True"
                                    ShowPrintButton="True" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="UnitTypeName" FilterControlAltText="Filter UnitTypeName column" HeaderText="Units" SortExpression="UnitTypeName" UniqueName="UnitTypeName"
                                        ItemStyle-Font-Bold="true"
                                        ItemStyle-Wrap="false"
                                        FooterStyle-CssClass="no-wrap"
                                        FooterText="Total"
                                        HeaderTooltip="CPCS Units"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="rowHeader">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActiveAtStart" DataType="System.Int32" FilterControlAltText="Filter ActiveAtStart column" HeaderText="Start" ReadOnly="True" SortExpression="ActiveAtStart" UniqueName="ActiveAtStart" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Active Assignments at Start = Assignment Date is before the 'Start Date' and Unassignment Date is either greater than or equal to the 'Start Date' OR the case is not closed plus: the unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BailOnlyAssigned" DataType="System.Int32" FilterControlAltText="Filter BailOnlyAssigned column" HeaderText="Bail" ReadOnly="True" SortExpression="BailOnlyAssigned" UniqueName="BailOnlyAssigned" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Bail Only = Assignment Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Bail Only' cases and there is an Assignment Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ProbationViolationAssigned" DataType="System.Int32" FilterControlAltText="Filter ProbationViolationAssigned column" HeaderText="Prob" ReadOnly="True" SortExpression="ProbationViolationAssigned" UniqueName="ProbationViolationAssigned" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Probabtion Violation = Assignment Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Probation Violation' cases and there is an Assignment Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Assigned" DataType="System.Int32" FilterControlAltText="Filter Assigned column" HeaderText="Asd" ReadOnly="True" SortExpression="Assigned" UniqueName="Asd" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Assigned Cases = All new cases assigned BETWEEN the 'Start Date' and  'End Date'">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="UnAssigned" DataType="System.Int32" FilterControlAltText="Filter UnAssigned column" HeaderText="Un-Asd" ReadOnly="True" SortExpression="UnAssigned" UniqueName="UnAssigned" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="UnAssignments =  Cases closed/unassigned BETWEEN the 'Start Date' and 'End Date'">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActiveAtEnd" DataType="System.Int32" FilterControlAltText="Filter ActiveAtEnd column" HeaderText="End" ReadOnly="True" SortExpression="ActiveEnd" UniqueName="ActiveAtEnd" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Active Cases at End = Unassignment Date is greater than the 'End Date' or case is not closed and Assignment Date between 'Start Date' and (including the) 'End Date' or Assignment Date is before the 'Start Date' plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TotalCases" DataType="System.Int32" FilterControlAltText="Filter TotalCases column" HeaderText="Total" ReadOnly="True" SortExpression="TotalCases" UniqueName="TotalCases" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Total Cases = Active at Start + New Assignments + Bail Only + Probation Violation">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h1 class="panel-title">Unit Cases</h1>
                        </div>
                        <telerik:RadGrid ID="gridUnitCasesMetrics" runat="server"
                            AllowPaging="False"
                            AllowSorting="False"
                            ShowFooter="True"
                            ShowGroupPanel="False"
                            CellSpacing="0" CellPadding="1"
                            Width="100%"
                            HorizontalAlign="Center"
                            AllowFilteringByColumn="False"
                            PagerStyle-AlwaysVisible="False"
                            RenderMode="Lightweight"
                            DataSourceID="dsCasesByUnitsMetrics"
                            AllowMultiRowSelection="true"
                            ClientSettings-Selecting-AllowRowSelect="true">
                            <HeaderStyle Wrap="false" CssClass="rgHeader small" Font-Size="Small" />
                            <FooterStyle CssClass="small" Font-Size="Small" Font-Bold="true" />
                            <ClientSettings
                                EnablePostBackOnRowClick="True">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <ExportSettings ExportOnlyData="True"
                                HideStructureColumns="False" IgnorePaging="True"
                                Excel-Format="ExcelML">
                            </ExportSettings>
                            <MasterTableView
                                AutoGenerateColumns="False"
                                GroupLoadMode="Server"
                                EnableGroupsExpandAll="False"
                                CommandItemDisplay="Top"
                                ShowFooter="True"
                                CellSpacing="0"
                                CellPadding="1">
                                <CommandItemSettings
                                    ShowAddNewRecordButton="False"
                                    ShowRefreshButton="false"
                                    ShowExportToCsvButton="True"
                                    ShowExportToExcelButton="True"
                                    ShowExportToPdfButton="True"
                                    ShowExportToWordButton="True"
                                    ShowPrintButton="True" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="UnitTypeName" FilterControlAltText="Filter UnitTypeName column" HeaderText="Units" SortExpression="UnitTypeName" UniqueName="UnitTypeName"
                                        ItemStyle-Font-Bold="true"
                                        ItemStyle-Wrap="false"
                                        FooterStyle-CssClass="no-wrap"
                                        FooterText="Total"
                                        HeaderTooltip="CPCS Units"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="rowHeader">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActiveAtStart" DataType="System.Int32" FilterControlAltText="Filter ActiveAtStart column" HeaderText="Start" ReadOnly="True" SortExpression="ActiveAtStart" UniqueName="ActiveAtStart" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Active at Start = Opening Date is before the 'Start Date' and Closing Date is either greater than or equal to the 'Start Date' OR the case is not closed plus: the unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn
                                        DataField="NewCases"
                                        DataType="System.Int32"
                                        FilterControlAltText="Filter NewCases column"
                                        HeaderText="New"
                                        ReadOnly="True"
                                        SortExpression="NewCases"
                                        UniqueName="NewCases"
                                        Aggregate="Sum"
                                        ItemStyle-Wrap="false"
                                        FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="New Cases = Opening Date is BETWEEN the 'Start Date' and (including the) 'End Date' and the CaseType Excludes 'Bail Only' and 'Probation Violation' Cases and there is an Opening Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BailOnly" DataType="System.Int32" FilterControlAltText="Filter BailOnly column" HeaderText="Bail" ReadOnly="True" SortExpression="BailOnly" UniqueName="BailOnly" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Bail Only = Opening Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Bail Only' cases and there is an Opening Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ProbationViolation" DataType="System.Int32" FilterControlAltText="Filter ProbationViolation column" HeaderText="Prob" ReadOnly="True" SortExpression="ProbationViolation" UniqueName="ProbationViolation" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Probabtion Violation = Opening Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Probation Violation' cases and there is an Opening Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ClosedCases" DataType="System.Int32" FilterControlAltText="Filter ClosedCases column" HeaderText="Clsd" ReadOnly="True" SortExpression="UnAssigned" UniqueName="ClosedCases" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Closed Cases = Closing Date is BETWEEN the 'Start Date' and (including the) 'End Date' and there is a Closing Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActiveAtEnd" DataType="System.Int32" FilterControlAltText="Filter ActiveAtEnd column" HeaderText="End" ReadOnly="True" SortExpression="ActiveEnd" UniqueName="ActiveAtEnd" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Active Cases at End = Closing Date is greater than the 'End Date' or case is not closed and Opening Date between 'Start Date' and (including the) 'End Date' or Opening Date is before the 'Start Date' plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TotalCases" DataType="System.Int32" FilterControlAltText="Filter TotalCases column" HeaderText="Total" ReadOnly="True" SortExpression="TotalCases" UniqueName="TotalCases" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Total Cases = Active at Start + New Cases + Bail Only + Probation Violation">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </div>
            </div>
        </telerik:RadPageView>
        <telerik:RadPageView ID="OfficeGroup" runat="server">
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h1 class="panel-title">Office Assignments</h1>
                        </div>
                        <telerik:RadGrid ID="gridOfficeAssignmentMetrics" runat="server"
                            AllowPaging="False"
                            AllowSorting="False"
                            ShowFooter="True"
                            ShowGroupPanel="False"
                            CellSpacing="0" CellPadding="1"
                            PageSize="100"
                            Width="100%"
                            HorizontalAlign="Center"
                            AllowFilteringByColumn="False"
                            PagerStyle-AlwaysVisible="False"
                            RenderMode="Lightweight"
                            DataSourceID="dsAssignmentsByOfficesMetrics"
                            AllowMultiRowSelection="true"
                            ClientSettings-Selecting-AllowRowSelect="true">
                            <HeaderStyle Wrap="false" CssClass="rgHeader small" Font-Size="Small" />
                            <FooterStyle CssClass="small" Font-Size="Small" Font-Bold="true" />
                            <ClientSettings
                                EnablePostBackOnRowClick="True">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <ExportSettings ExportOnlyData="True"
                                HideStructureColumns="False" IgnorePaging="True"
                                Excel-Format="ExcelML">
                            </ExportSettings>
                            <MasterTableView
                                AutoGenerateColumns="False"
                                GroupLoadMode="Server"
                                EnableGroupsExpandAll="False"
                                CommandItemDisplay="Top"
                                ShowFooter="True"
                                CellSpacing="0" CellPadding="1">
                                <CommandItemSettings
                                    ShowAddNewRecordButton="False"
                                    ShowRefreshButton="false"
                                    ShowExportToCsvButton="True"
                                    ShowExportToExcelButton="True"
                                    ShowExportToPdfButton="True"
                                    ShowExportToWordButton="True"
                                    ShowPrintButton="True" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="OfficeName" FilterControlAltText="Filter OfficeName column" HeaderText="Offices" SortExpression="OfficeName" UniqueName="OfficeName"
                                        ItemStyle-Font-Bold="true"
                                        ItemStyle-Wrap="false"
                                        FooterStyle-CssClass="no-wrap"
                                        FooterText="Total"
                                        HeaderTooltip="CPCS Units"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="rowHeader">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActiveAtStart" DataType="System.Int32" FilterControlAltText="Filter ActiveAtStart column" HeaderText="Start" ReadOnly="True" SortExpression="ActiveAtStart" UniqueName="ActiveAtStart" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Active Assignments at Start = Assignment Date is before the 'Start Date' and Unassignment Date is either greater than or equal to the 'Start Date' OR the case is not closed plus: the unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BailOnlyAssigned" DataType="System.Int32" FilterControlAltText="Filter BailOnlyAssigned column" HeaderText="Bail" ReadOnly="True" SortExpression="BailOnlyAssigned" UniqueName="BailOnlyAssigned" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Bail Only = Assignment Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Bail Only' cases and there is an Assignment Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ProbationViolationAssigned" DataType="System.Int32" FilterControlAltText="Filter ProbationViolationAssigned column" HeaderText="Prob" ReadOnly="True" SortExpression="ProbationViolationAssigned" UniqueName="ProbationViolationAssigned" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Probabtion Violation = Assignment Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Probation Violation' cases and there is an Assignment Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Assigned" DataType="System.Int32" FilterControlAltText="Filter Assigned column" HeaderText="Asd" ReadOnly="True" SortExpression="Assigned" UniqueName="Asd" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Assigned Cases = All new cases assigned BETWEEN the 'Start Date' and  'End Date'">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="UnAssigned" DataType="System.Int32" FilterControlAltText="Filter UnAssigned column" HeaderText="Un-Asd" ReadOnly="True" SortExpression="UnAssigned" UniqueName="UnAssigned" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="UnAssignments =  Cases closed/unassigned BETWEEN the 'Start Date' and 'End Date'">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActiveAtEnd" DataType="System.Int32" FilterControlAltText="Filter ActiveAtEnd column" HeaderText="End" ReadOnly="True" SortExpression="ActiveEnd" UniqueName="ActiveAtEnd" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Active Cases at End = Unassignment Date is greater than the 'End Date' or case is not closed and Assignment Date between 'Start Date' and (including the) 'End Date' or Assignment Date is before the 'Start Date' plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TotalCases" DataType="System.Int32" FilterControlAltText="Filter TotalCases column" HeaderText="Total" ReadOnly="True" SortExpression="TotalCases" UniqueName="TotalCases" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Total Cases = Active at Start + New Assignments + Bail Only + Probation Violation">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h1 class="panel-title">Office Cases</h1>
                        </div>
                        <telerik:RadGrid ID="gridOfficeCasesMetrics" runat="server"
                            AllowPaging="False"
                            AllowSorting="False"
                            ShowFooter="True"
                            ShowGroupPanel="False"
                            CellSpacing="0" CellPadding="1"
                            Width="100%"
                            HorizontalAlign="Center"
                            AllowFilteringByColumn="False"
                            PagerStyle-AlwaysVisible="False"
                            RenderMode="Lightweight"
                            DataSourceID="dsCasesByOfficesMetrics"
                            AllowMultiRowSelection="true"
                            ClientSettings-Selecting-AllowRowSelect="true">
                            <HeaderStyle Wrap="false" CssClass="rgHeader small" Font-Size="Small" />
                            <FooterStyle CssClass="small" Font-Size="Small" Font-Bold="true" />
                            <ClientSettings
                                EnablePostBackOnRowClick="True">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <ExportSettings ExportOnlyData="True"
                                HideStructureColumns="False" IgnorePaging="True"
                                Excel-Format="ExcelML">
                            </ExportSettings>
                            <MasterTableView
                                AutoGenerateColumns="False"
                                GroupLoadMode="Server"
                                EnableGroupsExpandAll="False"
                                CommandItemDisplay="Top"
                                ShowFooter="True"
                                CellSpacing="0"
                                CellPadding="1">
                                <CommandItemSettings
                                    ShowAddNewRecordButton="False"
                                    ShowRefreshButton="false"
                                    ShowExportToCsvButton="True"
                                    ShowExportToExcelButton="True"
                                    ShowExportToPdfButton="True"
                                    ShowExportToWordButton="True"
                                    ShowPrintButton="True" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="OfficeName" FilterControlAltText="Filter OfficeName column" HeaderText="Offices" SortExpression="OfficeName" UniqueName="OfficeName"
                                        ItemStyle-Font-Bold="true"
                                        ItemStyle-Wrap="false"
                                        FooterStyle-CssClass="no-wrap"
                                        FooterText="Total"
                                        HeaderTooltip="CPCS Units"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="rowHeader">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActiveAtStart" DataType="System.Int32" FilterControlAltText="Filter ActiveAtStart column" HeaderText="Start" ReadOnly="True" SortExpression="ActiveAtStart" UniqueName="ActiveAtStart" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Active at Start = Opening Date is before the 'Start Date' and Closing Date is either greater than or equal to the 'Start Date' OR the case is not closed plus: the unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn
                                        DataField="NewCases"
                                        DataType="System.Int32"
                                        FilterControlAltText="Filter NewCases column"
                                        HeaderText="New"
                                        ReadOnly="True"
                                        SortExpression="NewCases"
                                        UniqueName="NewCases"
                                        Aggregate="Sum"
                                        ItemStyle-Wrap="false"
                                        FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="New Cases = Opening Date is BETWEEN the 'Start Date' and (including the) 'End Date' and the CaseType Excludes 'Bail Only' and 'Probation Violation' Cases and there is an Opening Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BailOnly" DataType="System.Int32" FilterControlAltText="Filter BailOnly column" HeaderText="Bail" ReadOnly="True" SortExpression="BailOnly" UniqueName="BailOnly" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Bail Only = Opening Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Bail Only' cases and there is an Opening Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ProbationViolation" DataType="System.Int32" FilterControlAltText="Filter ProbationViolation column" HeaderText="Prob" ReadOnly="True" SortExpression="ProbationViolation" UniqueName="ProbationViolation" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Probabtion Violation = Opening Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Probation Violation' cases and there is an Opening Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ClosedCases" DataType="System.Int32" FilterControlAltText="Filter ClosedCases column" HeaderText="Clsd" ReadOnly="True" SortExpression="UnAssigned" UniqueName="ClosedCases" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Closed Cases = Closing Date is BETWEEN the 'Start Date' and (including the) 'End Date' and there is a Closing Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActiveAtEnd" DataType="System.Int32" FilterControlAltText="Filter ActiveAtEnd column" HeaderText="End" ReadOnly="True" SortExpression="ActiveEnd" UniqueName="ActiveAtEnd" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Active Cases at End = Closing Date is greater than the 'End Date' or case is not closed and Opening Date between 'Start Date' and (including the) 'End Date' or Opening Date is before the 'Start Date' plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TotalCases" DataType="System.Int32" FilterControlAltText="Filter TotalCases column" HeaderText="Total" ReadOnly="True" SortExpression="TotalCases" UniqueName="TotalCases" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Total Cases = Active at Start + New Cases + Bail Only + Probation Violation">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </div>
            </div>
        </telerik:RadPageView>
        <telerik:RadPageView ID="OfficeUnitGroup" runat="server">
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h1 class="panel-title">Offices/Unit Assignments</h1>
                        </div>
                        <telerik:RadGrid ID="gridOfficeUnitAssignmentMetrics" runat="server"
                            AllowPaging="False"
                            AllowSorting="False"
                            ShowFooter="True"
                            ShowGroupPanel="False"
                            CellSpacing="0"
                            CellPadding="1"
                            PageSize="100"
                            Width="100%"
                            HorizontalAlign="Center"
                            AllowFilteringByColumn="False"
                            PagerStyle-AlwaysVisible="False"
                            RenderMode="Lightweight"
                            DataSourceID="dsGroupedAssignments"
                            AllowMultiRowSelection="true"
                            ClientSettings-Selecting-AllowRowSelect="true"
                            MasterTableView-ExpandCollapseColumn-Visible="False">
                            <HeaderStyle Wrap="false" CssClass="rgHeader small" Font-Size="Small" />
                            <FooterStyle Font-Size="Medium" Font-Bold="true" />
                            <ClientSettings
                                EnablePostBackOnRowClick="True" AllowGroupExpandCollapse="False" AllowExpandCollapse="False">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <ExportSettings ExportOnlyData="True"
                                HideStructureColumns="False" IgnorePaging="True"
                                Excel-Format="ExcelML">
                            </ExportSettings>
                            <GroupingSettings IgnorePagingForGroupAggregates="True" RetainGroupFootersVisibility="True" />
                            <GroupHeaderItemStyle Font-Bold="true" Font-Size="Medium" ForeColor="#DA3B36" />
                            <GroupPanel>
                            </GroupPanel>
                            <MasterTableView
                                AutoGenerateColumns="False"
                                GroupLoadMode="Server"
                                EnableGroupsExpandAll="false"
                                CommandItemDisplay="Top"
                                CellSpacing="0"
                                CellPadding="1"
                                ShowGroupFooter="true"
                                ShowFooter="True">
                                <ExpandCollapseColumn Visible="false" Display="false"></ExpandCollapseColumn>
                                <CommandItemSettings
                                    ShowAddNewRecordButton="False"
                                    ShowRefreshButton="false"
                                    ShowExportToCsvButton="True"
                                    ShowExportToExcelButton="True"
                                    ShowExportToPdfButton="True"
                                    ShowExportToWordButton="True"
                                    ShowPrintButton="True" />
                                <Columns>
                                    <%--          <telerik:GridBoundColumn DataField="OfficeName" FilterControlAltText="Filter OfficeName column" HeaderText="Offices" SortExpression="OfficeName" UniqueName="OfficeName"
ItemStyle-Font-Bold="true"
ItemStyle-Wrap="false"
FooterStyle-CssClass="no-wrap"
FooterText="Total"
HeaderTooltip="CPCS Offices"
HeaderStyle-HorizontalAlign="Center">
</telerik:GridBoundColumn>--%>
                                    <telerik:GridBoundColumn DataField="UnitTypeName" FilterControlAltText="Filter UnitTypeName column" HeaderText="Units" SortExpression="UnitTypeName" UniqueName="UnitTypeName"
                                        ItemStyle-Font-Bold="true"
                                        ItemStyle-Wrap="false"
                                        FooterStyle-CssClass="no-wrap"
                                        FooterText="Total"
                                        HeaderTooltip="CPCS Units"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="rowHeader">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActiveAtStart" DataType="System.Int32" FilterControlAltText="Filter ActiveAtStart column" HeaderText="Start" ReadOnly="True" SortExpression="ActiveAtStart" UniqueName="ActiveAtStart" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Active Assignments at Start = Assignment Date is before the 'Start Date' and Unassignment Date is either greater than or equal to the 'Start Date' OR the case is not closed plus: the unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BailOnlyAssigned" DataType="System.Int32" FilterControlAltText="Filter BailOnlyAssigned column" HeaderText="Bail" ReadOnly="True" SortExpression="BailOnlyAssigned" UniqueName="BailOnlyAssigned" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Bail Only = Assignment Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Bail Only' cases and there is an Assignment Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ProbationViolationAssigned" DataType="System.Int32" FilterControlAltText="Filter ProbationViolationAssigned column" HeaderText="Prob" ReadOnly="True" SortExpression="ProbationViolationAssigned" UniqueName="ProbationViolationAssigned" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Probabtion Violation = Assignment Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Probation Violation' cases and there is an Assignment Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Assigned" DataType="System.Int32" FilterControlAltText="Filter Assigned column" HeaderText="Asd" ReadOnly="True" SortExpression="Assigned" UniqueName="Asd" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Assigned Cases = All new cases assigned BETWEEN the 'Start Date' and  'End Date'">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="UnAssigned" DataType="System.Int32" FilterControlAltText="Filter UnAssigned column" HeaderText="Un-Asd" ReadOnly="True" SortExpression="UnAssigned" UniqueName="UnAssigned" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="UnAssignments =  Cases closed/unassigned BETWEEN the 'Start Date' and 'End Date'">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActiveAtEnd" DataType="System.Int32" FilterControlAltText="Filter ActiveAtEnd column" HeaderText="End" ReadOnly="True" SortExpression="ActiveEnd" UniqueName="ActiveAtEnd" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Active Cases at End = Unassignment Date is greater than the 'End Date' or case is not closed and Assignment Date between 'Start Date' and (including the) 'End Date' or Assignment Date is before the 'Start Date' plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TotalCases" DataType="System.Int32" FilterControlAltText="Filter TotalCases column" HeaderText="Total" ReadOnly="True" SortExpression="TotalCases" UniqueName="TotalCases" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Total Cases = Active at Start + New Assignments + Bail Only + Probation Violation">
                                    </telerik:GridBoundColumn>
                                </Columns>
                                <GroupByExpressions>
                                    <telerik:GridGroupByExpression>
                                        <SelectFields>
                                            <telerik:GridGroupByField FieldName="OfficeName" HeaderText=" " HeaderValueSeparator=" " />
                                        </SelectFields>
                                        <GroupByFields>
                                            <telerik:GridGroupByField FieldName="OfficeName" SortOrder="Ascending" />
                                        </GroupByFields>
                                    </telerik:GridGroupByExpression>
                                </GroupByExpressions>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h1 class="panel-title">Offices/Units Cases</h1>
                        </div>
                        <telerik:RadGrid ID="gridOfficeUnitsCasesMetrics" runat="server"
                            AllowPaging="False"
                            AllowSorting="False"
                            ShowFooter="True"
                            ShowGroupPanel="False"
                            CellSpacing="0" CellPadding="1"
                            Width="100%"
                            HorizontalAlign="Center"
                            AllowFilteringByColumn="False"
                            PagerStyle-AlwaysVisible="False"
                            RenderMode="Lightweight"
                            DataSourceID="dsGroupedCases"
                            AllowMultiRowSelection="true"
                            ClientSettings-Selecting-AllowRowSelect="true">
                            <HeaderStyle Wrap="false" CssClass="rgHeader small" Font-Size="Small" />
                            <FooterStyle Font-Size="Medium" Font-Bold="true" />
                            <ClientSettings
                                EnablePostBackOnRowClick="True" AllowGroupExpandCollapse="False" AllowExpandCollapse="False">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <ExportSettings ExportOnlyData="True"
                                HideStructureColumns="False" IgnorePaging="True"
                                Excel-Format="ExcelML">
                            </ExportSettings>
                            <GroupingSettings IgnorePagingForGroupAggregates="True" RetainGroupFootersVisibility="True" />
                            <GroupHeaderItemStyle Font-Bold="true" Font-Size="Medium" ForeColor="#DA3B36" />
                            <GroupPanel>
                            </GroupPanel>
                            <MasterTableView
                                AutoGenerateColumns="False"
                                GroupLoadMode="Server"
                                EnableGroupsExpandAll="False"
                                CommandItemDisplay="Top"
                                CellSpacing="0"
                                CellPadding="1"
                                ShowGroupFooter="true"
                                ShowFooter="True">
                                <CommandItemSettings
                                    ShowAddNewRecordButton="False"
                                    ShowRefreshButton="false"
                                    ShowExportToCsvButton="True"
                                    ShowExportToExcelButton="True"
                                    ShowExportToPdfButton="True"
                                    ShowExportToWordButton="True"
                                    ShowPrintButton="True" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="UnitTypeName" FilterControlAltText="Filter UnitTypeName column" HeaderText="Units" SortExpression="UnitTypeName" UniqueName="UnitTypeName"
                                        ItemStyle-Font-Bold="true"
                                        ItemStyle-Wrap="false"
                                        FooterStyle-CssClass="no-wrap"
                                        FooterText="Total"
                                        HeaderTooltip="CPCS Units"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="rowHeader">
                                    </telerik:GridBoundColumn>
                                    <%--       <telerik:GridBoundColumn DataField="OfficeName" FilterControlAltText="Filter OfficeName column" HeaderText="Offices" SortExpression="OfficeName" UniqueName="OfficeName"
ItemStyle-Font-Bold="true"
ItemStyle-Wrap="false"
FooterStyle-CssClass="no-wrap"
FooterText="Total"
HeaderTooltip="CPCS Offices"
HeaderStyle-HorizontalAlign="Center">
</telerik:GridBoundColumn>--%>
                                    <telerik:GridBoundColumn DataField="ActiveAtStart" DataType="System.Int32" FilterControlAltText="Filter ActiveAtStart column" HeaderText="Start" ReadOnly="True" SortExpression="ActiveAtStart" UniqueName="ActiveAtStart" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Active at Start = Opening Date is before the 'Start Date' and Closing Date is either greater than or equal to the 'Start Date' OR the case is not closed plus: the unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn
                                        DataField="NewCases"
                                        DataType="System.Int32"
                                        FilterControlAltText="Filter NewCases column"
                                        HeaderText="New"
                                        ReadOnly="True"
                                        SortExpression="NewCases"
                                        UniqueName="NewCases"
                                        Aggregate="Sum"
                                        ItemStyle-Wrap="false"
                                        FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="New Cases = Opening Date is BETWEEN the 'Start Date' and (including the) 'End Date' and the CaseType Excludes 'Bail Only' and 'Probation Violation' Cases and there is an Opening Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BailOnly" DataType="System.Int32" FilterControlAltText="Filter BailOnly column" HeaderText="Bail" ReadOnly="True" SortExpression="BailOnly" UniqueName="BailOnly" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Bail Only = Opening Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Bail Only' cases and there is an Opening Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ProbationViolation" DataType="System.Int32" FilterControlAltText="Filter ProbationViolation column" HeaderText="Prob" ReadOnly="True" SortExpression="ProbationViolation" UniqueName="ProbationViolation" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Probabtion Violation = Opening Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Probation Violation' cases and there is an Opening Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ClosedCases" DataType="System.Int32" FilterControlAltText="Filter ClosedCases column" HeaderText="Clsd" ReadOnly="True" SortExpression="UnAssigned" UniqueName="ClosedCases" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Closed Cases = Closing Date is BETWEEN the 'Start Date' and (including the) 'End Date' and there is a Closing Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActiveAtEnd" DataType="System.Int32" FilterControlAltText="Filter ActiveAtEnd column" HeaderText="End" ReadOnly="True" SortExpression="ActiveEnd" UniqueName="ActiveAtEnd" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Active Cases at End = Closing Date is greater than the 'End Date' or case is not closed and Opening Date between 'Start Date' and (including the) 'End Date' or Opening Date is before the 'Start Date' plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TotalCases" DataType="System.Int32" FilterControlAltText="Filter TotalCases column" HeaderText="Total" ReadOnly="True" SortExpression="TotalCases" UniqueName="TotalCases" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Total Cases = Active at Start + New Cases + Bail Only + Probation Violation">
                                    </telerik:GridBoundColumn>
                                </Columns>
                                <GroupByExpressions>
                                    <telerik:GridGroupByExpression>
                                        <SelectFields>
                                            <telerik:GridGroupByField FieldName="OfficeName" HeaderText=" " HeaderValueSeparator=" " />
                                        </SelectFields>
                                        <GroupByFields>
                                            <telerik:GridGroupByField FieldName="OfficeName" SortOrder="Ascending" />
                                        </GroupByFields>
                                    </telerik:GridGroupByExpression>
                                </GroupByExpressions>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </div>
            </div>
        </telerik:RadPageView>
        <telerik:RadPageView ID="UnitOfficeGroup" runat="server">
            <div class="row">
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h1 class="panel-title">Units/Offices Assignments</h1>
                        </div>
                        <telerik:RadGrid ID="gridUnitOfficeAssignmentMetrics" runat="server"
                            AllowPaging="False"
                            AllowSorting="False"
                            ShowFooter="True"
                            ShowGroupPanel="False"
                            CellSpacing="0"
                            CellPadding="1"
                            PageSize="100"
                            Width="100%"
                            HorizontalAlign="Center"
                            AllowFilteringByColumn="False"
                            PagerStyle-AlwaysVisible="False"
                            RenderMode="Lightweight"
                            DataSourceID="dsGroupedAssignments"
                            AllowMultiRowSelection="true"
                            ClientSettings-Selecting-AllowRowSelect="true">
                            <HeaderStyle Wrap="false" CssClass="rgHeader small" Font-Size="Small" />
                            <FooterStyle Font-Size="Medium" Font-Bold="true" />
                            <ClientSettings
                                EnablePostBackOnRowClick="True" AllowGroupExpandCollapse="False" AllowExpandCollapse="False">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <ExportSettings ExportOnlyData="True"
                                HideStructureColumns="False" IgnorePaging="True"
                                Excel-Format="ExcelML">
                            </ExportSettings>
                            <GroupingSettings IgnorePagingForGroupAggregates="True" RetainGroupFootersVisibility="True" />
                            <GroupHeaderItemStyle Font-Bold="true" Font-Size="Medium" ForeColor="#DA3B36" />
                            <GroupPanel>
                            </GroupPanel>
                            <MasterTableView
                                AutoGenerateColumns="False"
                                GroupLoadMode="Server"
                                EnableGroupsExpandAll="false"
                                CommandItemDisplay="Top"
                                CellSpacing="0"
                                CellPadding="1"
                                ShowGroupFooter="true"
                                ShowFooter="True">
                                <CommandItemSettings
                                    ShowAddNewRecordButton="False"
                                    ShowRefreshButton="false"
                                    ShowExportToCsvButton="True"
                                    ShowExportToExcelButton="True"
                                    ShowExportToPdfButton="True"
                                    ShowExportToWordButton="True"
                                    ShowPrintButton="True" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="OfficeName" FilterControlAltText="Filter OfficeName column" HeaderText="Offices" SortExpression="OfficeName" UniqueName="OfficeName"
                                        ItemStyle-Font-Bold="true"
                                        ItemStyle-Wrap="false"
                                        FooterStyle-CssClass="no-wrap"
                                        FooterText="Total"
                                        HeaderTooltip="CPCS Offices"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="rowHeader">
                                    </telerik:GridBoundColumn>
                                    <%--                            <telerik:GridBoundColumn DataField="UnitTypeName" FilterControlAltText="Filter UnitTypeName column" HeaderText="Units" SortExpression="UnitTypeName" UniqueName="UnitTypeName"
ItemStyle-Font-Bold="true"
ItemStyle-Wrap="false"
FooterStyle-CssClass="no-wrap"
FooterText="Total"
HeaderTooltip="CPCS Units"
HeaderStyle-HorizontalAlign="Center">
</telerik:GridBoundColumn>--%>
                                    <telerik:GridBoundColumn DataField="ActiveAtStart" DataType="System.Int32" FilterControlAltText="Filter ActiveAtStart column" HeaderText="Start" ReadOnly="True" SortExpression="ActiveAtStart" UniqueName="ActiveAtStart" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Active Assignments at Start = Assignment Date is before the 'Start Date' and Unassignment Date is either greater than or equal to the 'Start Date' OR the case is not closed plus: the unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BailOnlyAssigned" DataType="System.Int32" FilterControlAltText="Filter BailOnlyAssigned column" HeaderText="Bail" ReadOnly="True" SortExpression="BailOnlyAssigned" UniqueName="BailOnlyAssigned" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Bail Only = Assignment Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Bail Only' cases and there is an Assignment Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ProbationViolationAssigned" DataType="System.Int32" FilterControlAltText="Filter ProbationViolationAssigned column" HeaderText="Prob" ReadOnly="True" SortExpression="ProbationViolationAssigned" UniqueName="ProbationViolationAssigned" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Probabtion Violation = Assignment Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Probation Violation' cases and there is an Assignment Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Assigned" DataType="System.Int32" FilterControlAltText="Filter Assigned column" HeaderText="Asd" ReadOnly="True" SortExpression="Assigned" UniqueName="Asd" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Assigned Cases = All new cases assigned BETWEEN the 'Start Date' and  'End Date'">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="UnAssigned" DataType="System.Int32" FilterControlAltText="Filter UnAssigned column" HeaderText="Un-Asd" ReadOnly="True" SortExpression="UnAssigned" UniqueName="UnAssigned" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="UnAssignments =  Cases closed/unassigned BETWEEN the 'Start Date' and 'End Date'">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActiveAtEnd" DataType="System.Int32" FilterControlAltText="Filter ActiveAtEnd column" HeaderText="End" ReadOnly="True" SortExpression="ActiveEnd" UniqueName="ActiveAtEnd" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Active Cases at End = Unassignment Date is greater than the 'End Date' or case is not closed and Assignment Date between 'Start Date' and (including the) 'End Date' or Assignment Date is before the 'Start Date' plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TotalCases" DataType="System.Int32" FilterControlAltText="Filter TotalCases column" HeaderText="Total" ReadOnly="True" SortExpression="TotalCases" UniqueName="TotalCases" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Total Cases = Active at Start + New Assignments + Bail Only + Probation Violation">
                                    </telerik:GridBoundColumn>
                                </Columns>
                                <GroupByExpressions>
                                    <telerik:GridGroupByExpression>
                                        <SelectFields>
                                            <telerik:GridGroupByField FieldName="UnitTypeName" HeaderText=" " HeaderValueSeparator=" " />
                                        </SelectFields>
                                        <GroupByFields>
                                            <telerik:GridGroupByField FieldName="UnitTypeName" SortOrder="Ascending" />
                                        </GroupByFields>
                                    </telerik:GridGroupByExpression>
                                </GroupByExpressions>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h1 class="panel-title">Units/Offices Cases</h1>
                        </div>
                        <telerik:RadGrid ID="gridUnitOfficesCasesMetrics" runat="server"
                            AllowPaging="False"
                            AllowSorting="False"
                            ShowFooter="True"
                            ShowGroupPanel="False"
                            CellSpacing="0" CellPadding="1"
                            Width="100%"
                            HorizontalAlign="Center"
                            AllowFilteringByColumn="False"
                            PagerStyle-AlwaysVisible="False"
                            RenderMode="Lightweight"
                            DataSourceID="dsGroupedCases"
                            AllowMultiRowSelection="true"
                            ClientSettings-Selecting-AllowRowSelect="true">
                            <HeaderStyle Wrap="false" CssClass="rgHeader small" Font-Size="Small" />
                            <FooterStyle Font-Size="Medium" Font-Bold="true" />
                            <ClientSettings
                                EnablePostBackOnRowClick="True" AllowGroupExpandCollapse="False" AllowExpandCollapse="False">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                            <ExportSettings ExportOnlyData="True"
                                HideStructureColumns="False" IgnorePaging="True"
                                Excel-Format="ExcelML">
                            </ExportSettings>
                            <GroupingSettings IgnorePagingForGroupAggregates="True" RetainGroupFootersVisibility="True" />
                            <GroupHeaderItemStyle Font-Bold="true" Font-Size="Medium" ForeColor="#DA3B36" />
                            <GroupPanel>
                            </GroupPanel>
                            <MasterTableView
                                AutoGenerateColumns="False"
                                GroupLoadMode="Server"
                                EnableGroupsExpandAll="False"
                                CommandItemDisplay="Top"
                                CellSpacing="0"
                                CellPadding="1"
                                ShowGroupFooter="true"
                                ShowFooter="True">
                                <CommandItemSettings
                                    ShowAddNewRecordButton="False"
                                    ShowRefreshButton="false"
                                    ShowExportToCsvButton="True"
                                    ShowExportToExcelButton="True"
                                    ShowExportToPdfButton="True"
                                    ShowExportToWordButton="True"
                                    ShowPrintButton="True" />
                                <Columns>
                                    <%-- <telerik:GridBoundColumn DataField="UnitTypeName" FilterControlAltText="Filter UnitTypeName column" HeaderText="Units" SortExpression="UnitTypeName" UniqueName="UnitTypeName"
ItemStyle-Font-Bold="true"
ItemStyle-Wrap="false"
FooterStyle-CssClass="no-wrap"
FooterText="Total"
HeaderTooltip="CPCS Units"
HeaderStyle-HorizontalAlign="Center">
</telerik:GridBoundColumn>--%>
                                    <telerik:GridBoundColumn DataField="OfficeName" FilterControlAltText="Filter OfficeName column" HeaderText="Offices" SortExpression="OfficeName" UniqueName="OfficeName"
                                        ItemStyle-Font-Bold="true"
                                        ItemStyle-Wrap="false"
                                        FooterStyle-CssClass="no-wrap"
                                        FooterText="Total"
                                        HeaderTooltip="CPCS Offices"
                                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="rowHeader">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActiveAtStart" DataType="System.Int32" FilterControlAltText="Filter ActiveAtStart column" HeaderText="Start" ReadOnly="True" SortExpression="ActiveAtStart" UniqueName="ActiveAtStart" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Active at Start = Opening Date is before the 'Start Date' and Closing Date is either greater than or equal to the 'Start Date' OR the case is not closed plus: the unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn
                                        DataField="NewCases"
                                        DataType="System.Int32"
                                        FilterControlAltText="Filter NewCases column"
                                        HeaderText="New"
                                        ReadOnly="True"
                                        SortExpression="NewCases"
                                        UniqueName="NewCases"
                                        Aggregate="Sum"
                                        ItemStyle-Wrap="false"
                                        FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="New Cases = Opening Date is BETWEEN the 'Start Date' and (including the) 'End Date' and the CaseType Excludes 'Bail Only' and 'Probation Violation' Cases and there is an Opening Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="BailOnly" DataType="System.Int32" FilterControlAltText="Filter BailOnly column" HeaderText="Bail" ReadOnly="True" SortExpression="BailOnly" UniqueName="BailOnly" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Bail Only = Opening Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Bail Only' cases and there is an Opening Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ProbationViolation" DataType="System.Int32" FilterControlAltText="Filter ProbationViolation column" HeaderText="Prob" ReadOnly="True" SortExpression="ProbationViolation" UniqueName="ProbationViolation" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Probabtion Violation = Opening Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Probation Violation' cases and there is an Opening Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ClosedCases" DataType="System.Int32" FilterControlAltText="Filter ClosedCases column" HeaderText="Clsd" ReadOnly="True" SortExpression="UnAssigned" UniqueName="ClosedCases" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Closed Cases = Closing Date is BETWEEN the 'Start Date' and (including the) 'End Date' and there is a Closing Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="ActiveAtEnd" DataType="System.Int32" FilterControlAltText="Filter ActiveAtEnd column" HeaderText="End" ReadOnly="True" SortExpression="ActiveEnd" UniqueName="ActiveAtEnd" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Active Cases at End = Closing Date is greater than the 'End Date' or case is not closed and Opening Date between 'Start Date' and (including the) 'End Date' or Opening Date is before the 'Start Date' plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="TotalCases" DataType="System.Int32" FilterControlAltText="Filter TotalCases column" HeaderText="Total" ReadOnly="True" SortExpression="TotalCases" UniqueName="TotalCases" Aggregate="Sum"
                                        ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                                        FooterText=" "
                                        HeaderTooltip="Total Cases = Active at Start + New Cases + Bail Only + Probation Violation">
                                    </telerik:GridBoundColumn>
                                </Columns>
                                <GroupByExpressions>
                                    <telerik:GridGroupByExpression>
                                        <SelectFields>
                                            <telerik:GridGroupByField FieldName="UnitTypeName" HeaderText=" " HeaderValueSeparator=" " />
                                        </SelectFields>
                                        <GroupByFields>
                                            <telerik:GridGroupByField FieldName="UnitTypeName" SortOrder="Ascending" />
                                        </GroupByFields>
                                    </telerik:GridGroupByExpression>
                                </GroupByExpressions>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </div>
            </div>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <div class="row-spacer clearfix"></div>


    <telerik:RadTabStrip RenderMode="Classic" ID="tabstripDetails" runat="server" MultiPageID="multipageDetails"
        SelectedIndex="0" AutoPostBack="True">
        <Tabs>
            <telerik:RadTab Text="Assignments" runat="server" PageViewID="AssignmentDetailsGroup" SelectedCssClass="bold" Selected="True" ToolTip="Assignment Details">
            </telerik:RadTab>
            <telerik:RadTab Text="Cases" runat="server" PageViewID="CaseDetailsGroup" SelectedCssClass="bold" ToolTip="Case Details">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" ID="multipageDetails" RenderSelectedPageOnly="true" SelectedIndex="0">
        <telerik:RadPageView ID="AssignmentDetailsGroup" runat="server" Selected="true">
            <telerik:RadGrid ID="gridUnitAssignments"
                runat="server"
                AllowSorting="True"
                ShowFooter="True"
                AllowPaging="True"
                CellSpacing="-1"
                PageSize="10"
                Width="100%"
                HorizontalAlign="Center"
                PagerStyle-AlwaysVisible="true"
                RenderMode="Lightweight"
                DataSourceID="dsAssignments"
                DataKeyNames="AttorneyID"
                EnableHierarchyExpandAll="True"
                AllowMultiRowSelection="true">
               
                            <HeaderStyle Wrap="false" CssClass="rgHeaderAlt small" Font-Size="Small" />
                            <FooterStyle CssClass="small" Font-Size="Small" Font-Bold="true" />
                <ClientSettings
                    EnablePostBackOnRowClick="True" AllowGroupExpandCollapse="true" AllowExpandCollapse="true">
                    <Selecting AllowRowSelect="True" EnableDragToSelectRows="true" />
                </ClientSettings>
                <ExportSettings ExportOnlyData="True"
                    HideStructureColumns="False"
                    IgnorePaging="false"
                    Excel-Format="ExcelML">
                </ExportSettings>
                <MasterTableView
                    AutoGenerateColumns="False"
                    CommandItemDisplay="Top"
                    ShowFooter="True"
                    EnableLinqGrouping="false"
                    AllowMultiColumnSorting="True"
                    DataSourceID="dsAssignments"
                    DataKeyNames="AttorneyID"
                    HierarchyDefaultExpanded="false"
                    EnableHierarchyExpandAll="True"
                    GroupsDefaultExpanded="False">
                    <CommandItemSettings
                        ShowAddNewRecordButton="False"
                        ShowRefreshButton="false"
                        ShowExportToCsvButton="True"
                        ShowExportToExcelButton="True"
                        ShowExportToPdfButton="True"
                        ShowExportToWordButton="True"
                        ShowPrintButton="True" />
                    <DetailTables>
                        <telerik:GridTableView
                            HierarchyDefaultExpanded="false"
                            EnableHierarchyExpandAll="true"
                            DataKeyNames="CaseGUID, CaseNumber, AttorneyID"
                            DataSourceID="dsAttorneyCases"
                            Width="100%"
                            ShowHeader="true"
                            ShowFooter="true"
                            AutoGenerateColumns="false"
                            AllowPaging="True"
                            runat="server"
                            HierarchyLoadMode="ServerOnDemand"
                            Name="AttorneyDetails"
                             HeaderStyle-CssClass="rgHeader small"

                            >
                            
                            <HeaderStyle Wrap="false" CssClass="rgHeader small" Font-Size="Small" />

                            <DetailTables>
                                <telerik:GridTableView
                                    HierarchyDefaultExpanded="false"
                                    EnableHierarchyExpandAll="true"
                                    DataKeyNames="CaseGUID, CaseNumber"
                                    DataSourceID="dsCaseDetails"
                                    Width="100%"
                                    ShowHeader="false"
                                    ShowFooter="false"
                                    AutoGenerateColumns="false"
                                    AllowPaging="False"
                                    runat="server"
                                    HierarchyLoadMode="ServerOnDemand"
                                    Name="CaseDetails">
                                    <ParentTableRelation>
                                        <telerik:GridRelationFields DetailKeyField="CaseNumber" MasterKeyField="CaseNumber"></telerik:GridRelationFields>
                                    </ParentTableRelation> 

                                    <DetailTables>
                                <telerik:GridTableView
                                    HierarchyDefaultExpanded="false"
                                    EnableHierarchyExpandAll="true"
                                    DataKeyNames="CaseGUID, CaseNumber"
                                    DataSourceID="odsCaseCharges"
                                    Width="100%"
                                    ShowHeader="false"
                                    ShowFooter="false"
                                    AutoGenerateColumns="false"
                                    AllowPaging="False"
                                    runat="server"
                                    HierarchyLoadMode="ServerOnDemand"
                                    Name="CaseCharges">
                                    <ParentTableRelation>
                                        <telerik:GridRelationFields DetailKeyField="CaseGUID" MasterKeyField="CaseGUID"></telerik:GridRelationFields>
                                    </ParentTableRelation>
                                    <Columns>
                                        <telerik:GridTemplateColumn DataField="CaseGUID" FilterControlAltText="Filter CaseGUID column" UniqueName="CaseGUID">
                                            <ItemTemplate> 
                                                <uc1:CaseCharges runat="server" id="CaseCharges" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </telerik:GridTableView>
                            </DetailTables> 

                                    <Columns>
                                        <telerik:GridTemplateColumn DataField="CaseNumber" FilterControlAltText="Filter CaseNumber column" UniqueName="CaseNumber">
                                            <ItemTemplate>
                                                <uc1:CaseDetails runat="server" ID="CaseDetails" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </telerik:GridTableView>
                            </DetailTables>
                            <ParentTableRelation>
                                <telerik:GridRelationFields DetailKeyField="AttorneyID" MasterKeyField="AttorneyID"></telerik:GridRelationFields>
                            </ParentTableRelation>
                            <Columns>
                                <telerik:GridTemplateColumn Aggregate="CountDistinct" DataField="CaseNumber" FilterControlAltText="Filter CaseNumber column" FooterText="Unique Cases: " HeaderText="Case Number" SortExpression="CaseNumber" UniqueName="CaseNumber" ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text" HeaderStyle-CssClass="rgHeader small">
                                    <ItemTemplate>
                                        <a href="/apps/casemanagement/managementcasedetails.aspx?caseguid=<%# Eval("CaseGUID") %>" target="_blank" title="view case details" class="bold"><%# Eval("CaseNumber") %></a>
                                    </ItemTemplate>
                                    <FooterStyle CssClass="footer-text"></FooterStyle>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </telerik:GridTemplateColumn>
                               <telerik:GridBoundColumn DataField="DateAssigned" HeaderText="Assigned" SortExpression="DateAssigned" FooterStyle-CssClass="footer-text" DataType="System.DateTime" FilterControlAltText="Filter DateAssigned column" UniqueName="DateAssigned" DataFormatString="{0:d}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="DateUnassigned" HeaderText="Unassigned" SortExpression="DateUnassigned" FooterStyle-CssClass="footer-text" DataType="System.DateTime" FilterControlAltText="Filter DateUnassigned column" UniqueName="DateUnassigned" DataFormatString="{0:d}"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="OfficeName" FilterControlAltText="Filter OfficeName column" HeaderText="Office" SortExpression="OfficeName" UniqueName="OfficeName" Aggregate="CountDistinct" Groupable="true"
                                    ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                                    FooterText="Offices: ">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="UnitTypeName" FilterControlAltText="Filter UnitTypeName column" HeaderText="Unit" ReadOnly="True" SortExpression="UnitTypeName" UniqueName="UnitTypeName" Aggregate="CountDistinct"
                                    ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                                    FooterText="Units: ">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CaseTypeName" FilterControlAltText="Filter CaseTypeName column" HeaderText="Case Type" ReadOnly="True" SortExpression="CaseTypeName" UniqueName="CaseTypeName" Aggregate="CountDistinct"
                                    ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                                    FooterText="Case Types: ">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="CountyName" FilterControlAltText="Filter CountyName column" HeaderText="County" ReadOnly="True" SortExpression="CountyName" UniqueName="CountyName" Aggregate="CountDistinct"
                                    ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                                    FooterText="Counties: ">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="OpeningDate" HeaderText="Opened" SortExpression="OpeningDate" FooterStyle-CssClass="footer-text" DataType="System.DateTime" FilterControlAltText="Filter OpeningDate column" UniqueName="OpeningDate" DataFormatString="{0:d}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="ClosingDate" HeaderText="Closed" SortExpression="ClosingDate" FooterStyle-CssClass="footer-text" DataType="System.DateTime" FilterControlAltText="Filter ClosingDate column" UniqueName="ClosingDate" DataFormatString="{0:d}"></telerik:GridBoundColumn>
                            </Columns>
                            <SortExpressions>
                                <telerik:GridSortExpression FieldName="OpeningDate" SortOrder="Descending"></telerik:GridSortExpression>
                            </SortExpressions>
                        </telerik:GridTableView>
                    </DetailTables>
                    <Columns>
                        <telerik:GridTemplateColumn Aggregate="CountDistinct" DataField="AttorneyName" FilterControlAltText="Filter AttorneyName column" FooterText="<strong>Attorneys:</strong> " FooterStyle-CssClass="footer-text" HeaderText="Attorney" SortExpression="AttorneyName" UniqueName="AttorneyName" Visible="true">
                            <ItemTemplate>
                                <a href="/apps/reports/attorney.aspx?attorneyguid=<%# Eval("AttorneyGUID") %>" target="_blank">
                                    <asp:Label ID="StaffNameLabel" runat="server" Text='<%# GetTitleCase(Eval("AttorneyName")) %>' CssClass="bold"></asp:Label></a>
                            </ItemTemplate>
                            <FooterStyle CssClass="footer-text"></FooterStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="ActiveAtStart" DataType="System.Int32" FilterControlAltText="Filter ActiveAtStart column" HeaderText="Active at Start" ReadOnly="True" SortExpression="ActiveAtStart" UniqueName="ActiveAtStart" Aggregate="Sum"
                            ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                            FooterText=" "
                            HeaderTooltip="Active Assignments at Start = Assignment Date is before the 'Start Date' and Unassignment Date is either greater than or equal to the 'Start Date' OR the case is not closed plus: the unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="BailOnlyAssigned" DataType="System.Int32" FilterControlAltText="Filter BailOnlyAssigned column" HeaderText="Bail Only" ReadOnly="True" SortExpression="BailOnlyAssigned" UniqueName="BailOnlyAssigned" Aggregate="Sum"
                            ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                            FooterText=" "
                            HeaderTooltip="Bail Only = Assignment Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Bail Only' cases and there is an Assignment Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ProbationViolationAssigned" DataType="System.Int32" FilterControlAltText="Filter ProbationViolationAssigned column" HeaderText="Probation" ReadOnly="True" SortExpression="ProbationViolationAssigned" UniqueName="ProbationViolationAssigned" Aggregate="Sum"
                            ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                            FooterText=" "
                            HeaderTooltip="Probabtion Violation = Assignment Date is BETWEEN the 'Start Date' and (including the) 'End Date' and CaseType is for 'Probation Violation' cases and there is an Assignment Date plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Assigned" DataType="System.Int32" FilterControlAltText="Filter Assigned column" HeaderText="Assigned" ReadOnly="True" SortExpression="Assigned" UniqueName="Asd" Aggregate="Sum"
                            ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                            FooterText=" "
                            HeaderTooltip="Assigned Cases = All new cases assigned BETWEEN the 'Start Date' and  'End Date'">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UnAssigned" DataType="System.Int32" FilterControlAltText="Filter UnAssigned column" HeaderText="Unassigned" ReadOnly="True" SortExpression="UnAssigned" UniqueName="UnAssigned" Aggregate="Sum"
                            ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                            FooterText=" "
                            HeaderTooltip="UnAssignments =  Cases closed/unassigned BETWEEN the 'Start Date' and 'End Date'">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ActiveAtEnd" DataType="System.Int32" FilterControlAltText="Filter ActiveAtEnd column" HeaderText="Active at End" ReadOnly="True" SortExpression="ActiveEnd" UniqueName="ActiveAtEnd" Aggregate="Sum"
                            ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                            FooterText=" "
                            HeaderTooltip="Active Cases at End = Unassignment Date is greater than the 'End Date' or case is not closed and Assignment Date between 'Start Date' and (including the) 'End Date' or Assignment Date is before the 'Start Date' plus: unitTypeName is not equal to 'yad' and caseTypeName is not equal to 'education' (non-Edlaw)">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TotalCasesTouched" DataType="System.Int32" FilterControlAltText="Filter TotalCases column" HeaderText="Total Touched" ReadOnly="True" SortExpression="TotalCasesTouched" UniqueName="TotalCasesTouched" Aggregate="Sum"
                            ItemStyle-Wrap="false" FooterStyle-CssClass="no-wrap"
                            FooterText=" "
                            HeaderTooltip="Total Cases Touched = Active at Start + New Assignments + Bail Only + Probation Violation">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <PagerStyle PageSizes="5,10,25,50,100,250,500" Position="TopAndBottom" PageButtonCount="5" />
                </MasterTableView>
                <PagerStyle AlwaysVisible="True"></PagerStyle>
            </telerik:RadGrid>
        </telerik:RadPageView>
        <telerik:RadPageView ID="CaseDetailsGroup" runat="server">
            <telerik:RadGrid ID="gridUnitCases"
                runat="server"
                AllowSorting="True"
                ShowFooter="True"
                AllowPaging="True"
                CellSpacing="-1"
                PageSize="10"
                Width="100%"
                HorizontalAlign="Center"
                PagerStyle-AlwaysVisible="true"
                RenderMode="Lightweight"
                DataSourceID="dsCases"
                DataKeyNames="CaseNumber"
                EnableHierarchyExpandAll="True">
               
                            <HeaderStyle Wrap="false" CssClass="rgHeaderAlt small" Font-Size="Small" />
                            <FooterStyle CssClass="small" Font-Size="Small" Font-Bold="true" />
                <ClientSettings
                    EnablePostBackOnRowClick="True" AllowGroupExpandCollapse="true" AllowExpandCollapse="true">
                    <Selecting AllowRowSelect="True" EnableDragToSelectRows="true" />
                </ClientSettings>
                <ExportSettings ExportOnlyData="True"
                    HideStructureColumns="False"
                    IgnorePaging="false"
                    Excel-Format="ExcelML">
                </ExportSettings>
                <MasterTableView
                    AutoGenerateColumns="False"
                    CommandItemDisplay="Top"
                    ShowFooter="True"
                    EnableLinqGrouping="false"
                    AllowMultiColumnSorting="True"
                    DataSourceID="dsCases"
                    DataKeyNames="CaseNumber"
                    HierarchyDefaultExpanded="false"
                    EnableHierarchyExpandAll="True"
                    GroupsDefaultExpanded="False">
                    <CommandItemSettings
                        ShowAddNewRecordButton="False"
                        ShowRefreshButton="false"
                        ShowExportToCsvButton="True"
                        ShowExportToExcelButton="True"
                        ShowExportToPdfButton="True"
                        ShowExportToWordButton="True"
                        ShowPrintButton="True" />
                    <DetailTables>
                        <telerik:GridTableView
                            EnableHierarchyExpandAll="False"
                            DataKeyNames="AttorneyID"
                            DataSourceID="dsAssignmentDetails"
                            Width="100%"
                            ShowHeader="True"
                            ShowFooter="false"
                            AutoGenerateColumns="False"
                            AllowPaging="False"
                            AllowSorting="false"
                            runat="server"
                            HierarchyLoadMode="ServerOnDemand"
                            Name="AttorneyDetails"
                            CommandItemDisplay="None">
                            <CommandItemSettings
                                ShowAddNewRecordButton="False"
                                ShowRefreshButton="false"
                                ShowExportToCsvButton="True"
                                ShowExportToExcelButton="True"
                                ShowExportToPdfButton="True"
                                ShowExportToWordButton="True"
                                ShowPrintButton="True" />
                            <ParentTableRelation>
                                <telerik:GridRelationFields DetailKeyField="CaseNumber" MasterKeyField="CaseNumber"></telerik:GridRelationFields>
                            </ParentTableRelation>
                            <Columns>
                                <telerik:GridTemplateColumn DataField="AttorneyName" FilterControlAltText="Filter AttorneyName column" FooterText="<strong>Attorneys:</strong> " HeaderText="Attorney" SortExpression="AttorneyName" UniqueName="AttorneyName" Visible="true">
                                    <ItemTemplate>
                                        <a href="/apps/reports/attorney.aspx?attorneyguid=<%# Eval("AttorneyGUID") %>" target="_blank">
                                            <asp:Label ID="StaffNameLabel" runat="server" Text='<%# GetTitleCase(Eval("AttorneyName")) %>' CssClass="bold"></asp:Label></a>
                                    </ItemTemplate>
                                    <FooterStyle CssClass="footer-text"></FooterStyle>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="AssignmentTypeName" HeaderText="Assignment Type" SortExpression="AssignmentTypeName" FooterStyle-CssClass="footer-text" DataType="System.DateTime" FilterControlAltText="Filter AssignmentTypeName column" UniqueName="AssignmentTypeName" DataFormatString="{0:d}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="DateAssigned" HeaderText="Date Assigned" SortExpression="DateAssigned" DataType="System.DateTime" FilterControlAltText="Filter DateAssigned column" UniqueName="DateAssigned" DataFormatString="{0:d}">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="DateUnassigned" HeaderText="Date Unassigned" SortExpression="DateUnassigned" DataType="System.DateTime" FilterControlAltText="Filter DateUnassigned column" UniqueName="DateUnassigned" DataFormatString="{0:d}">
                                </telerik:GridBoundColumn>
                            </Columns>
                            <SortExpressions>
                                <telerik:GridSortExpression FieldName="DateAssigned"></telerik:GridSortExpression>
                            </SortExpressions>
                        </telerik:GridTableView>
                    </DetailTables>
                    <DetailTables>
                        <telerik:GridTableView
                            HierarchyDefaultExpanded="false"
                            EnableHierarchyExpandAll="true"
                            DataKeyNames="CaseGUID, CaseNumber"
                            DataSourceID="dsCaseDetails"
                            Width="100%"
                            ShowHeader="false"
                            ShowFooter="false"
                            AutoGenerateColumns="false"
                            AllowPaging="False"
                            runat="server"
                            HierarchyLoadMode="ServerOnDemand"
                            Name="CaseDetails">
                            <ParentTableRelation>
                                <telerik:GridRelationFields DetailKeyField="CaseNumber" MasterKeyField="CaseNumber"></telerik:GridRelationFields>
                            </ParentTableRelation>


                            
                                    <DetailTables>
                                <telerik:GridTableView
                                    HierarchyDefaultExpanded="false"
                                    EnableHierarchyExpandAll="true"
                                    DataKeyNames="CaseGUID, CaseNumber"
                                    DataSourceID="odsCaseCharges"
                                    Width="100%"
                                    ShowHeader="false"
                                    ShowFooter="false"
                                    AutoGenerateColumns="false"
                                    AllowPaging="False"
                                    runat="server"
                                    HierarchyLoadMode="ServerOnDemand"
                                    Name="CaseCharges">
                                    <ParentTableRelation>
                                        <telerik:GridRelationFields DetailKeyField="CaseGUID" MasterKeyField="CaseGUID"></telerik:GridRelationFields>
                                    </ParentTableRelation>
                                    <Columns>
                                        <telerik:GridTemplateColumn DataField="CaseGUID" FilterControlAltText="Filter CaseGUID column" UniqueName="CaseGUID">
                                            <ItemTemplate> 
                                              <div class="row">  <uc1:CaseCharges runat="server" id="CaseCharges" /></div> 
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                </telerik:GridTableView>
                            </DetailTables>


                            <Columns>
                                <telerik:GridTemplateColumn DataField="CaseNumber" FilterControlAltText="Filter CaseNumber column" UniqueName="CaseNumber">
                                    <ItemTemplate>
                                        <uc1:CaseDetails runat="server" ID="CaseDetails" />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </telerik:GridTableView>
                    </DetailTables>
                    <Columns>
                        <telerik:GridTemplateColumn Aggregate="CountDistinct" DataField="CaseNumber" FilterControlAltText="Filter CaseNumber column" FooterText="Unique Cases: " HeaderText="Case Number" SortExpression="CaseNumber" UniqueName="CaseNumber" ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text">
                            <ItemTemplate>
                                <a href="/apps/casemanagement/managementcasedetails.aspx?caseguid=<%# Eval("CaseGUID") %>" target="_blank" title="view case details" class="bold"><%# Eval("CaseNumber") %></a>
                            </ItemTemplate>
                            <FooterStyle CssClass="footer-text"></FooterStyle>
                            <ItemStyle Wrap="False"></ItemStyle>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="OpeningDate" HeaderText="Opened" SortExpression="OpeningDate" FooterStyle-CssClass="footer-text" DataType="System.DateTime" FilterControlAltText="Filter OpeningDate column" UniqueName="OpeningDate" DataFormatString="{0:d}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ClosingDate" HeaderText="Closed" SortExpression="ClosingDate" FooterStyle-CssClass="footer-text" DataType="System.DateTime" FilterControlAltText="Filter ClosingDate column" UniqueName="ClosingDate" DataFormatString="{0:d}"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="OfficeName" FilterControlAltText="Filter OfficeName column" HeaderText="Office" SortExpression="OfficeName" UniqueName="OfficeName" Aggregate="CountDistinct" Groupable="true"
                            ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                            FooterText="Offices: ">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UnitTypeName" FilterControlAltText="Filter UnitTypeName column" HeaderText="Unit" ReadOnly="True" SortExpression="UnitTypeName" UniqueName="UnitTypeName" Aggregate="CountDistinct"
                            ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                            FooterText="Units: ">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CaseTypeName" FilterControlAltText="Filter CaseTypeName column" HeaderText="Case Type" ReadOnly="True" SortExpression="CaseTypeName" UniqueName="CaseTypeName" Aggregate="CountDistinct"
                            ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                            FooterText="Case Types: ">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CountyName" FilterControlAltText="Filter CountyName column" HeaderText="County" ReadOnly="True" SortExpression="CountyName" UniqueName="CountyName" Aggregate="CountDistinct"
                            ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                            FooterText="Counties: ">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <PagerStyle PageSizes="5,10,25,50,100,250,500" Position="TopAndBottom" PageButtonCount="5" />
                </MasterTableView>
                <PagerStyle AlwaysVisible="True"></PagerStyle>
            </telerik:RadGrid>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <asp:HiddenField ID="hdnStartDate" runat="server" Visible="false" />
    <asp:HiddenField ID="hdnEndDate" runat="server" Visible="false" />
    <asp:HiddenField ID="hdnUnit" runat="server" Visible="false" />
    <asp:HiddenField ID="hdnOffice" runat="server" Visible="false" />
    <asp:HiddenField ID="hdnAttorney" runat="server" Visible="false" />
    <asp:SqlDataSource ID="dsAssignmentsByUnitsMetrics" runat="server" ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>" SelectCommand="SELECT UnitTypeName, sum(ActiveAtStart) ActiveAtStart, sum(ActiveAtEnd) as ActiveAtEnd, sum(BailOnlyAssigned) as BailOnlyAssigned, sum(ProbationViolationAssigned) as ProbationViolationAssigned, sum(Assigned) as Assigned, sum(UnAssigned) as UnAssigned, sum(TotalCasesTouched) as TotalCases FROM [dbo].[FN_Metrics_Assignments](@StartDate,@EndDate) WHERE (ActiveAtStart + ActiveAtEnd + BailOnlyAssigned + ProbationViolationAssigned + Assigned + UnAssigned + totalCasesTouched > 0)
GROUP BY UnitTypeName
ORDER BY UnitTypeName"
        EnableCaching="true">
        <SelectParameters>
            <asp:ControlParameter ControlID="dteStartDate" Name="StartDate"
                PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="dteEndDate" Name="EndDate"
                PropertyName="SelectedDate" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsCasesByUnitsMetrics" runat="server"
        ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>"
        SelectCommand="SELECT UPPER(UnitTypeName) UnitTypeName, sum(ActiveAtStart) ActiveAtStart, sum(ActiveAtEnd) as ActiveAtEnd, sum(NewBailOnly) as BailOnly, sum(NewProbationViolation) as ProbationViolation, sum(NewlyOpenedCases) as 'NewCases', sum(ClosedCases) as ClosedCases, sum(totalCases) as TotalCases FROM [dbo].[FN_Metrics_Cases](@StartDate,@EndDate) WHERE (ActiveAtStart + ActiveAtEnd + NewBailOnly + NewProbationViolation + NewlyOpenedCases + ClosedCases + totalCases > 0) GROUP BY UnitTypeName ORDER BY UnitTypeName"
        EnableCaching="true">
        <SelectParameters>
            <asp:ControlParameter ControlID="dteStartDate" Name="StartDate"
                PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="dteEndDate" Name="EndDate"
                PropertyName="SelectedDate" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsAssignmentsByOfficesMetrics" runat="server" ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>" SelectCommand="SELECT UPPER(OfficeName) OfficeName, sum(ActiveAtStart) ActiveAtStart, sum(ActiveAtEnd) as ActiveAtEnd, sum(BailOnlyAssigned) as BailOnlyAssigned, sum(ProbationViolationAssigned) as ProbationViolationAssigned, sum(Assigned) as Assigned, sum(UnAssigned) as UnAssigned, sum(TotalCasesTouched) as TotalCases FROM [dbo].[FN_Metrics_Assignments](@StartDate,@EndDate) WHERE (ActiveAtStart + ActiveAtEnd + BailOnlyAssigned + ProbationViolationAssigned + Assigned + UnAssigned + totalCasesTouched > 0)
GROUP BY OfficeName
ORDER BY OfficeName"
        EnableCaching="true">
        <SelectParameters>
            <asp:ControlParameter ControlID="dteStartDate" Name="StartDate"
                PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="dteEndDate" Name="EndDate"
                PropertyName="SelectedDate" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsCasesByOfficesMetrics" runat="server"
        ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>"
        SelectCommand="SELECT UPPER(OfficeName) OfficeName, sum(ActiveAtStart) ActiveAtStart, sum(ActiveAtEnd) as ActiveAtEnd, sum(NewBailOnly) as BailOnly, sum(NewProbationViolation) as ProbationViolation, sum(NewlyOpenedCases) as 'NewCases', sum(ClosedCases) as ClosedCases, sum(totalCases) as TotalCases FROM [dbo].[FN_Metrics_Cases](@StartDate,@EndDate) WHERE (ActiveAtStart + ActiveAtEnd + NewBailOnly + NewProbationViolation + NewlyOpenedCases + ClosedCases + totalCases > 0) GROUP BY OfficeName ORDER BY OfficeName"
        EnableCaching="true">
        <SelectParameters>
            <asp:ControlParameter ControlID="dteStartDate" Name="StartDate"
                PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="dteEndDate" Name="EndDate"
                PropertyName="SelectedDate" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsGroupedAssignments" runat="server" ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>" SelectCommand="SELECT OfficeName, UnitTypeName, sum(ActiveAtStart) ActiveAtStart, sum(ActiveAtEnd) as ActiveAtEnd, sum(BailOnlyAssigned) as BailOnlyAssigned, sum(ProbationViolationAssigned) as ProbationViolationAssigned, sum(Assigned) as Assigned, sum(UnAssigned) as UnAssigned, sum(TotalCasesTouched) as TotalCases FROM [dbo].[FN_Metrics_Assignments](@StartDate,@EndDate) WHERE (ActiveAtStart + ActiveAtEnd + BailOnlyAssigned + ProbationViolationAssigned + Assigned + UnAssigned + totalCasesTouched > 0) GROUP BY OfficeName, UnitTypeName"
        EnableCaching="true">
        <SelectParameters>
            <asp:ControlParameter ControlID="dteStartDate" Name="StartDate"
                PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="dteEndDate" Name="EndDate"
                PropertyName="SelectedDate" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsGroupedCases" runat="server"
        ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>"
        SelectCommand="SELECT OfficeName, UnitTypeName, sum(ActiveAtStart) ActiveAtStart, sum(ActiveAtEnd) as ActiveAtEnd, sum(NewBailOnly) as BailOnly, sum(NewProbationViolation) as ProbationViolation, sum(NewlyOpenedCases) as 'NewCases', sum(ClosedCases) as ClosedCases, sum(totalCases) as TotalCases FROM [dbo].[FN_Metrics_Cases](@StartDate,@EndDate) WHERE (ActiveAtStart + ActiveAtEnd + NewBailOnly + NewProbationViolation + NewlyOpenedCases + ClosedCases + totalCases > 0) GROUP BY OfficeName, UnitTypeName"
        EnableCaching="true">
        <SelectParameters>
            <asp:ControlParameter ControlID="dteStartDate" Name="StartDate"
                PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="dteEndDate" Name="EndDate"
                PropertyName="SelectedDate" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsCases" runat="server" ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>"
        SelectCommand="SELECT [CaseGUID], [CaseNumber], [OpeningDate], [ClosingDate], [CaseTypeName], [CountyName], [DivisionShortName],[OfficeName], [UnitTypeName] FROM [dbo].[FN_Metrics_Cases](@StartDate, @EndDate) WHERE (ActiveAtStart + ActiveAtEnd + NewBailOnly + NewProbationViolation + NewlyOpenedCases + ClosedCases + totalCases > 0) GROUP BY [CaseGUID], [CaseNumber], [OpeningDate],[ClosingDate], [CaseTypeName], [CountyName], [DivisionShortName], [OfficeName], [UnitTypeName] ORDER BY OpeningDate ASC"
        EnableCaching="true">
        <SelectParameters>
            <asp:ControlParameter ControlID="dteStartDate" Name="StartDate" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="dteEndDate" Name="EndDate" PropertyName="SelectedDate" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsAssignments" runat="server" ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>"
        SelectCommand="SELECT  [AttorneyID], [AttorneyGUID], [FirstName] + ' ' + [LastName] AS AttorneyName, SUM(ActiveAtStart) ActiveAtStart, SUM(BailOnlyAssigned) BailOnlyAssigned, SUM(Assigned) Assigned, SUM(ProbationViolationAssigned) ProbationViolationAssigned, SUM(UnAssigned) UnAssigned, SUM(ActiveAtEnd) ActiveAtEnd, SUM(TotalCasesTouched) TotalCasesTouched  FROM [dbo].[FN_Metrics_Assignments](@StartDate, @EndDate) WHERE (ActiveAtStart +  Assigned > 0)  GROUP BY [AttorneyID] ,[AttorneyGUID], [FirstName] + ' ' + [LastName] "
        EnableCaching="true">
        <SelectParameters>
            <asp:ControlParameter ControlID="dteStartDate" Name="StartDate" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="dteEndDate" Name="EndDate" PropertyName="SelectedDate" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsAttorneyCases" runat="server" ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>"
        SelectCommand="SELECT [AttorneyID], [CaseGUID], [CaseNumber], [DateAssigned], [DateUnassigned], [OpeningDate], [ClosingDate], [CaseTypeName], [CountyName], [DivisionShortName], [OfficeName], [UnitTypeName] FROM [dbo].[FN_Metrics_Assignments](@StartDate, @EndDate) WHERE (ActiveAtStart + Assigned > 0)  AND (AttorneyID=@AttorneyID) GROUP BY [AttorneyID], [CaseGUID], [CaseNumber], [DateAssigned], [DateUnassigned], [OpeningDate], [ClosingDate], [CaseTypeName], [CountyName], [DivisionShortName], [OfficeName], [UnitTypeName] ORDER BY OpeningDate ASC"
        EnableCaching="true">
        <SelectParameters>
            <asp:ControlParameter ControlID="dteStartDate" Name="StartDate" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="dteEndDate" Name="EndDate" PropertyName="SelectedDate" Type="DateTime" />
            <asp:SessionParameter Name="AttorneyID" SessionField="AttorneyID" Type="Int32"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsAssignmentDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>" SelectCommand="SELECT [AttorneyID], [AttorneyGUID], [FirstName] + ' ' + [LastName] AS AttorneyName, [DateAssigned], [DateUnassigned],[AssignmentTypeName] + ' Attorney' AS AssignmentTypeName FROM [dbo].[FN_Metrics_Assignments](@StartDate, @EndDate) WHERE (ActiveAtStart + BailOnlyAssigned + Assigned + ProbationViolationAssigned + UnAssigned + ActiveAtEnd + TotalCasesTouched > 0)  AND (CaseNumber=@CaseNumber)">
        <SelectParameters>
            <asp:ControlParameter ControlID="dteStartDate" Name="StartDate" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="dteEndDate" Name="EndDate" PropertyName="SelectedDate" Type="DateTime" />
            <asp:SessionParameter Name="CaseNumber" SessionField="CaseNumber" Type="String"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsAttorneyAssignmentMetrics" runat="server" ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>"
        SelectCommand="SELECT  AttorneyID, AttorneyGUID, FirstName + ' ' + LastName AS AttorneyName,  SUM(ActiveAtStart) ActiveAtStart, SUM(BailOnlyAssigned) BailOnlyAssigned, SUM(Assigned) Assigned, SUM(ProbationViolationAssigned) ProbationViolationAssigned, SUM(UnAssigned) UnAssigned, SUM(ActiveAtEnd) ActiveAtEnd, SUM(TotalCasesTouched) TotalCasesTouched FROM [dbo].[FN_Metrics_Assignments](@StartDate, @EndDate) WHERE (ActiveAtStart + BailOnlyAssigned + Assigned + ProbationViolationAssigned + UnAssigned + ActiveAtEnd + TotalCasesTouched > 0) AND (AttorneyID=@AttorneyID) GROUP BY  AttorneyID, AttorneyGUID, FirstName + ' ' + LastName"
        EnableCaching="true">
        <SelectParameters>
            <asp:ControlParameter ControlID="dteStartDate" Name="StartDate" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="dteEndDate" Name="EndDate" PropertyName="SelectedDate" Type="DateTime" />
            <asp:SessionParameter Name="AttorneyID" SessionField="AttorneyID" Type="Int32"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="dsCaseDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>" SelectCommand="SELECT * FROM [df_VW_CaseDetails] WHERE (CaseNumber = @CaseNumber)">
        <SelectParameters>
            <asp:SessionParameter Name="CaseNumber" SessionField="CaseNumber" Type="String"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>

        <asp:ObjectDataSource ID="odsCaseCharges" runat="server"
    EnableCaching="True" TypeName="Defender.CaseDetails" SelectMethod="getCaseCharges">

    <SelectParameters>        
            <asp:SessionParameter Name="CaseGUID" SessionField="CaseGUID" Type="String"></asp:SessionParameter>
    </SelectParameters>

</asp:ObjectDataSource>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" runat="Server">
</asp:Content>
