<%@ Page Title="My Settings" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/MasterPage.Master" CodeBehind="Default.aspx.vb" Inherits="Defender._Default3" %>
 
 



<script runat="server">
    Public Shared Function currentUser() As MembershipUser
        currentUser = Membership.GetUser()
    End Function
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="Server">
    <%  Page.Title = Server.HtmlEncode(currentUser.UserName) & "'s Website Settings"%>
</asp:Content>



 



 


<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
   
   




    <table class="table table-striped table-bordered table-hover">


          <tr>
              <td>
                  
                  <strong>User Name/ID:</strong>   
                  
              </td> 

<td>  
              
              <strong>  <% =Server.HtmlEncode(currentUser.UserName)%> </strong>  </td>


          </tr>





          <tr>
              <td><strong>
                Email address:</strong></td>
<td>
                <% = Server.HtmlEncode(currentUser.Email) %>              </td>
          </tr>



          <tr>
              <td><strong>
                Membership Status:</strong></td>
<td>
                <% =IIf(currentUser.IsApproved = True, "Approved", "Not Approved")%>              </td>
          </tr>
          
          <tr>
              <td><strong>
                Online status:</strong></td>
<td>
                <% =IIf(currentUser.IsOnline = True, "Online", "Not online")%>              </td>
          </tr>
          <tr>
              <td><strong>
                Account created on:</strong></td>
<td>
                <% = currentUser.CreationDate.ToString("F") %>              </td>
          </tr>
          <tr>
              <td><strong>
                You last logged in at:</strong></td>
<td>
                <% = currentUser.LastLoginDate.ToString("F") %>              </td>
          </tr>
          <tr>
              <td><strong>
                You were last active at:</strong></td>
<td>
                <% = currentUser.LastActivityDate.ToString("F") %>              </td>
          </tr>
          <tr>
              <td ><strong>
                Password last changed on:</strong></td>
<td >
                <% = currentUser.LastPasswordChangedDate.ToString("F") %>              </td>
          </tr>
        </table>








 




</asp:Content>

