<%@ Page Title="Judges List" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="JudgesList.aspx.vb" Inherits="Defender.JudgesList" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">







     

    <h1 class="bold text-nounderline zero-margin">Case Judges</h1>

      <p>
            <telerik:RadSearchBox runat="server" ID="JudgeSearchBox"
                DataSourceID="odsJudgeSearch" 
                DataTextField="JudgeNameReverse"
                DataValueField="JudgeNameReverse"

                EnableAutoComplete="True"
                ShowSearchButton="True"

                Width="300"
                EmptyMessage="Filter by Judge name" 


                MinFilterLength="3" 
                HighlightFirstMatch="False" 
                IsCaseSensitive="False" 
                RenderMode="Auto"                
                
                >

                <DropDownSettings Width="300" />

            </telerik:RadSearchBox>
             
            <a href="JudgesList.aspx" class="text-danger bold small">reset</a>
        </p>



         


    <telerik:RadGrid ID="gridJudges" 
        
        runat="server" 
        
        AllowPaging="True" 
        CellSpacing="-1" 
        PageSize="10" 
        Width="100%" 
        HorizontalAlign="Center" 
        
        DataSourceID="odsJudges"
         
       
                      
           PagerStyle-AlwaysVisible="true"  

        MasterTableView-DataKeyNames="JudgeID, JudgeGUID"
         MasterTableView-ClientDataKeyNames="JudgeID, JudgeGUID" 
       
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
            ShowFooter="false" 
            AllowFilteringByColumn="false" 
            AllowMultiColumnSorting="true" 
            AllowNaturalSort="True" AllowSorting="true" 
            
                  DataSourceID="odsJudges"
            >





          <PagerStyle PageSizes="5,10,25,50,100,250,500" 
               Mode="NextPrevAndNumeric" 
              PagerTextFormat="{4} {5} Judge(s) in {1} page(s)"  
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
 
                 
 
                  
               
                 
 
                 

        <telerik:GridBoundColumn DataField="FirstName" FilterControlAltText="Filter FirstName column" HeaderText="First Name" SortExpression="FirstName" UniqueName="FirstName"></telerik:GridBoundColumn>
                       
 
                 


   <telerik:GridBoundColumn DataField="MiddleName" FilterControlAltText="Filter MiddleName column" HeaderText="Middle Name" SortExpression="MiddleName" UniqueName="MiddleName"></telerik:GridBoundColumn>

 

   <telerik:GridBoundColumn DataField="LastName" FilterControlAltText="Filter LastName column" HeaderText="Last Name" SortExpression="LastName" UniqueName="LastName"></telerik:GridBoundColumn>


   <telerik:GridBoundColumn DataField="CaseCount" FilterControlAltText="Filter CaseCount column" HeaderText="Case Count" SortExpression="CaseCount" UniqueName="CaseCount"></telerik:GridBoundColumn>

                

   <telerik:GridBoundColumn DataField="CourtName" FilterControlAltText="Filter CourtName column" HeaderText="Court" SortExpression="CourtName" UniqueName="CourtName" DataType="System.Int32"></telerik:GridBoundColumn>


   <telerik:GridBoundColumn DataField="CourtLevelName" FilterControlAltText="Filter CourtLevelName column" HeaderText="Court Level" SortExpression="CourtLevelName" UniqueName="CourtLevelName" Visible="false"></telerik:GridBoundColumn>

   <telerik:GridBoundColumn DataField="DepartmentName" FilterControlAltText="Filter DepartmentName column" HeaderText="Department Name" SortExpression="DepartmentName" UniqueName="DepartmentName" Visible="false"></telerik:GridBoundColumn>



   <telerik:GridBoundColumn DataField="AddressLine1" FilterControlAltText="Filter AddressLine1 column" HeaderText="Address" SortExpression="AddressLine1" UniqueName="AddressLine1"></telerik:GridBoundColumn>


   <telerik:GridBoundColumn DataField="City" FilterControlAltText="Filter City column" HeaderText="City" SortExpression="City" UniqueName="City"></telerik:GridBoundColumn>



 















            </Columns>



        </MasterTableView>


<PagerStyle PageSizes="5,10,25,50,100,250,500" AlwaysVisible="True" Mode="NextPrevNumericAndAdvanced"></PagerStyle>


    </telerik:RadGrid> 
                    





    
    <asp:HiddenField ID="hdnJudgeID" runat="server" Visible="false" />



    <asp:ObjectDataSource ID="odsJudges" runat="server" SelectMethod="getAllJudges" TypeName="Defender.CPCSJudges" EnableCaching="true">
        <SelectParameters>
            <asp:ControlParameter DefaultValue="" Name="JudgeName" Type="String" ConvertEmptyStringToNull="false" ControlID="JudgeSearchBox" PropertyName="text" />
        </SelectParameters>
    </asp:ObjectDataSource>


     

    
    <asp:ObjectDataSource ID="odsJudgeSearch" runat="server" SelectMethod="getAllJudgeNames" TypeName="Defender.CPCSJudges" EnableCaching="true" >
         
    </asp:ObjectDataSource>




























</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" Runat="Server">
</asp:Content>


