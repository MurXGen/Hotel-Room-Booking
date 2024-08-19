<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="roomBooking.aboutus1" %>

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

.section1 .content1 form{
    display: grid;
    grid-template-columns: 50% 50%;
    gap: 10px;
}

.section1 .content1 form input{
   border: 1px solid black;
   border-radius: 5px;
   height: 30px;
   padding: 10px;
}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Main Content -->

    <div class="section1">
        <div class="content1">
            <h2>About Us</h2>
            <p>
                "RoomMilega is not only a company but a solution to people who are in need of room facility with quality
                service. Our mission at RoomMilega is to revolutionize the way individuals find and book hotel
                accommodations. With a commitment to excellence and customer satisfaction, we strive to provide a seamless
                booking experience that meets the diverse needs of travelers worldwide.
                </p>

                <p>
                    At RoomMilega, we understand that finding the perfect accommodation can be a daunting task. That's why we've
                    curated a comprehensive database of hotels, guesthouses, and other lodging options, ensuring that our users
                    have access to a wide range of choices at their fingertips. Whether you're planning a business trip, a
                    family vacation, or a weekend getaway, RoomMilega has you covered.
                </p>
                <p>
                    What sets RoomMilega apart is our dedication to quality service. We work closely with our partner
                    establishments to ensure that every guest enjoys a comfortable stay and receives personalized attention.
                    From clean and well-appointed rooms to friendly and attentive staff, we go above and beyond to exceed our
                    customers' expectations.
                </p>
                
                <p>
                    With RoomMilega, booking your next hotel room is simple, convenient, and stress-free. Join us in our mission
                    to redefine the hospitality industry and make traveling a truly unforgettable experience for everyone."
                </p>
        </div>
        <div class="content2">
            <img src="https://cache.marriott.com/marriottassets/marriott/LASJW/lasjw-guestroom-0111-hor-clsc.jpg?interpolation=progressive-bilinear&" alt="aboutus">
        </div>
       
    </div>

    <!-- Main content ends -->
</asp:Content>
