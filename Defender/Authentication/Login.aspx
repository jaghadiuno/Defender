<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="Login.aspx.vb" Inherits="Defender.Login" Title="Login to ZENO" %>



<%@ Register Src="~/Controls/UIs/Authorization/SignIn.ascx" TagPrefix="uc1" TagName="SignIn" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" Runat="Server">

</asp:Content>
   
     
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    
  
    <uc1:SignIn runat="server" ID="SignIn" /> 

</asp:Content>


