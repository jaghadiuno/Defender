<%@ Page Title="Client List" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="ClientsList.aspx.vb" Inherits="Defender.ClientsList" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">




     

    <h1 class="bold text-nounderline zero-margin"> CPCS Clients</h1>


    

     <telerik:RadAjaxPanel ID="AjaxPanel1" runat="server" LoadingPanelID="RadAjaxDefaultLoadingPanel1">


           <p>
            <telerik:RadSearchBox runat="server" ID="ClientSearchBox"
                DataSourceID="odsClientSearch"
                
                DataTextField="ClientNameReverse"
                DataValueField="ClientNameReverse"

                EnableAutoComplete="True"
                ShowSearchButton="True"

                Width="300"
                EmptyMessage="Filter by client name" 


                MinFilterLength="3" 
                HighlightFirstMatch="False" 
                IsCaseSensitive="False" 
                RenderMode="Auto"                
                
                >

                <DropDownSettings Width="300" />

            </telerik:RadSearchBox>
           

        </p>


    <telerik:RadGrid ID="gridClients" 
        
        runat="server" 
        
        AllowPaging="True" 
        CellSpacing="-1" 
        PageSize="10" 
        Width="100%" 
        HorizontalAlign="Center" 
        
        DataSourceID="odsClients"
         
       
                      
           PagerStyle-AlwaysVisible="true"  

        MasterTableView-DataKeyNames="ClientID, ClientGUID"
         MasterTableView-ClientDataKeyNames="ClientID, ClientGUID" 
       
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
            
                  DataSourceID="odsClients"
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
 
                 
 
                 
                 
 
                <telerik:GridTemplateColumn  HeaderText="" ShowFilterIcon="false" ItemStyle-HorizontalAlign="Center" AllowFiltering="false" AllowSorting="false" EnableHeaderContextMenu="false" >
                                         
                    <ItemTemplate>
                        <a href="/apps/peoplesearch/personcase.aspx?clientguid=<%# Eval("ClientGUID") %>"><asp:Label ID="ViewCasesLbl" runat="server" Text='Cases' CssClass="btn btn-primary btn-block" ToolTip="View all client cases"></asp:Label></a>

                      
                         

                    </ItemTemplate>

                </telerik:GridTemplateColumn>
                 
                             

           
                <telerik:GridTemplateColumn Aggregate="CountDistinct" DataField="ClientName" FilterControlAltText="Filter ClientName column" FooterText="<strong>Clients:</strong> "  FooterStyle-CssClass="footer-text" HeaderText="Client" SortExpression="ClientName" UniqueName="ClientName" Groupable="false" ShowFilterIcon="false" ShowSortIcon="true">
                     
                    <ItemTemplate>
                       
                        
                         <a href="/apps/peoplesearch/personcase.aspx?clientguid=<%# Eval("ClientGUID") %>"><asp:Label ID="ClientNameReverseLabel" runat="server" Text='<%# GetTitleCase(Eval("ClientNameReverse")) %>' CssClass="bold text-nowrap"></asp:Label></a>

                        <br />

<address class="zero-margin"><em> <%# Eval("Address") %></em></address>

                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                

               

        <telerik:GridBoundColumn DataField="AKA" FilterControlAltText="Filter AKA column" HeaderText="AKA" SortExpression="AKA" UniqueName="AKA"></telerik:GridBoundColumn>
 

        <%--<telerik:GridBoundColumn DataField="SSN" FilterControlAltText="Filter SSN column" HeaderText="SSN" SortExpression="SSN" UniqueName="SSN"></telerik:GridBoundColumn> --%>

        <telerik:GridBoundColumn DataField="PcfNumber" FilterControlAltText="Filter PcfNumber column" HeaderText="PCF#" SortExpression="PcfNumber" UniqueName="PcfNumber" Visible="false"></telerik:GridBoundColumn>
                       
 

        <telerik:GridBoundColumn DataField="DOB" FilterControlAltText="Filter DOB column" HeaderText="DOB" SortExpression="DOB" UniqueName="DOB" DataFormatString="{0:d}"></telerik:GridBoundColumn> 

       <%-- <telerik:GridBoundColumn DataField="Address" FilterControlAltText="Filter Address column" HeaderText="Address" SortExpression="Address" UniqueName="Address"></telerik:GridBoundColumn>--%>

 

        <telerik:GridBoundColumn DataField="City" FilterControlAltText="Filter City column" HeaderText="City" SortExpression="City" UniqueName="City"></telerik:GridBoundColumn>
                 

        <telerik:GridBoundColumn DataField="Phone" FilterControlAltText="Filter Phone column" HeaderText="Phone" SortExpression="Phone" UniqueName="Phone"></telerik:GridBoundColumn>

        <telerik:GridBoundColumn DataField="EthnicityName" FilterControlAltText="Filter EthnicityName column" HeaderText="Ethnicity" SortExpression="EthnicityName" UniqueName="EthnicityName"></telerik:GridBoundColumn> 

        <telerik:GridBoundColumn DataField="RaceName" FilterControlAltText="Filter RaceName column" HeaderText="Race" SortExpression="RaceName" UniqueName="RaceName"></telerik:GridBoundColumn>

        <telerik:GridBoundColumn DataField="GenderName" FilterControlAltText="Filter GenderName column" HeaderText="Gender" SortExpression="GenderName" UniqueName="GenderName"></telerik:GridBoundColumn>

        <telerik:GridBoundColumn DataField="MaritalStatusName" FilterControlAltText="Filter MaritalStatusName column" HeaderText="Marital Status" SortExpression="MaritalStatusName" UniqueName="MaritalStatus" Visible="false"></telerik:GridBoundColumn>
                

            </Columns>



        </MasterTableView>


<PagerStyle PageSizes="5,10,25,50,100,250,500" AlwaysVisible="True"></PagerStyle>


    </telerik:RadGrid> 
                    




     </telerik:RadAjaxPanel>





    <asp:ObjectDataSource ID="odsClients" runat="server" SelectMethod="getAllClients" TypeName="Defender.CPCSClients" EnableCaching="true" >
        <SelectParameters>
            <asp:Parameter DefaultValue="" Name="FirstName" Type="String" ConvertEmptyStringToNull="false" />
            <asp:Parameter DefaultValue="" Name="LastName" Type="String" ConvertEmptyStringToNull="false" />
            <asp:ControlParameter DefaultValue="" Name="ClientName" Type="String" ConvertEmptyStringToNull="false" ControlID="ClientSearchBox" PropertyName="Text" />
        </SelectParameters>
    </asp:ObjectDataSource>





    <asp:ObjectDataSource ID="odsClientSearch" runat="server" SelectMethod="getAllClientNames" TypeName="Defender.CPCSClients" EnableCaching="true" >
        
    </asp:ObjectDataSource>










</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" Runat="Server">
</asp:Content>


