using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myhome
{
    public partial class addproduct : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataTable dt;
        string fnm;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillgrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("SELECT Product_Id, Product_Name, Category, Price, Product_Image, Description FROM Product_tbl ORDER BY Product_Id DESC", con);
            dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }

        void imageupload()
        {
            if (FileUpload1.HasFile)
            {
                string folder = Server.MapPath("~/Product images/");
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }

                fnm = "Product images/" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath("~/" + fnm));
            }
            else
            {
                fnm = "";
            }
        }

        void clear()
        {
            txtCategory.Text = "";
            txtName.Text = "";
            txtPrice.Text = "";
            TextBox4.Text = "";
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (btnAdd.Text == "Add Product")
            {
                getcon();
                imageupload();

                cmd = new SqlCommand(
                    "insert into Product_tbl " +
                    "(Product_Name, Category, Price, Product_Image, Description) " +
                    "values('" + txtName.Text + "','" +
                    txtCategory.Text + "','" + txtPrice.Text + "','" +
                    fnm + "','" + TextBox4.Text + "')", con);

                cmd.ExecuteNonQuery();
                con.Close();
                clear();
                fillgrid();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            fillgrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            fillgrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int pId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            GridViewRow row = GridView1.Rows[e.RowIndex];
            TextBox txtEditName = (TextBox)row.FindControl("txtEditName");
            TextBox txtEditCat = (TextBox)row.FindControl("txtEditCat");
            TextBox txtEditPrice = (TextBox)row.FindControl("txtEditPrice");

            getcon();
            string updateQuery = "UPDATE Product_tbl SET Product_Name='" + txtEditName.Text + "', Category='" + txtEditCat.Text + "', Price='" + txtEditPrice.Text + "' WHERE Product_Id='" + pId + "'";
            cmd = new SqlCommand(updateQuery, con);
            cmd.ExecuteNonQuery();
            con.Close();

            GridView1.EditIndex = -1;
            fillgrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int pId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            getcon();
            cmd = new SqlCommand("DELETE FROM Product_tbl WHERE Product_Id='" + pId + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();

            fillgrid();
        }

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}