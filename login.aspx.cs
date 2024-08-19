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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["hotelRooms"].ConnectionString);
            
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblUsers where Username=@username and Password=@logpassword", con);
                cmd.Parameters.AddWithValue("@username", username.Text);
                cmd.Parameters.AddWithValue("@logpassword", logpassword.Text);
            SqlDataAdapter sdp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sdp.Fill(dt);
            if (dt.Rows.Count!=0)
            {
                
                Session["Username"] = username.Text;
                Response.Redirect("DashboardUser.aspx");
            }
            else
            {
                lblErrorMessage.Text = "Please fill in all required fields.";
                lblErrorMessage.Visible = true;
            }   
                clr();
                con.Close();
        }

        private void clr()
        {
            logpassword.Text = String.Empty;
            username.Text = String.Empty;
            username.Focus();
        }
    }
}