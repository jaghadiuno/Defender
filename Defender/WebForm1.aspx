<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="Defender.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>


        <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>

         
 
        <br />
        <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="CaseID" DataSourceID="dsCaseDetails">
            <AlternatingItemTemplate>
                <span style="">CaseID:
                <asp:Label ID="CaseIDLabel" runat="server" Text='<%# Eval("CaseID") %>' />
                <br />
                CaseGUID:
                <asp:Label ID="CaseGUIDLabel" runat="server" Text='<%# Eval("CaseGUID") %>' />
                <br />
                CaseNumber:
                <asp:Label ID="CaseNumberLabel" runat="server" Text='<%# Eval("CaseNumber") %>' />
                <br />
                <asp:CheckBox ID="OpenCheckBox" runat="server" Checked='<%# Eval("Open") %>' Enabled="false" Text="Open" />
                <br />
                OpeningDate:
                <asp:Label ID="OpeningDateLabel" runat="server" Text='<%# Eval("OpeningDate") %>' />
                <br />
                ClosingDate:
                <asp:Label ID="ClosingDateLabel" runat="server" Text='<%# Eval("ClosingDate") %>' />
                <br />
                <asp:CheckBox ID="JurySessionCheckBox" runat="server" Checked='<%# Eval("JurySession") %>' Enabled="false" Text="JurySession" />
                <br />
                <asp:CheckBox ID="CasePriorClientCheckBox" runat="server" Checked='<%# Eval("CasePriorClient") %>' Enabled="false" Text="CasePriorClient" />
                <br />
                Note:
                <asp:Label ID="NoteLabel" runat="server" Text='<%# Eval("Note") %>' />
                <br />
                <asp:CheckBox ID="AdministrativelyClosedCheckBox" runat="server" Checked='<%# Eval("AdministrativelyClosed") %>' Enabled="false" Text="AdministrativelyClosed" />
                <br />
                DistrictArraignmentDate:
                <asp:Label ID="DistrictArraignmentDateLabel" runat="server" Text='<%# Eval("DistrictArraignmentDate") %>' />
                <br />
                <asp:CheckBox ID="ArraignCustomdyReleasedCheckBox" runat="server" Checked='<%# Eval("ArraignCustomdyReleased") %>' Enabled="false" Text="ArraignCustomdyReleased" />
                <br />
                <asp:CheckBox ID="ArraignCustomdyHeldCheckBox" runat="server" Checked='<%# Eval("ArraignCustomdyHeld") %>' Enabled="false" Text="ArraignCustomdyHeld" />
                <br />
                <asp:CheckBox ID="ArraignServingOtherSentenceCheckBox" runat="server" Checked='<%# Eval("ArraignServingOtherSentence") %>' Enabled="false" Text="ArraignServingOtherSentence" />
                <br />
                <asp:CheckBox ID="BailStatusCheckBox" runat="server" Checked='<%# Eval("BailStatus") %>' Enabled="false" Text="BailStatus" />
                <br />
                BailAmount:
                <asp:Label ID="BailAmountLabel" runat="server" Text='<%# Eval("BailAmount") %>' />
                <br />
                BailConditions:
                <asp:Label ID="BailConditionsLabel" runat="server" Text='<%# Eval("BailConditions") %>' />
                <br />
                <asp:CheckBox ID="SsaReferralCheckBox" runat="server" Checked='<%# Eval("SsaReferral") %>' Enabled="false" Text="SsaReferral" />
                <br />
                SuperiorArraignmentDate:
                <asp:Label ID="SuperiorArraignmentDateLabel" runat="server" Text='<%# Eval("SuperiorArraignmentDate") %>' />
                <br />
                JuvenileComplaintArraignmentDate:
                <asp:Label ID="JuvenileComplaintArraignmentDateLabel" runat="server" Text='<%# Eval("JuvenileComplaintArraignmentDate") %>' />
                <br />
                JuvenileIndictmentArraignmentDate:
                <asp:Label ID="JuvenileIndictmentArraignmentDateLabel" runat="server" Text='<%# Eval("JuvenileIndictmentArraignmentDate") %>' />
                <br />
                IncidentArrestDate:
                <asp:Label ID="IncidentArrestDateLabel" runat="server" Text='<%# Eval("IncidentArrestDate") %>' />
                <br />
                IncidentPoliceReportDate:
                <asp:Label ID="IncidentPoliceReportDateLabel" runat="server" Text='<%# Eval("IncidentPoliceReportDate") %>' />
                <br />
                IncidentComplaintDate:
                <asp:Label ID="IncidentComplaintDateLabel" runat="server" Text='<%# Eval("IncidentComplaintDate") %>' />
                <br />
                <asp:CheckBox ID="IncidentPoliceReportObtainedCheckBox" runat="server" Checked='<%# Eval("IncidentPoliceReportObtained") %>' Enabled="false" Text="IncidentPoliceReportObtained" />
                <br />
                IncidentTypeOfWeapon:
                <asp:Label ID="IncidentTypeOfWeaponLabel" runat="server" Text='<%# Eval("IncidentTypeOfWeapon") %>' />
                <br />
                CaseTypeName:
                <asp:Label ID="CaseTypeNameLabel" runat="server" Text='<%# Eval("CaseTypeName") %>' />
                <br />
                CourtName:
                <asp:Label ID="CourtNameLabel" runat="server" Text='<%# Eval("CourtName") %>' />
                <br />
                CourtCountyName:
                <asp:Label ID="CourtCountyNameLabel" runat="server" Text='<%# Eval("CourtCountyName") %>' />
                <br />
                DivisionName:
                <asp:Label ID="DivisionNameLabel" runat="server" Text='<%# Eval("DivisionName") %>' />
                <br />
                DivisionShortName:
                <asp:Label ID="DivisionShortNameLabel" runat="server" Text='<%# Eval("DivisionShortName") %>' />
                <br />
                DepartmentName:
                <asp:Label ID="DepartmentNameLabel" runat="server" Text='<%# Eval("DepartmentName") %>' />
                <br />
                UnitTypeName:
                <asp:Label ID="UnitTypeNameLabel" runat="server" Text='<%# Eval("UnitTypeName") %>' />
                <br />
                OfficeName:
                <asp:Label ID="OfficeNameLabel" runat="server" Text='<%# Eval("OfficeName") %>' />
                <br />
                CourtLevelName:
                <asp:Label ID="CourtLevelNameLabel" runat="server" Text='<%# Eval("CourtLevelName") %>' />
                <br />
                ClosingCourtName:
                <asp:Label ID="ClosingCourtNameLabel" runat="server" Text='<%# Eval("ClosingCourtName") %>' />
                <br />
                ClosingCourtLevelName:
                <asp:Label ID="ClosingCourtLevelNameLabel" runat="server" Text='<%# Eval("ClosingCourtLevelName") %>' />
                <br />
                ClosingCourtCountyName:
                <asp:Label ID="ClosingCourtCountyNameLabel" runat="server" Text='<%# Eval("ClosingCourtCountyName") %>' />
                <br />
                JudgeName:
                <asp:Label ID="JudgeNameLabel" runat="server" Text='<%# Eval("JudgeName") %>' />
                <br />
                ClosingJudgeName:
                <asp:Label ID="ClosingJudgeNameLabel" runat="server" Text='<%# Eval("ClosingJudgeName") %>' />
                <br />
                ProsecutorName:
                <asp:Label ID="ProsecutorNameLabel" runat="server" Text='<%# Eval("ProsecutorName") %>' />
                <br />
                ClosingProsecutorName:
                <asp:Label ID="ClosingProsecutorNameLabel" runat="server" Text='<%# Eval("ClosingProsecutorName") %>' />
                <br />
                CaseOpenTypeName:
                <asp:Label ID="CaseOpenTypeNameLabel" runat="server" Text='<%# Eval("CaseOpenTypeName") %>' />
                <br />
                ClientCommitTypeName:
                <asp:Label ID="ClientCommitTypeNameLabel" runat="server" Text='<%# Eval("ClientCommitTypeName") %>' />
                <br />
                JuryTypeName:
                <asp:Label ID="JuryTypeNameLabel" runat="server" Text='<%# Eval("JuryTypeName") %>' />
                <br />
<br /></span>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <span style="">CaseID:
                <asp:Label ID="CaseIDLabel1" runat="server" Text='<%# Eval("CaseID") %>' />
                <br />
                CaseGUID:
                <asp:TextBox ID="CaseGUIDTextBox" runat="server" Text='<%# Bind("CaseGUID") %>' />
                <br />
                CaseNumber:
                <asp:TextBox ID="CaseNumberTextBox" runat="server" Text='<%# Bind("CaseNumber") %>' />
                <br />
                <asp:CheckBox ID="OpenCheckBox" runat="server" Checked='<%# Bind("Open") %>' Text="Open" />
                <br />
                OpeningDate:
                <asp:TextBox ID="OpeningDateTextBox" runat="server" Text='<%# Bind("OpeningDate") %>' />
                <br />
                ClosingDate:
                <asp:TextBox ID="ClosingDateTextBox" runat="server" Text='<%# Bind("ClosingDate") %>' />
                <br />
                <asp:CheckBox ID="JurySessionCheckBox" runat="server" Checked='<%# Bind("JurySession") %>' Text="JurySession" />
                <br />
                <asp:CheckBox ID="CasePriorClientCheckBox" runat="server" Checked='<%# Bind("CasePriorClient") %>' Text="CasePriorClient" />
                <br />
                Note:
                <asp:TextBox ID="NoteTextBox" runat="server" Text='<%# Bind("Note") %>' />
                <br />
                <asp:CheckBox ID="AdministrativelyClosedCheckBox" runat="server" Checked='<%# Bind("AdministrativelyClosed") %>' Text="AdministrativelyClosed" />
                <br />
                DistrictArraignmentDate:
                <asp:TextBox ID="DistrictArraignmentDateTextBox" runat="server" Text='<%# Bind("DistrictArraignmentDate") %>' />
                <br />
                <asp:CheckBox ID="ArraignCustomdyReleasedCheckBox" runat="server" Checked='<%# Bind("ArraignCustomdyReleased") %>' Text="ArraignCustomdyReleased" />
                <br />
                <asp:CheckBox ID="ArraignCustomdyHeldCheckBox" runat="server" Checked='<%# Bind("ArraignCustomdyHeld") %>' Text="ArraignCustomdyHeld" />
                <br />
                <asp:CheckBox ID="ArraignServingOtherSentenceCheckBox" runat="server" Checked='<%# Bind("ArraignServingOtherSentence") %>' Text="ArraignServingOtherSentence" />
                <br />
                <asp:CheckBox ID="BailStatusCheckBox" runat="server" Checked='<%# Bind("BailStatus") %>' Text="BailStatus" />
                <br />
                BailAmount:
                <asp:TextBox ID="BailAmountTextBox" runat="server" Text='<%# Bind("BailAmount") %>' />
                <br />
                BailConditions:
                <asp:TextBox ID="BailConditionsTextBox" runat="server" Text='<%# Bind("BailConditions") %>' />
                <br />
                <asp:CheckBox ID="SsaReferralCheckBox" runat="server" Checked='<%# Bind("SsaReferral") %>' Text="SsaReferral" />
                <br />
                SuperiorArraignmentDate:
                <asp:TextBox ID="SuperiorArraignmentDateTextBox" runat="server" Text='<%# Bind("SuperiorArraignmentDate") %>' />
                <br />
                JuvenileComplaintArraignmentDate:
                <asp:TextBox ID="JuvenileComplaintArraignmentDateTextBox" runat="server" Text='<%# Bind("JuvenileComplaintArraignmentDate") %>' />
                <br />
                JuvenileIndictmentArraignmentDate:
                <asp:TextBox ID="JuvenileIndictmentArraignmentDateTextBox" runat="server" Text='<%# Bind("JuvenileIndictmentArraignmentDate") %>' />
                <br />
                IncidentArrestDate:
                <asp:TextBox ID="IncidentArrestDateTextBox" runat="server" Text='<%# Bind("IncidentArrestDate") %>' />
                <br />
                IncidentPoliceReportDate:
                <asp:TextBox ID="IncidentPoliceReportDateTextBox" runat="server" Text='<%# Bind("IncidentPoliceReportDate") %>' />
                <br />
                IncidentComplaintDate:
                <asp:TextBox ID="IncidentComplaintDateTextBox" runat="server" Text='<%# Bind("IncidentComplaintDate") %>' />
                <br />
                <asp:CheckBox ID="IncidentPoliceReportObtainedCheckBox" runat="server" Checked='<%# Bind("IncidentPoliceReportObtained") %>' Text="IncidentPoliceReportObtained" />
                <br />
                IncidentTypeOfWeapon:
                <asp:TextBox ID="IncidentTypeOfWeaponTextBox" runat="server" Text='<%# Bind("IncidentTypeOfWeapon") %>' />
                <br />
                CaseTypeName:
                <asp:TextBox ID="CaseTypeNameTextBox" runat="server" Text='<%# Bind("CaseTypeName") %>' />
                <br />
                CourtName:
                <asp:TextBox ID="CourtNameTextBox" runat="server" Text='<%# Bind("CourtName") %>' />
                <br />
                CourtCountyName:
                <asp:TextBox ID="CourtCountyNameTextBox" runat="server" Text='<%# Bind("CourtCountyName") %>' />
                <br />
                DivisionName:
                <asp:TextBox ID="DivisionNameTextBox" runat="server" Text='<%# Bind("DivisionName") %>' />
                <br />
                DivisionShortName:
                <asp:TextBox ID="DivisionShortNameTextBox" runat="server" Text='<%# Bind("DivisionShortName") %>' />
                <br />
                DepartmentName:
                <asp:TextBox ID="DepartmentNameTextBox" runat="server" Text='<%# Bind("DepartmentName") %>' />
                <br />
                UnitTypeName:
                <asp:TextBox ID="UnitTypeNameTextBox" runat="server" Text='<%# Bind("UnitTypeName") %>' />
                <br />
                OfficeName:
                <asp:TextBox ID="OfficeNameTextBox" runat="server" Text='<%# Bind("OfficeName") %>' />
                <br />
                CourtLevelName:
                <asp:TextBox ID="CourtLevelNameTextBox" runat="server" Text='<%# Bind("CourtLevelName") %>' />
                <br />
                ClosingCourtName:
                <asp:TextBox ID="ClosingCourtNameTextBox" runat="server" Text='<%# Bind("ClosingCourtName") %>' />
                <br />
                ClosingCourtLevelName:
                <asp:TextBox ID="ClosingCourtLevelNameTextBox" runat="server" Text='<%# Bind("ClosingCourtLevelName") %>' />
                <br />
                ClosingCourtCountyName:
                <asp:TextBox ID="ClosingCourtCountyNameTextBox" runat="server" Text='<%# Bind("ClosingCourtCountyName") %>' />
                <br />
                JudgeName:
                <asp:TextBox ID="JudgeNameTextBox" runat="server" Text='<%# Bind("JudgeName") %>' />
                <br />
                ClosingJudgeName:
                <asp:TextBox ID="ClosingJudgeNameTextBox" runat="server" Text='<%# Bind("ClosingJudgeName") %>' />
                <br />
                ProsecutorName:
                <asp:TextBox ID="ProsecutorNameTextBox" runat="server" Text='<%# Bind("ProsecutorName") %>' />
                <br />
                ClosingProsecutorName:
                <asp:TextBox ID="ClosingProsecutorNameTextBox" runat="server" Text='<%# Bind("ClosingProsecutorName") %>' />
                <br />
                CaseOpenTypeName:
                <asp:TextBox ID="CaseOpenTypeNameTextBox" runat="server" Text='<%# Bind("CaseOpenTypeName") %>' />
                <br />
                ClientCommitTypeName:
                <asp:TextBox ID="ClientCommitTypeNameTextBox" runat="server" Text='<%# Bind("ClientCommitTypeName") %>' />
                <br />
                JuryTypeName:
                <asp:TextBox ID="JuryTypeNameTextBox" runat="server" Text='<%# Bind("JuryTypeName") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br /><br /></span>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">CaseID:
                <asp:TextBox ID="CaseIDTextBox" runat="server" Text='<%# Bind("CaseID") %>' />
                <br />CaseGUID:
                <asp:TextBox ID="CaseGUIDTextBox" runat="server" Text='<%# Bind("CaseGUID") %>' />
                <br />CaseNumber:
                <asp:TextBox ID="CaseNumberTextBox" runat="server" Text='<%# Bind("CaseNumber") %>' />
                <br />
                <asp:CheckBox ID="OpenCheckBox" runat="server" Checked='<%# Bind("Open") %>' Text="Open" />
                <br />OpeningDate:
                <asp:TextBox ID="OpeningDateTextBox" runat="server" Text='<%# Bind("OpeningDate") %>' />
                <br />ClosingDate:
                <asp:TextBox ID="ClosingDateTextBox" runat="server" Text='<%# Bind("ClosingDate") %>' />
                <br />
                <asp:CheckBox ID="JurySessionCheckBox" runat="server" Checked='<%# Bind("JurySession") %>' Text="JurySession" />
                <br />
                <asp:CheckBox ID="CasePriorClientCheckBox" runat="server" Checked='<%# Bind("CasePriorClient") %>' Text="CasePriorClient" />
                <br />Note:
                <asp:TextBox ID="NoteTextBox" runat="server" Text='<%# Bind("Note") %>' />
                <br />
                <asp:CheckBox ID="AdministrativelyClosedCheckBox" runat="server" Checked='<%# Bind("AdministrativelyClosed") %>' Text="AdministrativelyClosed" />
                <br />DistrictArraignmentDate:
                <asp:TextBox ID="DistrictArraignmentDateTextBox" runat="server" Text='<%# Bind("DistrictArraignmentDate") %>' />
                <br />
                <asp:CheckBox ID="ArraignCustomdyReleasedCheckBox" runat="server" Checked='<%# Bind("ArraignCustomdyReleased") %>' Text="ArraignCustomdyReleased" />
                <br />
                <asp:CheckBox ID="ArraignCustomdyHeldCheckBox" runat="server" Checked='<%# Bind("ArraignCustomdyHeld") %>' Text="ArraignCustomdyHeld" />
                <br />
                <asp:CheckBox ID="ArraignServingOtherSentenceCheckBox" runat="server" Checked='<%# Bind("ArraignServingOtherSentence") %>' Text="ArraignServingOtherSentence" />
                <br />
                <asp:CheckBox ID="BailStatusCheckBox" runat="server" Checked='<%# Bind("BailStatus") %>' Text="BailStatus" />
                <br />BailAmount:
                <asp:TextBox ID="BailAmountTextBox" runat="server" Text='<%# Bind("BailAmount") %>' />
                <br />BailConditions:
                <asp:TextBox ID="BailConditionsTextBox" runat="server" Text='<%# Bind("BailConditions") %>' />
                <br />
                <asp:CheckBox ID="SsaReferralCheckBox" runat="server" Checked='<%# Bind("SsaReferral") %>' Text="SsaReferral" />
                <br />SuperiorArraignmentDate:
                <asp:TextBox ID="SuperiorArraignmentDateTextBox" runat="server" Text='<%# Bind("SuperiorArraignmentDate") %>' />
                <br />JuvenileComplaintArraignmentDate:
                <asp:TextBox ID="JuvenileComplaintArraignmentDateTextBox" runat="server" Text='<%# Bind("JuvenileComplaintArraignmentDate") %>' />
                <br />JuvenileIndictmentArraignmentDate:
                <asp:TextBox ID="JuvenileIndictmentArraignmentDateTextBox" runat="server" Text='<%# Bind("JuvenileIndictmentArraignmentDate") %>' />
                <br />IncidentArrestDate:
                <asp:TextBox ID="IncidentArrestDateTextBox" runat="server" Text='<%# Bind("IncidentArrestDate") %>' />
                <br />IncidentPoliceReportDate:
                <asp:TextBox ID="IncidentPoliceReportDateTextBox" runat="server" Text='<%# Bind("IncidentPoliceReportDate") %>' />
                <br />IncidentComplaintDate:
                <asp:TextBox ID="IncidentComplaintDateTextBox" runat="server" Text='<%# Bind("IncidentComplaintDate") %>' />
                <br />
                <asp:CheckBox ID="IncidentPoliceReportObtainedCheckBox" runat="server" Checked='<%# Bind("IncidentPoliceReportObtained") %>' Text="IncidentPoliceReportObtained" />
                <br />IncidentTypeOfWeapon:
                <asp:TextBox ID="IncidentTypeOfWeaponTextBox" runat="server" Text='<%# Bind("IncidentTypeOfWeapon") %>' />
                <br />CaseTypeName:
                <asp:TextBox ID="CaseTypeNameTextBox" runat="server" Text='<%# Bind("CaseTypeName") %>' />
                <br />CourtName:
                <asp:TextBox ID="CourtNameTextBox" runat="server" Text='<%# Bind("CourtName") %>' />
                <br />CourtCountyName:
                <asp:TextBox ID="CourtCountyNameTextBox" runat="server" Text='<%# Bind("CourtCountyName") %>' />
                <br />DivisionName:
                <asp:TextBox ID="DivisionNameTextBox" runat="server" Text='<%# Bind("DivisionName") %>' />
                <br />DivisionShortName:
                <asp:TextBox ID="DivisionShortNameTextBox" runat="server" Text='<%# Bind("DivisionShortName") %>' />
                <br />DepartmentName:
                <asp:TextBox ID="DepartmentNameTextBox" runat="server" Text='<%# Bind("DepartmentName") %>' />
                <br />UnitTypeName:
                <asp:TextBox ID="UnitTypeNameTextBox" runat="server" Text='<%# Bind("UnitTypeName") %>' />
                <br />OfficeName:
                <asp:TextBox ID="OfficeNameTextBox" runat="server" Text='<%# Bind("OfficeName") %>' />
                <br />CourtLevelName:
                <asp:TextBox ID="CourtLevelNameTextBox" runat="server" Text='<%# Bind("CourtLevelName") %>' />
                <br />ClosingCourtName:
                <asp:TextBox ID="ClosingCourtNameTextBox" runat="server" Text='<%# Bind("ClosingCourtName") %>' />
                <br />ClosingCourtLevelName:
                <asp:TextBox ID="ClosingCourtLevelNameTextBox" runat="server" Text='<%# Bind("ClosingCourtLevelName") %>' />
                <br />ClosingCourtCountyName:
                <asp:TextBox ID="ClosingCourtCountyNameTextBox" runat="server" Text='<%# Bind("ClosingCourtCountyName") %>' />
                <br />JudgeName:
                <asp:TextBox ID="JudgeNameTextBox" runat="server" Text='<%# Bind("JudgeName") %>' />
                <br />ClosingJudgeName:
                <asp:TextBox ID="ClosingJudgeNameTextBox" runat="server" Text='<%# Bind("ClosingJudgeName") %>' />
                <br />ProsecutorName:
                <asp:TextBox ID="ProsecutorNameTextBox" runat="server" Text='<%# Bind("ProsecutorName") %>' />
                <br />ClosingProsecutorName:
                <asp:TextBox ID="ClosingProsecutorNameTextBox" runat="server" Text='<%# Bind("ClosingProsecutorName") %>' />
                <br />CaseOpenTypeName:
                <asp:TextBox ID="CaseOpenTypeNameTextBox" runat="server" Text='<%# Bind("CaseOpenTypeName") %>' />
                <br />ClientCommitTypeName:
                <asp:TextBox ID="ClientCommitTypeNameTextBox" runat="server" Text='<%# Bind("ClientCommitTypeName") %>' />
                <br />JuryTypeName:
                <asp:TextBox ID="JuryTypeNameTextBox" runat="server" Text='<%# Bind("JuryTypeName") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br /><br /></span>
            </InsertItemTemplate>
            <ItemTemplate>
                <span style="">CaseID:
                <asp:Label ID="CaseIDLabel" runat="server" Text='<%# Eval("CaseID") %>' />
                <br />
                CaseGUID:
                <asp:Label ID="CaseGUIDLabel" runat="server" Text='<%# Eval("CaseGUID") %>' />
                <br />
                CaseNumber:
                <asp:Label ID="CaseNumberLabel" runat="server" Text='<%# Eval("CaseNumber") %>' />
                <br />
                <asp:CheckBox ID="OpenCheckBox" runat="server" Checked='<%# Eval("Open") %>' Enabled="false" Text="Open" />
                <br />
                OpeningDate:
                <asp:Label ID="OpeningDateLabel" runat="server" Text='<%# Eval("OpeningDate") %>' />
                <br />
                ClosingDate:
                <asp:Label ID="ClosingDateLabel" runat="server" Text='<%# Eval("ClosingDate") %>' />
                <br />
                <asp:CheckBox ID="JurySessionCheckBox" runat="server" Checked='<%# Eval("JurySession") %>' Enabled="false" Text="JurySession" />
                <br />
                <asp:CheckBox ID="CasePriorClientCheckBox" runat="server" Checked='<%# Eval("CasePriorClient") %>' Enabled="false" Text="CasePriorClient" />
                <br />
                Note:
                <asp:Label ID="NoteLabel" runat="server" Text='<%# Eval("Note") %>' />
                <br />
                <asp:CheckBox ID="AdministrativelyClosedCheckBox" runat="server" Checked='<%# Eval("AdministrativelyClosed") %>' Enabled="false" Text="AdministrativelyClosed" />
                <br />
                DistrictArraignmentDate:
                <asp:Label ID="DistrictArraignmentDateLabel" runat="server" Text='<%# Eval("DistrictArraignmentDate") %>' />
                <br />
                <asp:CheckBox ID="ArraignCustomdyReleasedCheckBox" runat="server" Checked='<%# Eval("ArraignCustomdyReleased") %>' Enabled="false" Text="ArraignCustomdyReleased" />
                <br />
                <asp:CheckBox ID="ArraignCustomdyHeldCheckBox" runat="server" Checked='<%# Eval("ArraignCustomdyHeld") %>' Enabled="false" Text="ArraignCustomdyHeld" />
                <br />
                <asp:CheckBox ID="ArraignServingOtherSentenceCheckBox" runat="server" Checked='<%# Eval("ArraignServingOtherSentence") %>' Enabled="false" Text="ArraignServingOtherSentence" />
                <br />
                <asp:CheckBox ID="BailStatusCheckBox" runat="server" Checked='<%# Eval("BailStatus") %>' Enabled="false" Text="BailStatus" />
                <br />
                BailAmount:
                <asp:Label ID="BailAmountLabel" runat="server" Text='<%# Eval("BailAmount") %>' />
                <br />
                BailConditions:
                <asp:Label ID="BailConditionsLabel" runat="server" Text='<%# Eval("BailConditions") %>' />
                <br />
                <asp:CheckBox ID="SsaReferralCheckBox" runat="server" Checked='<%# Eval("SsaReferral") %>' Enabled="false" Text="SsaReferral" />
                <br />
                SuperiorArraignmentDate:
                <asp:Label ID="SuperiorArraignmentDateLabel" runat="server" Text='<%# Eval("SuperiorArraignmentDate") %>' />
                <br />
                JuvenileComplaintArraignmentDate:
                <asp:Label ID="JuvenileComplaintArraignmentDateLabel" runat="server" Text='<%# Eval("JuvenileComplaintArraignmentDate") %>' />
                <br />
                JuvenileIndictmentArraignmentDate:
                <asp:Label ID="JuvenileIndictmentArraignmentDateLabel" runat="server" Text='<%# Eval("JuvenileIndictmentArraignmentDate") %>' />
                <br />
                IncidentArrestDate:
                <asp:Label ID="IncidentArrestDateLabel" runat="server" Text='<%# Eval("IncidentArrestDate") %>' />
                <br />
                IncidentPoliceReportDate:
                <asp:Label ID="IncidentPoliceReportDateLabel" runat="server" Text='<%# Eval("IncidentPoliceReportDate") %>' />
                <br />
                IncidentComplaintDate:
                <asp:Label ID="IncidentComplaintDateLabel" runat="server" Text='<%# Eval("IncidentComplaintDate") %>' />
                <br />
                <asp:CheckBox ID="IncidentPoliceReportObtainedCheckBox" runat="server" Checked='<%# Eval("IncidentPoliceReportObtained") %>' Enabled="false" Text="IncidentPoliceReportObtained" />
                <br />
                IncidentTypeOfWeapon:
                <asp:Label ID="IncidentTypeOfWeaponLabel" runat="server" Text='<%# Eval("IncidentTypeOfWeapon") %>' />
                <br />
                CaseTypeName:
                <asp:Label ID="CaseTypeNameLabel" runat="server" Text='<%# Eval("CaseTypeName") %>' />
                <br />
                CourtName:
                <asp:Label ID="CourtNameLabel" runat="server" Text='<%# Eval("CourtName") %>' />
                <br />
                CourtCountyName:
                <asp:Label ID="CourtCountyNameLabel" runat="server" Text='<%# Eval("CourtCountyName") %>' />
                <br />
                DivisionName:
                <asp:Label ID="DivisionNameLabel" runat="server" Text='<%# Eval("DivisionName") %>' />
                <br />
                DivisionShortName:
                <asp:Label ID="DivisionShortNameLabel" runat="server" Text='<%# Eval("DivisionShortName") %>' />
                <br />
                DepartmentName:
                <asp:Label ID="DepartmentNameLabel" runat="server" Text='<%# Eval("DepartmentName") %>' />
                <br />
                UnitTypeName:
                <asp:Label ID="UnitTypeNameLabel" runat="server" Text='<%# Eval("UnitTypeName") %>' />
                <br />
                OfficeName:
                <asp:Label ID="OfficeNameLabel" runat="server" Text='<%# Eval("OfficeName") %>' />
                <br />
                CourtLevelName:
                <asp:Label ID="CourtLevelNameLabel" runat="server" Text='<%# Eval("CourtLevelName") %>' />
                <br />
                ClosingCourtName:
                <asp:Label ID="ClosingCourtNameLabel" runat="server" Text='<%# Eval("ClosingCourtName") %>' />
                <br />
                ClosingCourtLevelName:
                <asp:Label ID="ClosingCourtLevelNameLabel" runat="server" Text='<%# Eval("ClosingCourtLevelName") %>' />
                <br />
                ClosingCourtCountyName:
                <asp:Label ID="ClosingCourtCountyNameLabel" runat="server" Text='<%# Eval("ClosingCourtCountyName") %>' />
                <br />
                JudgeName:
                <asp:Label ID="JudgeNameLabel" runat="server" Text='<%# Eval("JudgeName") %>' />
                <br />
                ClosingJudgeName:
                <asp:Label ID="ClosingJudgeNameLabel" runat="server" Text='<%# Eval("ClosingJudgeName") %>' />
                <br />
                ProsecutorName:
                <asp:Label ID="ProsecutorNameLabel" runat="server" Text='<%# Eval("ProsecutorName") %>' />
                <br />
                ClosingProsecutorName:
                <asp:Label ID="ClosingProsecutorNameLabel" runat="server" Text='<%# Eval("ClosingProsecutorName") %>' />
                <br />
                CaseOpenTypeName:
                <asp:Label ID="CaseOpenTypeNameLabel" runat="server" Text='<%# Eval("CaseOpenTypeName") %>' />
                <br />
                ClientCommitTypeName:
                <asp:Label ID="ClientCommitTypeNameLabel" runat="server" Text='<%# Eval("ClientCommitTypeName") %>' />
                <br />
                JuryTypeName:
                <asp:Label ID="JuryTypeNameLabel" runat="server" Text='<%# Eval("JuryTypeName") %>' />
                <br />
<br /></span>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="">CaseID:
                <asp:Label ID="CaseIDLabel" runat="server" Text='<%# Eval("CaseID") %>' />
                <br />
                CaseGUID:
                <asp:Label ID="CaseGUIDLabel" runat="server" Text='<%# Eval("CaseGUID") %>' />
                <br />
                CaseNumber:
                <asp:Label ID="CaseNumberLabel" runat="server" Text='<%# Eval("CaseNumber") %>' />
                <br />
                <asp:CheckBox ID="OpenCheckBox" runat="server" Checked='<%# Eval("Open") %>' Enabled="false" Text="Open" />
                <br />
                OpeningDate:
                <asp:Label ID="OpeningDateLabel" runat="server" Text='<%# Eval("OpeningDate") %>' />
                <br />
                ClosingDate:
                <asp:Label ID="ClosingDateLabel" runat="server" Text='<%# Eval("ClosingDate") %>' />
                <br />
                <asp:CheckBox ID="JurySessionCheckBox" runat="server" Checked='<%# Eval("JurySession") %>' Enabled="false" Text="JurySession" />
                <br />
                <asp:CheckBox ID="CasePriorClientCheckBox" runat="server" Checked='<%# Eval("CasePriorClient") %>' Enabled="false" Text="CasePriorClient" />
                <br />
                Note:
                <asp:Label ID="NoteLabel" runat="server" Text='<%# Eval("Note") %>' />
                <br />
                <asp:CheckBox ID="AdministrativelyClosedCheckBox" runat="server" Checked='<%# Eval("AdministrativelyClosed") %>' Enabled="false" Text="AdministrativelyClosed" />
                <br />
                DistrictArraignmentDate:
                <asp:Label ID="DistrictArraignmentDateLabel" runat="server" Text='<%# Eval("DistrictArraignmentDate") %>' />
                <br />
                <asp:CheckBox ID="ArraignCustomdyReleasedCheckBox" runat="server" Checked='<%# Eval("ArraignCustomdyReleased") %>' Enabled="false" Text="ArraignCustomdyReleased" />
                <br />
                <asp:CheckBox ID="ArraignCustomdyHeldCheckBox" runat="server" Checked='<%# Eval("ArraignCustomdyHeld") %>' Enabled="false" Text="ArraignCustomdyHeld" />
                <br />
                <asp:CheckBox ID="ArraignServingOtherSentenceCheckBox" runat="server" Checked='<%# Eval("ArraignServingOtherSentence") %>' Enabled="false" Text="ArraignServingOtherSentence" />
                <br />
                <asp:CheckBox ID="BailStatusCheckBox" runat="server" Checked='<%# Eval("BailStatus") %>' Enabled="false" Text="BailStatus" />
                <br />
                BailAmount:
                <asp:Label ID="BailAmountLabel" runat="server" Text='<%# Eval("BailAmount") %>' />
                <br />
                BailConditions:
                <asp:Label ID="BailConditionsLabel" runat="server" Text='<%# Eval("BailConditions") %>' />
                <br />
                <asp:CheckBox ID="SsaReferralCheckBox" runat="server" Checked='<%# Eval("SsaReferral") %>' Enabled="false" Text="SsaReferral" />
                <br />
                SuperiorArraignmentDate:
                <asp:Label ID="SuperiorArraignmentDateLabel" runat="server" Text='<%# Eval("SuperiorArraignmentDate") %>' />
                <br />
                JuvenileComplaintArraignmentDate:
                <asp:Label ID="JuvenileComplaintArraignmentDateLabel" runat="server" Text='<%# Eval("JuvenileComplaintArraignmentDate") %>' />
                <br />
                JuvenileIndictmentArraignmentDate:
                <asp:Label ID="JuvenileIndictmentArraignmentDateLabel" runat="server" Text='<%# Eval("JuvenileIndictmentArraignmentDate") %>' />
                <br />
                IncidentArrestDate:
                <asp:Label ID="IncidentArrestDateLabel" runat="server" Text='<%# Eval("IncidentArrestDate") %>' />
                <br />
                IncidentPoliceReportDate:
                <asp:Label ID="IncidentPoliceReportDateLabel" runat="server" Text='<%# Eval("IncidentPoliceReportDate") %>' />
                <br />
                IncidentComplaintDate:
                <asp:Label ID="IncidentComplaintDateLabel" runat="server" Text='<%# Eval("IncidentComplaintDate") %>' />
                <br />
                <asp:CheckBox ID="IncidentPoliceReportObtainedCheckBox" runat="server" Checked='<%# Eval("IncidentPoliceReportObtained") %>' Enabled="false" Text="IncidentPoliceReportObtained" />
                <br />
                IncidentTypeOfWeapon:
                <asp:Label ID="IncidentTypeOfWeaponLabel" runat="server" Text='<%# Eval("IncidentTypeOfWeapon") %>' />
                <br />
                CaseTypeName:
                <asp:Label ID="CaseTypeNameLabel" runat="server" Text='<%# Eval("CaseTypeName") %>' />
                <br />
                CourtName:
                <asp:Label ID="CourtNameLabel" runat="server" Text='<%# Eval("CourtName") %>' />
                <br />
                CourtCountyName:
                <asp:Label ID="CourtCountyNameLabel" runat="server" Text='<%# Eval("CourtCountyName") %>' />
                <br />
                DivisionName:
                <asp:Label ID="DivisionNameLabel" runat="server" Text='<%# Eval("DivisionName") %>' />
                <br />
                DivisionShortName:
                <asp:Label ID="DivisionShortNameLabel" runat="server" Text='<%# Eval("DivisionShortName") %>' />
                <br />
                DepartmentName:
                <asp:Label ID="DepartmentNameLabel" runat="server" Text='<%# Eval("DepartmentName") %>' />
                <br />
                UnitTypeName:
                <asp:Label ID="UnitTypeNameLabel" runat="server" Text='<%# Eval("UnitTypeName") %>' />
                <br />
                OfficeName:
                <asp:Label ID="OfficeNameLabel" runat="server" Text='<%# Eval("OfficeName") %>' />
                <br />
                CourtLevelName:
                <asp:Label ID="CourtLevelNameLabel" runat="server" Text='<%# Eval("CourtLevelName") %>' />
                <br />
                ClosingCourtName:
                <asp:Label ID="ClosingCourtNameLabel" runat="server" Text='<%# Eval("ClosingCourtName") %>' />
                <br />
                ClosingCourtLevelName:
                <asp:Label ID="ClosingCourtLevelNameLabel" runat="server" Text='<%# Eval("ClosingCourtLevelName") %>' />
                <br />
                ClosingCourtCountyName:
                <asp:Label ID="ClosingCourtCountyNameLabel" runat="server" Text='<%# Eval("ClosingCourtCountyName") %>' />
                <br />
                JudgeName:
                <asp:Label ID="JudgeNameLabel" runat="server" Text='<%# Eval("JudgeName") %>' />
                <br />
                ClosingJudgeName:
                <asp:Label ID="ClosingJudgeNameLabel" runat="server" Text='<%# Eval("ClosingJudgeName") %>' />
                <br />
                ProsecutorName:
                <asp:Label ID="ProsecutorNameLabel" runat="server" Text='<%# Eval("ProsecutorName") %>' />
                <br />
                ClosingProsecutorName:
                <asp:Label ID="ClosingProsecutorNameLabel" runat="server" Text='<%# Eval("ClosingProsecutorName") %>' />
                <br />
                CaseOpenTypeName:
                <asp:Label ID="CaseOpenTypeNameLabel" runat="server" Text='<%# Eval("CaseOpenTypeName") %>' />
                <br />
                ClientCommitTypeName:
                <asp:Label ID="ClientCommitTypeNameLabel" runat="server" Text='<%# Eval("ClientCommitTypeName") %>' />
                <br />
                JuryTypeName:
                <asp:Label ID="JuryTypeNameLabel" runat="server" Text='<%# Eval("JuryTypeName") %>' />
                <br />
<br /></span>
            </SelectedItemTemplate>
        </asp:ListView>
        <br />

      

    <asp:SqlDataSource ID="dsCaseDetails" runat="server" ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>" SelectCommand="SELECT * FROM [df_VW_CaseDetails]"
        EnableCaching="True">


    </asp:SqlDataSource>








    </div>
    </form>
</body>
</html>
