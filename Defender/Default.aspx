<%@ Page Title="CPCS Case Management System" MasterPageFile="~/Masterpages/MasterPage.master" Language="VB" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="Defender._Default" %>

<%@ Register Src="~/Controls/UIs/Authorization/SignIn.ascx" TagPrefix="uc1" TagName="SignIn" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" Runat="Server" >

</asp:Content>





<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">


        <telerik:RadAjaxLoadingPanel ID="SignInLoadingPanel" runat="server" DefaultButton="imgSignIn" AnimationDuration="30000" MinDisplayTime="30000" InitialDelayTime="30000">
        </telerik:RadAjaxLoadingPanel>

    <telerik:RadAjaxManager ID="MetricsAjaxManager"
        runat="server"
        ShowLoadingPanelForPostBackControls="False"
        DefaultLoadingPanelID="SignInLoadingPanel" RestoreOriginalRenderDelegate="True">



        <AjaxSettings>

            <telerik:AjaxSetting AjaxControlID="imgSignIn">
                <UpdatedControls >
                    <telerik:AjaxUpdatedControl ControlID="SignIn" LoadingPanelID="SignInLoadingPanel"  />
                    <telerik:AjaxUpdatedControl ControlID="imgSignIn" LoadingPanelID="SignInLoadingPanel" />
                </UpdatedControls>                
            </telerik:AjaxSetting>


            <telerik:AjaxSetting AjaxControlID="SignIn">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="SignIn" LoadingPanelID="SignInLoadingPanel" />
                </UpdatedControls>
            </telerik:AjaxSetting>     

        </AjaxSettings>
        </telerik:RadAjaxManager> 





     

<div class="text-center">
    <asp:ImageButton ID="imgSignIn" runat="server" AlternateText="Sign In" ImageUrl="/Images/Logos/seal.png" CssClass="img-resposnsive center-block" BorderWidth="0" />
</div>


<uc1:SignIn runat="server" ID="SignIn" />

             






</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="FooterPlaceHolder" Runat="Server">

</asp:Content>


