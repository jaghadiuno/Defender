<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CaseInformation.ascx.vb" Inherits="Defender.CaseInformation" %>







<asp:DetailsView ID="dvPrimaryInfo" 
    
    runat="server" 
    CssClass="table table-responsive table-hover table-striped" 
    GridLines="None"  AutoGenerateRows="False" 
    DataKeyNames="CaseID,CaseGUID,CaseNumber" DataSourceID="odsCaseDetails" >
    
    <Fields>


        <asp:TemplateField ShowHeader="False">
            <%--<EditItemTemplate>
                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>--%>
            <ItemTemplate>

                <div class="btn-group btn-group-md" role="group" aria-label="...">
  

<asp:Button ID="Button1" runat="server" CausesValidation="False" Text="Edit Case" Enabled="false" Visible="true" CssClass="btn active btn-primary"  />
                &nbsp;
<asp:Button ID="Button2" runat="server" CausesValidation="False" Text="Close Case" Enabled="false" Visible="true" CssClass="btn active btn-primary" />
                &nbsp;
<asp:Button ID="Button3" runat="server" CausesValidation="False" Text="Merge" Enabled="false" Visible="true" CssClass="btn active btn-danger" />
</div>




            </ItemTemplate>
            <ControlStyle />
        </asp:TemplateField>

        <asp:BoundField DataField="CaseGUID" HeaderText="Case GUID" SortExpression="CaseGUID" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize" Visible="false" >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="CaseNumber" HeaderText="Case Number" SortExpression="CaseNumber" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize" Visible="false" >





<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>





        <asp:BoundField DataField="DivisionName" HeaderText="Division" SortExpression="DivisionName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  ItemStyle-Width="50%"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize" Width="50%"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="DepartmentName" HeaderText="Department" SortExpression="DepartmentName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="OfficeName" HeaderText="Office" SortExpression="OfficeName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="UnitTypeName" HeaderText="Unit" SortExpression="UnitTypeName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >




<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>




        <asp:CheckBoxField DataField="CasePriorClient" HeaderText="Prior Client" SortExpression="CasePriorClient" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:CheckBoxField>

        <asp:CheckBoxField DataField="Open" HeaderText="Open" SortExpression="Open" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:CheckBoxField>

        <asp:BoundField DataField="OpeningDate" DataFormatString="{0:d}" HeaderText="Opening Date" SortExpression="OpeningDate" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="ClosingDate" DataFormatString="{0:d}" HeaderText="Closing Date" SortExpression="ClosingDate" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >




<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>




        <asp:CheckBoxField DataField="AdministrativelyClosed" HeaderText="Administratively Closed" SortExpression="AdministrativelyClosed" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >




<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:CheckBoxField>




        <asp:BoundField DataField="CourtName" HeaderText="Court" SortExpression="CourtName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="CourtLevelName" HeaderText="Court Level" SortExpression="CourtLevelName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="CourtCountyName" HeaderText="Court County" SortExpression="CourtCountyName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >



<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>



        <asp:BoundField DataField="ClosingCourtName" HeaderText="Closing Court" SortExpression="ClosingCourtName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="ClosingCourtLevelName" HeaderText="Closing Court Level" SortExpression="ClosingCourtLevelName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="ClosingCourtCountyName" HeaderText="Closing Court County" SortExpression="ClosingCourtCountyName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >






<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>






        <asp:BoundField DataField="JudgeName" HeaderText="Judge" ReadOnly="True" SortExpression="JudgeName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="ClosingJudgeName" HeaderText="Closing Judge" ReadOnly="True" SortExpression="ClosingJudgeName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >



<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>



        <asp:BoundField DataField="ProsecutorName" HeaderText="Prosecutor" ReadOnly="True" SortExpression="ProsecutorName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="ClosingProsecutorName" HeaderText="Closing Prosecutor" ReadOnly="True" SortExpression="ClosingProsecutorName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >





<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>





        <asp:BoundField DataField="ArraignAgencyID" HeaderText="Arraign Agency ID" SortExpression="Arraign AgencyID" Visible="false"  />

        <asp:BoundField DataField="CaseTypeName" HeaderText="Case Type" SortExpression="CaseTypeName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="CaseOpenTypeName" HeaderText="Case Open Type" SortExpression="CaseOpenTypeName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >


<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>


        <asp:BoundField DataField="ClientCommitTypeName" HeaderText="Client Commit Type" SortExpression="ClientCommitTypeName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:CheckBoxField DataField="JurySession" HeaderText="Jury Session" SortExpression="JurySession" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >





<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:CheckBoxField>





        <asp:BoundField DataField="DistrictArraignmentDate" DataFormatString="{0:d}" HeaderText="District Arraignment Date" SortExpression="DistrictArraignmentDate" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:CheckBoxField DataField="ArraignCustomdyHeld" HeaderText="Arraign Custody Held" SortExpression="ArraignCustomdyHeld" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:CheckBoxField>

        <asp:CheckBoxField DataField="ArraignCustomdyReleased" HeaderText="Custody Released" SortExpression="ArraignCustomdyReleased" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:CheckBoxField>

        <asp:CheckBoxField DataField="ArraignServingOtherSentence" HeaderText="Serving Other Sentence" SortExpression="ArraignServingOtherSentence" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >





<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:CheckBoxField>

         


        <asp:CheckBoxField DataField="BailStatus" HeaderText="Bail Status" SortExpression="BailStatus" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:CheckBoxField>

        <asp:BoundField DataField="BailAmount" HeaderText="Bail Amount" SortExpression="BailAmount" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="BailConditions" HeaderText="Bail Conditions" SortExpression="BailConditions" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

 

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

 

        <asp:BoundField DataField="LeadCharge" HeaderText="Lead Charge" SortExpression="LeadCharge" Visible="false" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >



<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>



        <asp:CheckBoxField DataField="SsaReferral" HeaderText="SSA Referral" SortExpression="SsaReferral" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >




<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:CheckBoxField>




        <asp:BoundField DataField="SuperiorArraignmentDate" DataFormatString="{0:d}" HeaderText="Superior Arraignment Date" SortExpression="SuperiorArraignmentDate" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="JuvenileComplaintArraignmentDate" DataFormatString="{0:d}" HeaderText="Juvenile Complaint Arraignment Date" SortExpression="JuvenileComplaintArraignmentDate" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >


<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>


        <asp:BoundField DataField="JuvenileIndictmentArraignmentDate" HeaderText="Juvenile Indictment Arraignment Date" SortExpression="JuvenileIndictmentArraignmentDate" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="IncidentArrestDate" HeaderText="Incident Arrest Date" SortExpression="IncidentArrestDate" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="IncidentPoliceReportDate" HeaderText="Incident Police Report Date" SortExpression="IncidentPoliceReportDate" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="IncidentComplaintDate" HeaderText="Incident Complaint Date" SortExpression="IncidentComplaintDate" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

        <asp:CheckBoxField DataField="IncidentPoliceReportObtained" HeaderText="Incident Police Report Obtained" SortExpression="IncidentPoliceReportObtained" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >


<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:CheckBoxField>


        <asp:BoundField DataField="IncidentTypeOfWeapon" HeaderText="Incident Type Of Weapon" SortExpression="IncidentTypeOfWeapon" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize"  >

 





<HeaderStyle Font-Bold="True"></HeaderStyle>

<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

 





        <asp:BoundField DataField="JuryTypeName" HeaderText="Jury Type" SortExpression="JuryTypeName" HeaderStyle-Font-Bold="true" ItemStyle-CssClass="capitalize">
<HeaderStyle Font-Bold="True"></HeaderStyle>
<ItemStyle CssClass="capitalize"></ItemStyle>
        </asp:BoundField>

         


        <asp:TemplateField HeaderText="Note" SortExpression="Note" ShowHeader="false" ItemStyle-CssClass="capitalize">
            <ItemTemplate>
               <strong>Case Notes</strong><br />
                <%# Eval("Note") %>
            </ItemTemplate>
        </asp:TemplateField>


    </Fields>

  
</asp:DetailsView>





        <asp:ObjectDataSource ID="odsCaseDetails" runat="server"
     TypeName="Defender.CaseDetails" SelectMethod="getCaseDetails"
            EnableCaching="False" CacheDuration="Infinite">
            
    <SelectParameters>
        <asp:QueryStringParameter Name="CaseGUID" QueryStringField="caseguid" ValidateInput="true" ConvertEmptyStringToNull="true" />
    </SelectParameters>

        </asp:ObjectDataSource>


 
