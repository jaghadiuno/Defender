<%@ Page Title="People Search" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="AdvancedSearch.aspx.vb" Inherits="Defender._AdvancedSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="Server" Visible="False">
    <div class="text-center">
        <asp:Label ID="errLabel" runat="server" CssClass="bold text-danger text-center" />
    </div>
    <div class="row-spacer clearfix"></div>
    <asp:RequiredFieldValidator ID="rfvPersonName" runat="server" ErrorMessage="Name of client or Participant is required" Display="None" ValidationGroup="search" ControlToValidate="txtPersonName" />
    <asp:CompareValidator ID="rfvBirthdate" runat="server" ErrorMessage="Please enter a valid date of birth" ControlToValidate="dteBirthdate" ValidationGroup="search" Display="None"
        Type="Date"
        Operator="LessThanEqual" />
    <asp:RegularExpressionValidator ID="rfvPhone" runat="server" ErrorMessage="Please enter a valid phone number" ControlToValidate="txtPhone" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ValidationGroup="search" Display="None"></asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="rfvZipCode" runat="server" ErrorMessage="Please enter a valid US zip code" ControlToValidate="txtZipCode" ValidationGroup="search" Display="None" ValidationExpression="^(\d{5}-\d{4}|\d{5}|\d{9})$|^([a-zA-Z]\d[a-zA-Z] \d[a-zA-Z]\d)$"></asp:RegularExpressionValidator>
    <asp:ValidationSummary ID="vsSummary"
        runat="server"
        ValidationGroup="search"
        CssClass="text-danger alert alert-danger bold"
        DisplayMode="BulletList"  ClientIDMode="AutoID" EnableClientScript="True" Enabled="True" ValidateRequestMode="Enabled" Visible="True" ShowValidationErrors="True" ShowSummary="True" ShowModelStateErrors="True" ShowMessageBox="False" />
        <div class="row">
            <div class="col-sm-6">
                <div class="form-horizontal">
                    <div class="form-group">
                        <asp:Label ID="lblPersonName" runat="server" Text="Participant Name" CssClass="col-sm-4 control-label" AssociatedControlID="txtPersonName" />
                        <div class="col-sm-8">
                <asp:TextBox ID="txtPersonName" runat="server" 
                    CssClass="form-control" 
                    placeholder="Name of client or participant" 
                    ValidationGroup="search" 
                    CausesValidation="true" ToolTip="Enter a first and/or last name of person to search for"></asp:TextBox>
                            </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblSearchType" runat="server" Text="Search Type" CssClass="col-sm-4 control-label" AssociatedControlID="blSearchType" />
                        <div class="col-sm-8">
                            <telerik:RadRadioButtonList ID="blSearchType" runat="server" AutoPostBack="False" Columns="2" Direction="Horizontal">
                                <Items>
                                    <telerik:ButtonListItem Value="0"  Text="Regular" ToolTip="Performs a search based on character matching" Selected="true" />
                                    <telerik:ButtonListItem Value="1"  Text="Soundex" ToolTip="Performs a search based how participants name sounds"  />
                                </Items>
                            </telerik:RadRadioButtonList>
                            </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblBirthdate" runat="server" Text="Date of Birth" CssClass="col-sm-4 control-label" AssociatedControlID="dteBirthdate" />
                        <div class="col-sm-8">
                                <telerik:RadDatePicker ID="dteBirthdate" 
                                    runat="server"
                                    DateInput-EmptyMessage="Date of birth"
                                    DateInput-ValidationGroup="search"
                                    DatePopupButton-AccessKey="d" 
                                    ShowPopupOnFocus="true"
                                    DatePopupButton-Visible="True"
                                    DatePopupButton-Width="30"
                                    DateInput-CssClass=""
                                    Calendar-EnableKeyboardNavigation="true" 
                                     DateInput-EmptyMessageStyle-CssClass=""
                                     AutoPostBack="true" 
                                    RenderMode="Lightweight"
                                    DateInput-ToolTip="Optional: Select date of birth of person." 
                                     >
                                </telerik:RadDatePicker>
    <asp:PlaceHolder ID="panelFlexibility" runat="server" Visible="false">
                             <asp:DropDownList ID="ddlFlexible" runat="server" cssclass="form-control-static do-radius" ToolTip="Filter by age range in years. Plus minus.">
                                    <Items>                                        
                                        <asp:ListItem Text="+- 0 year" Value="0" />
                                        <asp:ListItem Text="+- 1 year" Value="1" />
                                        <asp:ListItem Text="+- 2 years" Value="2" />
                                        <asp:ListItem Text="+- 3 years" Value="3" />
                                        <asp:ListItem Text="+- 4 years" Value="4" />
                                        <asp:ListItem Text="+- 5 years" Value="5" /> 
                                    </Items>
                             </asp:DropDownList>
</asp:PlaceHolder>
                            </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblCaseNumber" runat="server" Text="Case #" CssClass="col-sm-4 control-label" AssociatedControlID="txtCaseNumber" />
                        <div class="col-sm-8">
                                <asp:TextBox ID="txtCaseNumber" runat="server" CssClass="form-control" placeholder="Partial or full case number"></asp:TextBox>
                            </div>
                    </div>       
                        <div class="form-group">
                            <asp:Label ID="lblRole" runat="server" Text="Participant Role" CssClass="col-sm-4 control-label" AssociatedControlID="ddlRole" />
                            <div class="col-sm-8">
                                <asp:ListBox ID="ddlRole" runat="server" CssClass="form-control" AppendDataBoundItems="false" DataSourceID="odsRoles" DataTextField="RoleName" DataValueField="RoleID" SelectionMode="Multiple" Rows="7">
                                    <asp:ListItem Text="" Value="" />
                                </asp:ListBox>
                                 <%-- <span class="input-group-addon"><i class="fa fa-question-circle fa-fw fa-lgXXX"></i></span>--%>
                            </div>
                        </div>
                </div>
            </div>
            <div class="col-sm-6">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <asp:Label ID="lblPhone" runat="server" Text="Phone" CssClass="col-sm-4 control-label" AssociatedControlID="txtPhone" />
                            <div class="col-sm-8">
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Client or participant's phone number"></asp:TextBox>
                                     <%-- <span class="input-group-addon"><i class="fa fa-question-circle fa-fw fa-lgXXX"></i></span>--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblAddress" runat="server" Text="Address" CssClass="col-sm-4 control-label" AssociatedControlID="txtAddress" />
                            <div class="col-sm-8">
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Address address"></asp:TextBox>
                                     <%-- <span class="input-group-addon"><i class="fa fa-question-circle fa-fw fa-lgXXX"></i></span>--%>
                            </div>
                        </div>
                    <div class="form-group">
                        <asp:Label ID="lblCity" runat="server" Text="City" CssClass="col-sm-4 control-label" AssociatedControlID="txtCity" />
                        <div class="col-sm-8">
                                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="City"></asp:TextBox>
                                 <%-- <span class="input-group-addon"><i class="fa fa-question-circle fa-fw fa-lgXXX"></i></span>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblState" runat="server" Text="State" CssClass="col-sm-4 control-label" AssociatedControlID="ddlState" />
                        <div class="col-sm-8">
                                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" AutoPostBack="False" DataSourceID="odsStates" DataTextField="StateName" DataValueField="StateCode" AppendDataBoundItems="true" placeholder="State of residence">
                                    <asp:ListItem Value="" Text="" />
                                </asp:DropDownList>
                                 <%-- <span class="input-group-addon"><i class="fa fa-question-circle fa-fw fa-lgXXX"></i></span>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblZipCode" runat="server" Text="Zip Code" CssClass="col-sm-4 control-label" AssociatedControlID="txtZipCode" />
                        <div class="col-sm-8">
                                <asp:TextBox ID="txtZipCode" runat="server" CssClass="form-control" placeholder="Zip code"></asp:TextBox>
                                 <%-- <span class="input-group-addon"><i class="fa fa-question-circle fa-fw fa-lgXXX"></i></span>--%>
                        </div>
                    </div>
                        <div class="form-group">
                            <asp:Label ID="lblStaffLastName" runat="server" Text="CPCS Staff" CssClass="col-sm-4 control-label" AssociatedControlID="txtStaffName" />
                            <div class="col-sm-8">
                                <telerik:RadAutoCompleteBox
                                    ID="txtStaffName"
                                    runat="server"
                                    DataSourceID="odsStaff"
                                    DataTextField="StaffName"
                                    DataValueField="StaffName"
                                    EmptyMessage="Enter a staff name to filter against"
                                    InputType="Text"
                                      MinFilterLength="3" Filter="Contains"
                                    Width="100%"
                                    AllowCustomEntry="false"
                                    TextSettings-SelectionMode="Single"
                                    Delimiter=" "
                                    ShowLoadingIcon="true" CssClass="text-capitalize">
                                </telerik:RadAutoCompleteBox>
                            </div>
                        </div>
                       <%-- <div class="form-group">
                            <asp:Label ID="lblCaseType" runat="server" Text="Case Type" CssClass="col-sm-4 control-label" AssociatedControlID="ddlCaseType" />
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ddlCaseType" runat="server" CssClass="form-control" DataSourceID="odsCaseTypes" DataTextField="CaseTypeName" DataValueField="CaseTypeID" AppendDataBoundItems="true" placeholder="Filter by case type">
                                    <asp:ListItem Text="" />
                                </asp:DropDownList>
                            </div>
                        </div>--%>
                    </div>
             </div>
        </div>
    <div class="row-spacer clearfix"></div>
    <div class="text-center">
        <asp:Button ID="btnSubmit" CssClass="btn btn-lg btn-primary" runat="server" Text="Search" ValidationGroup="search" CausesValidation="true" ToolTip="Apply filter and perform a search with options given." />
    </div>
    <div class="row-spacer clearfix"></div>
    <telerik:RadGrid ID="gridCPCSCaseSearch" runat="server" AllowPaging="True" ShowFooter="True" CellSpacing="-1" Width="100%" HorizontalAlign="Center" DataSourceID="dsSearchResults" PageSize="10" Visible="false"  FilterItemStyle-HorizontalAlign="NotSet">
        <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        <ClientSettings EnablePostBackOnRowClick="false" Selecting-AllowRowSelect="true">
            <Scrolling AllowScroll="False" ScrollHeight="500px" UseStaticHeaders="true"></Scrolling>           
        </ClientSettings>
        <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="None" ShowFooter="True" AllowMultiColumnSorting="False" DataKeyNames="CaseID, CaseGUID">
            <HeaderStyle />
            <PagerStyle PageSizes="5,10,25,50,100,250,500" Position="Bottom"  PageButtonCount="5" PageSizeControlType="RadDropDownList" EnableSEOPaging="false" SEOPagingQueryStringKey="ConflictCheck"                
                 PagerTextFormat="{4} Page {0} from {1} pages, displaying rows {2} to {3} from {5} records"  
                />
            <Columns>               
                <telerik:GridTemplateColumn FilterControlAltText="Filter ParticipantName column" HeaderText="Participant Name&lt;br /&gt;&lt;small&gt;Role / Date of Birth / Address&lt;/small&gt;" UniqueName="ParticipantName">
                    <ItemTemplate>
                   <p>    <a href="/apps/peoplesearch/PersonCase.aspx?<%#IIf(Eval("ParticipantRole") = "Client", "clientguid=" & Eval("ClientGUID"), "participantguid=" & Eval("ParticipantGUID")) %>"><asp:Label ID="ParticipantNameLabel" runat="server" Text='<%# GetTitleCase(Eval("ParticipantName")) %>' CssClass="bold"></asp:Label></a> </p>
 <p>
   <asp:Label ID="ParticipantRoleLabel" runat="server" Text='<%# IIf(Eval("ParticipantRole").ToString <> "", "(" & Eval("ParticipantRole").ToString & ")", "") %>' CssClass="text-success bold"></asp:Label>
                           <%# IIf(IsDate(Eval("ParticipantDOB", "{0:d}")), "| " & Eval("ParticipantDOB", "{0:d}") & ", <strong class=text-danger>(" & Eval("ParticipantAge") & " years old)</strong>", "") %>
</p>
 <p>
                       <%# IIf(GetTitleCase(Eval("ParticipantAddress") & ", " & Eval("ParticipantCity") & ", " & Eval("ParticipantState") & " " & Eval("ParticipantZipCode")).ToString.Trim <> ", ,", GetTitleCase(Eval("ParticipantAddress") & ", " & Eval("ParticipantCity") & ", " & Eval("ParticipantState") & " " & Eval("ParticipantZipCode")).ToString.Trim.Replace(", ,", ""), "~address information not found~") %></p>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn FilterControlAltText="Filter LeadCharge column" HeaderText="Case Number &lt;br /&gt;&lt;small&gt; Disposition / Lead Charge&lt;/small&gt;" UniqueName="LeadCharge">
                    <ItemTemplate>
                    <p>  <a href="/apps/casemanagement/managementcasedetails.aspx?caseguid=<%# Eval("CaseGUID") %>"><asp:Label ID="CaseNumberLabel" runat="server" Text='<%# Eval("CaseNumber") %>' CssClass="bold"></asp:Label></a></p> 
                       <p>     <asp:Label ID="DispositionLabel" runat="server" Text='<%# GetTitleCase(Eval("Disposition")) %>' CssClass="bold text-danger"></asp:Label></p> 
                       <p>     <asp:Label ID="LeadChargeLabel" runat="server" Text='<%# GetTitleCase(Eval("LeadCharge")) %>' CssClass="text-success"></asp:Label></p> 
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn FilterControlAltText="Filter ClientName column" HeaderText="Client Name&lt;br /&gt;&lt;small&gt;Staff&lt;/small&gt;" UniqueName="ClientName">
                    <ItemTemplate>
                        <p>  <a href="/apps/peoplesearch/PersonCase.aspx?clientguid=<%# Eval("ClientGUID") %>"><asp:Label ID="ClientNameLabel" runat="server" Text='<%# GetTitleCase(Eval("ClientName").ToString) %>' CssClass="bold"></asp:Label></a> </p>
                      <p>  <a href="/apps/peoplesearch/PersonCase.aspx?attorneyguid=<%# Eval("AttorneyGUID") %>"><asp:Label ID="StaffNameLabel" runat="server" Text='<%# GetTitleCase(Eval("AttorneyName")) %>' CssClass="text-mutedxx"></asp:Label></a> </p>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="Opened" DataType="System.DateTime" FilterControlAltText="Filter Opened column" HeaderText="Opened<br/><small>Closed</small>" SortExpression="Opened" UniqueName="Opened">
                    <ItemTemplate>
                        <p><asp:Label ID="OpenedLabel" runat="server" Text='<%# Eval("CaseDateOpened", "{0:d}")  %>' CssClass="bold"></asp:Label></p>
                      <p>  <asp:Label ID="ClosedLabel" runat="server" Text='<%# Eval("CaseDateClosed", "{0:d}") %>'></asp:Label></p> 
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
        SelectMethod="SearchResults"
        >
        <SelectParameters>
            <asp:ControlParameter Name="personName" ControlID="txtPersonName" PropertyName="Text" ConvertEmptyStringToNull="false" Type="String" />
            <asp:ControlParameter Name="SearchType" ControlID="blSearchType" PropertyName="SelectedValue" ConvertEmptyStringToNull="True" Type="Int32" />
            <asp:ControlParameter Name="DOB" ControlID="dteBirthdate" PropertyName="SelectedDate" ConvertEmptyStringToNull="True" Type="String" />
            <asp:ControlParameter Name="dobRange" ControlID="ddlFlexible" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
            <asp:ControlParameter Name="phoneNumber" ControlID="txtPhone" PropertyName="Text" ConvertEmptyStringToNull="false" Type="String" />
            <asp:ControlParameter Name="streetAddress" ControlID="txtAddress" PropertyName="Text" ConvertEmptyStringToNull="false" Type="String" />
            <asp:ControlParameter Name="city" ControlID="txtCity" PropertyName="Text" ConvertEmptyStringToNull="false" Type="String" />
            <asp:ControlParameter Name="state" ControlID="ddlState" PropertyName="SelectedValue" ConvertEmptyStringToNull="false" Type="String" />
            <asp:ControlParameter Name="zipCode" ControlID="txtZipCode" PropertyName="Text" ConvertEmptyStringToNull="false" Type="String" />
            <asp:ControlParameter Name="staffName" ControlID="txtStaffName" PropertyName="Text" ConvertEmptyStringToNull="false" Type="String" />
            <asp:ControlParameter Name="participantRoles" ControlID="ddlRole" PropertyName="Text" ConvertEmptyStringToNull="false" Type="String" />
            <asp:ControlParameter Name="caseNumber" ControlID="txtCaseNumber" PropertyName="Text" ConvertEmptyStringToNull="false" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsStates" runat="server" TypeName="Defender.CPCSLocations" SelectMethod="getStates" EnableCaching="true">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsRoles" runat="server" TypeName="Defender.CPCSRoles" SelectMethod="getNonStaffRoles" EnableCaching="true" />
    <asp:ObjectDataSource ID="odsAttorneys" runat="server" TypeName="Defender.PeopleSearch" SelectMethod="getAllAttorneyNames" EnableCaching="true" />
    <asp:ObjectDataSource ID="odsStaff" runat="server" TypeName="Defender.PeopleSearch" SelectMethod="getAllStaff" EnableCaching="true" />
    <asp:ObjectDataSource ID="odsParticipants" runat="server" TypeName="Defender.PeopleSearch" SelectMethod="getParticipantNames" EnableCaching="true" />
    <asp:ObjectDataSource ID="odsCaseTypes"
        runat="server"
        SelectMethod="getCaseTypes"
        TypeName="Defender.CPCSCasesDAL"
        EnableCaching="true" />
        <telerik:RadAjaxPanel ID="RadAjaxDefaultPanel1" runat="server" LoadingPanelID="RadAjaxDefaultLoadingPanel1">
        </telerik:RadAjaxPanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" runat="Server">
</asp:Content>