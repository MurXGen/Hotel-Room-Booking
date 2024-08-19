<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="roomBooking.contactus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style>


    .section1{
    display: grid;
    grid-template-columns: 40% 60%;
    justify-content: center;
    align-content: center;
    align-items: center;
    margin: 20px 0;
    border-radius: 5px;
    border: 1px solid black;
    }

.section1 .content1{
    padding: 40px;
    font-family: 'DM sans';
}

.section1 .content1 p{
    line-height: 25px;
}

.section1 .content2{
    text-align: center;
    overflow: hidden;
    
}

.section1 .content2 img{
    max-width: 900px;
    min-width: 100px;
    max-height: 500px;
    border-radius:  20px 10px 50px 10px;
    box-shadow: 3px 3px 10px rgb(210, 210, 210);
    padding: 10px;
}

.section1 .content1{
    display: grid;
    grid-template-columns:;
    gap: 10px;
}

.section1 .content1 .input{
   border: 1px solid black;
   border-radius: 5px;
   height: 30px;
   padding: 10px;
}
       </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="section1">
    <div class="content1">
        <h2>Contact Us</h2>
        <p style="padding: 0 0 20px 0;">We love to hear your Feedback.</p>
        <asp:TextBox ID="NameTextBox" runat="server" CssClass="input" placeholder="Enter Name"></asp:TextBox>
        <asp:TextBox ID="EmailTextBox" runat="server" CssClass="input" placeholder="Enter Email"></asp:TextBox>
        <asp:TextBox ID="MessageTextBox" runat="server" CssClass="input" placeholder="Message..." TextMode="MultiLine" Rows="3" style="height: 60px; line-height: 25px;"></asp:TextBox>
        <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" CssClass="submitButton" style="border-radius: 40px;background-color: antiquewhite;min-height:50px;max-height: max-content;"/>
    </div>
    <div class="content2">
        <img src="Assets/icons/contactus.png" alt="aboutus" />
    </div>
</div>

</asp:Content>

