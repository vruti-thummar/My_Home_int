using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace myhome
{
    public partial class cart : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings
            ["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            ViewState["uid"] = Session["uid"];

            getcon();

            if (!IsPostBack)
            {
                fillcartgrid();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillcartgrid()
        {
            getcon();

            da = new SqlDataAdapter(
                "select c.Cart_Id,c.Cart_Prod_Id,p.Product_Image,p.Product_Name,p.Price,c.Quantity,c.Total,c.Added_Date " +
                "from Product_tbl p INNER JOIN Cart_tbl c " +
                "on p.Product_Id=c.Cart_Prod_Id " +
                "where c.Cart_User_Id=" + Session["uid"], con);

            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            decimal total = 0;
            foreach(DataRow dr in ds.Tables[0].Rows)
            {
                decimal price = Convert.ToDecimal(dr["Total"]);
                int Quntity = Convert.ToInt16(dr["Quantity"]);
                total += price * Quntity;
            }
            lblTotal.Text = " Amount is ₹: " + total;
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            fillcartgrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int cartId = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Value);
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];

            DropDownList drpqnt = (DropDownList)row.FindControl("drpqnt");
            int qty = int.Parse(drpqnt.SelectedValue);

            getcon();
            cmd = new SqlCommand(
                "update Cart_tbl set Quantity=" + qty +
                " where Cart_Id=" + cartId +
                " AND Cart_User_Id=" + ViewState["uid"], con);
            cmd.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            fillcartgrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            fillcartgrid();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_rmv")
                {
                int cartId = Convert.ToInt16(e.CommandArgument);
                getcon();
                cmd = new SqlCommand("delete from Cart_tbl where Cart_Id=" + cartId +" AND Cart_User_Id=" + ViewState["uid"], con);
                cmd.ExecuteNonQuery();
                fillcartgrid();
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}