<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CaseParticipants.ascx.vb" Inherits="Defender.CaseParticipants" %>

 

<asp:ListView ID="ListView1" runat="server" DataSourceID="odsCaseParticipants">
   



    <EmptyDataTemplate>
        <div class="alert alert-danger text-center text-danger bold">No other participants found for this case.</div>
    </EmptyDataTemplate>

        


 
   

    <ItemTemplate>
        <tr style="">
            <td>
              <asp:Label ID="ParticipantNameLabel" runat="server" Text='<%# Eval("LastName") & ", " & Eval("FirstName") & " " & Eval("MiddleName") %>' CssClass="" />
            </td>

            <td>
                <asp:Label ID="RoleNameLabel" runat="server" Text='<%# GetTitleCase(Eval("RoleName")) %>' />
            </td>

            <td>
                <asp:Label ID="DOBLabel" runat="server" Text='<%# Eval("DOB", "{0:d}") %>' />
            </td>
             

        </tr>
    </ItemTemplate>



    <LayoutTemplate>
       
                    <table id="itemPlaceholderContainer" runat="server" class="table table-responsive table-hover">
                        <tr runat="server" style="">

                            <th runat="server" title="Participant's Name">Name</th>                      
                            <th runat="server" title="Participant's Role">Role</th>
                            <th runat="server" title="Participant's Date of Birth">DOB</th>

                        </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </table>
                
    </LayoutTemplate>

</asp:ListView>






<asp:ObjectDataSource ID="odsCaseParticipants" runat="server"
    EnableCaching="True" TypeName="Defender.CaseDetails" SelectMethod="getCaseParticipants">

    <SelectParameters>
        <asp:QueryStringParameter Name="CaseGUID" QueryStringField="caseguid" ValidateInput="true" ConvertEmptyStringToNull="true" />
    </SelectParameters>

</asp:ObjectDataSource>





<%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ZenoConnectionString %>" SelectCommand="SELECT TOP 10 CaseAttorney.DateAssigned, CaseAttorney.DateUnassigned, Attorney.AttorneyGUID, Attorney.BBO, Attorney.FirstName AttorneyName, Attorney.FirstName, Attorney.MiddleName, Attorney.LastName, AssignmentType.AssignmentTypeName FROM CaseAttorney INNER JOIN [Case] ON CaseAttorney.CaseNumber = [Case].CaseNumber INNER JOIN Attorney ON CaseAttorney.AttorneyID = Attorney.AttorneyID INNER JOIN AssignmentType ON CaseAttorney.AssignmentTypeID = AssignmentType.AssignmentTypeID "></asp:SqlDataSource>--%>



