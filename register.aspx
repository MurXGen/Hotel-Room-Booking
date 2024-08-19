<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs"  EnableViewState="false" Inherits="roomBooking.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>roomMilega</title>
    <link rel="stylesheet" href="/Assets/css/registration.css">
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
                <li>Home</li>
                <li>About us</li>
                <li>Contact us</li>
                <li><img src="Assets/icons/profile.jpg" alt="profile" srcset="" width="40px"
                        style="border-radius: 50%; box-shadow: 3px 6px 10px rgb(230 230 230)"></li>
            </ul>
        </div>
    </header>


    <div class="registraion">
        <div class="forms">
            
            <h2 style="font-size: 50px;font-family: 'Trebuchet MS';margin-bottom: -5px;">roomMilega</h2>
            <span style="font-size: 10px;font-family:'Lucida Sans';">Search rooms loved by many</span>
            <p style="font-family:'Comic Sans MS';font-size:15px;font-weight: 600;color: grey;padding:20px 0px;">Register Karo , Room Milega</p>
            <form runat="server" enableviewstate="false">
                <asp:TextBox ID="username" placeholder="Create Username" runat="server" CssClass="inputs" style="grid-column-start: 1;
  grid-column-end: 3;"></asp:TextBox>
                <asp:TextBox ID="email" placeholder="Enter Your Email" runat="server" CssClass="inputs"></asp:TextBox>
                <asp:TextBox ID="password" type="password" placeholder="Create Password" runat="server" CssClass="inputs"></asp:TextBox>
                <asp:TextBox ID="cpassword" type="password" placeholder="Confirm Password" runat="server" CssClass="inputs" ></asp:TextBox>
                <asp:Button ID="SubmitBtn" runat="server" Text="Submit" OnClick="SubmitBtn_Click" style="background-color: darkred;color: white;border-radius:50px;"/>
                <p style="font-family:'Times New Roman', Times, serif;">Already have account?<a href="login.aspx"> Login</a></p>
            </form> 
        </div>
        <div class="formsImg">
            <img src="Assets/icons/Dashboardicon.png" alt="Rooms" style="width: 550px;">
        </div>
        
    </div>

   
</body>
</html>
