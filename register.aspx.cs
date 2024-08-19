using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace roomBooking
{ 

    public partial class register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=LAPTOP-U0ANOJDB\SQLEXPRESS08;Initial Catalog=hotelRooms;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SubmitBtn_Click(object sender, EventArgs e)
        {

            if (isformvalid())
            {
                using (SqlConnection con= new SqlConnection(ConfigurationManager.ConnectionStrings["hotelRooms"].ConnectionString));
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Insert into tblUsers Values('" + username.Text + "','" + email.Text + "','" + password.Text + "')", con);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Registration sucessfull')</script>");
                    clr();
                    con.Close();
                    
                }
                Response.Redirect("~/login.aspx");
            }
            else
            {
                /*Response.Write("<script>alert('Registration unsucessfull')</script>");*/
            }
        }

        private bool isformvalid()
        {
            if (username.Text == "")
            {
                Response.Write("<script>alert('UserID Not Valid')</script>");
                username.Focus();
                return false;
                
            }
            else if (password.Text == "")
            {
                Response.Write("<script>alert('Password Invalid')</script>");
                password.Focus();
                return false;
                
            }
            else if(password.Text != cpassword.Text){
                Response.Write("<script>alert('Confirm Password Invalid')</script>");
                cpassword.Focus();
                return false;
            }
            else if (email.Text=="")
            {
                Response.Write("<script>alert('Email Invalid')</script>");
                email.Focus();
                return false;
            }
            return true;
        }


        // clr() is used to clear the data from the form after submission
        private void clr()
        {
            username.Text = String.Empty;
            email.Text = String.Empty;
            password.Text = String.Empty;
            cpassword.Text = String.Empty;
        }
    }
    
}