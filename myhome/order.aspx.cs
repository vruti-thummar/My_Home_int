using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace myhome
{
    public partial class order : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                fillorderdetails();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillorderdetails()
        {
            getcon();

            da = new SqlDataAdapter(
                "select top 1 o.order_id, o.order_Date, o.order_total_amount, o.order_payment_status, u.Firstname " +
                "from Order_tbl o inner join user1_tbl u on o.order_user_id = u.Id " +
                "where o.order_user_id = " + Session["uid"] + " " +
                "order by o.order_id desc", con);

            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblOrderNo.Text = ds.Tables[0].Rows[0]["order_id"].ToString();
                lblOrderDate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["order_Date"]).ToString("dd MMM yyyy, hh:mm tt");
                lblCustomerName.Text = ds.Tables[0].Rows[0]["Firstname"].ToString();
                lblTotalAmount.Text = ds.Tables[0].Rows[0]["order_total_amount"].ToString();
                lblOrderStatus.Text = ds.Tables[0].Rows[0]["order_payment_status"].ToString();
            }

            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("catalog.aspx");
        }
    }
}