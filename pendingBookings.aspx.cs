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
    public partial class pendingBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if user is logged in and has a session available
                if (Session["Username"] != null)
                {
                    string userName = Session["Username"].ToString();
                    string userId = GetUserIdFromUserName(userName);
                    username.Text = "Hey " + userName + ", Your Pending Bookings.";


                    int roomID = Convert.ToInt32(Session["RoomID"]);
                    DataTable roomDetails = GetRoomDetails(roomID);


                    // Fetch pending bookings for the user
                    DataTable pendingBookings = GetPendingBookingsForUser(userId);

                    // Create a new DataTable with the same schema as the pendingBookings DataTable
                    DataTable lastItemTable = pendingBookings.Clone();

                    // Get the last row from the pendingBookings DataTable
                    DataRow lastRow = pendingBookings.Rows[pendingBookings.Rows.Count - 1];

                    // Add the last row to the new DataTable
                    lastItemTable.ImportRow(lastRow);

                    // Bind the new DataTable to the Repeater
                    RepeaterRooms.DataSource = roomDetails;
                    RepeaterRooms.DataBind();

                    RepeaterPendingBookings.DataSource = lastItemTable;
                    RepeaterPendingBookings.DataBind();
                }
                else
                {
                    // Handle case where user is not logged in
                    // Redirect to login page or display a message
                }



            }
        }




        private string GetUserIdFromUserName(string userName)
        {
            string userID = null; // Change the data type to string
            string connectionString = ConfigurationManager.ConnectionStrings["hotelRooms"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT Uid FROM tblUsers WHERE Username = @Username";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Username", userName);
                object result = command.ExecuteScalar();
                if (result != null)
                {
                    userID = result.ToString(); // Convert to string
                }
            }
            return userID;
        }


        private DataTable GetPendingBookingsForUser(string userId)
        {
            DataTable pendingBookingsTable = new DataTable();
            string connectionString = ConfigurationManager.ConnectionStrings["hotelRooms"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM pendingbookings WHERE UserID = @UserID";
                SqlCommand command = new SqlCommand(query, connection);

                // Ensure the parameter is added and its value is assigned
                command.Parameters.AddWithValue("@UserID", userId);

                // Execute the command and fetch data
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(pendingBookingsTable);
            }
            return pendingBookingsTable;
        }

        protected decimal CalculateTotalBill(object stayDays, object roomId, string connectionString)
        {
            int stayDaysValue = Convert.ToInt32(stayDays);
            int roomIdValue = Convert.ToInt32(roomId);

            // Fetch the cost from the Rooms table
            decimal cost = GetRoomCost(roomIdValue, connectionString);

            // Calculate total bill
            decimal totalBill = stayDaysValue * cost;

            // Return formatted total bill
            return totalBill; // Format as currency
        }

        private decimal GetRoomCost(int roomId, string connectionString)
        {
            decimal cost = 0;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT Cost FROM Rooms WHERE RoomID = @RoomID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@RoomID", roomId);
                object result = command.ExecuteScalar();
                if (result != null)
                {
                    cost = Convert.ToDecimal(result);
                }
            }

            return cost;
        }


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


        private void UpdateRoomBookingStatus(int roomId)
        {
            try
            {
                // Establish connection to the database
                string connectionString = ConfigurationManager.ConnectionStrings["hotelRooms"].ConnectionString;

                // Define the SQL UPDATE statement to update the booking status of the room
                string updateQuery = @"UPDATE Rooms
                               SET bookingstatus = 'Booked'
                               WHERE RoomID = @RoomID";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(updateQuery, connection);
                    command.Parameters.AddWithValue("@RoomID", roomId);

                    // Execute the SQL UPDATE statement
                    int rowsAffected = command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions (e.g., log the error, display an error message)
                // You can also redirect the user to an error page
                throw ex; // Rethrow the exception to be caught by the outer try-catch block
            }
        }


        protected void Pay_Click(object sender, EventArgs e)
        {

            try
            {
                // Get the room ID from the session or any other source
                int roomId = Convert.ToInt32(Session["RoomID"]);

                // Update the booking status of the room to 'booked'
                UpdateRoomBookingStatus(roomId);

                // Redirect the user to the booked status page or any other page
                Response.Redirect("bookedStatus.aspx");
            }
            catch (Exception ex)
            {
                // Handle any exceptions (e.g., log the error, display an error message)
                // You can also redirect the user to an error page
                Response.Write("Error: An error occurred while processing your request. Details: " + ex.Message);
            }

           

            try
            {
                // Get user ID from session
                string userId = Session["UserID"].ToString(); // Assuming you have stored the user ID in the session

                // Get room ID from session or any other source
                int roomId = Convert.ToInt32(Session["RoomID"]); // Assuming you have stored the room ID in the session

                // Get the values entered by the user
                string checkInDate = string.Empty;
                int stayDays = 0;
                string mobileNumber = string.Empty;

                checkInDate = (Session["CheckInDate"]).ToString();
                stayDays = Convert.ToInt32(Session["StayDays"]);
                mobileNumber = (Session["MobileNumber"]).ToString();

                // Establish connection to the database
                string connectionString = ConfigurationManager.ConnectionStrings["hotelRooms"].ConnectionString;

                // Fetch the last row from the "PendingBookings" table for the user
                string selectQuery = @"SELECT TOP 1 [checkInDate], stayDays, mobileNumber 
                               FROM pendingbookings 
                               WHERE UserID = @UserId 
                               ORDER BY bookingID DESC"; // Replace YourPrimaryKey with the primary key of the PendingBookings table

                DataTable pendingBookings = new DataTable();
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(selectQuery, connection);
                    command.Parameters.AddWithValue("@UserId", userId);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(pendingBookings);
                }

                

                // Calculate total bill
                decimal totalBill = CalculateTotalBill(stayDays, roomId, connectionString);

                // Insert data into the "UserDetails" table
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Define the SQL INSERT statement
                    string insertQuery = @"INSERT INTO userHistory (UserId, RoomId, CheckInDate, StayDays, MobileNumber, TotalBill)
                                   VALUES (@UserId, @RoomId, @CheckInDate, @StayDays, @MobileNumber, @TotalBill)";

                    // Create a SqlCommand object
                    SqlCommand command = new SqlCommand(insertQuery, connection);

                    // Set parameter values
                    command.Parameters.AddWithValue("@UserId", userId);
                    command.Parameters.AddWithValue("@RoomId", roomId);
                    command.Parameters.AddWithValue("@CheckInDate", checkInDate);
                    command.Parameters.AddWithValue("@StayDays", stayDays);
                    command.Parameters.AddWithValue("@MobileNumber", mobileNumber);
                    command.Parameters.AddWithValue("@TotalBill", totalBill);

                    // Execute the INSERT statement
                    int rowsAffected = command.ExecuteNonQuery();

                    Response.Redirect("bookedStatus.aspx");
                }
            }
            catch (Exception ex)
            {
                // Log the error
                string errorMessage = "An error occurred while processing your request. Details: " + ex.Message;
                // You can log the error to a file, database, or any other preferred logging mechanism

                // Display a user-friendly error message
                Response.Write("Error: " + errorMessage);
            }
        }

        
    }
}

