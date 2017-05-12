<%@ Page Title="Recover Your Password" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="RecoverPassword.aspx.vb" Inherits="Defender.RecoverPassword" %>
 

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    
   
    
        
     
           
           
           

<div class="row">
<div class="col-md-6 col-md-offset-3 col-sm-10 col-sm-offset-1 col-xs-12">

<div class="panel panel-primary">
 <div class="panel-heading">
<h1 class="panel-title">Recover your Password</h1> 
 </div>
<div class="panel-body">

           
          

        


        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server"  
                       
            MailDefinition-BodyFileName="~/Authentication/emailbodies/lostpasswords.txt"


            MailDefinition-Subject="Your Password"
            BorderPadding="0" 
            BorderStyle="None" 
            BorderWidth="0" 
            Width="100%"
            MailDefinition-IsBodyHtml="True" MailDefinition-Priority="High">
            
            
            <InstructionTextStyle Font-Italic="True" CssClass="text-info"/>
            <SuccessTextStyle Font-Bold="True" CssClass="text-success"/>
           
           <FailureTextStyle Font-Bold="True" CssClass="text-danger" />
            <UserNameTemplate>
                



<p>


                <asp:ValidationSummary 
                    ID="ValidationSummary1" 
                    runat="server" 
                    ValidationGroup="PasswordRecovery1" DisplayMode="BulletList"
                    />

        <asp:Literal ID="FailureText" runat="server"></asp:Literal>


</p>




       <div class="form-inline" role="form">

            

<div class="input-group">

      <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="sr-only">Username:</asp:Label>

     
          

  <span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
                                        
    
    <asp:TextBox ID="UserName" 
                                            runat="server" 
                                            class="form-control" 
                                            placeholder="Enter your username">

                                        </asp:TextBox>


                                        <asp:RequiredFieldValidator ID="UserNameRequired" 
                                            runat="server" 
                                            ControlToValidate="UserName" ErrorMessage="Enter your username to have your password emailed to you." 
                                            ToolTip="User Name is required." ValidationGroup="PasswordRecovery1" Display="None" />




      </div>

    

                                        <asp:Button ID="SubmitButton" runat="server"  
                                            CommandName="Submit" Text="Submit" 
                                            ValidationGroup="PasswordRecovery1" CssClass="btn btn-primary" />




                

            

    </div> 
            </UserNameTemplate>
           
 
        </asp:PasswordRecovery>
        
        
    
    </div>
	


    </div>

</div>   
</div>           

 





	<div class="clearfix row-spacer"></div>
					

	<div class="alert alert-danger text-center">

		If you no longer have access to the email account you used to register, contact the 
        
       <strong> <%=ConfigurationManager.AppSettings.Item("TechContactName") %> </strong>
        
        at 
        
        <strong> <%=ConfigurationManager.AppSettings.Item("TechContactEmail") %> </strong>
        
        
        to reset your account. 

	</div> 
</asp:Content>
 
 

