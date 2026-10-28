using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myhome
{
    public partial class confirmation : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string fnm;
        SqlDataAdapter da;
        DataSet ds;

        string orderstatus;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                getcon();
                lblOrderNo.Text = "ORD" + DateTime.Now.ToString("yyyyMMddHHmmss");
                lblOrderDate.Text = DateTime.Now.ToString("dd-MMM-yyyy hh:mm tt");

                if (Session["CustMobile"] != null)
                {
                    lblCustomerMobile.Text = Session["CustMobile"].ToString();
                }

                if (Session["CustAddress"] != null)
                {
                    lblCustomerAddress.Text = Session["CustAddress"].ToString();
                }

                if (Session["CustPayment"] != null)
                {
                    lblPaymentMethod.Text = Session["CustPayment"].ToString();
                }

                LoadUserData();
                LoadCartData();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void LoadUserData()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Firstname, Email FROM user_tbl WHERE Id = @uid", con))
                {
                    cmd.Parameters.AddWithValue("@uid", Session["uid"]);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            lblCustomerName.Text = dt.Rows[0]["Firstname"].ToString();
                            lblCustomerEmail.Text = dt.Rows[0]["Email"].ToString();
                        }
                    }
                }
            }
        }

        void LoadCartData()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                string query = @"SELECT p.Product_Image, p.Product_Name, p.Price,
                                        c.quantity AS Quantity,
                                        c.total AS Line_Total
                                 FROM Product_tbl p
                                 INNER JOIN Cart_tbl c ON p.Product_Id = c.Cart_prod_Id
                                 WHERE c.Cart_User_Id = @uid";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@uid", Session["uid"]);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                        decimal subtotal = 0;
                        if (dt.Rows.Count > 0)
                        {
                            foreach (DataRow row in dt.Rows)
                            {
                                if (row["Line_Total"] != DBNull.Value)
                                {
                                    subtotal += Convert.ToDecimal(row["Line_Total"]);
                                }
                            }
                        }

                        decimal delivery = 200;
                        decimal total = subtotal + delivery;

                        lblSubTotal.Text = subtotal.ToString("0.00");
                        lblDelivery.Text = delivery.ToString("0.00");
                        lblTotalAmount.Text = total.ToString("0.00");
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            string orderstatus = "Pending";

            int uid = Convert.ToInt32(Session["uid"]);

            decimal totalAmount = 0;
            decimal.TryParse(lblSubTotal.Text.Replace("₹", "").Trim(), out totalAmount);
            decimal subtotal = 0;
            cmd = new SqlCommand("insert into order_tbl (order_user_id,order_Date,order_total_amount,order_payment_method,order_payment_status) values ('" + uid + "',getdate(),'" + lblSubTotal.Text + "','" + lblPaymentMethod.Text + "','" + orderstatus + "')", con);
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Order Placed Successfully');window.location='place.aspx';</script>");
        }
    }
    }
