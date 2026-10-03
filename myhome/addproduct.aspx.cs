using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
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
        string fnm;

        string s = ConfigurationManager.ConnectionStrings
            ["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imageupload()
        {
            fnm = "Product images/" + FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath(fnm));
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
                clear();
            }
            Response.Redirect("catalog.aspx");
        }

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}