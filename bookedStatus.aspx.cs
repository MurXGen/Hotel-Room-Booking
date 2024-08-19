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
    public partial class bookedStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

               


                if (Session["UserID"] != null)
                {
                    string userId = Session["UserID"].ToString();

                    // Fetch user history data including room details
                    DataTable userHistoryData = GetUserHistoryData(userId);

                    // Bind the fetched data to the Repeater control
                    RepeaterRooms.DataSource = userHistoryData;
                    RepeaterRooms.DataBind();
                }
                else
                {
                    // Handle case where user is not logged in
                    // Redirect to login page or display a message
                }
            }
        }

        private DataTable GetUserHistoryData(string userId)
        {
            DataTable userHistoryData = new DataTable();

            try
            {
                // Establish connection to the database
                string connectionString = ConfigurationManager.ConnectionStrings["hotelRooms"].ConnectionString;

                // Define the SQL SELECT statement with JOIN to fetch user history data including room details
                string selectQuery = @"
            SELECT uh.BookingId, uh.UserId, uh.RoomId, uh.CheckInDate, uh.StayDays, uh.MobileNumber, uh.TotalBill,
                   r.RoomImg, r.RoomName, r.Location, r.Type, r.Cost
            FROM userHistory uh
            INNER JOIN Rooms r ON uh.RoomId = r.RoomId
            WHERE uh.UserId = @UserId";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand(selectQuery, connection);
                    command.Parameters.AddWithValue("@UserId", userId);

                    // Execute the SQL query and fill the DataTable with the result
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(userHistoryData);
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions (e.g., log the error, display an error message)
                // You can also redirect the user to an error page
            }

            return userHistoryData;
        }


    }
}