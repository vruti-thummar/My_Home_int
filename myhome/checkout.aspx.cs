using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace myhome
{
    public partial class checkout : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string fnm;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings
            ["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                fillcartgrid();
                getcon();

                cmd = new SqlCommand(
                    "SELECT * FROM user1_tbl WHERE Id = @uid", con);

                cmd.Parameters.AddWithValue("@uid", Session["uid"]);

                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    lblCustomerName.Text =
                        ds.Tables[0].Rows[0]["Firstname"].ToString();

                    lblCustomerEmail.Text =
                        ds.Tables[0].Rows[0]["Email"].ToString();

                }
                else
                {
                    lblCustomerName.Text = "Customer not found";
                    lblCustomerEmail.Text = "-";
                }

                con.Close();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void fillcartgrid()
        {
            con = new SqlConnection(s);

            cmd = new SqlCommand(
                @"SELECT p.Product_Image, p.Product_Name, p.Price,
                 c.quantity AS Quantity,
                 c.total AS Line_Total
          FROM Product_tbl p
          INNER JOIN Cart_tbl c
          ON p.Product_Id = c.Cart_prod_Id
          WHERE c.Cart_User_Id = @uid", con);

            cmd.Parameters.AddWithValue("@uid", Session["uid"]);

            da = new SqlDataAdapter(cmd);
            ds = new DataSet();

            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            decimal subtotal = 0;

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if (row["Line_Total"] != DBNull.Value)
                {
                    subtotal += Convert.ToDecimal(row["Line_Total"]);
                }
            }

            lblSubTotal.Text = "₹" + subtotal.ToString("0.00");
            decimal delivery = 200;
            lblDelivery.Text = "₹" + delivery.ToString("0.00");
            decimal total = subtotal + delivery;
            lblTotalAmount.Text = "₹" + total.ToString("0.00");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["CustMobile"] = TextBox1.Text.Trim();
            Session["CustAddress"] = TextBox2.Text.Trim();

            if (DropDownList1.SelectedItem != null)
            {
                Session["CustPayment"] = DropDownList1.SelectedItem.Text;
            }

            Response.Redirect("confirmation.aspx");
        }        

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}