using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace myhome
{
    public partial class catalog : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings
            ["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (!IsPostBack)
            {
                

                filldatalist();

            }
            getcon();
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }


        

        void filldatalist()
        {
            getcon();
            if (Request.QueryString["cid"] != null)
            {
                int id = Convert.ToInt32(Request.QueryString["cid"]);

                da = new SqlDataAdapter(
                    "select * from Product_tbl where Category_Id=" + id, con);
            }
            else
            {
                da = new SqlDataAdapter(
                    "select * from Product_tbl", con);
            }

            ds = new DataSet();
            da.Fill(ds);

            DataList1.DataSource = ds;
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
                int id = Convert.ToInt32(e.CommandArgument);

                ViewState["cid"] = id;

                Response.Redirect("catalog.aspx?cid=" + ViewState["cid"]);
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
Response.Redirect("viewdetails.aspx");

        }
    }
}
    
