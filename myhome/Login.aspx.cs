using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace myhome
{

    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {


            getcon();

        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            txtEmail.Text = "";
            txtPassword.Text = "";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            if (btnLogin.Text == "Sign in")
            {
                getcon();
                cmd = new SqlCommand("INSERT into home_tbl(Email,Password)values('" + txtEmail.Text + "','" + txtPassword.Text + "')", con);
                cmd.ExecuteNonQuery();
                clear();
            }

            if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password))
            {
                lblShowEmail.Text = "Welcome, " + email;
            }
            else
            {
                lblShowEmail.Text = "Please enter your email and password!";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Btnregister_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
    }
}