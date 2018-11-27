<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CaseDetails.ascx.vb" Inherits="Defender.CaseDetails1" %>
   <div class="row bold text-muted small">
       <div class="col-md-3">
           <div class="panel panel-default"><div class="panel-body" style="min-height: 250px;"> 
                <asp:CheckBox ID="OpenCheckBox" runat="server" Checked='<%# Eval("Open") %>' Enabled="false" Text="Open" />
                <br />
                <%--<asp:CheckBox ID="JurySessionCheckBox" runat="server" Checked='<%# Eval("JurySession") %>' Enabled="false" Text="Jury Session" />
                <br />--%>
                <asp:CheckBox ID="CasePriorClientCheckBox" runat="server" Checked='<%# Eval("CasePriorClient") %>' Enabled="false" Text="Prior Client" />
                <br />
                <asp:CheckBox ID="ArraignCustomdyHeldCheckBox" runat="server" Checked='<%# Eval("ArraignCustomdyHeld") %>' Enabled="false" Text="Custody Held" />
                <br />
                <asp:CheckBox ID="ArraignCustomdyReleasedCheckBox" runat="server" Checked='<%# Eval("ArraignCustomdyReleased") %>' Enabled="false" Text="Custody Released" />
                <br />
                <asp:CheckBox ID="ArraignServingOtherSentenceCheckBox" runat="server" Checked='<%# Eval("ArraignServingOtherSentence") %>' Enabled="false" Text="Serving Other Sentence" />
                <br />
                <asp:CheckBox ID="BailStatusCheckBox" runat="server" Checked='<%# Eval("BailStatus") %>' Enabled="false" Text="Bail Status" />
                <br />
 <asp:CheckBox ID="SsaReferralCheckBox" runat="server" Checked='<%# Eval("SsaReferral") %>' Enabled="false" Text="SSA Referral" />
                <br />
                <asp:CheckBox ID="IncidentPoliceReportObtainedCheckBox" runat="server" Checked='<%# Eval("IncidentPoliceReportObtained") %>' Enabled="false" Text="Police Report Obtained" />
                <br />
        </div></div>
       </div> 
       <div class="col-md-3">
           <div class="panel panel-default"><div class="panel-body" style="min-height: 250px;">
              <%--  Case Number:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="CaseNumberLabel" runat="server" Text='<%# Eval("CaseNumber") %>' />
                <br />--%>
                Date Opened:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="OpeningDateLabel" runat="server" Text='<%# Eval("OpeningDate", "{0:d}") %>' />
                <br />
                 Date Closed:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="ClosingDateLabel" runat="server" Text='<%# Eval("ClosingDate", "{0:d}") %>' />
                <br />
 Case Type:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="CaseTypeNameLabel" runat="server" Text='<%# Eval("CaseTypeName") %>' />
                <br />
                Court:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="CourtNameLabel" runat="server" Text='<%# Eval("CourtName") %>' />
                <br />
                Court Level:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="CourtLevelNameLabel" runat="server" Text='<%# Eval("CourtLevelName") %>' />
                <br />
                Court County:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="CourtCountyNameLabel" runat="server" Text='<%# Eval("CourtCountyName") %>' />
                <br />
                Division:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="DivisionNameLabel" runat="server" Text='<%# Eval("DivisionName") %>' />
                <br />
                Department:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="DepartmentNameLabel" runat="server" Text='<%# Eval("DepartmentName") %>' />
                <br />
                Unit:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="UnitTypeNameLabel" runat="server" Text='<%# Eval("UnitTypeName") %>' />
                <br />
                Office:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="OfficeNameLabel" runat="server" Text='<%# Eval("OfficeName") %>' />
                <br />
               Arraignment Date:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="DistrictArraignmentDateLabel" runat="server" Text='<%# Eval("DistrictArraignmentDate", "{0:d}") %>' />
        </div></div>
       </div> 
       <div class="col-md-4">
           <div class="panel panel-default"><div class="panel-body" style="min-height: 250px;">
                Closing Court:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="ClosingCourtNameLabel" runat="server" Text='<%# Eval("ClosingCourtName") %>' />
                <br />
                Closing Court Level:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="ClosingCourtLevelNameLabel" runat="server" Text='<%# Eval("ClosingCourtLevelName") %>' />
                <br />
                Closing Court County:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="ClosingCourtCountyNameLabel" runat="server" Text='<%# Eval("ClosingCourtCountyName") %>' />
                <br />
                Judge:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="JudgeNameLabel" runat="server" Text='<%# Eval("JudgeName") %>' />
                <br />
                Closing Judge:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="ClosingJudgeNameLabel" runat="server" Text='<%# Eval("ClosingJudgeName") %>' />
                <br />
                Prosecutor:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="ProsecutorNameLabel" runat="server" Text='<%# Eval("ProsecutorName") %>' />
                <br />
                Closing Prosecutor:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="ClosingProsecutorNameLabel" runat="server" Text='<%# Eval("ClosingProsecutorName") %>' />
                <br />
                Case Open Type:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="CaseOpenTypeNameLabel" runat="server" Text='<%# Eval("CaseOpenTypeName") %>' />
                <br />
                Client Commit Type:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="ClientCommitTypeNameLabel" runat="server" Text='<%# Eval("ClientCommitTypeName") %>' />
                <br />
  Jury Type:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="JuryTypeNameLabel" runat="server" Text='<%# Eval("JuryTypeName") %>' />
                <br />
Bail Amount:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="BailAmountLabel" runat="server" Text='<%# Eval("BailAmount") %>' />
                <br />
                Bail Conditions:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="BailConditionsLabel" runat="server" Text='<%# Eval("BailConditions") %>' />
                <br />
<%--
                Superior Arraignment Date:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="SuperiorArraignmentDateLabel" runat="server" Text='<%# Eval("SuperiorArraignmentDate", "{0:d}") %>' />
                <br />
                Juvenile Complaint Arraignment Date:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="JuvenileComplaintArraignmentDateLabel" runat="server" Text='<%# Eval("JuvenileComplaintArraignmentDate", "{0:d}") %>' />
                <br />
                Juvenile Indictment Arraignment Date:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="JuvenileIndictmentArraignmentDateLabel" runat="server" Text='<%# Eval("JuvenileIndictmentArraignmentDate", "{0:d}") %>' />
                <br />
                Incident Arrest Date:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="IncidentArrestDateLabel" runat="server" Text='<%# Eval("IncidentArrestDate", "{0:d}") %>' />
                <br />
                Incident Police Report Date:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="IncidentPoliceReportDateLabel" runat="server" Text='<%# Eval("IncidentPoliceReportDate", "{0:d}") %>' />
                <br />
                Incident Complaint Date:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="IncidentComplaintDateLabel" runat="server" Text='<%# Eval("IncidentComplaintDate", "{0:d}") %>' />
                <br />
                Incident Type of Weapon:
                <asp:Label Font-Bold="False" ForeColor="Black" ID="IncidentTypeOfWeaponLabel" runat="server" Text='<%# Eval("IncidentTypeOfWeapon") %>' />
--%>
        </div></div>
       </div> 
       <div class="col-md-2">
           <div class="panel panel-default">
               <div class="panel-body" style="min-height: 250px;">
                <div class="row-spacer clearfix"></div>
<a href="/apps/casemanagement/managementcasedetails.aspx?caseguid=<%# Eval("CaseGUID") %>" class="btn btn-block btn-primary bold">Case Details</a>
        </div></div>
   </div>
</div>