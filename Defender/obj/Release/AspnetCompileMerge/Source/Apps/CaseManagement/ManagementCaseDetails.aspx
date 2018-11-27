<%@ Page Title="Case Details" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="ManagementCaseDetails.aspx.vb" Inherits="Defender.ManagementCaseDetails" %>

<%@ Register Src="~/Controls/UIs/CaseDetails/CaseCharges.ascx" TagPrefix="uc1" TagName="CaseCharges" %>
<%@ Register Src="~/Controls/UIs/CaseDetails/CaseAttorneys.ascx" TagPrefix="uc1" TagName="CaseAttorneys" %>
<%@ Register Src="~/Controls/UIs/CaseDetails/CaseClient.ascx" TagPrefix="uc1" TagName="CaseClient" %>
<%@ Register Src="~/Controls/UIs/CaseDetails/CaseInformation.ascx" TagPrefix="uc1" TagName="CaseInformation" %>
<%@ Register Src="~/Controls/UIs/CaseDetails/CaseParticipants.ascx" TagPrefix="uc1" TagName="CaseParticipants" %>
<%@ Register Src="~/Controls/UIs/CaseDetails/CaseSchedule.ascx" TagPrefix="uc1" TagName="CaseSchedule" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" Runat="Server">

</asp:Content>




<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">


    <asp:HiddenField ID="hdnCaseGUID" runat="server" Visible="true"  />
    <asp:HiddenField ID="hdnCaseID" runat="server" Visible="true"  />


    <asp:PlaceHolder ID="phNoCaseFound" runat="server" Visible="false">
     
        <div class="alert alert-danger text-center text-danger">

            <h1 class="bold">Oops! An error has occured.</h1>

            <h2>No case could be found with the case ID your browser has sent. Please try again.</h2>

            <p>If this problem persists, please contact the support team at <%: ConfigurationManager.AppSettings("TechContactEmail").ToString.ToLower  %></p>


        </div>

    </asp:PlaceHolder>



    <asp:PlaceHolder ID="phCaseIsValid" runat="server" Visible="false">
        

<div class="row">

 <div class="col-sm-6">

    <h1 class="zero-marginXX bold" runat="server" visible="false">
        <asp:Literal ID="ltrlCaseNumber" runat="server"></asp:Literal>
    </h1>

     
 
     
     
         
<div class="panel panel-primary"> 
    <div class="panel-heading" role="heading">

      <h3 class="panel-title">
          <%=ltrlCaseNumber.Text %>
          </h3> 

 </div> 
     <uc1:CaseInformation runat="server" id="CaseInformation" />
</div>  





 </div>           

 <div class="col-sm-6">




<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="false" aria-expanded="true"  >




  <div class="panel panel-primary">
    <div class="panel-heading" role="tab" id="headingOne">
      <h3 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          Client Information
        </a>
      </h3>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
     <%-- <div class="panel-body">--%>        
     <uc1:CaseClient runat="server" id="CaseClient" />
      <%--</div>--%>
    </div>
  </div>




           

          
                    <div class="row-spacer clearfix"></div>

            






  <div class="panel panel-primary">
    <div class="panel-heading" role="tab" id="headingAttorney">
      <h2 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseAttorney" aria-expanded="true" aria-controls="collapseAttorney">
           Attorneys
        </a>
      </h2>
    </div>
    <div id="collapseAttorney" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingAttorney">
     <%-- <div class="panel-body">--%>
          <uc1:CaseAttorneys runat="server" ID="CaseAttorneys" />
      <%--</div>--%>
    </div>
  </div>





    

           

          
                    <div class="row-spacer clearfix"></div>

            






  <div class="panel panel-primary">


    <div class="panel-heading" role="tab" id="headingTwo">
      <h2 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          Charges
        </a>
      </h2>
    </div>



    <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
     <uc1:CaseCharges runat="server" id="CaseCharges" />
      </div>
    


  </div>




    

           

          
                    <div class="row-spacer clearfix"></div>

            



  <div class="panel panel-primary">
    <div class="panel-heading" role="tab" id="headingThree">
      <h2 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
          Participants
        </a>
      </h2>
    </div>
    <div id="collapseThree" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingThree">
      <%--<div class="panel-body">--%>
         <uc1:CaseParticipants runat="server" id="CaseParticipants" />
      <%--</div>--%>
    </div>
  </div>



    

           

          
                    <div class="row-spacer clearfix"></div>

            




  <div class="panel panel-primary">
    <div class="panel-heading" role="tab" id="headingFive">
      <h2 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
          Schedules and Events
        </a>
      </h2>
    </div>
    <div id="collapseFive" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingFive">
     <%-- <div class="panel-body">--%>
        <uc1:CaseSchedule runat="server" id="CaseSchedule" />
     <%-- </div>--%>
    </div>
  </div>













</div>








    

     


     



 </div>

</div>

    </asp:PlaceHolder>



</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="FooterPlaceHolder" Runat="Server">


</asp:Content>


