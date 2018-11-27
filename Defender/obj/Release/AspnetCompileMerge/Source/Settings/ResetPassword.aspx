<%@ Page Title="Reset Your Password" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="ResetPassword.aspx.vb" Inherits="Defender.ResetPassword" %>
 
 

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" Runat="Server">
</asp:Content>

 




<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
   
  
      
    
    <div>
    
        <asp:ChangePassword ID="ChangePassword1" runat="server" 
            style="margin-left: 0px; margin-top: 20px" width="100%" 
            CancelDestinationPageUrl="~/Settings/default.aspx" 
            ContinueDestinationPageUrl="~/Settings/default.aspx"
            ChangePasswordFailureText="Password incorrect or New Password invalid. New Password length minimum: {0}.">
            
            <MailDefinition 
                Subject="Changes to your Password"
                
            BodyFileName="~/Authentication/emailbodies/resetpassword.txt"
            />
            
            <ChangePasswordTemplate>
                <table class="table table-striped table-bordered table-hover">
                    
                           
                                <tr>
                                    <th colspan="2" class="text-info">
                                        Change Your Password</th>
                                </tr>
                                
                    
                    
                    <tr>
                                
                                    
                                        <td>
                                        <asp:Label ID="CurrentPasswordLabel" runat="server" 
                                            AssociatedControlID="CurrentPassword">Current Password:</asp:Label>
                                    </td>


                                    <td>
                                        <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" 
                                            ControlToValidate="CurrentPassword" ErrorMessage="Password is required." 
                                            ToolTip="Your Current Password is required." ValidationGroup="ChangePassword1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>



                                <tr>
                                    <td>
                                        <asp:Label ID="NewPasswordLabel" runat="server" 
                                            AssociatedControlID="NewPassword">New Password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" 
                                            ControlToValidate="NewPassword" ErrorMessage="New Password is required." 
                                            ToolTip="New Password is required." ValidationGroup="ChangePassword1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>



                                <tr>
                                    <td>
                                        <asp:Label ID="ConfirmNewPasswordLabel" runat="server" 
                                            AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" 
                                            ControlToValidate="ConfirmNewPassword" 
                                            ErrorMessage="Confirm New Password is required." 
                                            ToolTip="Confirm New Password is required." ValidationGroup="ChangePassword1"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>







                                <tr>
                                    <td colspan="2">
                                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                                            ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                                            Display="Dynamic" 
                                            ErrorMessage="The Confirm New Password must match the New Password field." 
                                            ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                    </td>
                                </tr>






                                <tr>
                                    <td colspan="2" class="bold text-danger">
                                        <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                                    </td>
                                </tr>


                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="ChangePasswordPushButton" runat="server" 
                                            CommandName="ChangePassword" Text="Change Password" ValidationGroup="ChangePassword1" Cssclass="btn btn-primary" />
                                    
                                        <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancel" Cssclass="btn btn-primary" />
                                    </td>
                                </tr>



                            </table>
                      
            </ChangePasswordTemplate>





            <SuccessTemplate>
           <table class="table table-striped table-bordered table-hover">
                                <tr>
                                    <th colspan="2" class="text-success">
                                        Change Password Complete</th>
                                </tr>
                                <tr>
                                    <td>
                                    
                                   <br />   
                                   <p class="bold text-danger">  Your password has been changed!</p> 
                                   <br />
                                   
                                   </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="ContinuePushButton" runat="server" CausesValidation="False" 
                                            CommandName="Continue" Text="Continue" Cssclass="btn btn-primary" />
                                    </td>
                                </tr>
                            </table>

            </SuccessTemplate>
        </asp:ChangePassword>
    
    </div>



     

</asp:Content>
 

