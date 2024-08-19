<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="DashboardUser.aspx.cs" Inherits="roomBooking.DashboardUser" %>
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

.selections{
    padding: 20px;
    margin: 20px 0;
    border-radius: 5px;
    border: 1px solid black;
}

.selections .inputs{
    padding: 10px;
    border-radius: 3px;
    margin: 10px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <div class="selections">
    <asp:DropDownList ID="DropDownListCity" runat="server" CssClass="inputs">
        <asp:ListItem Text="Select City" Value="" />
        <asp:ListItem Text="Mumbai" Value="Mumbai" />
        <asp:ListItem Text="Navi Mumbai" Value="Navi Mumbai" />
        <asp:ListItem Text="Pune" Value="Pune" />
        <asp:ListItem Text="Satara" Value="Satara" />
        <asp:ListItem Text="Delhi" Value="Delhi" />
    </asp:DropDownList>
    <asp:Button ID="btnShowRooms" runat="server" Text="Show Rooms" class="inputs" style="width: 100px; background-color: antiquewhite;" OnClick="btnShowRooms_Click" />
</div>




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
                        <p class="status">Booking Status: <%# Eval("BookingStatus") %></p>
                        <a href='<%# "RoomDetails.aspx?RoomID=" + Eval("RoomID") %>'>View Details</a>

                    </div>
</div>
            </ItemTemplate>
        </asp:Repeater>
    </div>





    </asp:Content>

        
    

   

