
<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SignIn.ascx.vb" Inherits="Defender.SignIn" %>




 
     

<div class="row">
<div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-10 col-sm-offset-1 col-xs-12">

<div class="panel panel-primary">
    <div class="panel-heading">
        <h1 class="panel-title">Sign In</h1>
    </div>
    <div class="panel-body">










        <asp:Login ID="Login1" runat="server"
            LoginButtonText="Sign In"
            VisibleWhenLoggedIn="true"
            RememberMeSet="False"
            RenderOuterTable="False">

            <LayoutTemplate>


                <div class="form-horizontal" role="form">


                        <div class="input-group">


                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" class="sr-only" Text="Username" />

                         
                        <span class="input-group-addon"><i class="fa fa-user fa-fw"></i></span>
                            <asp:TextBox ID="UserName" class="form-control" runat="server" placeholder="Enter your Username">
                   
                            </asp:TextBox>


                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                ErrorMessage="Username is required" ValidationGroup="PageLoginGroup" Display="None" />
                        
                   

</div> 

<br />

                        <div class="input-group">

                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" class="sr-only"><strong>Password:</strong></asp:Label>


                            <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>

                            <asp:TextBox ID="Password" class="form-control" runat="server" TextMode="Password" placeholder="Enter your Password"></asp:TextBox>
                            </div> 
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server"
                                ControlToValidate="Password"
                                ErrorMessage="Password is required" ValidationGroup="PageLoginGroup"
                                Display="None" />

                       
                    </div>



                <br />

                    
                         
                            <p class="small text-muted">

                                <asp:CheckBox ID="RememberMe" runat="server" Text=" &nbsp; Remember me" />

                            </p>
                        
                     


                     

                        <p>     
                            
                            
                            <asp:Button ID="Button1" runat="server" Text="Sign In" ValidationGroup="PageLoginGroup" CommandName="Login" Cssclass="btn btn-primary" />


                        </p>





                           
        
    




<p class="bold small">

<a href="/Authentication/RecoverPassword.aspx">I forgot my password</a>

</p>

          
     



                    <p class="form-group">
                         




                            <span class="text-danger bold"><asp:Literal ID="FailureText" runat="server" ></asp:Literal></span>

                            <asp:ValidationSummary ID="ValidationSummary1" runat="server"  ValidationGroup="PageLoginGroup" />




                        
                    </p>









            </LayoutTemplate>
        </asp:Login>

        

    </div>
</div>


</div>
    </div>




 




