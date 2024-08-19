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
    public partial class DashboardUser : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["hotelRooms"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {

            }
            else
            {
                Response.Redirect("/login.aspx");
            }

            /*if (!IsPostBack)
            {
                // Bind data to Repeater
                ShowRooms();
            }*/
        }

       /* private void ShowRooms()
        {
            // Retrieve data from database
            string query = "SELECT RoomImg, RoomName, Location, Type, Cost, BookingStatus FROM Rooms";
            SqlDataAdapter adapter = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            // Bind data to Repeater
            RepeaterRooms.DataSource = dt;
            RepeaterRooms.DataBind();
        }*/
        protected void btnShowRooms_Click(object sender, EventArgs e)
        {
            string selectedCity = DropDownListCity.SelectedValue;

            // Query the database to retrieve rooms based on the selected city
            string query = "SELECT * FROM Rooms WHERE Location = @Location";

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["hotelRooms"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Location", selectedCity);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    RepeaterRooms.DataSource = reader;
                    RepeaterRooms.DataBind();
                }
            }
        }



    }
}