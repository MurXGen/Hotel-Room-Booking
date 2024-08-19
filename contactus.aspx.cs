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
    public partial class contactus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            try
            {
                string name = NameTextBox.Text;
                string email = EmailTextBox.Text;
                string message = MessageTextBox.Text;

                string connectionString = ConfigurationManager.ConnectionStrings["hotelRooms"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string insertQuery = "INSERT INTO customerfeed (Name, Email, Message) VALUES (@Name, @Email, @Message)";
                    SqlCommand command = new SqlCommand(insertQuery, connection);
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Message", message);
                    command.ExecuteNonQuery();
                }

                // Optionally, you can redirect the user to a thank you page or display a success message.
                Response.Redirect("DashboardUser.aspx");
            }
            catch (Exception ex)
            {
                // Handle any exceptions
                Response.Write("An error occurred: " + ex.Message);
            }
        }
    }
}