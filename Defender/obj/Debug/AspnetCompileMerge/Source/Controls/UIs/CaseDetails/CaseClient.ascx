<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CaseClient.ascx.vb" Inherits="Defender.CaseClient" %>







        <asp:ListView ID="lvClientDetails" runat="server" DataKeyNames="ClientID" DataSourceID="odsClientDetails" Visible="true" Enabled="True">

            <EmptyDataTemplate>
            </EmptyDataTemplate>

            <ItemTemplate>


<div class="row">
    <div class="col-md-6">
        
                <table class="table table-responsive table-hover table-striped bg-successXXX" style="border: 0px solid #006600 !important;">
                  
                    <tr>
                        <td colspan="2" class='<%# Eval("DoNotDefendCSS") %>'>
                            <asp:CheckBox ID="DoNotDefendCheckBox" runat="server" Checked='<%# Eval("DoNotDefend") %>' Enabled="false" Text="Do Not Defend?" CssClass="bold" />
                        </td>
                    </tr>  
                    
                    
                   <%-- <tr>
                        <td class="bold">Client ID:</td>
                        <td>
                            <asp:Label ID="ClientIDLabel" runat="server" Text='<%# Eval("ClientID") %>' />
                        </td>
                    </tr>--%>


                    <tr>
                        <td class="bold">First Name:</td>
                        <td>
                            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' CssClass="bold text-danger" />
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
                            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' CssClass="bold text-danger" />
                        </td>
                    </tr>




                    <tr>
                        <td class="bold">SSN:</td>
                        <td>
                            <asp:Label ID="SSNLabel" runat="server" Text='<%# Eval("SSN") %>' />
                        </td>
                    </tr>


                    <tr>
                        <td class="bold">Height:</td>
                        <td>
                            <asp:Label ID="HeightInchesLabel" runat="server" Text='<%# Eval("HeightInches") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Weight:</td>
                        <td>
                            <asp:Label ID="WeightPoundsLabel" runat="server" Text='<%# Eval("WeightPounds") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">POB:</td>
                        <td>
                            <asp:Label ID="POBLabel" runat="server" Text='<%# Eval("POB") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">DOB:</td>
                        <td>
                            <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("DOB", "{0:d}") %>' CssClass="bold text-danger" />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Age:</td>
                        <td>
                            <asp:Label ID="AgeLabel" runat="server" Text='<%# Eval("Age") & " years old" %>' CssClass="bold text-danger" />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">PCF Number:</td>
                        <td>
                            <asp:Label ID="PcfNumberLabel" runat="server" Text='<%# Eval("PcfNumber") %>' />
                        </td>
                    </tr>

                </table>

    </div>

    <div class="col-md-6">





                <table class="table table-responsive table-hover table-striped bg-successxxx" style="border: 0px solid #006600 !important;">
                    
                  
                    <tr>
                        <td class="bold">AKA:</td>
                        <td>
                            <asp:Label ID="AKALabel" runat="server" Text='<%# Eval("AKA") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Address:</td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# GetTitleCase(Eval("Address").ToString) %>' />
                       

                            <asp:Label ID="Address2Label" runat="server" Text='<%# GetTitleCase(Eval("Address2").ToString) %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">City:</td>
                        <td>
                            <asp:Label ID="CityLabel" runat="server" Text='<%# GetTitleCase(Eval("City").ToString) %>' />
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
                        <td class="bold">Ethnicity:</td>
                        <td>
                            <asp:Label ID="EthnicityNameLabel" runat="server" Text='<%# GetTitleCase(Eval("EthnicityName").ToString) %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Citizenship:</td>
                        <td>
                            <asp:Label ID="CitizenshipNameLabel" runat="server" Text='<%# Eval("CitizenshipName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Race:</td>
                        <td>
                            <asp:Label ID="RaceNameLabel" runat="server" Text='<%# GetTitleCase(Eval("RaceName").ToString) %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Gender:</td>
                        <td>
                            <asp:Label ID="GenderNameLabel" runat="server" Text='<%# Eval("GenderName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">Status:</td>
                        <td>
                            <asp:Label ID="MaritalStatusNameLabel" runat="server" Text='<%# GetTitleCase(Eval("MaritalStatusName").ToString) %>' />
                        </td>
                    </tr>

                </table>

                <p><a href="/apps/peoplesearch/PersonCase.aspx?clientguid=<%# Eval("ClientGUID") %>"><i class="fa fa-user fa-fw" aria-hidden="true"></i>view all client cases</a></p>


    </div>

</div>


            </ItemTemplate>


            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />

            </LayoutTemplate>
        </asp:ListView>


       


        <asp:ObjectDataSource ID="odsClientDetails" runat="server"
     TypeName="Defender.CaseDetails" SelectMethod="getClientInformation"
            EnableCaching="true" CacheDuration="Infinite">
            
    <SelectParameters>
        <asp:QueryStringParameter Name="CaseGUID" QueryStringField="caseguid" ValidateInput="true" ConvertEmptyStringToNull="true" />
    </SelectParameters>

        </asp:ObjectDataSource>


<asp:HiddenField ID="hdnClientID" runat="server" Visible="false" />
