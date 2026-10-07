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
    public partial class viewdetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                fillproduct();

            }

        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void fillproduct()
        {
            getcon();
            da = new SqlDataAdapter(
                "select * from Product_tbl where Product_Id=" +
                Request.QueryString["pid"], con);

            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            {
                if (e.CommandName == "AddToCart")
                {
                    int prid = Convert.ToInt32(e.CommandArgument);

                    getcon();

                    cmd = new SqlCommand(
                        "insert into Cart_tbl(Cart_Prod_Id,Cart_User_Id,Quantity,Total,Added_Date) " +
                        "select Product_Id," + Session["uid"] + ",1,Price,GETDATE() " +
                        "from Product_tbl where Product_Id=" + prid, con);

                    cmd.ExecuteNonQuery();

                    con.Close();

                    Response.Redirect("cart.aspx");
                }
            }
        }
    }
}