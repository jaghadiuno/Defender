<%@ Page Title="Prosecutors List" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="ProsecutorsList.aspx.vb" Inherits="Defender.ProsecutorsList" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">





    


     

    <h1 class="bold text-nounderline zero-margin">Case Prosecutors</h1>




  
      <p>
            <telerik:RadSearchBox runat="server" ID="ProsecutorSearchBox"
                DataSourceID="odsProsecutorSearch" 
                DataTextField="ProsecutorNameReverse"
                DataValueField="ProsecutorNameReverse"

                EnableAutoComplete="True"
                ShowSearchButton="True"

                Width="300"
                EmptyMessage="Filter by Prosecutor name" 


                MinFilterLength="3" 
                HighlightFirstMatch="False" 
                IsCaseSensitive="False" 
                RenderMode="Auto"  CssClass="capitalize"               
                
                >

                <DropDownSettings Width="300" />

            </telerik:RadSearchBox>
             
            <a href="ProsecutorsList.aspx" class="text-danger bold small">reset</a>
        </p>








    <telerik:RadGrid ID="gridProsecutors" 
        
        runat="server" 
          FilterItemStyle-Wrap ="false" 
        AllowPaging="True" 
        CellSpacing="-1" 
        PageSize="10" 
        Width="100%" 
        HorizontalAlign="Center" 
        
        DataSourceID="odsProsecutors"
         
       
                      
           PagerStyle-AlwaysVisible="true"  

        MasterTableView-DataKeyNames="ProsecutorID, ProsecutorGUID"
         MasterTableView-ClientDataKeyNames="ProsecutorID, ProsecutorGUID" 
       
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
            ShowFooter="False" 
            AllowFilteringByColumn="false" 
            AllowMultiColumnSorting="true" 
            AllowNaturalSort="True" AllowSorting="true" 
            
                  DataSourceID="odsProsecutors"
            >





          <PagerStyle PageSizes="5,10,25,50,100,250,500" 
               Mode="NextPrevAndNumeric" 
              PagerTextFormat="{4} {5} Prosecutor(s) in {1} page(s)"  
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


   <telerik:GridBoundColumn DataField="CaseCount" FilterControlAltText="Filter CaseCount column" HeaderText="Case Count" SortExpression="CaseCount" UniqueName="CaseCount" DataType="System.Int32"></telerik:GridBoundColumn>

                

            </Columns>



        </MasterTableView>


<PagerStyle PageSizes="5,10,25,50,100,250,500" AlwaysVisible="True" Mode="NextPrevNumericAndAdvanced"></PagerStyle>


    </telerik:RadGrid> 
                    













     



    <asp:ObjectDataSource ID="odsProsecutors" runat="server" SelectMethod="getAllProsecutors" TypeName="Defender.CPCSProsecutors" EnableCaching="true">
        <SelectParameters>
            <asp:ControlParameter DefaultValue="" Name="ProsecutorName" Type="String" ConvertEmptyStringToNull="false" ControlID="ProsecutorSearchBox" PropertyName="text" />
        </SelectParameters>
    </asp:ObjectDataSource>


     

    
    <asp:ObjectDataSource ID="odsProsecutorSearch" runat="server" SelectMethod="getAllProsecutorNames" TypeName="Defender.CPCSProsecutors" EnableCaching="true" >
         
    </asp:ObjectDataSource>













</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" Runat="Server">
</asp:Content>

