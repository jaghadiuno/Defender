<%@ Page Title="Case Search" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="Default.aspx.vb" Inherits="Defender._Default4" %>


<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>





<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="Server">
</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">


    <asp:Panel ID="AlertPanel" runat="server" Visible="false" CssClass="alert alert-danger text-center text-danger">
        <p>
            <asp:Label ID="lblAlertPanel" runat="server" /></p>
    </asp:Panel>



    <asp:Panel ID="SearchPanel" runat="server" CssClass="panel panel-default">
        <div class="panel-body bg-success">
            
            
           <div class="row">

                
                      
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxDefaultLoadingPanel1" CssClass="col-md-10">
            
            <div class="form-group">


                <div class="col-sm-6">



                    <div class="form-horizontal">

                        



                        <div class="form-group">




                            <asp:Label ID="lblClient" runat="server" Text="Client" CssClass="col-sm-4 control-label" AssociatedControlID="txtClientName" />

                            <div class="col-sm-8">



                                <telerik:RadAutoCompleteBox
                                    ID="txtClientName"
                                    runat="server"

                                    DataSourceID="odsClients"

                                    DataTextField="ClientNameReverse"
                                    DataValueField="ClientNameReverse"

                                    EmptyMessage="Client's name"
                                    InputType="Text"

                                    MinFilterLength="3" 

                                    Filter="StartsWith"  

                                    Width="100%"
                                    AllowCustomEntry="false"
                                    TextSettings-SelectionMode="Single"
                                    Delimiter=";"

                                    ShowLoadingIcon="true" 
                                    CssClass="text-capitalize"
                                    
                                    >
                                </telerik:RadAutoCompleteBox>



                            </div>



                        </div>





                        <div class="form-group">

                            <asp:Label ID="lblCaseNumber" runat="server" Text="Case Number" CssClass="col-sm-4 control-label" AssociatedControlID="txtCaseNumber" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="txtCaseNumber" runat="server" CssClass="form-control" placeholder="Case number"></asp:TextBox>
                            </div>

                        </div>



                        <div class="form-group">

                            <asp:Label ID="lblCharge" runat="server" Text="Charge" CssClass="col-sm-4 control-label" AssociatedControlID="txtCharge" />
                            <div class="col-sm-8">
                                 

                                
                                <telerik:RadAutoCompleteBox
                                    ID="txtCharge"
                                    runat="server"
                                    DataSourceID="odsCharges"
                                    DataTextField="Offense"
                                    DataValueField="Offense"
                                    EmptyMessage="Filter by Offense"
                                    InputType="Text"
                                      MinFilterLength="3" Filter="StartsWith"
                                    Width="100%"
                                    AllowCustomEntry="false"
                                    TextSettings-SelectionMode="Single"
                                    Delimiter=";"
                                    ShowLoadingIcon="true" CssClass="text-capitalize">
                                </telerik:RadAutoCompleteBox>



                            </div>

                        </div>



                        <div class="form-group">

                            <asp:Label ID="lblCaseType" runat="server" Text="Case Type" CssClass="col-sm-4 control-label" AssociatedControlID="ddlCaseType" />
                            <div class="col-sm-8">



                                <asp:DropDownList ID="ddlCaseType" runat="server" CssClass="form-control" DataSourceID="odsCaseTypes" DataTextField="CaseTypeName" DataValueField="CaseTypeID" AppendDataBoundItems="true" placeholder="Filter by case type">
                                    <asp:ListItem Text="" />
                                </asp:DropDownList>


                            </div>



                        </div>



                         


                        <div class="form-group zero-margin-bottom">

                            <asp:Label ID="lblOpenedFrom" runat="server" Text="Opened" CssClass="col-sm-4 control-label" AssociatedControlID="ddlOpenedFromDate" />


                            <div class="col-sm-8">


                                <asp:DropDownList ID="ddlOpenedFromDate" runat="server" CssClass="form-control" AutoPostBack="true" >
                                    <asp:ListItem Text="Between" />
                                    <asp:ListItem Text="From" />
                                </asp:DropDownList>

                           

                                <telerik:RadDatePicker ID="dteCaseOpenedFrom" runat="server" ShowPopupOnFocus="False" DatePopupButton-Visible="true" DatePopupButton-Width="30px" Width="100%" DateInput-Width="100%"></telerik:RadDatePicker>

                             


                            </div>


                        </div>
                        
                        <asp:PlaceHolder ID="phCaseOpenedTo" runat="server" Visible="false">


                        <div class="form-group zero-margin-top">                            


                            <asp:Label ID="lblCaseOpenedTo" runat="server" Text="and" CssClass="col-sm-4 control-label" Font-Bold="false"  AssociatedControlID="dteCaseClosedTo" />

                            <div class="col-sm-8">

                              
                                <telerik:RadDatePicker ID="dteCaseOpenedTo" runat="server" ShowPopupOnFocus="False" DatePopupButton-Visible="true"  DatePopupButton-Width="30px" Width="100%" DateInput-Width="100%"></telerik:RadDatePicker>


                            </div>


                        </div>



                        </asp:PlaceHolder>


                        

                        <div class="form-group zero-margin-bottom">

                            <asp:Label ID="lblClosedFrom" runat="server" Text="Closed" CssClass="col-sm-4 control-label" AssociatedControlID="dteCaseClosedFrom" />


                            <div class="col-sm-8">


                                <asp:DropDownList ID="ddlClosedFromDate" runat="server" CssClass="form-control" AutoPostBack="True">
                                    <asp:ListItem Text="Between" />
                                    <asp:ListItem Text="On" />
                                </asp:DropDownList>

                             

                                <telerik:RadDatePicker ID="dteCaseClosedFrom" runat="server" ShowPopupOnFocus="False" DatePopupButton-Visible="true" DatePopupButton-Width="30px" Width="100%" DateInput-Width="100%" ></telerik:RadDatePicker>


                            </div>


                        </div>

                        <asp:PlaceHolder ID="phCaseClosedTo" runat="server" Visible="false">

                        <div class="form-group zero-margin-top">
                             

                            <asp:Label ID="lblClosedTo" runat="server" Text="and" CssClass="col-sm-4 control-label" Font-Bold="false" AssociatedControlID="dteCaseClosedTo" />

                            <div class="col-sm-8">                                
                        

                                <telerik:RadDatePicker ID="dteCaseClosedTo" runat="server"  ShowPopupOnFocus="False" DatePopupButton-Visible="true" DatePopupButton-Width="30px" Width="100%" DateInput-Width="100%"></telerik:RadDatePicker>


                            </div>


                        </div>

                    
                        </asp:PlaceHolder>







                </div>

</div> 

                <div class="col-sm-6">



                    <div class="form-horizontal">
                        

                        <div class="form-group">

                            <asp:Label ID="lblDivision" runat="server" Text="Division" CssClass="col-sm-4 control-label" AssociatedControlID="ddlDivision" />
                            <div class="col-sm-8">



                                <asp:DropDownList ID="ddlDivision" runat="server" CssClass="form-control" DataSourceID="odsDivisions" DataTextField="DivisionName" DataValueField="DivisionID" AppendDataBoundItems="true" placeholder="Filter by division">
                                    <asp:ListItem Text="" />
                                </asp:DropDownList>


                            </div>


                        </div>


                        <div class="form-group">

                            <asp:Label ID="lblOffice" runat="server" Text="Office" CssClass="col-sm-4 control-label" AssociatedControlID="ddlOffice" />
                            <div class="col-sm-8">


                                <asp:DropDownList ID="ddlOffice" runat="server" CssClass="form-control" DataSourceID="odsOffices" DataTextField="OfficeName" DataValueField="OfficeID" AppendDataBoundItems="true" placeholder="Filter by Office">
                                    <asp:ListItem Text="" />
                                </asp:DropDownList>



                            </div>

                        </div>


                        <div class="form-group">

                            <asp:Label ID="lblUnit" runat="server" Text="Unit" CssClass="col-sm-4 control-label" AssociatedControlID="ddlUnit" />
                            <div class="col-sm-8">


                                <asp:DropDownList ID="ddlUnit" runat="server" CssClass="form-control" DataSourceID="odsUnits" DataTextField="UnitTypeName" DataValueField="UnitTypeID" AppendDataBoundItems="true" placeholder="Filter by unit">
                                    <asp:ListItem Text="" />
                                </asp:DropDownList>



                            </div>

                        </div>




                        <div class="form-group">

                            <asp:Label ID="lblParticipant" runat="server" Text="Participant" CssClass="col-sm-4 control-label" AssociatedControlID="txtParticipantName" />

                            <div class="col-sm-8">

                                <telerik:RadAutoCompleteBox
                                    ID="txtParticipantName"
                                    runat="server"
                                    DataSourceID="odsParticipants"
                                    DataTextField="ParticipantNameReverse"
                                    DataValueField="ParticipantNameReverse"
                                    EmptyMessage="Participant's name"
                                    InputType="Text"
                                      MinFilterLength="3" Filter="StartsWith"
                                    Width="100%"
                                    AllowCustomEntry="false"
                                    TextSettings-SelectionMode="Single"
                                    Delimiter=";"
                                    ShowLoadingIcon="true" CssClass="text-capitalize">
                                </telerik:RadAutoCompleteBox>



                            </div>
                        </div>




                        <div class="form-group">



                            <asp:Label ID="lblAttorney" runat="server" Text="Attorney" CssClass="col-sm-4 control-label" AssociatedControlID="txtAttorneyName" />

                            <div class="col-sm-8">


                                <telerik:RadAutoCompleteBox
                                    ID="txtAttorneyName"
                                    runat="server"
                                    DataSourceID="odsAttorneys"
                                    DataTextField="AttorneyNameReverse"
                                    DataValueField="AttorneyNameReverse"
                                    EmptyMessage="Attorney's name"
                                    InputType="Text"
                                      MinFilterLength="3" Filter="StartsWith"
                                    Width="100%"
                                    AllowCustomEntry="false"
                                    TextSettings-SelectionMode="Single"
                                    Delimiter=";"
                                    ShowLoadingIcon="true" CssClass="text-capitalize">
                                </telerik:RadAutoCompleteBox>
                            </div>


                        </div>



                        <div class="form-group">



                            <asp:Label ID="lblProsecutor" runat="server" Text="Prosecutor" CssClass="col-sm-4 control-label" AssociatedControlID="txtProsecutorName" />

                            <div class="col-sm-8">

                                <telerik:RadAutoCompleteBox
                                    ID="txtProsecutorName"
                                    runat="server"
                                    DataSourceID="odsProsecutors"
                                    DataTextField="ProsecutorNameReverse"
                                    DataValueField="ProsecutorNameReverse"
                                    EmptyMessage="Prosecutor's name"
                                    InputType="Text"
                                      MinFilterLength="3" Filter="StartsWith"
                                    Width="100%"
                                    AllowCustomEntry="false"
                                    TextSettings-SelectionMode="Single"
                                    Delimiter=";"
                                    ShowLoadingIcon="true" CssClass="text-capitalize">
                                </telerik:RadAutoCompleteBox>
                            </div>




                        </div>



                        <div class="form-group">




                            <asp:Label ID="lblJudge" runat="server" Text="Judge" CssClass="col-sm-4 control-label" AssociatedControlID="txtJudgeName" />

                            <div class="col-sm-8">
                                <telerik:RadAutoCompleteBox
                                    ID="txtJudgeName"
                                    runat="server"
                                    DataSourceID="odsJudges"
                                    DataTextField="JudgeNameReverse"
                                    DataValueField="JudgeNameReverse"
                                    EmptyMessage="Judge's name"
                                    InputType="Text"
                                      MinFilterLength="3" Filter="StartsWith"
                                    Width="100%"
                                    AllowCustomEntry="false"
                                    TextSettings-SelectionMode="Single"
                                    Delimiter=";"
                                    ShowLoadingIcon="true" CssClass="text-capitalize">
                                </telerik:RadAutoCompleteBox>
                            </div>




                        </div>




                        <div class="form-group">



                            <asp:Label ID="lblSSA" runat="server" Text="SSA" CssClass="col-sm-4 control-label" AssociatedControlID="txtSSAName" />

                            <div class="col-sm-8">



                                <telerik:RadAutoCompleteBox
                                    ID="txtSSAName"
                                    runat="server"
                                    DataSourceID="odsSSAs"
                                    DataTextField="SSANameReverse"
                                    DataValueField="SSANameReverse"
                                    EmptyMessage="SSA's name"
                                    InputType="Text"
                                      MinFilterLength="3" Filter="StartsWith"
                                    Width="100%"
                                    AllowCustomEntry="false"
                                    TextSettings-SelectionMode="Single"
                                    Delimiter=";"
                                    ShowLoadingIcon="true" CssClass="text-capitalize">
                                </telerik:RadAutoCompleteBox>

                            </div>




                        </div>



                        <div class="form-group">

                            <asp:Label ID="lblInvestigator" runat="server" Text="Investigator" CssClass="col-sm-4 control-label" AssociatedControlID="txtInvestigatorName" />

                            <div class="col-sm-8">




                                <telerik:RadAutoCompleteBox
                                    ID="txtInvestigatorName"
                                    runat="server"
                                    DataSourceID="odsInvestigators"
                                    DataTextField="InvestigatorNameReverse"
                                    DataValueField="InvestigatorNameReverse"
                                    EmptyMessage="Investigator's name"
                                    InputType="Text"
                                      MinFilterLength="3" Filter="StartsWith"
                                    Width="100%"
                                    AllowCustomEntry="false"
                                    TextSettings-SelectionMode="Single"
                                    Delimiter=";"
                                    ShowLoadingIcon="true" CssClass="text-capitalize">
                                </telerik:RadAutoCompleteBox>


                            </div>
                        </div>






                    </div>



                </div>


                 




            </div>


        </telerik:RadAjaxPanel>

 




               <div class="col-md-2"> 

                         
                   
                <div class="row-spacer clearfix"></div>
                             



                    <p>
                        <asp:CheckBox ID="chkHeldInCustody" runat="server" CssClass="" Text=" &nbsp; Held in Custody" />
                    </p>



                    <p>
                        <asp:CheckBox ID="chkCaseIsOpen" runat="server" CssClass="" Text=" &nbsp; Case is Open" />
                    </p>


                    <p>
                        <asp:CheckBox ID="chkSSAReferral" runat="server" CssClass="" Text=" &nbsp; SSA Referral" />
                    </p>



                           

                              
                                 

                    
                    <asp:LinkButton ID="btnSearch" CssClass="btn btn-primary btn-block btn-lg bold" runat="server"><i class="fa fa-fw fa-search-plus" aria-hidden="true"></i>

Search
                    </asp:LinkButton>

 


                   
                <div class="row-spacer clearfix"></div>




                   <p class="text-center bold small text-danger"><a href="default.aspx" class="text-danger" onclick="return confirm('Are you sure? All entries you have entered will be lost.');" > Reset Search Fields</a></p>
                              

                                       


</div>
          
               
            </div>




         
        </div>
    </asp:Panel>





    <telerik:RadGrid ID="gridCPCSCaseSearch" runat="server"
        AllowPaging="True" CellSpacing="-1"
        PageSize="10" Width="100%" HorizontalAlign="Center"
        AllowFilteringByColumn="false"
       
        EnableHeaderContextMenu="false"
        EnableHeaderContextFilterMenu="false"
        PagerStyle-AlwaysVisible="true"
        MasterTableView-DataKeyNames="CaseID, CaseGUID, CaseNumber"
        MasterTableView-ClientDataKeyNames="CaseID, CaseGUID, CaseNumber" 
        DataSourceID="SqlDSSearchResults"
        RenderMode="Lightweight" Visible="false" >



        <HeaderStyle Wrap="false" CssClass="rgHeaderAlt" />

        <GroupingSettings CaseSensitive="false" CollapseAllTooltip="Collapse all groups"></GroupingSettings>



        <ClientSettings AllowDragToGroup="True" AllowColumnHide="True" AllowColumnsReorder="True">

            <Scrolling AllowScroll="False" UseStaticHeaders="false"></Scrolling>
        </ClientSettings>

        <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>

        <ExportSettings ExportOnlyData="True" HideStructureColumns="False" IgnorePaging="True" Excel-Format="ExcelML">
            <Excel Format="ExcelML"></Excel>
        </ExportSettings>


        <MasterTableView
            AutoGenerateColumns="False"
            GroupLoadMode="Server"
            ShowGroupFooter="True"
            EnableGroupsExpandAll="True"

            CommandItemDisplay="Top" 
            ShowFooter="True"
            AllowMultiColumnSorting="True"
            AllowSorting="true"
          DataSourceID="SqlDSSearchResults">


            <PagerStyle
                Mode="NextPrevAndNumeric"
                PagerTextFormat="{4} {5} record(s) in {1} page(s)"
                Position="Bottom" 
                 PageSizeLabelText="Page Size: " PageSizes="5,10,25,50,100,250,500"
                
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
                <telerik:GridTemplateColumn Aggregate="CountDistinct" DataField="CaseNumber" FilterControlAltText="Filter CaseNumber column" FooterText="Unique Cases: " HeaderText="Case Number" SortExpression="CaseNumber" UniqueName="CaseNumber" ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text">
                    <ItemTemplate>

                        <a href="/apps/casemanagement/managementcasedetails.aspx?caseguid=<%# Eval("CaseGUID") %>" target="_blank" title="view case details" class="bold"><%# Eval("CaseNumber") %></a>

                    </ItemTemplate>

                    <FooterStyle CssClass="footer-text"></FooterStyle>

                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridTemplateColumn>


               <%-- <telerik:GridTemplateColumn Aggregate="CountDistinct" DataField="AttorneyName" FilterControlAltText="Filter AttorneyName column" FooterText="<strong>Attorneys:</strong> " FooterStyle-CssClass="footer-text" HeaderText="Attorney" SortExpression="AttorneyName" UniqueName="AttorneyName" Visible="false">

                    <ItemTemplate>
                        <a href="/apps/peoplesearch/PersonCase.aspx?attorneyguid=<%# Eval("AttorneyGUID") %>">
                            <asp:Label ID="StaffNameLabel" runat="server" Text='<%# GetTitleCase(Eval("AttorneyName")) %>'></asp:Label></a>
                    </ItemTemplate>

                    <FooterStyle CssClass="footer-text"></FooterStyle>
                </telerik:GridTemplateColumn>

                <telerik:GridBoundColumn DataField="AttorneyBBO" FilterControlAltText="Filter AttorneyBBO column" HeaderText="BBO" SortExpression="AttorneyBBO" UniqueName="AttorneyBBO" ReadOnly="True" Visible="false">
                </telerik:GridBoundColumn>
--%>


                <telerik:GridTemplateColumn DataField="ClientName" FilterControlAltText="Filter ClientName column" HeaderText="Client" SortExpression="ClientName" UniqueName="ClientName" FooterText="<b>Clients:</b> " FooterStyle-CssClass="footer-text" Aggregate="CountDistinct" ItemStyle-CssClass="no-wrap">
                    <ItemTemplate>
                        <a href="/apps/peoplesearch/PersonCase.aspx?clientguid=<%# Eval("ClientGUID") %>">
                            <asp:Label ID="ClientNameLabel" runat="server" Text='<%# GetTitleCase(Eval("ClientName").ToString) %>'></asp:Label></a>
                    </ItemTemplate>

                    <FooterStyle CssClass="footer-text"></FooterStyle>

                    <ItemStyle CssClass="no-wrap"></ItemStyle>
                </telerik:GridTemplateColumn>


                <telerik:GridBoundColumn DataField="Opened" FilterControlAltText="Filter Opened column" HeaderText="Opened" SortExpression="Opened" UniqueName="Opened" DataType="System.DateTime" DataFormatString="{0:d}">
                </telerik:GridBoundColumn>


                <telerik:GridBoundColumn DataField="Closed" FilterControlAltText="Filter Closed column" HeaderText="Closed" SortExpression="Closed" UniqueName="Closed" DataType="System.DateTime" DataFormatString="{0:d}">
                </telerik:GridBoundColumn>





                <telerik:GridCheckBoxColumn DataField="AdministrativelyClosed" DataType="System.Boolean" FilterControlAltText="Filter AdministrativelyClosed column" HeaderText="Administratively Closed" SortExpression="AdministrativelyClosed" UniqueName="AdministrativelyClosed" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" Visible="false">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </telerik:GridCheckBoxColumn>


                <telerik:GridCheckBoxColumn DataField="Open" DataType="System.Boolean" FilterControlAltText="Filter Open column" HeaderText="Open" SortExpression="Open" UniqueName="Open" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" Visible="false">
                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </telerik:GridCheckBoxColumn>


                <telerik:GridBoundColumn DataField="CaseTypeName" FilterControlAltText="Filter CaseTypeName column" HeaderText="Case Type" SortExpression="CaseTypeName" UniqueName="CaseTypeName">
                </telerik:GridBoundColumn>



                <telerik:GridBoundColumn DataField="DepartmentName" FilterControlAltText="Filter DepartmentName column" HeaderText="Department" SortExpression="DepartmentName" UniqueName="DepartmentName" Visible="false">
                </telerik:GridBoundColumn>


                <telerik:GridBoundColumn DataField="DivisionName" FilterControlAltText="Filter DivisionName column" HeaderText="Division" SortExpression="DivisionName" UniqueName="DivisionName" ItemStyle-CssClass="no-wrap" Visible="false">
                    <ItemStyle CssClass="no-wrap"></ItemStyle>
                </telerik:GridBoundColumn>


                <telerik:GridBoundColumn DataField="OfficeName" FilterControlAltText="Filter OfficeName column" HeaderText="Office" SortExpression="OfficeName" UniqueName="OfficeName">
                </telerik:GridBoundColumn>


                <telerik:GridBoundColumn DataField="UnitTypeName" FilterControlAltText="Filter UnitTypeName column" HeaderText="Unit" SortExpression="UnitTypeName" UniqueName="UnitTypeName">
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="JudgeName" FilterControlAltText="Filter JudgeName column" HeaderText="Judge" SortExpression="JudgeName" UniqueName="JudgeName" ReadOnly="True" ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text" FooterText="Judges: " Aggregate="CountDistinct" ItemStyle-CssClass="no-wrap" Visible="false">
                    <FooterStyle CssClass="footer-text"></FooterStyle>

                    <ItemStyle Wrap="False" CssClass="no-wrap"></ItemStyle>
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="ProsecutorName" FilterControlAltText="Filter ProsecutorName column" HeaderText="Prosecutor" ReadOnly="True" SortExpression="ProsecutorName" UniqueName="ProsecutorName" ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text" FooterText="Prosecutors: " Aggregate="CountDistinct" ConvertEmptyStringToNull="true" ItemStyle-CssClass="no-wrap" Visible="false">
                    <FooterStyle CssClass="footer-text"></FooterStyle>

                    <ItemStyle Wrap="False" CssClass="no-wrap"></ItemStyle>
                </telerik:GridBoundColumn>

                <telerik:GridBoundColumn DataField="CourtName" FilterControlAltText="Filter CourtName column" HeaderText="Court" SortExpression="CourtName" UniqueName="CourtName" ItemStyle-Wrap="false" FooterStyle-CssClass="footer-text" FooterText="Courts: " Aggregate="CountDistinct" Visible="false" >
                    <FooterStyle CssClass="footer-text"></FooterStyle>

                    <ItemStyle Wrap="False"></ItemStyle>
                </telerik:GridBoundColumn>


            </Columns>



        </MasterTableView>


        <PagerStyle PageSizes="5,10,25,50,100,250,500" AlwaysVisible="True"></PagerStyle>


    </telerik:RadGrid>





     <asp:ObjectDataSource ID="SqlDSSearchResultsXX" 
        runat="server" 
 TypeName="Defender.CPCSCasesDAL" 
        SelectMethod="getAllCases" 
        EnableCaching="True" CacheDuration="6000">

          

        <SelectParameters>
            <asp:ControlParameter ControlID="txtCaseNumber" Name="caseNo" PropertyName="Text" Type="String" />


            <asp:ControlParameter ControlID="txtCharge" Name="charge" PropertyName="Text" Type="String" />

            <asp:ControlParameter ControlID="ddlCaseType" Name="casetype" PropertyName="SelectedValue" Type="Int32" />



            <asp:ControlParameter ControlID="ddlDivision" Name="division" PropertyName="SelectedValue" Type="Int32" />

            <asp:ControlParameter ControlID="ddlOffice" Name="office" PropertyName="SelectedValue" Type="Int32" />

            <asp:ControlParameter ControlID="ddlUnit" Name="unitType" PropertyName="SelectedValue" Type="Int32" />






            <asp:ControlParameter ControlID="dteCaseOpenedFrom" Name="dteCaseOpenedFrom" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="dteCaseOpenedTo" Name="dteCaseOpenedTo" PropertyName="SelectedDate" Type="DateTime" />


            <asp:ControlParameter ControlID="dteCaseClosedFrom" Name="dteCaseClosedFrom" PropertyName="SelectedDate" Type="DateTime" />
            <asp:ControlParameter ControlID="dteCaseClosedTo" Name="dteCaseClosedTo" PropertyName="SelectedDate" Type="DateTime" />






            <asp:ControlParameter ControlID="txtClientName" Name="clientName" PropertyName="Text" Type="String" />

            <asp:ControlParameter ControlID="txtParticipantName" Name="participantName" PropertyName="Text" Type="String" />


            <asp:ControlParameter ControlID="txtAttorneyName" Name="attorneyName" PropertyName="Text" Type="String" />

            <asp:ControlParameter ControlID="txtProsecutorName" Name="prosecutorName" PropertyName="Text" Type="String" />


            <asp:ControlParameter ControlID="txtJudgeName" Name="judgeName" PropertyName="Text" Type="String" />

            <asp:ControlParameter ControlID="txtSSAName" Name="ssaName" PropertyName="Text" Type="String" />

            <asp:ControlParameter ControlID="txtInvestigatorName" Name="investigatorName" PropertyName="Text" Type="String" />



            <asp:ControlParameter ControlID="chkHeldInCustody" Name="Custody" PropertyName="Checked" Type="Int32" />

            <asp:ControlParameter ControlID="chkCaseIsOpen" Name="OpenStatus" PropertyName="Checked" Type="Int32" />

            <asp:ControlParameter ControlID="chkSSAReferral" Name="ssaReferral" PropertyName="Checked" Type="Int32" />


        </SelectParameters>



         </asp:ObjectDataSource>


    


    <asp:SqlDataSource ID="SqlDSSearchResults"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>"
        SelectCommand="df_SP_Cases_Search"
        SelectCommandType="StoredProcedure" EnableCaching="true" CacheDuration="600">


        <SelectParameters>
                       

            <asp:ControlParameter ControlID="dteCaseOpenedFrom" Name="dteCaseOpenedFrom" PropertyName="SelectedDate" Type="DateTime" DefaultValue="1/1/1900" />
            <asp:ControlParameter ControlID="dteCaseOpenedTo" Name="dteCaseOpenedTo" PropertyName="SelectedDate" Type="DateTime" DefaultValue="1/1/1900" />
            
            <asp:ControlParameter ControlID="dteCaseClosedFrom" Name="dteCaseClosedFrom" PropertyName="SelectedDate" Type="DateTime" DefaultValue="1/1/1900" />
            <asp:ControlParameter ControlID="dteCaseClosedTo" Name="dteCaseClosedTo" PropertyName="SelectedDate" Type="DateTime" DefaultValue="1/1/1900" />                      

            <asp:ControlParameter ControlID="chkSSAReferral" Name="ssaReferral" PropertyName="Checked" Type="Int32" DefaultValue="2" />

            <asp:ControlParameter ControlID="ddlCaseType" Name="casetype" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />

            <asp:ControlParameter ControlID="ddlDivision" Name="division" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />

            <asp:ControlParameter ControlID="chkHeldInCustody" Name="Custody" PropertyName="Checked" Type="Int32" DefaultValue="0" />

            <asp:ControlParameter ControlID="chkCaseIsOpen" Name="OpenStatus" PropertyName="Checked" Type="Int32" DefaultValue="0" />

            <asp:ControlParameter ControlID="ddlUnit" Name="unitType" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />

            <asp:ControlParameter ControlID="ddlOffice" Name="office" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />


            <asp:ControlParameter ControlID="txtInvestigatorName" Name="investigatorName" PropertyName="Text" Type="String" DefaultValue="None" />

            <asp:ControlParameter ControlID="txtCaseNumber" Name="caseNo" PropertyName="Text" Type="String" DefaultValue="None" />
            
            <asp:ControlParameter ControlID="txtCharge" Name="charge" PropertyName="Text" Type="String" DefaultValue="None" />


            <asp:ControlParameter ControlID="txtClientName" Name="clientName" PropertyName="Text" Type="String" DefaultValue="None" />

            <asp:ControlParameter ControlID="txtAttorneyName" Name="attorneyName" PropertyName="Text" Type="String" DefaultValue="None" />

            <asp:ControlParameter ControlID="txtParticipantName" Name="participantName" PropertyName="Text" Type="String" DefaultValue="None" />


            <asp:ControlParameter ControlID="txtProsecutorName" Name="prosecutorName" PropertyName="Text" Type="String" DefaultValue="None" />


            <asp:ControlParameter ControlID="txtJudgeName" Name="judgeName" PropertyName="Text" Type="String" DefaultValue="None" />

            <asp:ControlParameter ControlID="txtSSAName" Name="ssaName" PropertyName="Text" Type="String" DefaultValue="None" />


        </SelectParameters>



    </asp:SqlDataSource>






    <asp:ObjectDataSource ID="odsClients"
        runat="server"
        SelectMethod="getAllClientNames"
        TypeName="Defender.CPCSClients"
        EnableCaching="true" />


    <asp:ObjectDataSource ID="odsAttorneys"
        runat="server"
        SelectMethod="getAllAttorneyNames"
        TypeName="Defender.CPCSAttorneys"
        EnableCaching="true" />



    <asp:ObjectDataSource ID="odsProsecutors"
        runat="server"
        SelectMethod="getAllProsecutorNames"
        TypeName="Defender.CPCSProsecutors"
        EnableCaching="true" />


    <asp:ObjectDataSource ID="odsJudges"
        runat="server"
        SelectMethod="getAllJudgeNames"
        TypeName="Defender.CPCSJudges"
        EnableCaching="true" />



    <asp:ObjectDataSource ID="odsParticipants"
        runat="server"
        SelectMethod="getAllParticipantNames"
        TypeName="Defender.CPCSParticipants"
        EnableCaching="true" />




    <asp:ObjectDataSource ID="odsInvestigators"
        runat="server"
        SelectMethod="getAllInvestigatorNames"
        TypeName="Defender.CPCSInvestigators"
        EnableCaching="true" />



    <asp:ObjectDataSource ID="odsSSAs"
        runat="server"
        SelectMethod="getAllSSANames"
        TypeName="Defender.CPCSSSAs"
        EnableCaching="true" />






    <asp:ObjectDataSource ID="odsOffices"
        runat="server"
        SelectMethod="getAllOfficeNames"
        TypeName="Defender.CPCS_Org"
        EnableCaching="true" />


    <asp:ObjectDataSource ID="odsDivisions"
        runat="server"
        SelectMethod="getAllDivisionNames"
        TypeName="Defender.CPCS_Org"
        EnableCaching="true" />


    <asp:ObjectDataSource ID="odsUnits"
        runat="server"
        SelectMethod="getAllUnitNames"
        TypeName="Defender.CPCS_Org"
        EnableCaching="true" />



    <asp:ObjectDataSource ID="odsCaseTypes"
        runat="server"
        SelectMethod="getCaseTypes"
        TypeName="Defender.CPCSCasesDAL"
        EnableCaching="true" />


    <asp:ObjectDataSource ID="odsCharges"
        runat="server"
        SelectMethod="getOffenses"
        TypeName="Defender.CPCSCasesDAL"
        EnableCaching="true"
        
        >

    </asp:ObjectDataSource>





</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" runat="Server">
</asp:Content>

