<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CaseAttorneys.ascx.vb" Inherits="Defender.CaseAttorneys" %>



<asp:ListView ID="ListView1" runat="server" DataSourceID="odsCaseAttorneys">
   



    <EmptyDataTemplate>
        <div class="alert alert-danger text-center text-danger bold">No attorney information could be found for this case.</div>
    </EmptyDataTemplate>

        




   

    <ItemTemplate>
        <tr style="">
            <td>
               <a href="/apps/peoplesearch/PersonCase.aspx?attorneyguid=<%# Eval("AttorneyGUID") %>"><asp:Label ID="AttorneyNameLabel" runat="server" Text='<%# Eval("AttorneyName") %>' CssClass="" /></a>
            </td>

            <td>
                <asp:Label ID="BBOLabel" runat="server" Text='<%# Eval("BBO") %>' />
            </td>

            <td>
                <asp:Label ID="DateAssignedLabel" runat="server" Text='<%# Eval("DateAssigned", "{0:d}") %>' />
            </td>
            <td>
                <asp:Label ID="DateUnassignedLabel" runat="server" Text='<%# Eval("DateUnassigned", "{0:d}") %>' />
            </td>
             


           <%-- <td>
                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
            </td>
            <td>
                <asp:Label ID="MiddleNameLabel" runat="server" Text='<%# Eval("MiddleName") %>' />
            </td>
            <td>
                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
            </td>--%>

            <td>
                <asp:Label ID="AssignmentTypeNameLabel" runat="server" Text='<%# Eval("AssignmentTypeName") %>' />
            </td>
        </tr>
    </ItemTemplate>



    <LayoutTemplate>
       
                    <table id="itemPlaceholderContainer" runat="server" class="table table-responsive table-hover table-striped">
                        <tr runat="server" style="">

                            <th runat="server" title="Attorney Name">Name</th>                      
                            <th runat="server" title="Attorney's BBO Number">BBO</th>

                            <th runat="server" title="Date Assigned">Assigned</th>
                            <th runat="server" title="Date Unassigned">Unassigned</th>  

                           <%-- <th runat="server">FirstName</th>
                            <th runat="server">MiddleName</th>
                            <th runat="server">LastName</th>--%>


                            <th runat="server" title="Assignment Type">Type</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </table>
                
    </LayoutTemplate>

</asp:ListView>






<asp:ObjectDataSource ID="odsCaseAttorneys" runat="server"
    EnableCaching="True" TypeName="Defender.CaseDetails" SelectMethod="getCaseAttorneys">

    <SelectParameters>
        <asp:QueryStringParameter Name="CaseGUID" QueryStringField="caseguid" ValidateInput="true" ConvertEmptyStringToNull="true" />
    </SelectParameters>

</asp:ObjectDataSource>
 

