<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CaseDetails.ascx.vb" Inherits="Defender.CaseDetails1" %>


   <div class="row">



       <div class="col-md-3">
           <div class="panel panel-default"><div class="panel-body" style="min-height: 300px;">



              <%--  Case Number:
                <asp:Label ID="CaseNumberLabel" runat="server" Text='<%# Eval("CaseNumber") %>' />
                <br />--%>


                <asp:CheckBox ID="OpenCheckBox" runat="server" Checked='<%# Eval("Open") %>' Enabled="false" Text="Open" />
                <br />


                Opening Date:
                <asp:Label ID="OpeningDateLabel" runat="server" Text='<%# Eval("OpeningDate", "{0:d}") %>' />
                <br />


                Closing Date:
                <asp:Label ID="ClosingDateLabel" runat="server" Text='<%# Eval("ClosingDate", "{0:d}") %>' />
                <br />


 Case Type:
                <asp:Label ID="CaseTypeNameLabel" runat="server" Text='<%# Eval("CaseTypeName") %>' />
                <br />



                Court:
                <asp:Label ID="CourtNameLabel" runat="server" Text='<%# Eval("CourtName") %>' />
                <br />


                Court Level:
                <asp:Label ID="CourtLevelNameLabel" runat="server" Text='<%# Eval("CourtLevelName") %>' />
                <br />

                Court County:
                <asp:Label ID="CourtCountyNameLabel" runat="server" Text='<%# Eval("CourtCountyName") %>' />
                <br />



                Division:
                <asp:Label ID="DivisionNameLabel" runat="server" Text='<%# Eval("DivisionName") %>' />
                <br />
               



                Department:
                <asp:Label ID="DepartmentNameLabel" runat="server" Text='<%# Eval("DepartmentName") %>' />
                <br />


                Unit Type:
                <asp:Label ID="UnitTypeNameLabel" runat="server" Text='<%# Eval("UnitTypeName") %>' />
                <br />

                Office Name:
                <asp:Label ID="OfficeNameLabel" runat="server" Text='<%# Eval("OfficeName") %>' />
                
 
        </div></div>
       </div> 



       <div class="col-md-3">
           <div class="panel panel-default"><div class="panel-body" style="min-height: 300px;">



                Closing Court Name:
                <asp:Label ID="ClosingCourtNameLabel" runat="server" Text='<%# Eval("ClosingCourtName") %>' />
                <br />

                Closing Court Level:
                <asp:Label ID="ClosingCourtLevelNameLabel" runat="server" Text='<%# Eval("ClosingCourtLevelName") %>' />
                <br />

                Closing Court County:
                <asp:Label ID="ClosingCourtCountyNameLabel" runat="server" Text='<%# Eval("ClosingCourtCountyName") %>' />
                <br />


                Judge Name:
                <asp:Label ID="JudgeNameLabel" runat="server" Text='<%# Eval("JudgeName") %>' />
                <br />

                Closing Judge:
                <asp:Label ID="ClosingJudgeNameLabel" runat="server" Text='<%# Eval("ClosingJudgeName") %>' />
                <br />

                Prosecutor:
                <asp:Label ID="ProsecutorNameLabel" runat="server" Text='<%# Eval("ProsecutorName") %>' />
                <br />


                Closing Prosecutor:
                <asp:Label ID="ClosingProsecutorNameLabel" runat="server" Text='<%# Eval("ClosingProsecutorName") %>' />
                <br />


                Case Open Type:
                <asp:Label ID="CaseOpenTypeNameLabel" runat="server" Text='<%# Eval("CaseOpenTypeName") %>' />
                <br />


                Client Commit Type:
                <asp:Label ID="ClientCommitTypeNameLabel" runat="server" Text='<%# Eval("ClientCommitTypeName") %>' />
                <br />


             


               District Arraignment Date:
                <asp:Label ID="DistrictArraignmentDateLabel" runat="server" Text='<%# Eval("DistrictArraignmentDate", "{0:d}") %>' />
                <br />
 
  Jury Type:
                <asp:Label ID="JuryTypeNameLabel" runat="server" Text='<%# Eval("JuryTypeName") %>' />
                <br />



        </div></div>
       </div> 


       <div class="col-md-3">
           <div class="panel panel-default"><div class="panel-body" style="min-height: 300px;"> 
               

                <asp:CheckBox ID="JurySessionCheckBox" runat="server" Checked='<%# Eval("JurySession") %>' Enabled="false" Text="Jury Session" />
                <br />

                <asp:CheckBox ID="CasePriorClientCheckBox" runat="server" Checked='<%# Eval("CasePriorClient") %>' Enabled="false" Text="Prior Client" />
                <br />

                <asp:CheckBox ID="AdministrativelyClosedCheckBox" runat="server" Checked='<%# Eval("AdministrativelyClosed") %>' Enabled="false" Text="Administratively Closed" />
                <br />
             
               

                <asp:CheckBox ID="ArraignCustomdyReleasedCheckBox" runat="server" Checked='<%# Eval("ArraignCustomdyReleased") %>' Enabled="false" Text="Arraign Custody Released" />
                <br />


                <asp:CheckBox ID="ArraignCustomdyHeldCheckBox" runat="server" Checked='<%# Eval("ArraignCustomdyHeld") %>' Enabled="false" Text="Arraign Custody Held" />
                <br />

                <asp:CheckBox ID="ArraignServingOtherSentenceCheckBox" runat="server" Checked='<%# Eval("ArraignServingOtherSentence") %>' Enabled="false" Text="Arraign Serving Other Sentence" />
                <br />


                <asp:CheckBox ID="BailStatusCheckBox" runat="server" Checked='<%# Eval("BailStatus") %>' Enabled="false" Text="Bail Status" />
                <br />

                


 <asp:CheckBox ID="SsaReferralCheckBox" runat="server" Checked='<%# Eval("SsaReferral") %>' Enabled="false" Text="SSA Referral" />
                <br />
               



                <asp:CheckBox ID="IncidentPoliceReportObtainedCheckBox" runat="server" Checked='<%# Eval("IncidentPoliceReportObtained") %>' Enabled="false" Text="Incident Police Report Obtained" />
                <br />



        </div></div>
       </div> 


       <div class="col-md-3">
           <div class="panel panel-default"><div class="panel-body" style="min-height: 300px;"> 
               

            




Bail Amount:
                <asp:Label ID="BailAmountLabel" runat="server" Text='<%# Eval("BailAmount") %>' />
                <br />



                Bail Conditions:
                <asp:Label ID="BailConditionsLabel" runat="server" Text='<%# Eval("BailConditions") %>' />
                <br />



                Superior Arraignment Date:
                <asp:Label ID="SuperiorArraignmentDateLabel" runat="server" Text='<%# Eval("SuperiorArraignmentDate", "{0:d}") %>' />
                <br />

                Juvenile Complaint Arraignment Date:
                <asp:Label ID="JuvenileComplaintArraignmentDateLabel" runat="server" Text='<%# Eval("JuvenileComplaintArraignmentDate", "{0:d}") %>' />
                <br />

                Juvenile Indictment Arraignment Date:
                <asp:Label ID="JuvenileIndictmentArraignmentDateLabel" runat="server" Text='<%# Eval("JuvenileIndictmentArraignmentDate", "{0:d}") %>' />
                <br />

                Incident Arrest Date:
                <asp:Label ID="IncidentArrestDateLabel" runat="server" Text='<%# Eval("IncidentArrestDate", "{0:d}") %>' />
                <br />


                Incident Police Report Date:
                <asp:Label ID="IncidentPoliceReportDateLabel" runat="server" Text='<%# Eval("IncidentPoliceReportDate", "{0:d}") %>' />
                <br />


                Incident Complaint Date:
                <asp:Label ID="IncidentComplaintDateLabel" runat="server" Text='<%# Eval("IncidentComplaintDate", "{0:d}") %>' />
                <br />


                Incident Type of Weapon:
                <asp:Label ID="IncidentTypeOfWeaponLabel" runat="server" Text='<%# Eval("IncidentTypeOfWeapon") %>' />

                




                <div class="row-spacer clearfix"></div>






<a href="/apps/casemanagement/managementcasedetails.aspx?caseguid=<%# Eval("CaseGUID") %>" class="btn btn-block btn-primary">View Full Case Details</a>
               



        </div></div>
       </div> 



   </div>




 


           