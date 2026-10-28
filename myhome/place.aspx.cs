using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace myhome
{
    public partial class place : System.Web.UI.Page
    {
        SqlConnection con;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // ૧. જો URL માં ?order_id= મોકલેલ હોય
                if (Request.QueryString["order_id"] != null)
                {
                    string orderId = Request.QueryString["order_id"].ToString();
                    LoadOrderDetails(orderId);
                }
                // ૨. અથવા Session માં સેવ કરેલ હોય
                else if (Session["last_order_id"] != null)
                {
                    string orderId = Session["last_order_id"].ToString();
                    LoadOrderDetails(orderId);
                }
            }
        }

        void LoadOrderDetails(string orderId)
        {
            con = new SqlConnection(s);
            con.Open();

            string query = "SELECT TOP 1 Order_Id, Total, order_payment_method FROM order_tbl WHERE Order_Id = @id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", orderId);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblOrderId.Text = dr["Order_Id"].ToString();
                lblTotal.Text = dr["Total"].ToString();
                lblPayMethod.Text = dr["order_payment_method"].ToString();
            }
            dr.Close();
            con.Close();
        }
    }
}