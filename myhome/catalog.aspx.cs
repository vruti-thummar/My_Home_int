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

            da = new SqlDataAdapter("select * from Product_tbl", con);

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
    }
    
}