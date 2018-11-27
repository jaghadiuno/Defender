<%@ Page Title="Change Your Email Address" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="ChangeEmail.aspx.vb" Inherits="Defender.ChangeEmail" %>
 


<script runat="server">
    
    Public Shared Function currentUser() As MembershipUser
        currentUser = Membership.GetUser()
    End Function

</script>

<script runat="server">

Dim u As MembershipUser

Public Sub Page_Load(sender As Object, args As EventArgs)

  u = Membership.GetUser(User.Identity.Name)

  If Not IsPostBack Then EmailTextBox.Text = u.Email

End Sub

Public Sub UpdateEmailButton_OnClick(sender As Object, args As EventArgs)

  Try
    u.Email = EmailTextBox.Text

    Membership.UpdateUser(u)
  
            Msg.Text = "Your new email address has been updated."
  Catch e As System.Configuration.Provider.ProviderException
    Msg.Text = e.Message
  End Try

End Sub

</script>

 

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" Runat="Server">
</asp:Content>

 






<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
   
  

 


			 

            





<%  If Msg.Text <> "" Then%>        
   
  <p> <asp:Label id="Msg" runat="server" CssClass="bold text-danger" /></p>


<%  End If%>  



    <table class="table table-striped table-bordered table-hover">
                                <tr>
                                    <th colspan="2" class="text-danger">
                                       Update Your E-Mail Address</th>
                                </tr>
    <tr>
      <td class="MainContent"><strong>New E-mail Address:</strong></td>
      <td class="MainContent"><asp:TextBox id="EmailTextBox" MaxLength="128" Columns="30" runat="server" />
      
      <asp:RequiredFieldValidator 
      id="EmailRequiredValidator" 
      runat="server"
      ControlToValidate="EmailTextBox" ForeColor="red"  Display="Dynamic" ErrorMessage="Email Address is Required"
      
       />
     
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter a valid email address" ControlToValidate="EmailTextBox" Display="Dynamic" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />           
                               

     </td>
    </tr>
    <tr>
      <td colspan="2">
      
      <asp:Button id="UpdateEmailButton" 
                      Text="Update E-mail" 
                      OnClick="UpdateEmailButton_OnClick" 
                      runat="server" Cssclass="btn btn-primary" /></td>
    </tr>
  </table>




     

</asp:Content>


