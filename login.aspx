<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="roomBooking.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="/Assets/css/login.css">
</head>
<body>
     <header>
        <div class="HeaderLogo">
            <img src="https://tse4.mm.bing.net/th?id=OIP.dW3Uh84M3dVKv5zBIij9tQHaHa&pid=Api&P=0&h=180" alt="" srcset=""
                width="80px" style="border-radius: 3px; box-shadow: 3px 6px 10px rgb(230 230 230);padding: 10px;">
            <div class="titleLogo">
                <b>roomMilega</b>
                <span>www.roommilega.fake.com</span>
            </div>


        </div>
        <div class="menu">
            <ul>
                <li><a href="DashboardUser.aspx">Home</a></li>
                <li><a href="aboutus.aspx">About US</a></li>
                <li><a href="contactus.aspx">Contact us</a></li>
              
                <li><img src="Assets/icons/profile.jpg" alt="profile" srcset="" width="40px"
                        style="border-radius: 50%; box-shadow: 3px 6px 10px rgb(230 230 230)">

                </li>
            </ul>
        </div>
    </header>


    <div class="registraion">
        <div class="forms">
            
          
                <form runat="server">
                  <h2 style="font-size: 50px;font-family: 'Trebuchet MS';margin-bottom: -5px;">roomMilega</h2>
            <span style="font-size: 10px;font-family:'Lucida Sans';">Search rooms loved by many</span>
            <p style="font-family:'Comic Sans MS';font-size:15px;font-weight: 600;color: grey;padding:20px 0px;">Welcome Back , Proceed to Login Now</p>
                <asp:TextBox ID="username" placeholder="Enter Your username" runat="server" CssClass="inputs"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ErrorMessage="Enter Correct Username" ControlToValidate="username" ForeColor="Red"></asp:RequiredFieldValidator>
                
                <asp:TextBox ID="logpassword" type="password" placeholder="Enter Password" runat="server" CssClass="inputs"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Enter Correct Password" ControlToValidate="logpassword" ForeColor="Red"></asp:RequiredFieldValidator>
                 <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                
                <asp:Button ID="loginBtn" runat="server" Text="Login" style="background-color:limegreen;height:40px;border-radius: 50px;" OnClick="loginBtn_Click"/>
                <p style="font-family:'Times New Roman', Times, serif;">Create New Account?<a href="register.aspx" >Register Here</a></p>
            </form> 
        </div>
        <div class="formsImg">
            <img src="Assets/icons/Dashboardicon.png" alt="Rooms" style="width: 550px;">
        </div>
        
    </div>

   
</body>
</html>
