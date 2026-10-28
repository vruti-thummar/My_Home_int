using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace myhome.admin
{
    public partial class adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();

            if (username == "admin" && password == "admin123")
            {
                Session["admin_id"] = "1";
                Session["admin_name"] = "Admin";

                Response.Redirect("mange_order.aspx");
            }
            else
            {
                lblError.Text = "Invalid username or password!";
            }
        }
    }
}