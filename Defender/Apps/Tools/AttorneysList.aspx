<%@ Page Title="Attorneys List" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="AttorneysList.aspx.vb" Inherits="Defender.AttorneysList" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">


     

    <h1 class="bold text-nounderline zero-margin">CPCS Attorneys</h1>





    
     <telerik:RadAjaxPanel ID="AjaxPanel1" runat="server" LoadingPanelID="RadAjaxDefaultLoadingPanel1">
 
    </telerik:RadAjaxPanel>

        <p>
            <telerik:RadSearchBox runat="server" ID="AttorneySearchBox"
                DataSourceID="odsAttorneySearch"
                DataKeyNames="AttorneyID, AttorneyGUID"
                DataTextField="AttorneyNameReverse"
                DataValueField="AttorneyID"

                EnableAutoComplete="True"
                ShowSearchButton="True"

                Width="300"
                EmptyMessage="Filter by attorney name" 


                MinFilterLength="3" 
                HighlightFirstMatch="False" 
                IsCaseSensitive="False" 
                RenderMode="Auto"                
                
                >

                <DropDownSettings Width="300" />

            </telerik:RadSearchBox>
             
            <a href="AttorneysList.aspx" class="text-danger bold small">reset</a>
        </p>



         

          
                <asp:Label ID="Label1" runat="server" />






    <telerik:RadGrid ID="gridAttorneys" 
        
        runat="server" 
        
        AllowPaging="True" 
        CellSpacing="-1" 
        PageSize="10" 
        Width="100%" 
        HorizontalAlign="Center" 
        
        DataSourceID="odsAttorneys"
         
       
                      
           PagerStyle-AlwaysVisible="true"  

        MasterTableView-DataKeyNames="AttorneyID, AttorneyGUID"
         MasterTableView-ClientDataKeyNames="AttorneyID, AttorneyGUID" 
       
        >
         

        <ClientSettings AllowDragToGroup="True" AllowColumnHide="True" AllowColumnsReorder="True" Scrolling-AllowScroll="False" >

<Scrolling AllowScroll="False"  UseStaticHeaders="true"></Scrolling>
        </ClientSettings>

<GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>

        <ExportSettings ExportOnlyData="True" HideStructureColumns="False" IgnorePaging="True" Excel-Format="ExcelML">
<Excel Format="ExcelML"></Excel>
        </ExportSettings>

        
        <MasterTableView AutoGenerateColumns="False" 
            GroupLoadMode="Server" 
            ShowGroupFooter="True" 
            EnableGroupsExpandAll="True" 
            EnableHeaderContextAggregatesMenu="True" 
            EnableHeaderContextFilterMenu="false" 
            EnableHeaderContextMenu="false" 
            CommandItemDisplay="Top" 
            ShowFooter="True" 
            AllowFilteringByColumn="false" 
            AllowMultiColumnSorting="true" 
            AllowNaturalSort="True" AllowSorting="true" 
            
                  DataSourceID="odsAttorneys"
            >





          <PagerStyle PageSizes="5,10,25,50,100,250,500" 
               Mode="NextPrevAndNumeric" 
              PagerTextFormat="{4} {5} attorney(s) in {1} page(s)"  
              Position="Bottom"  PageButtonCount="5" 
               />
            <HeaderStyle Wrap="false" CssClass="rgHeaderAlt" />

            <CommandItemSettings 
                
                ShowAddNewRecordButton="False"
                ShowRefreshButton="false"
                ShowExportToCsvButton="True"
                ShowExportToExcelButton="True"
                ShowExportToPdfButton="True"
                ShowExportToWordButton="True"
                ShowPrintButton="True" />

             
            <Columns>
 
                
           
                <telerik:GridTemplateColumn Aggregate="Count" DataField="AttorneyName" FilterControlAltText="Filter AttorneyName column" FooterText="<strong>Attorneys:</strong> "  FooterStyle-CssClass="footer-text" HeaderText="Attorney" SortExpression="AttorneyName" UniqueName="AttorneyName" Groupable="false" ShowFilterIcon="false" ShowSortIcon="true">
                     
                    <ItemTemplate>
                        <a href="/apps/peoplesearch/PersonCase.aspx?attorneyguid=<%# Eval("AttorneyGUID") %>"><asp:Label ID="StaffNameLabel" runat="server" Text='<%# GetTitleCase(Eval("AttorneyName")) %>' CssClass="bold"></asp:Label></a>
                        <br />
                        <a href="mailto:<%# Eval("Email") %>"><asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email").ToString.ToLower  %>' CssClass=""></asp:Label></a>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>



                <telerik:GridBoundColumn DataField="BBO" FilterControlAltText="Filter BBO column" HeaderText="BBO" SortExpression="BBO" UniqueName="BBO" ReadOnly="True" Groupable="false" >
                </telerik:GridBoundColumn>


                <telerik:GridBoundColumn DataField="AttorneyCaseCount" FilterControlAltText="Filter AttorneyCaseCount column" HeaderText="Cases" SortExpression="AttorneyCaseCount" UniqueName="AttorneyCaseCount" ReadOnly="True" Groupable="false" EnableHeaderContextMenu="false" AllowFiltering="false">
                </telerik:GridBoundColumn>

               

                 

                <telerik:GridTemplateColumn DataField="OfficeName" FilterControlAltText="Filter OfficeName column" HeaderText="Office" SortExpression="OfficeName" UniqueName="OfficeName"  FooterText="<b>Offices:</b> " FooterStyle-CssClass="footer-text" Aggregate="CountDistinct" ItemStyle-CssClass="no-wrap"> 
                    <ItemTemplate>
                       <asp:Label ID="OfficeNameLabel" runat="server" Text='<%# GetTitleCase(Eval("OfficeName")) %>'></asp:Label> 
                    </ItemTemplate>

<FooterStyle CssClass="footer-text"></FooterStyle>

<ItemStyle CssClass="no-wrap"></ItemStyle>
                </telerik:GridTemplateColumn>

                 

                <telerik:GridBoundColumn DataField="UnitTypeName" FilterControlAltText="Filter UnitTypeName column" HeaderText="Unit" SortExpression="UnitTypeName" UniqueName="UnitTypeName">
                </telerik:GridBoundColumn>

               

 
                 
                <telerik:GridBoundColumn DataField="DateJoined" FilterControlAltText="Filter DateJoined column" HeaderText="Joined" SortExpression="DateJoined" UniqueName="DateJoined" DataType="System.DateTime" DataFormatString="{0:d}" Groupable="false">
                </telerik:GridBoundColumn>



                <telerik:GridBoundColumn DataField="DateLeft" FilterControlAltText="Filter DateLeft column" HeaderText="Left" SortExpression="DateLeft" UniqueName="DateLeft" DataType="System.DateTime" DataFormatString="{0:d}" Groupable="false">
                </telerik:GridBoundColumn>
                 
                 
 
                <telerik:GridTemplateColumn  HeaderText="" ShowFilterIcon="false" ItemStyle-HorizontalAlign="Center" AllowFiltering="false" AllowSorting="false" EnableHeaderContextMenu="false" >
                                         
                    <ItemTemplate>
                        <a href="/apps/peoplesearch/personcase.aspx?attorneyguid=<%# Eval("AttorneyGUID") %>"><asp:Label ID="ViewCasesLbl" runat="server" Text='Cases' CssClass="btn btn-primary" ToolTip="View all attorney cases"></asp:Label></a>

                    </ItemTemplate>

                </telerik:GridTemplateColumn>
                 

                <telerik:GridTemplateColumn  HeaderText="" ShowFilterIcon="false" ItemStyle-HorizontalAlign="Center" AllowFiltering="false" AllowSorting="false" EnableHeaderContextMenu="false" >
                                         
                    <ItemTemplate>
                       
                        <a href="/apps/reports/attorney.aspx?attorneyguid=<%# Eval("AttorneyGUID") %>"><asp:Label ID="ViewAssignmentsLbl" runat="server" Text='Assignments' CssClass="btn btn-primary" ToolTip="View all attorney cases"></asp:Label></a>

                    </ItemTemplate>

                </telerik:GridTemplateColumn>
                 

                

            </Columns>



        </MasterTableView>


<PagerStyle PageSizes="5,10,25,50,100,250,500" AlwaysVisible="True"></PagerStyle>


    </telerik:RadGrid> 
                    







    <asp:HiddenField ID="hdnAttorneyID" runat="server" Visible="false" />


    <asp:ObjectDataSource ID="odsAttorneys" runat="server" SelectMethod="getAllAttorneys" TypeName="Defender.CPCSAttorneys" EnableCaching="false" >
        <SelectParameters>

            <asp:ControlParameter DefaultValue="0" Name="AttorneyID" Type="Int32" ControlID="hdnAttorneyID" PropertyName="Value" />

            <asp:ControlParameter DefaultValue="" Name="AttorneyName" Type="String" ControlID="AttorneySearchBox" PropertyName="Text" ConvertEmptyStringToNull="False" />

            <asp:Parameter DefaultValue="0" Name="UnitID" Type="Int32" />

            <asp:Parameter DefaultValue="" Name="UnitTypeName" Type="String" ConvertEmptyStringToNull="false" />

            <asp:Parameter DefaultValue="" Name="OfficeName" Type="String" ConvertEmptyStringToNull="false" />
        </SelectParameters>
    </asp:ObjectDataSource>



    <asp:ObjectDataSource ID="odsAttorneySearch" runat="server" SelectMethod="getAllAttorneySearch" TypeName="Defender.CPCSAttorneys" EnableCaching="true" >
         
    </asp:ObjectDataSource>






</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" Runat="Server">
</asp:Content>


