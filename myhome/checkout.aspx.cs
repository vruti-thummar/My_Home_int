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
          ON p.Product_Id = c.prod_id
          WHERE c.userid = @uid", con);

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

            lblSubTotal.Text = "₹" + subtotal.ToString("N2");
            lblDelivery.Text = "₹0.00";
            lblTotalAmount.Text = "₹" + subtotal.ToString("N2");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("confirmation.aspx");
        }
    }
}