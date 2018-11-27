<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="CaseSchedule.ascx.vb" Inherits="Defender.CaseSchedule" %>






<asp:ListView ID="ListView1" runat="server" DataSourceID="odsCaseSchedule">

 

    <EmptyDataTemplate>
        <div class="alert alert-danger text-center text-danger bold">No schedules were found for this case.</div>
    </EmptyDataTemplate>

        
    
     <ItemTemplate>
        <div class="panel panel-default">
        <div class="panel-body">
            
 
       <h4>  
        <asp:Label ID="EventNameLabel" runat="server" Text='<%# GetTitleCase(Eval("EventName").ToString) %>' CssClass="bold text-success" /></h4>
        
        
            
            
        <asp:CheckBox ID="IsJurySessionCheckBox" runat="server" Checked='<%# Eval("JurySession") %>' Enabled="false" Text="Is Jury Session" />
        
         



        <br /> 


       <strong>Date/Time:</strong>
        <asp:Label ID="DateAndTimeLabel" runat="server" Text='<%# Eval("DateAndTime") %>' />
        <br />

        <strong>Event Type:</strong>
        <asp:Label ID="EventTypeLabel" runat="server" Text='<%# GetTitleCase(Eval("EventTypeName").ToString)  %>' CssClass="bold text-danger" />
            <br />


 
        <strong>Counsel:</strong>
        <asp:Label ID="CounselLabel" runat="server" Text='<%# Eval("LastName") & ", " & Eval("FirstName") %>' CssClass="boldxx" />
         
 
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

     
    

</asp:ListView>


        <div class="text-center">
            <asp:Button ID="Button1" runat="server" Text="Add new schedule" CssClass="btn btn-primary active" />
        </div>






           

          
                    <div class="row-spacer clearfix"></div>

            

<asp:ObjectDataSource ID="odsCaseSchedule" runat="server"
    EnableCaching="True" TypeName="Defender.CaseDetails" SelectMethod="getCaseSchedule">

    <SelectParameters>
        <asp:QueryStringParameter Name="CaseGUID" QueryStringField="caseguid" ValidateInput="true" ConvertEmptyStringToNull="true" />
    </SelectParameters>

</asp:ObjectDataSource>



