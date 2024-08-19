﻿<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="bookedStatus.aspx.cs" Inherits="roomBooking.bookedStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
<style>
           .roomContainer{
    display: flex;
    justify-content: center;
    align-items: center;
    align-content: center;
    flex-direction: row;
    flex-wrap:wrap;
    margin: 20px 0;

}

.roomContainer .room{
    margin: 20px;
    padding: 20px;
    min-width: 250px;
    max-width: 250px;
    min-height: max-content;
    max-height: max-content;
    border-radius: 5px;
    border: 1px solid grey;
    display: flex;
    flex-direction: column;
}

.roomContainer .room .roomImg img{
    width: 250px;
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

.prUser{
    background-color: aliceblue;
    border: 1px solid black;
    border-radius: 5px;
    padding:20px;
}

.roomContainer .room p span{
    display:block;
    padding:10px;
    background-color: lightblue;
    font-family:'DM sans';
    margin: 10px 0;
    border-radius: 5px;
    border: 1px solid grey;
}

.prContainer{
    display: grid;
    grid-template-columns: auto;
    justify-content:center;
    gap: 20px;
    justify-items:center;
}

</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <div class="prUser">
       <asp:Label ID="username" runat="server" Text="Your History" style="font-family:'DM sans';text-align:center;font-size: 30px;"></asp:Label>
       </div>
       <div class="prContainer">
        
       <div class="roomContainer">

        <asp:Repeater ID="RepeaterRooms" runat="server">
            <ItemTemplate>
                <div class="room">
                    <div class="roomImg">
                        <img src='<%# Eval("RoomImg") %>' alt="" srcset="" />
                    </div>
                    <div class="roomContent">
                        <p class="name">
                            <%# Eval("RoomName") %>
                        </p>
                        <span class="location">
                            <%# Eval("Location") %>
                        </span>
                        <span class="type">
                            <%# Eval("Type") %>
                        </span>
                        <p class="cost" style="font-size: 15px;">$<%# Eval("Cost") %>/day</p>
                    </div>
                    <p>Check-In Date: <span>
                            <%# Eval("CheckInDate") %>
                        </span></p>
                    <p>Stay Days: <span>
                            <%# Eval("StayDays") %>
                        </span></p>
                    <p>Mobile Number: <span>
                            <%# Eval("MobileNumber") %>
                        </span></p>
                    <p>Total Bill: <span>
                            <%# Eval("TotalBill") %>
                        </span></p>
                    <p class="payStatus" style="padding:10px;margin:10px;border:1px solid black;font-family: 'DM sans';text-align:center;">!! Your Payment is SuccessFull !!</p>
                </div>
    </div>
    </ItemTemplate>
    </asp:Repeater>
</div>
</asp:Content>
