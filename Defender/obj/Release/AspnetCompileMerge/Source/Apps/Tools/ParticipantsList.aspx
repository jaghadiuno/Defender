<%@ Page Title="Participants List" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="ParticipantsList.aspx.vb" Inherits="Defender.ParticipantsList" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">






     

    <h1 class="bold text-nounderline zero-margin">Case Participants List</h1>
    
    

     <telerik:RadAjaxPanel ID="AjaxPanel1" runat="server" LoadingPanelID="RadAjaxDefaultLoadingPanel1"></telerik:RadAjaxPanel>


           <p>
            <telerik:RadSearchBox runat="server" ID="ParticipantSearch"
                DataSourceID="odsParticipantSearch"
                
                DataTextField="ParticipantNameReverse"
                DataValueField="ParticipantNameReverse"

                EnableAutoComplete="True"
                ShowSearchButton="True"

                Width="300"
                EmptyMessage="Filter by name" 


                MinFilterLength="3" 
                HighlightFirstMatch="False" 
                IsCaseSensitive="False" 
                RenderMode="Auto"                
                
                >

                <DropDownSettings Width="300" />

            </telerik:RadSearchBox>
           

        </p>



    <telerik:RadGrid ID="gridParticipants" 
        
        runat="server" 
        
        AllowPaging="True" 
        CellSpacing="-1" 
        PageSize="10" 
        Width="100%" 
        HorizontalAlign="Center" 
        
        DataSourceID="odsParticipants"
         
       
                      
           PagerStyle-AlwaysVisible="true"  

        MasterTableView-DataKeyNames="ParticipantID, ParticipantGUID"
         MasterTableView-ClientDataKeyNames="ParticipantID, ParticipantGUID" 
       
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
            
                  DataSourceID="odsParticipants"
            >





          <PagerStyle PageSizes="5,10,25,50,100,250,500" 
               Mode="NextPrevAndNumeric" 
              PagerTextFormat=""  
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
 
                 
 
                 

                 

           
                <telerik:GridTemplateColumn  DataField="ParticipantName" FilterControlAltText="Filter ParticipantName column"   HeaderText="Participant" SortExpression="ParticipantName" UniqueName="ParticipantName" Groupable="false" ShowFilterIcon="false" ShowSortIcon="true">
                     
                    <ItemTemplate>
                       
                        
                         <a href="/apps/peoplesearch/PersonCase.aspx?participantguid=<%# Eval("ParticipantGUID") %>"><asp:Label ID="ParticipantNameReverseLabel" runat="server" Text='<%# GetTitleCase(Eval("ParticipantNameReverse")) %>' CssClass="bold"></asp:Label></a>

                       

                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                

               
                 
 
                 

        <telerik:GridBoundColumn DataField="PcfNumber" FilterControlAltText="Filter PcfNumber column" HeaderText="PCF Number" SortExpression="PcfNumber" UniqueName="PcfNumber"></telerik:GridBoundColumn>
                       
 

        <telerik:GridBoundColumn DataField="DOB" FilterControlAltText="Filter DOB column" HeaderText="DOB" SortExpression="DOB" UniqueName="DOB" DataFormatString="{0:d}"></telerik:GridBoundColumn> 



   <telerik:GridBoundColumn DataField="Address" FilterControlAltText="Filter Address column" HeaderText="Address" SortExpression="Address" UniqueName="Address"></telerik:GridBoundColumn> 

 

        <telerik:GridBoundColumn DataField="City" FilterControlAltText="Filter City column" HeaderText="City" SortExpression="City" UniqueName="City"></telerik:GridBoundColumn>
                 

        <telerik:GridBoundColumn DataField="Phone" FilterControlAltText="Filter Phone column" HeaderText="Phone" SortExpression="Phone" UniqueName="Phone"></telerik:GridBoundColumn>

        <telerik:GridBoundColumn DataField="EthnicityName" FilterControlAltText="Filter EthnicityName column" HeaderText="Ethnicity" SortExpression="EthnicityName" UniqueName="EthnicityName"></telerik:GridBoundColumn>

 


                

            </Columns>



        </MasterTableView>


<PagerStyle PageSizes="5,10,25,50,100,250,500" AlwaysVisible="True"></PagerStyle>


    </telerik:RadGrid> 
                    









    <asp:ObjectDataSource ID="odsParticipants" runat="server" SelectMethod="getAllParticipants" TypeName="Defender.CPCSParticipants" EnableCaching="true">
        <SelectParameters>
            <asp:Parameter DefaultValue="" Name="FirstName" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter DefaultValue="" Name="LastName" Type="String" ConvertEmptyStringToNull="false" />
            <asp:ControlParameter DefaultValue="" Name="ParticipantName" Type="String" ConvertEmptyStringToNull="false" ControlID="ParticipantSearch" PropertyName="Text" />
        </SelectParameters>
    </asp:ObjectDataSource>




    <asp:ObjectDataSource ID="odsParticipantSearch" runat="server" SelectMethod="getAllParticipantNames" TypeName="Defender.CPCSParticipants" EnableCaching="true">
 
    </asp:ObjectDataSource>






</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" Runat="Server">
</asp:Content>


