<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ParticipantCases.ascx.vb" Inherits="Defender.ParticipantCases" %>


<%--  <div class="row-spacer clearfix"></div>--%>


<asp:HiddenField ID="hdnParticipantName" runat="server" Visible ="false"  />






 




<asp:PlaceHolder ID="phParticipantInfoShow" runat="server" Visible="false">
<h2 class="bold text-nounderline zero-margin text-capitalize">   
<i class="fa fa-user" aria-hidden="true"></i>    

    <asp:LinkButton ID="lkDisplayInfo" runat="server" Visible="false" CssClass="text-nounderline active"> Participant: <small> <asp:Literal ID="ltrlAttorneyName" runat="server"></asp:Literal>  
        
                                                                                                       </small></asp:LinkButton>  

</h2>
</asp:PlaceHolder>

 




        <asp:ListView ID="lvParticipantDetails" runat="server" DataKeyNames="ParticipantID" DataSourceID="odsParticipantDetails" Visible="true" Enabled="true">

            <EmptyDataTemplate>
            </EmptyDataTemplate>

            <ItemTemplate>


<div class="row">
    <div class="col-md-6">
        
                <table class="table table-responsive table-hover bg-success" style="border: 1px solid #006600 !important;">
                  
                   
                    
                    
                    <tr>
                        <td class="bold">Participant ID:</td>
                        <td>
                            <asp:Label ID="ParticipantIDLabel" runat="server" Text='<%# Eval("ParticipantID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">SSN:</td>
                        <td>
                            <asp:Label ID="SSNLabel" runat="server" Text='<%# Eval("SSN") %>' />
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
                    
                    <tr>
                        <td class="bold">Date of Birth:</td>
                        <td>
                            <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("DOB", "{0:d}") %>' CssClass="bold" />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Age:</td>
                        <td>
                            <asp:Label ID="AgeLabel" runat="server" Text='<%# Eval("Age") & " years old" %>' CssClass="bold" />
                        </td>
                    </tr>
                   

                </table>

    </div>

    <div class="col-md-6">





                <table class="table table-responsive table-hover bg-success" style="border: 1px solid #006600 !important;">
                    
                  
                  

                    <tr>
                        <td class="bold">Address:</td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Address 2:</td>
                        <td>
                            <asp:Label ID="Address2Label" runat="server" Text='<%# Eval("Address2") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">City:</td>
                        <td>
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">State:</td>
                        <td>
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Zip Code:</td>
                        <td>
                            <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Eval("ZipCode") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Phone:</td>
                        <td>
                            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                        </td>
                    </tr>

                  
                    <tr>
                        <td class="bold">Notes/Comments:</td>
                        <td>
                            <asp:Label ID="CommentsLabel" runat="server" Text='<%# Eval("Comments") %>' />
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
















        <asp:ObjectDataSource ID="odsParticipantDetails" runat="server"
     TypeName="Defender.CPCSParticipants" SelectMethod="getParticipantDetails"
            EnableCaching="true" CacheDuration="Infinite">

            <SelectParameters>
                <asp:QueryStringParameter Name="ParticipantGUID" QueryStringField="participantguid" DbType="Guid" ValidateInput="true" />

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

