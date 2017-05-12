<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CaseMetricsUnits.ascx.vb" Inherits="Defender.CaseMetricsUnits" %>
 


<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
</telerik:RadScriptBlock>

    <script>
        function exportChartToImage() {
            var $ = $telerik.$;
            $find('<%=RadClientExportManager1.ClientID%>').exportImage($(".chartArea"));
    }

    function exportChartToPDF() {
        var $ = $telerik.$;
        $find('<%=RadClientExportManager1.ClientID%>').exportPDF($(".chartArea"));
    }
    </script>





 <div class="row">

                    <div class="col-sm-6">                      

<asp:Label ID="lblMsg" runat="server" />

                    </div>



                    <div class="col-sm-6">

                      



<telerik:RadClientExportManager runat="server" ID="RadClientExportManager1" ClientIDMode="Static">
</telerik:RadClientExportManager>

    <div class="text-right">
<asp:Button  runat="server" OnClientClick="exportChartToPDF" 
    Text="Export to PDF" CssClass="btn btn-default btn-xs" />

<asp:Button  runat="server" OnClientClick="exportChartToImage" 
    Text="Export to Image" CssClass="btn btn-default btn-xs" />
</div>



                    </div>    

                </div>





    <telerik:RadHtmlChart runat="server" Width="100%" ID="chartArea"
        DataSourceID="dsMetrics" Transitions="true" Visible="true">

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
                    <TooltipsAppearance DataFormatString="{0} active Assigned" />
                    <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                    <MarkersAppearance MarkersType="Circle" Size="14"></MarkersAppearance>
                </telerik:AreaSeries>



                <telerik:AreaSeries DataFieldY="NewCases" Name="New Cases" VisibleInLegend="true" Visible="true">
                    <TooltipsAppearance DataFormatString="{0} new cases" />
                    <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                    <MarkersAppearance MarkersType="Circle" Size="14"></MarkersAppearance>
                </telerik:AreaSeries>


                <telerik:AreaSeries DataFieldY="BailOnly" Name="Bail Only" VisibleInLegend="true" Visible="true">
                    <TooltipsAppearance DataFormatString="{0} bail only cases" />
                    <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                    <MarkersAppearance MarkersType="Circle" Size="14"></MarkersAppearance>
                </telerik:AreaSeries>



                <telerik:AreaSeries DataFieldY="ProbationViolation" Name="Probation Violations" VisibleInLegend="true" Visible="true">
                    <TooltipsAppearance DataFormatString="{0} probation violation cases" />
                    <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                    <MarkersAppearance MarkersType="Circle" Size="14"></MarkersAppearance>
                </telerik:AreaSeries>

                
                <telerik:AreaSeries DataFieldY="ClosedCases" Name="Closed Cases" VisibleInLegend="true" Visible="true">
                    <TooltipsAppearance Color="White" DataFormatString="{0} closed closed" />
                    <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                    <MarkersAppearance MarkersType="Circle" Size="14"></MarkersAppearance>
                </telerik:AreaSeries>


                <telerik:AreaSeries DataFieldY="ActiveAtEnd" Name="Active At End" VisibleInLegend="true" Visible="true">
                    <TooltipsAppearance DataFormatString="{0} probation violation cases" />
                    <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                    <MarkersAppearance MarkersType="Circle" Size="14"></MarkersAppearance>
                </telerik:AreaSeries>

                
                <telerik:AreaSeries DataFieldY="TotalTouched" Name="Total" VisibleInLegend="true" Visible="true">
                    <TooltipsAppearance Color="White" DataFormatString="{0} Total" />
                    <LabelsAppearance DataFormatString="{0}" Visible="false"></LabelsAppearance>
                    <MarkersAppearance MarkersType="Circle" Size="14"></MarkersAppearance>
                </telerik:AreaSeries>






            </Series>


            <XAxis DataLabelsField="UnitTypeName">
                <LabelsAppearance Color="#999999">
                    <TextStyle Bold="true" FontSize="14px" />

                    <ClientTemplate></ClientTemplate>
                </LabelsAppearance>


                <TitleAppearance Visible="True">
                    <TextStyle Bold="true" />
                </TitleAppearance>
            </XAxis>



            <YAxis>
                <TitleAppearance Text="Number of Cases Assigned" Visible="True">
                    <TextStyle Bold="true" />
                </TitleAppearance>
            </YAxis>


        </PlotArea>
        
    </telerik:RadHtmlChart>

    




<telerik:RadGrid ID="gridMetrics" runat="server" 

      
        AllowPaging="False" 
        AllowSorting="False" 
        ShowFooter="True" 

        ShowGroupPanel="False" 
        
        CellSpacing="-1" 
        PageSize="100" 
        Width="100%" 

        HorizontalAlign="Center"
        
        AllowFilteringByColumn="False"
        PagerStyle-AlwaysVisible="true"
        
        RenderMode="Lightweight" 
    DataSourceID="dsMetrics"


    AllowMultiRowSelection="true"
     ClientSettings-Selecting-AllowRowSelect="true"  
        >
         
       
        
            <HeaderStyle Wrap="false" CssClass="rgHeaderAlt" />
     
        
        <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" AllowExpandCollapse="true" AllowGroupExpandCollapse="true" 
            
            EnablePostBackOnRowClick="True"
            >

             
            <Selecting AllowRowSelect="True" />

             
            <Scrolling AllowScroll="False" UseStaticHeaders="true" EnableColumnClientFreeze="true" CountGroupSplitterColumnAsFrozen="true"
                FrozenColumnsCount="9" EnableNextPrevFrozenColumns="false"
                 
                
                />

        </ClientSettings>

        <ExportSettings ExportOnlyData="True" HideStructureColumns="False" IgnorePaging="True" Excel-Format="ExcelML">

<Excel Format="ExcelML"></Excel>

        </ExportSettings>


        <MasterTableView 
            AutoGenerateColumns="False" 
            GroupLoadMode="Server" 
            ShowGroupFooter="True" 

            EnableGroupsExpandAll="False" 

            CommandItemDisplay="Top" 
            ShowFooter="True" 
          

          

            AllowMultiColumnSorting="False"  
            GroupsDefaultExpanded="False"
            
            >


            <CommandItemSettings
                ShowAddNewRecordButton="False"
                ShowRefreshButton="false"
                ShowExportToCsvButton="True"
                ShowExportToExcelButton="True"
                ShowExportToPdfButton="True"
                ShowExportToWordButton="True"
                ShowPrintButton="True"
            />




            <Columns>


                <telerik:GridBoundColumn DataField="UnitTypeName" FilterControlAltText="Filter UnitTypeName column" HeaderText="" SortExpression="UnitTypeName" UniqueName="UnitTypeName"  
                     ItemStyle-Font-Bold="true"
                     ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                   
                     >
                    </telerik:GridBoundColumn>


                    <%-- <telerik:GridBoundColumn DataField="OfficeName" FilterControlAltText="Filter OfficeName column" HeaderText="Office" SortExpression="OfficeName" UniqueName="OfficeName" Aggregate="CountDistinct" Groupable="true"
                    
                     ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                    FooterText="Offices: " 
                    >
                </telerik:GridBoundColumn>   --%>                
                          

                <telerik:GridBoundColumn DataField="ActiveAtStart" DataType="System.Int32" FilterControlAltText="Filter ActiveAtStart column" HeaderText="Active Start" ReadOnly="True" SortExpression="ActiveAtStart" UniqueName="ActiveAtStart" Aggregate="Sum"
                    
                     ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                    FooterText=" " 
                    >
                </telerik:GridBoundColumn>

                

                <telerik:GridBoundColumn DataField="NewCases" DataType="System.Int32" FilterControlAltText="Filter NewCases column" HeaderText="NewCases" ReadOnly="True" SortExpression="NewCases" UniqueName="NewCases" Aggregate="Sum"
                    
                     ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                    FooterText=" " 
                    >
                </telerik:GridBoundColumn>


                <telerik:GridBoundColumn DataField="BailOnly" DataType="System.Int32" FilterControlAltText="Filter BailOnly column" HeaderText="Bail Only" ReadOnly="True" SortExpression="BailOnly" UniqueName="BailOnly" Aggregate="Sum" 
                    
                     ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                    FooterText=" " 
                    >
                </telerik:GridBoundColumn>


                <telerik:GridBoundColumn DataField="ProbationViolation" DataType="System.Int32" FilterControlAltText="Filter ProbationViolation column" HeaderText="Probation" ReadOnly="True" SortExpression="ProbationViolation" UniqueName="ProbationViolation" Aggregate="Sum"
                    
                     ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                    FooterText=" " 
                    >
                </telerik:GridBoundColumn>                


                <telerik:GridBoundColumn DataField="ClosedCases" DataType="System.Int32" FilterControlAltText="Filter ClosedCases column" HeaderText="Closed Cases" ReadOnly="True" SortExpression="UnAssigned" UniqueName="ClosedCases" Aggregate="Sum"
                    
                     ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                    FooterText=" " 
                    >
                </telerik:GridBoundColumn>
                 
                <telerik:GridBoundColumn DataField="ActiveAtEnd" DataType="System.Int32" FilterControlAltText="Filter ActiveAtEnd column" HeaderText="Active End" ReadOnly="True" SortExpression="ActiveEnd" UniqueName="ActiveAtEnd" Aggregate="Sum"
                    
                     ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                    FooterText=" " 
                    >
                </telerik:GridBoundColumn>



                <telerik:GridBoundColumn DataField="TotalTouched" DataType="System.Int32" FilterControlAltText="Filter TotalTouched column" HeaderText="Total" ReadOnly="True" SortExpression="TotalTouched" UniqueName="TotalTouched" Aggregate="Sum"
                    
                     ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                    FooterText="Total: " 
                    >
                </telerik:GridBoundColumn>




            </Columns>




<%--                <GroupByExpressions>
             <telerik:GridGroupByExpression>
        <SelectFields>
          <telerik:GridGroupByField FieldName="UnitTypeName" HeaderText="UnitTypeName" />       
        </SelectFields>

        <GroupByFields>
          <telerik:GridGroupByField FieldName="UnitTypeName" SortOrder="Ascending" /> 
        </GroupByFields>
      </telerik:GridGroupByExpression>
            </GroupByExpressions>--%>
             

        </MasterTableView> 

    </telerik:RadGrid>

































    <telerik:RadGrid ID="gridCaseData" runat="server" 
        AllowSorting="True" 
        ShowFooter="True" 
         AllowPaging="true" 
        ShowGroupPanel="True" 
        
        CellSpacing="-1" 
        PageSize="100" 
        Width="100%" 

        HorizontalAlign="Center"
        PagerStyle-AlwaysVisible="true"
        
        RenderMode="Lightweight"   DataSourceID="dsCaseData"
        >
         
       
        
            <HeaderStyle Wrap="false" CssClass="rgHeaderAlt" />

 
            <GroupingSettings CaseSensitive="false" CollapseAllTooltip="Collapse all groups" ShowUnGroupButton="true" RetainGroupFootersVisibility="true" IgnorePagingForGroupAggregates="true" >

                 
            </GroupingSettings>
        
        <ClientSettings AllowDragToGroup="True" 
            AllowColumnsReorder="True" AllowExpandCollapse="true" 
            AllowGroupExpandCollapse="true" 
            
            >

             
            <Selecting AllowRowSelect="True" />

             

        </ClientSettings>

        <ExportSettings ExportOnlyData="True" HideStructureColumns="False" IgnorePaging="True" Excel-Format="ExcelML">

<Excel Format="ExcelML"></Excel>

        </ExportSettings>


        <MasterTableView 
            AutoGenerateColumns="False" 
            GroupLoadMode="Server" 
            ShowGroupFooter="True" 

            EnableGroupsExpandAll="False" 

            CommandItemDisplay="Bottom" 
            ShowFooter="True" 
            
            
            AllowMultiColumnSorting="True"  
            GroupsDefaultExpanded="False"
              DataSourceID="dsCaseData"
            >


            <CommandItemSettings
                ShowAddNewRecordButton="False"
                ShowRefreshButton="false"
                ShowExportToCsvButton="True"
                ShowExportToExcelButton="True"
                ShowExportToPdfButton="True"
                ShowExportToWordButton="True"
                ShowPrintButton="True" />
            

            <Columns>


                <telerik:GridBoundColumn DataField="CaseNumber" HeaderText="CaseNumber" SortExpression="CaseNumber" ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap" FilterControlAltText="Filter CaseNumber column" 
                    UniqueName="CaseNumber" 
                    Aggregate="CountDistinct" 
                        FooterText=" " 
                    ></telerik:GridBoundColumn>
    

                <telerik:GridBoundColumn DataField="OpeningDate" HeaderText="Opened" SortExpression="OpeningDate" FooterStyle-CssClass="footer-text" DataType="System.DateTime" FilterControlAltText="Filter OpeningDate column" UniqueName="OpeningDate"></telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="ClosingDate" HeaderText="Closed" SortExpression="ClosingDate" FooterStyle-CssClass="footer-text" DataType="System.DateTime" FilterControlAltText="Filter ClosingDate column" UniqueName="ClosingDate"></telerik:GridBoundColumn>


                <telerik:GridBoundColumn DataField="OfficeName" FilterControlAltText="Filter OfficeName column" HeaderText="Office" SortExpression="OfficeName" UniqueName="OfficeName" Aggregate="CountDistinct" Groupable="true"                    
                     ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                    FooterText="Offices: " 
                    >
                </telerik:GridBoundColumn>

                                  



                <telerik:GridBoundColumn DataField="UnitTypeName"  FilterControlAltText="Filter UnitTypeName column" HeaderText="Unit" ReadOnly="True" SortExpression="UnitTypeName" UniqueName="UnitTypeName" Aggregate="CountDistinct" 
                     ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                    FooterText=" " 
                    > </telerik:GridBoundColumn>




                <telerik:GridBoundColumn DataField="CaseTypeName" FilterControlAltText="Filter CaseTypeName column" HeaderText="Case Type" ReadOnly="True" SortExpression="CaseTypeName" UniqueName="CaseTypeName" Aggregate="CountDistinct" 
                     ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                    FooterText=" " 
                    > </telerik:GridBoundColumn>



                <telerik:GridBoundColumn DataField="CountyName"  FilterControlAltText="Filter CountyName column" HeaderText="County" ReadOnly="True" SortExpression="CountyName" UniqueName="CountyName" Aggregate="CountDistinct"
                     ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text no-wrap"
                    FooterText=" " 
                    > </telerik:GridBoundColumn>


 

            </Columns>

             


            <PagerStyle PageSizes="5,10,25,50,100,250,500" Position="Bottom" />

        </MasterTableView>


         

<PagerStyle AlwaysVisible="True"></PagerStyle>


         

<FilterMenu RenderMode="Lightweight"></FilterMenu>

<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>



    </telerik:RadGrid>
    
     
    
    
    
     

    <asp:HiddenField ID="hdnStartDate" runat="server" Visible="false" />
    <asp:HiddenField ID="hdnEndDate" runat="server" Visible="false" />
    <asp:HiddenField ID="hdnUnit" runat="server" Visible="false" />
    <asp:HiddenField ID="hdnOffice" runat="server" Visible="false" />
    <asp:HiddenField ID="hdnAttorney" runat="server" Visible="false" />




    <asp:SqlDataSource ID="dsCaseData" runat="server" ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>"
        
     SelectCommand="SELECT [CaseGUID] ,[CaseNumber] ,[OpeningDate] ,[ClosingDate] ,[CaseTypeName] ,[CountyName] ,[DivisionShortName] ,[OfficeName] ,[UnitTypeName]  FROM [dbo].[FN_Metrics_Cases](@StartDate,@EndDate) GROUP BY [CaseGUID] ,[CaseNumber] ,[OpeningDate] ,[ClosingDate] ,[CaseTypeName] ,[CountyName] ,[DivisionShortName] ,[OfficeName] ,[UnitTypeName]"
        
        >
        <SelectParameters>
            <asp:ControlParameter ControlID="dteStartDate" Name="StartDate" PropertyName="SelectedDate" Type="DateTime" />

            <asp:ControlParameter ControlID="dteEndDate" Name="EndDate" 
                PropertyName="SelectedDate" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>






<asp:SqlDataSource ID="dsMetrics" runat="server" ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>" SelectCommand="SELECT UnitTypeName, sum(ActiveAtStart) ActiveAtStart, sum(ActiveAtEnd) as ActiveAtEnd, sum(NewBailOnly) as BailOnly, sum(NewProbationViolation) as ProbationViolation, sum(NewlyOpenedCases) as 'NewCases', sum(ClosedCases) as ClosedCases, sum(totalTouched) as TotalTouched FROM [dbo].[FN_Metrics_Cases](@StartDate,@EndDate) GROUP BY UnitTypeName">
        <SelectParameters>

            
            <asp:ControlParameter ControlID="dteStartDate" Name="StartDate" 
                PropertyName="SelectedDate" Type="DateTime" />

            <asp:ControlParameter ControlID="dteEndDate" Name="EndDate" 
                PropertyName="SelectedDate" Type="DateTime" />


        </SelectParameters>
    </asp:SqlDataSource>
















<asp:SqlDataSource ID="dsAssignmentMetrics" runat="server" ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>" SelectCommand="SELECT UnitTypeName, sum(ActiveAtStart) ActiveAtStart, sum(ActiveAtEnd) as ActiveAtEnd,sum(BailOnlyAssigned) as BailOnly, sum(ProbationViolationAssigned) as ProbationViolation, sum([Assigned(MinusPV&BO)]) as 'Assigned', sum(UnAssigned) as UnAssigned, sum(TotalCases) as TotalCases FROM [dbo].[FN_Metrics_Cases](@StartDate,@EndDate) GROUP BY UnitTypeName">
        <SelectParameters>

            
            <asp:ControlParameter ControlID="dteStartDate" Name="StartDate" 
                PropertyName="SelectedDate" Type="DateTime" />

            <asp:ControlParameter ControlID="dteEndDate" Name="EndDate" 
                PropertyName="SelectedDate" Type="DateTime" />


        </SelectParameters>
    </asp:SqlDataSource>