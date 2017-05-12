<%@ Page Title="Attorney Case Reporting" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="Attorney.aspx.vb" Inherits="Defender.Attorney" %>

<%@ Register Src="~/Controls/UIs/Reports/CaseDetails.ascx" TagPrefix="uc1" TagName="CaseDetails" %>







<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="Server">

    <script>
        function exportChartToImage() {
            var $ = $telerik.$;
            $find('<%=RadClientExportManager1.ClientID%>').exportImage($(".RadHtmlChart"));
    }

    function exportChartToPDF() {
        var $ = $telerik.$;
        $find('<%=RadClientExportManager1.ClientID%>').exportPDF($(".RadHtmlChart"));
    }
    </script>

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">


    <asp:HiddenField ID="hdnAttorneyName" runat="server" Visible="false" />
    <asp:HiddenField ID="hdnAttorneyID" runat="server" Visible="false" />
    <asp:HiddenField ID="hdnAttorneyGUID" runat="server" Visible="false" />


     





    <asp:Panel ID="SearchPanel" runat="server" CssClass="panel panel-default">
        <div class="panel-body bg-success">








            <div class="row">


                <div class="col-md-9">





                    <div class="row">


                        <!-- this contains the options section -->

                        <div class="col-md-3 text-center">  
                              
                            <i class="fa fa-user-plus" aria-hidden="true"></i> 


                            <br />
                                    <asp:LinkButton runat="server"
                                        ID="btnCaseDetails" CssClass="text-danger bold">Back to  Cases
                                    </asp:LinkButton> 

                            </div>                         
                             





                        <!-- this contains the date fields -->
                        <div class="col-sm-6">








                            <div class="row">

                                <div class="col-sm-6">

                                    <asp:DropDownList ID="ddlAssignedOptions" runat="server" CssClass="form-control" AutoPostBack="true">
                                        <asp:ListItem Text="Assigned Between" />
                                        <asp:ListItem Text="Assigned On" />
                                    </asp:DropDownList>

                                </div>


                                <div class="col-sm-6">




                                    <telerik:RadDatePicker ID="dteAssignedStartDate" runat="server" ShowPopupOnFocus="False" DatePopupButton-Visible="true" DatePopupButton-Width="30px" Width="100%" DateInput-Width="100%"></telerik:RadDatePicker>




                                </div>


                            </div>











                            <div class="row">

                                <div class="col-sm-6">

                                    <asp:DropDownList ID="ddlUnAssignedOptions" runat="server" CssClass="form-control" AutoPostBack="True">
                                        <asp:ListItem Text="Un-Assigned Between" />
                                        <asp:ListItem Text="Un-Assigned On" />
                                    </asp:DropDownList>

                                </div>


                                <div class="col-sm-6">





                                    <telerik:RadDatePicker ID="dteUnAssignedStartDate" runat="server" ShowPopupOnFocus="False" DatePopupButton-Visible="true" DatePopupButton-Width="30px" Width="100%" DateInput-Width="100%"></telerik:RadDatePicker>


                                </div>


                            </div>








                        </div>



                        <!-- this contains the second date fields -->

                        <div class="col-sm-3">




                            <div class="row">




                                

                                    <div class="row">

                                        <div class="col-sm-3">

                                          <p class="text-center">  <asp:Label ID="lblAssignedEndDate" runat="server" Text="and" CssClass="control-label" Font-Bold="false" AssociatedControlID="dteAssignedEndDate" /></p> 

                                        </div>

                                        <div class="col-sm-9">

<asp:PlaceHolder ID="phAssignedEndDate" runat="server" Visible="true">

                                            <telerik:RadDatePicker ID="dteAssignedEndDate" runat="server" ShowPopupOnFocus="False" DatePopupButton-Visible="true" DatePopupButton-Width="30px" Width="100%" DateInput-Width="100%"></telerik:RadDatePicker>

                                </asp:PlaceHolder>

                                        </div>


                                    </div>






                                    <div class="row">

                                        <div class="col-sm-3">

                                           <p class="text-center"> <asp:Label ID="lblUnAssignedEndDate" runat="server" Text="and" CssClass="control-label" Font-Bold="false" AssociatedControlID="dteUnAssignedEndDate" /></p>

                                        </div>
                                        <div class="col-sm-9">


                                <asp:PlaceHolder ID="phUnAssignedEndDate" runat="server" Visible="true">

                                            <telerik:RadDatePicker ID="dteUnAssignedEndDate" runat="server" ShowPopupOnFocus="False" DatePopupButton-Visible="true" DatePopupButton-Width="30px" Width="100%" DateInput-Width="100%"></telerik:RadDatePicker>

                                </asp:PlaceHolder>

                                        </div>


                                    </div>







                            </div>

                        </div>




                    </div>

                     
                </div>
                 




                        <!-- this contains the submit button -->
                <div class="col-md-3">


                     



                    <asp:LinkButton ID="btnFilter" CssClass="btn btn-primary btn-block btn-lg bold active" runat="server"><i class="fa fa-fw fa-search-plus" aria-hidden="true"></i>

Apply Filter
                    </asp:LinkButton>





                    <div class="row-spacerXXX clearfix"></div>




                    <p class="text-center bold small text-danger"><a href="attorney.aspx?attorneyguid=<%=Request("attorneyguid") %>" class="text-danger">Reset </a></p>





                </div>


            </div>





        </div>
    </asp:Panel>



     




    <telerik:RadClientExportManager runat="server" ID="RadClientExportManager1">
    </telerik:RadClientExportManager>

   
     
     


    <telerik:RadHtmlChart runat="server" Width="100%" ID="chartArea"
        DataSourceID="odsAssignmentCounts" Transitions="true" Visible="true">

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

            <Series >



                <telerik:AreaSeries DataFieldY="ActiveAtStart" Name="Active At Start" VisibleInLegend="true" Visible="true" >
                    <TooltipsAppearance DataFormatString="{0} active assignments" />
                    <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                    <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                </telerik:AreaSeries>



                <telerik:AreaSeries DataFieldY="Assignments" Name="New Assignments" VisibleInLegend="true" Visible="true">
                    <TooltipsAppearance DataFormatString="{0} new assignments" />
                    <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                    <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                </telerik:AreaSeries>



                <telerik:AreaSeries DataFieldY="ClosedCases" Name="Assignments Closed" VisibleInLegend="true" Visible="true">
                    <TooltipsAppearance Color="White" DataFormatString="{0} assignments closed" />
                    <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                    <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                </telerik:AreaSeries>


                <telerik:AreaSeries DataFieldY="BailOnly" Name="Bail Only" VisibleInLegend="true" Visible="true">
                    <TooltipsAppearance DataFormatString="{0} bail only cases" />
                    <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                    <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                </telerik:AreaSeries>



                <telerik:AreaSeries DataFieldY="ProbationViolations" Name="Probation Violations" VisibleInLegend="true" Visible="true">
                    <TooltipsAppearance DataFormatString="{0} probation violation cases" />
                    <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                    <MarkersAppearance MarkersType="Circle" Size="10"></MarkersAppearance>
                </telerik:AreaSeries>




            </Series>


            <XAxis DataLabelsField="CountYear">
                <LabelsAppearance Color="#999999">
                    <TextStyle Bold="true" FontSize="14px" />

                    <ClientTemplate></ClientTemplate>
                </LabelsAppearance>


                <TitleAppearance Visible="True">
                    <TextStyle Bold="true" />
                </TitleAppearance>
            </XAxis>



            <YAxis>
                <TitleAppearance Text="Number of Cases Assigned" Visible="True" >
                    <TextStyle Bold="true" />
                </TitleAppearance>
            </YAxis>


        </PlotArea>


    </telerik:RadHtmlChart>




     



    <div class="row-spacer clearfix"></div>





    <telerik:RadAjaxLoadingPanel ID="GridLoadingPanel1" runat="server" BackgroundPosition="Top">
    </telerik:RadAjaxLoadingPanel>




    <telerik:RadAjaxPanel ID="GridPanel1" runat="server" LoadingPanelID="GridLoadingPanel1">

    </telerik:RadAjaxPanel>


        <telerik:RadGrid ID="gridCaseSearch" runat="server"
            AllowPaging="False"
            AllowSorting="True"
            ShowFooter="True"
            ShowGroupPanel="False"
            CellSpacing="-1"
            GridLines="None"
            PageSize="100"
            Visible="true"
            Width="100%"
            HorizontalAlign="Center"
            AllowFilteringByColumn="false"
            EnableHeaderContextMenu="false"
            EnableHeaderContextFilterMenu="false"
            PagerStyle-AlwaysVisible="true"
            MasterTableView-DataKeyNames="CaseID, CaseNumber, AttorneyGUID"
            MasterTableView-ClientDataKeyNames="CaseID, CaseNumber, AttorneyGUID"
            DataSourceID="dsAttorneyCases"
            RenderMode="Lightweight"
            AutoGenerateHierarchy="false" 
            >


            <HeaderStyle Wrap="false" CssClass="rgHeaderAlt" />



            <GroupingSettings CaseSensitive="false" CollapseAllTooltip="Collapse all groups" ShowUnGroupButton="true" RetainGroupFootersVisibility="true" IgnorePagingForGroupAggregates="true"></GroupingSettings>


            <ClientSettings AllowDragToGroup="True">

                <Scrolling AllowScroll="False" UseStaticHeaders="true" EnableColumnClientFreeze="true" CountGroupSplitterColumnAsFrozen="true"
                    FrozenColumnsCount="9" EnableNextPrevFrozenColumns="false" />


            </ClientSettings>

            <ExportSettings ExportOnlyData="True" HideStructureColumns="False" IgnorePaging="True" Excel-Format="ExcelML">
            </ExportSettings>


            <MasterTableView AutoGenerateColumns="False" GroupLoadMode="Server"
                ShowGroupFooter="True"
                EnableGroupsExpandAll="True"
                GroupsDefaultExpanded="false"
                HierarchyDefaultExpanded="false"

                CommandItemDisplay="Top"
                ShowFooter="True"
                AllowMultiColumnSorting="True">


                <CommandItemSettings
                    ShowAddNewRecordButton="False"
                    ShowRefreshButton="false"
                    ShowExportToCsvButton="True"
                    ShowExportToExcelButton="True"
                    ShowExportToPdfButton="True"
                    ShowExportToWordButton="True"
                    ShowPrintButton="True" />



<%--

                
 
                <DetailTables>
                    
                    <telerik:GridTableView 
                        
                        HierarchyDefaultExpanded="false"
                        EnableHierarchyExpandAll="false" 
                        DataKeyNames="CaseNumber"                         
                        
                        DataSourceID="dsCaseDetails" 
                        Width="100%" 
                        
                        ShowHeader="false" 
                        ShowFooter="false"

                        AutoGenerateColumns="false" 
                        AllowPaging="False"
                        runat="server"
                        HierarchyLoadMode="ServerOnDemand" 
                        Name="CaseDetails"
                        >

<ParentTableRelation>
<telerik:GridRelationFields DetailKeyField="CaseNumber" MasterKeyField="CaseNumber">
</telerik:GridRelationFields>
</ParentTableRelation>


<Columns>

                    <telerik:GridTemplateColumn DataField="CaseNumber" FilterControlAltText="Filter CaseNumber column" UniqueName="CaseNumber">

                        <ItemTemplate>                        
                            <uc1:CaseDetails runat="server" ID="CaseDetails" />     
                        </ItemTemplate>                       
                    </telerik:GridTemplateColumn>
    

</Columns>


                    </telerik:GridTableView>
                                   

                </DetailTables>
 --%>













                <Columns>                 



                    <telerik:GridTemplateColumn Aggregate="CountDistinct" DataField="CaseNumber" FilterControlAltText="Filter CaseNumber column" FooterText="<b>Cases:</b> " HeaderText="Case Number" SortExpression="CaseNumber" UniqueName="CaseNumber" ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap">
                        <ItemTemplate>
                            <strong>
                                <a href="/apps/casemanagement/managementcasedetails.aspx?caseguid=<%# Eval("CaseGUID") %>" target="_blank" title="view case details"><%# Eval("CaseNumber") %></a>
                            </strong>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>


                    <telerik:GridBoundColumn DataField="AssignmentTypeName" HeaderText="Assignment" ItemStyle-Wrap="false" SortExpression="AssignmentTypeName"></telerik:GridBoundColumn>


                    <telerik:GridBoundColumn DataField="DateAssigned" FilterControlAltText="Filter DateAssigned column" HeaderText="Assigned" SortExpression="DateAssigned" UniqueName="DateAssigned" DataType="System.DateTime" DataFormatString="{0:d}" HeaderStyle-Width="10%">
                    </telerik:GridBoundColumn>


                    <telerik:GridBoundColumn DataField="DateUnassigned" FilterControlAltText="Filter DateUnassigned column" HeaderText="Unassigned" SortExpression="DateUnassigned" UniqueName="DateUnassigned" DataType="System.DateTime" DataFormatString="{0:d}" HeaderStyle-Width="10%">
                    </telerik:GridBoundColumn>




                    <telerik:GridTemplateColumn DataField="ClientName" FilterControlAltText="Filter ClientName column" HeaderText="Client" SortExpression="ClientName" UniqueName="ClientName" FooterText="<b>Clients:</b> " FooterStyle-CssClass="footer-text" Aggregate="CountDistinct">
                        <ItemTemplate>
                            <a href="/apps/peoplesearch/PersonCase.aspx?clientguid=<%# Eval("ClientGUID") %>">
                                <asp:Label ID="ClientNameLabel" runat="server" Text='<%# GetTitleCase(Eval("ClientName").ToString) %>' CssClass=""></asp:Label></a>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>


                    <telerik:GridBoundColumn DataField="CaseTypeName" HeaderText="Case Type" SortExpression="CaseTypeName" FooterText="<b>Case Types:</b> " ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap" Aggregate="CountDistinct" Visible="False"></telerik:GridBoundColumn>


                    <telerik:GridBoundColumn DataField="OfficeName" HeaderText="Office" ItemStyle-Wrap="false" SortExpression="OfficeName"></telerik:GridBoundColumn>


                    <telerik:GridBoundColumn DataField="UnitTypeName" HeaderText="Unit" SortExpression="UnitTypeName"></telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Opened" FilterControlAltText="Filter Opened column" HeaderText="Date Opened" SortExpression="Opened" UniqueName="Opened" DataType="System.DateTime" DataFormatString="{0:d}" HeaderStyle-Width="10%">
                    </telerik:GridBoundColumn>


                    <telerik:GridBoundColumn DataField="Closed" FilterControlAltText="Filter Closed column" HeaderText="Date Closed" SortExpression="Closed" UniqueName="Closed" DataType="System.DateTime" DataFormatString="{0:d}" HeaderStyle-Width="10%"
                         
                        >
                    </telerik:GridBoundColumn>




                </Columns>


                <GroupByExpressions>
                    <telerik:GridGroupByExpression>

                        <GroupByFields>
                            <telerik:GridGroupByField FieldName="CaseTypeName" />
                        </GroupByFields>

                        <SelectFields>
                            <telerik:GridGroupByField FieldName="CaseTypeName" HeaderText="Case Type" />
                        </SelectFields>

                    </telerik:GridGroupByExpression>
                </GroupByExpressions>

                <GroupHeaderItemStyle />



                <PagerStyle PageSizes="5,10,25,50,100,250,500" Position="TopAndBottom" />

            </MasterTableView>


        </telerik:RadGrid>






    <asp:ObjectDataSource
        ID="dsAttorneyCases"
        runat="server"
        TypeName="Defender.AttorneyCaseReports"
        SelectMethod="getAllAttorneyCases"
        EnableCaching="true"
        CacheDuration="6000">

        <SelectParameters> 


            <asp:ControlParameter Name="AttorneyID" PropertyName="Value" ControlID="hdnAttorneyID" Type="String" />
            <asp:ControlParameter Name="AttorneyGUID" PropertyName="Value" ControlID="hdnAttorneyGUID" DbType="Guid" />

            <asp:ControlParameter Name="AssignedOptions" ControlID="ddlAssignedOptions" ConvertEmptyStringToNull="True" PropertyName="SelectedValue" Type="String" />  
               
            <asp:ControlParameter Name="AssignedStartDate" ControlID="dteAssignedStartDate" ConvertEmptyStringToNull="True" PropertyName="SelectedDate" Type="String"  />  
             
            <asp:ControlParameter Name="AssignedEndDate" ControlID="dteAssignedEndDate" ConvertEmptyStringToNull="True" PropertyName="SelectedDate" Type="String"  /> 



            <asp:ControlParameter Name="UnAssignedOptions" ControlID="ddlUnAssignedOptions" ConvertEmptyStringToNull="True" PropertyName="SelectedValue" Type="String" /> 

            <asp:ControlParameter Name="UnAssignedStartDate" ControlID="dteUnAssignedStartDate" ConvertEmptyStringToNull="True" PropertyName="SelectedDate" Type="String"  /> 

            <asp:ControlParameter Name="UnAssignedEndDate" ControlID="dteUnAssignedEndDate" ConvertEmptyStringToNull="True" PropertyName="SelectedDate" Type="String" /> 


        </SelectParameters>


    </asp:ObjectDataSource>



    <asp:ObjectDataSource
        ID="odsAssignmentCounts"
        runat="server"
        TypeName="Defender.AttorneyCaseReports"
        SelectMethod="getAttorneyCaseMetrics"
        EnableCaching="True"
        CacheDuration="6000">
       
        <SelectParameters> 

            <asp:ControlParameter Name="AttorneyID" PropertyName="Value" ControlID="hdnAttorneyID" Type="String" />
            <asp:ControlParameter Name="AttorneyGUID" PropertyName="Value" ControlID="hdnAttorneyGUID" DbType="Guid" />

            <asp:ControlParameter Name="AssignedOptions" ControlID="ddlAssignedOptions" ConvertEmptyStringToNull="True" PropertyName="SelectedValue" Type="String" />  
               
            <asp:ControlParameter Name="AssignedStartDate" ControlID="dteAssignedStartDate" ConvertEmptyStringToNull="True" PropertyName="SelectedDate" Type="String"  />  
             
            <asp:ControlParameter Name="AssignedEndDate" ControlID="dteAssignedEndDate" ConvertEmptyStringToNull="True" PropertyName="SelectedDate" Type="String"  /> 



            <asp:ControlParameter Name="UnAssignedOptions" ControlID="ddlUnAssignedOptions" ConvertEmptyStringToNull="True" PropertyName="SelectedValue" Type="String" /> 

            <asp:ControlParameter Name="UnAssignedStartDate" ControlID="dteUnAssignedStartDate" ConvertEmptyStringToNull="True" PropertyName="SelectedDate" Type="String"  /> 

            <asp:ControlParameter Name="UnAssignedEndDate" ControlID="dteUnAssignedEndDate" ConvertEmptyStringToNull="True" PropertyName="SelectedDate" Type="String" /> 


        </SelectParameters>


    </asp:ObjectDataSource>

       
    <asp:SqlDataSource ID="dsCaseDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>" SelectCommand="SELECT * FROM [df_VW_CaseDetails] WHERE (CaseNumber = @CaseNumber)"
     >
        <SelectParameters>
            <asp:SessionParameter Name="CaseNumber" SessionField="CaseNumber" Type="String"></asp:SessionParameter>
        </SelectParameters>

    </asp:SqlDataSource>


     
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" runat="Server">
</asp:Content>


