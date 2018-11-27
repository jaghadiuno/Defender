<%@ Page Title="People Search" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="Default.aspx.vb" Inherits="Defender._Default5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
     <telerik:RadAjaxManager ID="MetricsAjaxManager"
        runat="server"
        ShowLoadingPanelForPostBackControls="False"
        DefaultLoadingPanelID="CPCSDefaultLoadingPanel">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="txtPersonName">
                <UpdatedControls> 
                    <telerik:AjaxUpdatedControl ControlID="txtPersonName" />
                    <telerik:AjaxUpdatedControl ControlID="gridCPCSCaseSearch" LoadingPanelID="CPCSTransparentLoadingPanel" />
                    <telerik:AjaxUpdatedControl ControlID="lblSearchItem" LoadingPanelID="CPCSTransparentLoadingPanel" />
                    <telerik:AjaxUpdatedControl ControlID="errLabel" LoadingPanelID="CPCSTransparentLoadingPanel" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="gridCPCSCaseSearch">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="gridCPCSCaseSearch" />
                </UpdatedControls>
            </telerik:AjaxSetting>          
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <div class="text-center">
        <asp:Label ID="errLabel" runat="server" CssClass="bold text-danger text-center" />
    </div>
    <div class="row-spacer clearfix"></div>
    <div class="row">
        <div class="col-md-6 col-md-offset-3 col-sm-10 col-sm-offset-1 col-xs-12">
            <label class="sr-only" for="exampleInputAmount">Enter name of person to search for</label>
            <telerik:RadSearchBox
                ID="txtPersonName"
                runat="server"
                DataSourceID="odsParticipants"
                DataTextField="ParticipantName"
                DataValueField="ParticipantName"
                EmptyMessage="Enter a first and/or last name of person to search for"
                EnableAutoComplete="True"
                ShowSearchButton="True"
                Width="100%"
                MinFilterLength="4"
                HighlightFirstMatch="False"
                IsCaseSensitive="False"
                RenderMode="Auto"
                
                >
                <DropDownSettings Width="300" />
            </telerik:RadSearchBox> 
        </div>
    </div>
    <div class="row-spacer clearfix"></div>
    <div class="text-center center-block">
        <asp:LinkButton ID="lbAdvancedSearch" runat="server" CssClass="bold text-center">Advanced Search  <span class="glyphicon glyphicon-search" aria-hidden="true"></span> </asp:LinkButton>
    </div>
    <h1 class="page-header">
        <asp:Label ID="lblSearchItem" runat="server" /></h1>
    <telerik:RadGrid ID="gridCPCSCaseSearch" runat="server" AllowPaging="True" ShowFooter="True" CellSpacing="-1" Width="100%" HorizontalAlign="Center" DataSourceID="dsSearchResults" PageSize="10" Visible="false" FilterItemStyle-HorizontalAlign="NotSet">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ClientSettings EnablePostBackOnRowClick="false" Selecting-AllowRowSelect="true">
            <Scrolling AllowScroll="False" ScrollHeight="500px" UseStaticHeaders="true"></Scrolling>
        </ClientSettings>
        <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="None" ShowFooter="True" AllowMultiColumnSorting="False" DataKeyNames="CaseID, CaseGUID">
           <HeaderStyle Wrap="false" CssClass="rgHeaderAlt" />
            <PagerStyle PageSizes="5,10,25,50,100,250,500" Position="Bottom" PageButtonCount="5" PageSizeControlType="RadDropDownList" EnableSEOPaging="false" SEOPagingQueryStringKey="ConflictCheck"
                PagerTextFormat="{4} Page {0} from {1} pages, displaying rows {2} to {3} from {5} records" />
            <Columns>
                <telerik:GridTemplateColumn FilterControlAltText="Filter ParticipantName column" HeaderText="Participant Name&lt;br /&gt;&lt;small&gt;Role / Date of Birth / Address&lt;/small&gt;" UniqueName="ParticipantName">
                    <ItemTemplate>
                        <p><a href="/apps/peoplesearch/PersonCase.aspx?<%#IIf(Eval("ParticipantRole") = "Client", "clientguid=" & Eval("ClientGUID"), "participantguid=" & Eval("ParticipantGUID")) %>">
                            <asp:Label ID="ParticipantNameLabel" runat="server" Text='<%# GetTitleCase(Eval("ParticipantName")) %>' CssClass="bold"></asp:Label></a> </p>
                        <p>
                            <asp:Label ID="ParticipantRoleLabel" runat="server" Text='<%# IIf(Eval("ParticipantRole").ToString <> "", "(" & Eval("ParticipantRole").ToString & ")", "") %>' CssClass="text-success bold"></asp:Label>
                            <%# IIf(IsDate(Eval("ParticipantDOB", "{0:d}")), "| " & Eval("ParticipantDOB", "{0:d}") & ", <strong class=text-danger>(" & Eval("ParticipantAge") & " years old)</strong>", "") %>
                        </p>
                        <p>
                            <%# IIf(GetTitleCase(Eval("ParticipantAddress") & ", " & Eval("ParticipantCity") & ", " & Eval("ParticipantState") & " " & Eval("ParticipantZipCode")).ToString.Trim <> ", ,", GetTitleCase(Eval("ParticipantAddress") & ", " & Eval("ParticipantCity") & ", " & Eval("ParticipantState") & " " & Eval("ParticipantZipCode")).ToString.Trim.Replace(", ,", ""), "~address information not found~") %>
                        </p>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn FilterControlAltText="Filter LeadCharge column" HeaderText="Case Number &lt;br /&gt;&lt;small&gt; Disposition / Lead Charge&lt;/small&gt;" UniqueName="LeadCharge">
                    <ItemTemplate>
                        <p><a href="/apps/casemanagement/managementcasedetails.aspx?caseguid=<%# Eval("CaseGUID") %>">
                            <asp:Label ID="CaseNumberLabel" runat="server" Text='<%# Eval("CaseNumber") %>' CssClass="bold"></asp:Label></a></p>
                        <p>
                            <asp:Label ID="DispositionLabel" runat="server" Text='<%# GetTitleCase(Eval("Disposition")) %>' CssClass="bold text-danger"></asp:Label></p>
                        <p>
                            <asp:Label ID="LeadChargeLabel" runat="server" Text='<%# GetTitleCase(Eval("LeadCharge")) %>' CssClass="text-success"></asp:Label></p>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn FilterControlAltText="Filter ClientName column" HeaderText="Client Name&lt;br /&gt;&lt;small&gt;Staff&lt;/small&gt;" UniqueName="ClientName">
                    <ItemTemplate>
                        <p><a href="/apps/peoplesearch/PersonCase.aspx?clientguid=<%# Eval("ClientGUID") %>">
                            <asp:Label ID="ClientNameLabel" runat="server" Text='<%# GetTitleCase(Eval("ClientName").ToString) %>' CssClass="bold"></asp:Label></a> </p>
                        <p><a href="/apps/peoplesearch/PersonCase.aspx?attorneyguid=<%# Eval("AttorneyGUID") %>">
                            <asp:Label ID="StaffNameLabel" runat="server" Text='<%# GetTitleCase(Eval("AttorneyName")) %>' CssClass="text-mutedxx"></asp:Label></a> </p>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="Opened" DataType="System.DateTime" FilterControlAltText="Filter Opened column" HeaderText="Opened<br/><small>Closed</small>" SortExpression="Opened" UniqueName="Opened">
                    <ItemTemplate>
                        <p>
                            <asp:Label ID="OpenedLabel" runat="server" Text='<%# Eval("CaseDateOpened", "{0:d}")  %>' CssClass="bold"></asp:Label></p>
                        <p>
                            <asp:Label ID="ClosedLabel" runat="server" Text='<%# Eval("CaseDateClosed", "{0:d}") %>'></asp:Label></p>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
            <NoRecordsTemplate>
                <div class="alert alert-danger text-center bold zero-margin">
                    <p>
                        No records found matching your criteria. Please try again.
                    </p>
                </div>
            </NoRecordsTemplate>
            <%--            <DetailTables>
                <telerik:GridTableView>
                </telerik:GridTableView>
            </DetailTables>--%>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:ObjectDataSource ID="dsSearchResults"
        runat="server"
        EnableCaching="True"
        CacheDuration="6000"
        TypeName="Defender.PeopleSearch"
        SelectMethod="SearchResults">
        <SelectParameters>
            <asp:Parameter Name="personName" ConvertEmptyStringToNull="false" Type="String" />
            <asp:Parameter Name="searchType" DefaultValue="0" Type="Int32" ConvertEmptyStringToNull="true" />
            <asp:Parameter Name="DOB"  ConvertEmptyStringToNull="True" Type="String" />
            <asp:Parameter Name="dobRange" Type="Int32" DefaultValue="0" />
            <asp:Parameter Name="phoneNumber" ConvertEmptyStringToNull="false" Type="String" />
            <asp:Parameter Name="streetAddress" ConvertEmptyStringToNull="false" Type="String" />
            <asp:Parameter Name="city" ConvertEmptyStringToNull="false" Type="String" />
            <asp:Parameter Name="state" ConvertEmptyStringToNull="false" Type="String" />
            <asp:Parameter Name="zipCode" ConvertEmptyStringToNull="false" Type="String" />
            <asp:Parameter Name="staffName" ConvertEmptyStringToNull="false" Type="String" />
            <asp:Parameter Name="participantRoles" ConvertEmptyStringToNull="false" Type="String" />
            <asp:Parameter Name="caseNumber" ConvertEmptyStringToNull="false" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsStates" runat="server" TypeName="Defender.CPCSLocations" SelectMethod="getStates" EnableCaching="true" CacheExpirationPolicy="Sliding"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsRoles" runat="server" TypeName="Defender.CPCSRoles" SelectMethod="getNonStaffRoles" EnableCaching="true" CacheExpirationPolicy="Sliding" />
    <asp:ObjectDataSource ID="odsAttorneys" runat="server" TypeName="Defender.PeopleSearch" SelectMethod="getAllAttorneyNames" EnableCaching="true" CacheExpirationPolicy="Sliding" />
    <asp:ObjectDataSource ID="odsStaff" runat="server" TypeName="Defender.PeopleSearch" SelectMethod="getAllStaff" EnableCaching="true" CacheExpirationPolicy="Sliding" />
    <asp:ObjectDataSource ID="odsParticipants"
        runat="server"
        TypeName="Defender.PeopleSearch"
        SelectMethod="getParticipantNames" EnableCaching="True" CacheExpirationPolicy="Sliding">
        <SelectParameters>
            <asp:ControlParameter DefaultValue="" Name="ParticipantName" Type="String" ConvertEmptyStringToNull="false" ControlID="txtPersonName" PropertyName="Text" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" runat="Server">
</asp:Content>