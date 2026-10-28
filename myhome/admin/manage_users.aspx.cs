using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myhome.admin
{
    public partial class manage_users : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataTable dt;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_id"] == null)
            {
                Response.Redirect("adminlogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                FillUsersGrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void FillUsersGrid()
        {
            getcon();

            string query = "SELECT Id, Firstname, Email FROM user1_tbl ORDER BY Id DESC";
            da = new SqlDataAdapter(query, con);
            dt = new DataTable();
            da.Fill(dt);

            gvUsers.DataSource = dt;
            gvUsers.DataBind();

            lblUserCount.Text = dt.Rows.Count.ToString();

            con.Close();
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userId = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

            getcon();
            cmd = new SqlCommand("DELETE FROM user1_tbl WHERE Id = @id", con);
            cmd.Parameters.AddWithValue("@id", userId);
            cmd.ExecuteNonQuery();
            con.Close();

            FillUsersGrid();
        }

        protected void gvUsers_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}