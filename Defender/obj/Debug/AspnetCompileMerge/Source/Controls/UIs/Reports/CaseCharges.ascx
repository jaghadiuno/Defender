<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CaseCharges.ascx.vb" Inherits="Defender.CaseCharges1" %>
 
<table class="table table-responsive small">

<tr>
        <td style="width:34%">
            
 
       <p style="font-size: medium; font-weight: 600;">  
        <asp:Label ID="OffenseLabel" runat="server" Text='<%# Eval("Offense") %>' CssClass="bold text-success" /></p>
        
        
            
            
        <asp:CheckBox ID="IsLeadChargeCheckBox" runat="server" Checked='<%# Eval("IsLeadCharge") %>' Enabled="false" Text="Is Lead Charge" />
        <br />
        <asp:CheckBox ID="IsComittedCheckBox" runat="server" Checked='<%# Eval("IsComitted") %>' Enabled="false" Text="Is Comitted" />
         
        <br />
    <strong>Charge ID:</strong>
        <asp:Label ID="CaseChargeIDLabel" runat="server" Text='<%# Eval("CaseChargeID") %>' />
        <br />

        <strong>Docket Number:</strong>
        <asp:Label ID="DocketNumberLabel" runat="server" Text='<%# Eval("DocketNumber") %>' CssClass="bold text-danger" />
        <br />

        <strong>Sentence:</strong>
        <asp:Label ID="SentenceLabel" runat="server" Text='<%# GetTitleCase(Eval("Sentence").ToString) %>' CssClass="bold text-danger" />

             
            </td>
            <td style="width:33%">

   

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
 
            </td>
            <td style="width:33%">


       



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
        

        </td>
        </tr>

</table> 