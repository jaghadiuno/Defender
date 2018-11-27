<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="AttorneyCases.ascx.vb" Inherits="Defender.AttorneyCases" %>
 

<%--  <div class="row-spacer clearfix"></div>--%>


<asp:HiddenField ID="hdnAttorneyName" runat="server" Visible ="false"  />


 


<asp:PlaceHolder ID="phAttorneyInfoShow" runat="server" Visible="false">


<span class="text-right pull-right">
    <a href="/apps/reports/attorney.aspx?attorneyguid=<%=Request.QueryString("attorneyguid") %>" target="_blank" class="text-success bold">
  <i class="fa fa-bar-chart fa-fw fa-lg text-success" aria-hidden="true"></i></a>   <a href="/apps/reports/attorney.aspx?attorneyguid=<%=Request.QueryString("attorneyguid") %>" target="_blank" class="text-success bold">Case Reports
    </a>
</span>






<h2 class="bold text-nounderline zero-margin text-capitalize">   
<i class="fa fa-user" aria-hidden="true"></i>    

   <asp:LinkButton ID="lkDisplayInfo" runat="server" Visible="false" CssClass="text-nounderline active">    Attorney:  
       
       <small>
           <asp:Literal ID="ltrlAttorneyName" runat="server"></asp:Literal>  

 
                                                                                                                       </small>

   </asp:LinkButton> 
</h2>

</asp:PlaceHolder>

 




        <asp:ListView ID="lvAttorneyDetails" runat="server" DataKeyNames="AttorneyID" DataSourceID="odsAttorneyDetails" Visible="true" Enabled="true">

            <EmptyDataTemplate>
            </EmptyDataTemplate>

            <ItemTemplate>


<div class="row">
    <div class="col-md-6">
        
                <table class="table table-responsive table-hover bg-success" style="border: 1px solid #006600 !important;">
                  
                   
                    
                    
                    <tr>
                        <td class="bold">Attorney ID:</td>
                        <td>
                            <asp:Label ID="AttorneyIDLabel" runat="server" Text='<%# Eval("AttorneyID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">BBO:</td>
                        <td>
                            <asp:Label ID="SSNLabel" runat="server" Text='<%# Eval("BBO") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">First Name:</td>
                        <td>
                            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' CssClass="bold" />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Middle Name:</td>
                        <td>
                            <asp:Label ID="MiddleNameLabel" runat="server" Text='<%# Eval("MiddleName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Last Name:</td>
                        <td>
                            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' CssClass="bold" />
                        </td>
                    </tr>
                    
                    
                   

                </table>

    </div>

    <div class="col-md-6">





                <table class="table table-responsive table-hover bg-success" style="border: 1px solid #006600 !important;">
                    
                  
                  

                    <tr>
                        <td class="bold">Email Address:</td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Email") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Joined:</td>
                        <td>
                            <asp:Label ID="DateJoinedLabel" runat="server" Text='<%# Eval("DateJoined") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Left:</td>
                        <td>
                            <asp:Label ID="DateLeftLabel" runat="server" Text='<%# Eval("DateLeft") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Office:</td>
                        <td>
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("OfficeName") %>' CssClass="text-capitalize bold" />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Unit:</td>
                        <td>
                            <asp:Label ID="UnitTypeNameLabel" runat="server" Text='<%# Eval("UnitTypeName") %>' />
                        </td>
                    </tr>
                    

                </table>



    </div>

</div>

            </ItemTemplate>


            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />

            </LayoutTemplate>
        </asp:ListView>


     

        <asp:ObjectDataSource ID="odsAttorneyDetails" runat="server"
     TypeName="Defender.CPCSAttorneys" SelectMethod="getAttorneyDetails"
            EnableCaching="true" CacheDuration="Infinite">

            <SelectParameters>
                <asp:QueryStringParameter Name="AttorneyGUID" QueryStringField="attorneyguid" DbType="Guid" ValidateInput="true" />

            </SelectParameters>

        </asp:ObjectDataSource>





<telerik:RadGrid ID="gridCPCSCaseSearch" runat="server" AllowPaging="True" ShowFooter="True" CellSpacing="-1" Width="100%" HorizontalAlign="Center" DataSourceID="dsSearchResults" PageSize="10" Visible="false" FilterItemStyle-HorizontalAlign="NotSet" Enabled="false">


    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
    <ClientSettings EnablePostBackOnRowClick="false" Selecting-AllowRowSelect="true">
        <Scrolling AllowScroll="False" ScrollHeight="500px" UseStaticHeaders="true"></Scrolling>
    </ClientSettings>



    <MasterTableView AutoGenerateColumns="False" CommandItemDisplay="None" ShowFooter="True" AllowMultiColumnSorting="False" DataKeyNames="CaseID, CaseGUID">



        <HeaderStyle />


        <PagerStyle PageSizes="5,10,25,50,100,250,500" Position="Bottom" PageButtonCount="5" PageSizeControlType="RadDropDownList" EnableSEOPaging="false" SEOPagingQueryStringKey="ConflictCheck"
            PagerTextFormat="{4} Page {0} from {1} pages, displaying rows {2} to {3} from {5} records" />


        <Columns>



            <telerik:GridTemplateColumn FilterControlAltText="Filter ParticipantName column" HeaderText="Participant Name&lt;br /&gt;&lt;small&gt;Role / Date of Birth / Address&lt;/small&gt;" UniqueName="ParticipantName">
                <ItemTemplate>


                    <p><a href="/apps/peoplesearch/PersonCase.aspx?<%#IIf(Eval("ParticipantRole") = "Client", "clientguid=" & Eval("ClientGUID"), "participantguid=" & Eval("ParticipantGUID")) %>">
                        <asp:Label ID="ParticipantNameLabel" runat="server" Text='<%#  Defender.SiteGeneral.GetTitleCase(Eval("ParticipantName")) %>' CssClass="bold"></asp:Label></a> </p>





                    <p>
                        <asp:Label ID="ParticipantRoleLabel" runat="server" Text='<%# IIf(Eval("ParticipantRole").ToString <> "", "(" & Eval("ParticipantRole").ToString & ")", "") %>' CssClass="text-success bold"></asp:Label>




                        <%# IIf(IsDate(Eval("ParticipantDOB", "{0:d}")), "| " & Eval("ParticipantDOB", "{0:d}") & ", <strong class=text-danger>(" & Eval("ParticipantAge") & " years old)</strong>", "") %>
                    </p>




                    <p>
                        <%# IIf(GetTitleCase(Eval("ParticipantAddress") & ", " & Eval("ParticipantCity") & ", " & Eval("ParticipantState") & " " & Eval("ParticipantZipCode")).ToString.Trim <> ", ,", Defender.SiteGeneral.GetTitleCase(Eval("ParticipantAddress") & ", " & Eval("ParticipantCity") & ", " & Eval("ParticipantState") & " " & Eval("ParticipantZipCode")).ToString.Trim.Replace(", ,", ""), "~address information not found~") %>
                    </p>

                </ItemTemplate>
            </telerik:GridTemplateColumn>




            <telerik:GridTemplateColumn FilterControlAltText="Filter LeadCharge column" HeaderText="Case Number &lt;br /&gt;&lt;small&gt; Disposition / Lead Charge&lt;/small&gt;" UniqueName="LeadCharge">
                <ItemTemplate>


                    <p><a href="/apps/casemanagement/managementcasedetails.aspx?caseguid=<%# Eval("CaseGUID") %>">
                        <asp:Label ID="CaseNumberLabel" runat="server" Text='<%# Eval("CaseNumber") %>' CssClass="bold"></asp:Label></a></p>



                    <p>
                        <asp:Label ID="DispositionLabel" runat="server" Text='<%#  Defender.SiteGeneral.GetTitleCase(Eval("Disposition")) %>' CssClass="bold text-danger"></asp:Label></p>


                    <p>
                        <asp:Label ID="LeadChargeLabel" runat="server" Text='<%#  Defender.SiteGeneral.GetTitleCase(Eval("LeadCharge")) %>' CssClass="text-success"></asp:Label></p>
                </ItemTemplate>
            </telerik:GridTemplateColumn>




            <telerik:GridTemplateColumn FilterControlAltText="Filter ClientName column" HeaderText="Client Name&lt;br /&gt;&lt;small&gt;Staff&lt;/small&gt;" UniqueName="ClientName">
                <ItemTemplate>


                    <p><a href="/apps/peoplesearch/PersonCase.aspx?clientguid=<%# Eval("ClientGUID") %>">
                        <asp:Label ID="ClientNameLabel" runat="server" Text='<%#  Defender.SiteGeneral.GetTitleCase(Eval("ClientName").ToString) %>' CssClass="bold"></asp:Label></a> </p>


                    <p><a href="/apps/peoplesearch/PersonCase.aspx?attorneyguid=<%# Eval("AttorneyGUID") %>">
                        <asp:Label ID="StaffNameLabel" runat="server" Text='<%#  Defender.SiteGeneral.GetTitleCase(Eval("AttorneyName")) %>' CssClass="text-mutedxx"></asp:Label></a> </p>
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
    runat="server" EnableCaching="True" CacheDuration="6000" TypeName="Defender.PersonCases" SelectMethod="SearchResults">

    <SelectParameters>


        <asp:QueryStringParameter Name="personGUID" QueryStringField="guid" Type="Object" ValidateInput="true" DbType="Guid" />


        <asp:QueryStringParameter Name="personType" QueryStringField="type" Type="String" ValidateInput="true" DbType="String" />




    </SelectParameters>

</asp:ObjectDataSource>

