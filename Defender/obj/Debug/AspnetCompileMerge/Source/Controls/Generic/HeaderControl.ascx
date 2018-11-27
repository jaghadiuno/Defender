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
            
            <ul class="nav navbar-nav navbar-left bold">

                <li runat="server" id="linkPeople"><a href="/apps/peoplesearch/default.aspx" class="bold"><i class="fa fa-users fa-lg" aria-hidden="true"></i>&nbsp;
<strong>People</strong></a></li>
                <li runat="server" id="linkCases"><a href="/apps/casemanagement/default.aspx" class="bold"><i class="fa fa-legal fa-fw fa-lg" aria-hidden="true"></i>&nbsp;
<strong>Cases</strong></a></li>
                <li runat="server" id="linkAssignments">
                    <a href="/apps/reports/default.aspx" class="bold"><i class="fa fa-bar-chart fa-fw fa-lg" aria-hidden="true"></i>&nbsp;
<strong>Reports</strong></a>
                </li>

            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li runat="server" id="toolsMore">
                    <a href="#" class="dropdown-toggle bold" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" title="Case Tools">More  <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-header">Attorney Case Tools</li>
                        <uc1:ToolsMenu runat="server" ID="ToolsMenu" />
                    </ul>
                </li>
            
            </ul>

        </div>
    </div>
</nav>
