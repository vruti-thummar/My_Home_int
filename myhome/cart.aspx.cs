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
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            fillcartgrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int prid = Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Value);
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];

            DropDownList drpqnt = (DropDownList)row.FindControl("drpqnt");
            int qty = int.Parse(drpqnt.SelectedValue);

            getcon();
            cmd = new SqlCommand(
                "update Cart_tbl set Quantity=" + qty +
                " where Cart_Prod_Id=" + prid +
                " AND Cart_User_Id=" + ViewState["uid"], con);
            cmd.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            fillcartgrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
           
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}