<%@ Page Title="Attorneys, Clients, and Participants Cases" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="PersonCase.aspx.vb" Inherits="Defender.PersonCase" %>


<%@ Register Src="~/Controls/UIs/Cases/AttorneyCases.ascx" TagPrefix="uc1" TagName="AttorneyCases" %>
<%@ Register Src="~/Controls/UIs/Cases/ClientCases.ascx" TagPrefix="uc1" TagName="ClientCases" %>
<%@ Register Src="~/Controls/UIs/Cases/ParticipantCases.ascx" TagPrefix="uc1" TagName="ParticipantCases" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">


<%--<p>
    <a href="/apps/peoplesearch/default.aspx" class="btn btn-primary"><i class="fa fa-search fa-fw" aria-hidden="true"></i>   Return to People Search</a>
</p>--%>



    <uc1:AttorneyCases runat="server" ID="AttorneyCases" />



    <uc1:ClientCases runat="server" ID="ClientCases" />



    <uc1:ParticipantCases runat="server" ID="ParticipantCases" />



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" Runat="Server">
</asp:Content>


