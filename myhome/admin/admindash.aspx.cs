using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace myhome.admin
{
    public partial class admindash : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                fillstats();
                fillrecentorders();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillstats()
        {
            getcon();

            cmd = new SqlCommand("select count(*) from order_tbl", con);
            lblTotalOrders.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("select count(*) from order_tbl where cast(order_Date as date) = cast(getdate() as date)", con);
            lblTodayOrders.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("select count(*) from user1_tbl", con);
            lblTotalUsers.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("select count(*) from order_tbl where order_payment_status='Pending'", con);
            lblPendingOrders.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("select isnull(sum(order_total_amount), 0) from order_tbl where order_payment_status='Paid' or order_payment_status='Completed'", con);
            decimal revenue = Convert.ToDecimal(cmd.ExecuteScalar());
            lblTotalRevenue.Text = "₹ " + revenue;

            cmd = new SqlCommand("select count(*) from Product_tbl", con);
            lblTotalProducts.Text = cmd.ExecuteScalar().ToString();

            con.Close();
        }

        void fillrecentorders()
        {
            getcon();

            da = new SqlDataAdapter(
                "select top 5 o.Order_id, u.Firstname as User_Name, o.order_Date, o.order_total_amount, o.order_payment_method, o.order_payment_status " +
                "from order_tbl o inner join user1_tbl u on o.order_user_id = u.Id " +
                "order by o.order_id desc", con);

            ds = new DataSet();
            da.Fill(ds);

            gvRecentOrders.DataSource = ds;
            gvRecentOrders.DataBind();

            con.Close();
        }
    }
}