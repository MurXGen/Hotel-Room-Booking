using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace roomBooking
{
    public partial class RoomDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

              


                // Check if RoomID is provided in the query string
                if (!string.IsNullOrEmpty(Request.QueryString["RoomID"]))
                {
                    int roomID = Convert.ToInt32(Request.QueryString["RoomID"]);
                    // Fetch room details based on the RoomID
                    DataTable roomDetails = GetRoomDetails(roomID);
                    // Bind room details to the Repeater control
                    RepeaterRooms.DataSource = roomDetails;
                    RepeaterRooms.DataBind();
                    Session["RoomID"] = roomID;
                   

                }
                else
                {
                    // RoomID not provided in the query string, handle error or redirect
                    Response.Redirect("login.aspx");
                }

              

            }

            
        }

       


        // Method to fetch room details from the database based on roomID
        private DataTable GetRoomDetails(int roomID)
        {
            DataTable dtRoomDetails = new DataTable();
            // Connection string from web.config
            string connectionString = ConfigurationManager.ConnectionStrings["hotelRooms"].ConnectionString;
            // SQL query to retrieve room details by roomID
            string query = "SELECT RoomImg ,RoomName, Location, Type, Cost FROM Rooms WHERE RoomID = @RoomID";
           
            // Create connection and command objects
            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                // Add parameter for RoomID
                command.Parameters.AddWithValue("@RoomID", roomID);
                // Open connection and execute command
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dtRoomDetails);
            }
            return dtRoomDetails;
        }

        protected void Sub_Click(object sender, EventArgs e)
        {

            // Get the values entered by the user

            string checkInDate = Request.Form["checkInDate"];
            int stayDays = Convert.ToInt32(stayDaysText.Text);
                string mobileNumber = Mobile.Text;

            Session["CheckInDate"] = checkInDate;
            Session["StayDays"] = stayDays;
            Session["MobileNumber"] = mobileNumber;

            // Get the room ID from wherever it's available on the page
            int roomID = Convert.ToInt32(Session["RoomID"]); // Implement this method to retrieve the room ID

            // Get the user ID from the session
            string username = Session["Username"].ToString();
            
            string userID = GetUserIDByUsername(username);
            Session["UserID"] = userID;

            // Insert the details into the database table
            InsertBookingDetails(roomID, userID, checkInDate, stayDays, mobileNumber);
            Response.Redirect("pendingBookings.aspx");
        }

        // Method to fetch user ID based on username
        private string GetUserIDByUsername(string username)
        {
            string userID = null; // Change the data type to string
            string connectionString = ConfigurationManager.ConnectionStrings["hotelRooms"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT Uid FROM tblUsers WHERE Username = @Username";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Username", username);
                object result = command.ExecuteScalar();
                if (result != null)
                {
                    userID = result.ToString(); // Convert to string
                }
            }
            return userID;
        }


        private void InsertBookingDetails(int roomID, string userID, string checkInDate, int stayDays, string mobileNumber)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["hotelRooms"].ConnectionString;
            string query = @"INSERT INTO pendingbookings (RoomID, UserID, checkInDate, stayDays, mobileNumber) VALUES (@RoomID, @UserID, @CheckInDate, @StayDays, @MobileNumber)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@RoomID", roomID);
                    command.Parameters.AddWithValue("@UserID", userID);
                    command.Parameters.AddWithValue("@CheckInDate", checkInDate);
                    command.Parameters.AddWithValue("@StayDays", stayDays);
                    command.Parameters.AddWithValue("@MobileNumber", mobileNumber);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
        










    }
}
