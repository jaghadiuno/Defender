<%@ Page Title="Case Tools" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="Default.aspx.vb" Inherits="Defender._Default7" %>

<%@ Register Src="~/Controls/UIs/Navigation/ToolsMenu.ascx" TagPrefix="uc1" TagName="ToolsMenu" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">


 



    <ul class="list-group">


        <li class="list-group-item active">
    <h4 class="list-group-item-heading">List of Frequently Used Data</h4>
    
  </li>

 
        <uc1:ToolsMenu runat="server" id="ToolsMenu" />


    </ul>
    


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" Runat="Server">
</asp:Content>


