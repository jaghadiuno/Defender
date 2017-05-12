<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="HeaderControl.ascx.vb" Inherits="Defender.HeaderControl" %>
<%@ Register Src="~/Controls/UIs/Navigation/ToolsMenu.ascx" TagPrefix="uc1" TagName="ToolsMenu" %>




<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>

         <a class="navbar-brand brand-image" href="/"><img src="/images/logos/logo.png" alt="Defender" /></a>

        </div>
        <div id="navbar" class="navbar-collapse collapse">
          
             
               <ul class="nav navbar-nav navbar-left">

  


            <li runat="server" id="linkPeople"><a href="/apps/peoplesearch/default.aspx" class="bold"><i class="fa fa-users fa-lg" aria-hidden="true"></i>&nbsp; 
         People</a></li>



            <li runat="server" id="linkCases"><a href="/apps/casemanagement/default.aspx" class="bold"><i class="fa fa-legal fa-fw fa-lg" aria-hidden="true"></i>&nbsp; 
         Cases</a></li>





                    



<li runat="server" id="linkAssignments">
  <a href="/apps/reports/default.aspx" class="bold"> 
         Reports Main Page</a>
</li> 


 












<li runat="server" id="toolsMore">
  <a href="#" class="dropdown-toggle bold" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" title="Case Tools">
    
  More  <span class="caret"></span>
  </a>


  <ul class="dropdown-menu">

       
       
  <li class="dropdown-header">Attorney Case Tools</li>
    

      <uc1:ToolsMenu runat="server" id="ToolsMenu" />


  </ul>



</li>


          </ul>         
             

            <ul class="nav navbar-nav navbar-right">
                 



<li runat="server" id="linkSettings" class="dropdown" >
  <a href="#" class="dropdown-toggle bold" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
    <i class="fa fa-cog fa-lg" aria-hidden="true"></i>&nbsp;  <%:Defender.SiteGeneral.GetDisplayName  %>
    <span class="caret"></span>
  </a>


  <ul class="dropdown-menu">
  
<li> 
    <asp:LoginStatus ID="LoginStatus1" runat="server" LoginText="Sign In" LogoutText="Sign Out" />
</li>


    <li role="separator" class="divider"></li>


<asp:LoginView ID="LoginView1" runat="server">

    <AnonymousTemplate>


<li>
    <asp:HyperLink ID="lnkPassword" runat="server" NavigateUrl="~/authentication/recoverpassword.aspx" CssClass="bold">I forgot my password</asp:HyperLink>
</li>

    </AnonymousTemplate>






    <LoggedInTemplate>

<li>
    <asp:HyperLink ID="lnkSettings" runat="server" NavigateUrl="~/settings/default.aspx" CssClass="bold">Settings</asp:HyperLink>
</li>

    </LoggedInTemplate> 

</asp:LoginView> 


  </ul>



</li>















          </ul>
 

             
        </div>
      </div>
    </nav>



