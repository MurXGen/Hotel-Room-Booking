<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="RoomDetails.aspx.cs" Inherits="roomBooking.RoomDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
         .roomContainer{
    display: flex;
    justify-content: center;
    align-items: center;
    align-content: center;
    flex-direction: row;
    flex-wrap:nowrap;
    margin: 20px 0;
    

}

.roomContainer .room{
    margin: 20px;
    padding: 20px;
    min-width: 300px;
    max-width: 300px;
    min-height: max-content;
    max-height: max-content;
    border-radius: 5px;
    border: 1px solid grey;
    display: flex;
    flex-direction: column;
}

.roomContainer .room .roomImg img{
    width: 300px;
    border-radius: 5px;
    box-shadow: 3px 3px 10px whitesmoke;
}

.roomContainer .room .roomContent{
    font-family: 'DM sans';
    line-height: 20px;
}

.roomContainer .room .roomContent .status{
    background-color: beige;
    padding:10px;
    border-radius: 5px;
    
}

.roomContainer .room .roomContent a{
    height: 40px;
    padding: 10px;
    border: 1px solid black;
    margin: 10px 0;
    text-decoration: none;
    font-family: "DM sans";
    font-size: 15px;
    background-color: darkslategrey;
    border-radius: 5px;
    width: 100%;
    color: aliceblue;
}

.roomContainer .room .roomContent > .type{
    padding: 6px;
    background-color: rgb(209, 255, 244);
    font-size: 10px;
    border-radius: 4px;
    /* margin: 25px 0; */
    font-family: 'DM Sans';
    border: 1px solid black;
}

.roomContainer .room .roomContent >.location{
    padding: 6px;
    background-color: rgb(255, 242, 224);
    font-size: 10px;
    border-radius: 4px;
    /* margin: 25px 0; */
    font-family: 'DM Sans';
    border: 1px solid black;
    
}

.roomContainer .room .roomContent label{
    display:block;
    background-color: azure;
    padding:5px;
    height: 30px;
}

.detailInput{
    display: grid;
    grid-template-columns: auto auto;
    align-items: center;
    align-content: center;

}

.roomContainer .detailInput .input{
    padding: 10px;
    border-radius: 5px;
    margin: 10px 0;
    height: 30px;
}

.roomContainer .detailInput .label{
    background-color: azure;
    padding:5px;
    height: 30px;
}
    </style>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="roomContainer">
    
        <asp:Repeater ID="RepeaterRooms" runat="server">
            <ItemTemplate>
                <div class="room">
                    <div class="roomImg">
                        <img src='<%# Eval("RoomImg") %>' alt="" srcset="" />
                    </div>
                    <div class="roomContent">
                        <p class="name"><%# Eval("RoomName") %></p>
                        <span class="location"><%# Eval("Location") %></span>
                        <span class="type"><%# Eval("Type") %></span>
                        <p class="cost" style="font-size: 15px;">$<%# Eval("Cost") %>/day</p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

       <div class="detailInput">
           <label for="checkin" class="label">Select Check-In</label>
        <input type="date" id="checkInDate" name="checkInDate" min="<%= DateTime.Now.ToString("yyyy-MM-dd") %>" class="input"/>
                        

                        <asp:Label ID="stayDaysLabel" runat="server" Text="No. of days" CssClass="label"></asp:Label>
                        <asp:TextBox ID="stayDaysText" runat="server" CssClass="input"></asp:TextBox>
                        
                        <br />
                        <asp:RangeValidator ID="stayDaysValidate" runat="server" ControlToValidate="stayDaysText" ErrorMessage="Please enter a days between 1 and 10" Type="Integer" MinimumValue="1" MaximumValue="10"></asp:RangeValidator>
                        

                         <asp:Label ID="mobileLabel" runat="server" Text="Enter Your Mobile Number :" CssClass="label"></asp:Label>
                        <asp:TextBox ID="Mobile" runat="server" CssClass="input"></asp:TextBox>
                       
                        <br />
                        <asp:RegularExpressionValidator ID="mobileValidation" runat="server" ControlToValidate="Mobile" ErrorMessage="Please enter a 10-digit mobile number" ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                        <br />                        

                       <asp:Button ID="Sub" runat="server" Text="Submit" OnClick="Sub_Click" style="background-color:palegoldenrod;border:1px solid black;padding: 10px;"/>

       

       </div></div>



  




</asp:Content>

