using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace myhome
{
    public partial class catalog : System.Web.UI.Page
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
                filldatalist();
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }



        void filldatalist()
        {
            getcon();

            if (Request.QueryString["cat"] != null)
            {
                string cat = Request.QueryString["cat"];

                da = new SqlDataAdapter(
                    "select * from Product_tbl where Category_Id=" + cat, con);
            }
            else
            {
                da = new SqlDataAdapter(
                    "select * from Product_tbl", con);
            }

            ds = new DataSet();
            da.Fill(ds);

            DataList1.DataSource = ds.Tables[0];
            DataList1.DataBind();
        }
        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void rptProducts_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {

        }

        protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList2_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {


        }

        protected void DataList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_cid")
            {
                string cat = e.CommandArgument.ToString();

                Response.Redirect("catalog.aspx?cat=" + cat);
            }

            if (e.CommandName == "AddToCart")
            {
                int prid = Convert.ToInt32(e.CommandArgument);

                getcon();

                cmd = new SqlCommand(
                    "insert into Cart_tbl(Cart_Prod_Id,Cart_User_Id,Quantity,Total,Added_Date) " +
                    "select Product_Id," + Session["uid"] + ",1,Price,GETDATE() " +
                    "from Product_tbl where Product_Id=" + prid, con);

                cmd.ExecuteNonQuery();

                Response.Redirect("cart.aspx");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewdetails.aspx");
        }
        protected void DataList1_SelectedIndexChanged2(object sender, EventArgs e)
        {

        }
    }
}

