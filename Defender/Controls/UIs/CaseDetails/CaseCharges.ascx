<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CaseCharges.ascx.vb" Inherits="Defender.CaseCharges" %>







<asp:ListView ID="ListView1" runat="server" DataSourceID="odsCaseCharges">

 

    <EmptyDataTemplate>
        <div class="alert alert-danger text-center text-danger bold">No charges were found for this case.</div>
    </EmptyDataTemplate>

        
    
     <ItemTemplate>
        <div class="panel panel-default">
        <div class="panel-body">
            
 
       <h4>  
        <asp:Label ID="OffenseLabel" runat="server" Text='<%# Eval("Offense") %>' CssClass="bold text-success" /></h4>
        
        
            
            
        <asp:CheckBox ID="IsLeadChargeCheckBox" runat="server" Checked='<%# Eval("IsLeadCharge") %>' Enabled="false" Text="Is Lead Charge" />
        <br />
        <asp:CheckBox ID="IsComittedCheckBox" runat="server" Checked='<%# Eval("IsComitted") %>' Enabled="false" Text="Is Comitted" />
         



        <br />
        <br />


       <strong>Charge ID:</strong>
        <asp:Label ID="CaseChargeIDLabel" runat="server" Text='<%# Eval("CaseChargeID") %>' />
        <br />

        <strong>Docket Number:</strong>
        <asp:Label ID="DocketNumberLabel" runat="server" Text='<%# Eval("DocketNumber") %>' CssClass="bold text-danger" />
        <br />

        <strong>Sentence:</strong>
        <asp:Label ID="SentenceLabel" runat="server" Text='<%# GetTitleCase(Eval("Sentence").ToString) %>' CssClass="bold text-danger" />
        <br />

        <strong>Date Of Offense:</strong>
        <asp:Label ID="DateOfOffenseLabel" runat="server" Text='<%# Eval("DateOfOffense", "{0:d}") %>' />
        <br />


        <strong>Date Of Disposition:</strong>
        <asp:Label ID="DateOfDispositionLabel" runat="server" Text='<%# Eval("DateOfDisposition", "{0:d}") %>' />
        <br />

        <strong>Chapter:</strong>
        <asp:Label ID="ChapterLabel" runat="server" Text='<%# Eval("Chapter") %>' />
        <br />
        <strong>Section:</strong>
        <asp:Label ID="SectionLabel" runat="server" Text='<%# Eval("Section") %>' />
        <br />


        <strong>State Charge Type:</strong>
        <asp:Label ID="StateChargeTypeLabel" runat="server" Text='<%# GetTitleCase(Eval("StateChargeTypeName").ToString) %>' CssClass="bold text-danger" />
        <br />
        <strong>State Charge Severity:</strong>
        <asp:Label ID="StateChargeSeverityLabel" runat="server" Text='<%# Eval("StateChargeSeverity") %>' />
        <br />
        


        <strong>National Charge Type:</strong>
        <asp:Label ID="NationalChargeTypeLabel" runat="server" Text='<%# GetTitleCase(Eval("NationalChargeTypeName").ToString) %>' />
        <br />
        <strong>National Charge Severity:</strong>
        <asp:Label ID="NationalChargeSeverityLabel" runat="server" Text='<%# Eval("NationalChargeSeverity") %>' />
        <br />



        <strong>Charge Status:</strong>
        <asp:Label ID="ChargeStatusNameLabel" runat="server" Text='<%# Eval("ChargeStatusName") %>' />
        <br />
        <strong>Disposition:</strong>
        <asp:Label ID="DispositionNameLabel" runat="server" Text='<%# GetTitleCase(Eval("DispositionName").ToString) %>' CssClass="bold text-danger" />
        <br />
        <strong>Sentence Type:</strong>
        <asp:Label ID="SentenceTypeNameLabel" runat="server" Text='<%# GetTitleCase(Eval("SentenceTypeName").ToString) %>' CssClass="bold text-danger" />
        <br />
        <strong>Court Level:</strong>
        <asp:Label ID="CourtLevelNameLabel" runat="server" Text='<%# Eval("CourtLevelName") %>' />
        <br />
        <br />

        <strong>Note:</strong>
        <asp:Label ID="NoteLabel" runat="server" Text='<%# Eval("Note") %>' />
        

        </div>
        </div>


    </ItemTemplate>



    <LayoutTemplate>
        
            <span runat="server" id="itemPlaceholder" />
         


        <%--<div style="">
            <asp:DataPager ID="DataPager1" runat="server">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
        </div>--%>
    </LayoutTemplate>

    

    <SelectedItemTemplate>
        <span style="">CaseGUID:
        <asp:Label ID="CaseGUIDLabel" runat="server" Text='<%# Eval("CaseGUID") %>' />
        <br />
        CaseNumber:
        <asp:Label ID="CaseNumberLabel" runat="server" Text='<%# Eval("CaseNumber") %>' />
        <br />
        CaseChargeID:
        <asp:Label ID="CaseChargeIDLabel" runat="server" Text='<%# Eval("CaseChargeID") %>' />
        <br />
        DocketNumber:
        <asp:Label ID="DocketNumberLabel" runat="server" Text='<%# Eval("DocketNumber") %>' />
        <br />
        Sentence:
        <asp:Label ID="SentenceLabel" runat="server" Text='<%# Eval("Sentence") %>' />
        <br />
        DateOfOffense:
        <asp:Label ID="DateOfOffenseLabel" runat="server" Text='<%# Eval("DateOfOffense") %>' />
        <br />
        DateOfDisposition:
        <asp:Label ID="DateOfDispositionLabel" runat="server" Text='<%# Eval("DateOfDisposition") %>' />
        <br />
        Note:
        <asp:Label ID="NoteLabel" runat="server" Text='<%# Eval("Note") %>' />
        <br />
        <asp:CheckBox ID="IsLeadChargeCheckBox" runat="server" Checked='<%# Eval("IsLeadCharge") %>' Enabled="false" Text="IsLeadCharge" />
        <br />
        <asp:CheckBox ID="IsComittedCheckBox" runat="server" Checked='<%# Eval("IsComitted") %>' Enabled="false" Text="IsComitted" />
        <br />
        <asp:CheckBox ID="LeadChargeCalcCheckBox" runat="server" Checked='<%# Eval("LeadChargeCalc") %>' Enabled="false" Text="LeadChargeCalc" />
        <br />
        Offense:
        <asp:Label ID="OffenseLabel" runat="server" Text='<%# Eval("Offense") %>' />
        <br />
        Chapter:
        <asp:Label ID="ChapterLabel" runat="server" Text='<%# Eval("Chapter") %>' />
        <br />
        Section:
        <asp:Label ID="SectionLabel" runat="server" Text='<%# Eval("Section") %>' />
        <br />
        StateCode:
        <asp:Label ID="StateCodeLabel" runat="server" Text='<%# Eval("StateCode") %>' />
        <br />
        StateChargeType:
        <asp:Label ID="StateChargeTypeLabel" runat="server" Text='<%# Eval("StateChargeType") %>' />
        <br />
        StateChargeSeverity:
        <asp:Label ID="StateChargeSeverityLabel" runat="server" Text='<%# Eval("StateChargeSeverity") %>' />
        <br />
        ChargeTypeUSID:
        <asp:Label ID="ChargeTypeUSIDLabel" runat="server" Text='<%# Eval("ChargeTypeUSID") %>' />
        <br />
        NationalChargeType:
        <asp:Label ID="NationalChargeTypeLabel" runat="server" Text='<%# Eval("NationalChargeType") %>' />
        <br />
        NationalChargeSeverity:
        <asp:Label ID="NationalChargeSeverityLabel" runat="server" Text='<%# Eval("NationalChargeSeverity") %>' />
        <br />
        ChargeStatusName:
        <asp:Label ID="ChargeStatusNameLabel" runat="server" Text='<%# Eval("ChargeStatusName") %>' />
        <br />
        DispositionName:
        <asp:Label ID="DispositionNameLabel" runat="server" Text='<%# Eval("DispositionName") %>' />
        <br />
        SentenceTypeName:
        <asp:Label ID="SentenceTypeNameLabel" runat="server" Text='<%# Eval("SentenceTypeName") %>' />
        <br />
        CourtLevelName:
        <asp:Label ID="CourtLevelNameLabel" runat="server" Text='<%# Eval("CourtLevelName") %>' />
        <br />
        <br />
        </span>
    </SelectedItemTemplate>




</asp:ListView>



<asp:ObjectDataSource ID="odsCaseCharges" runat="server"
    EnableCaching="True" TypeName="Defender.CaseDetails" SelectMethod="getCaseCharges">

    <SelectParameters>
        <asp:QueryStringParameter Name="CaseGUID" QueryStringField="caseguid" ValidateInput="true" ConvertEmptyStringToNull="true" />
    </SelectParameters>

</asp:ObjectDataSource>



