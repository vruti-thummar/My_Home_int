using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myhome.admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_id"] == null)
            {
                Response.Redirect("adminlogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                getcon();
                fillcompany();
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

        void imageupload()
        {
            if (FileUpload1.HasFile)
            {
                string folder = Server.MapPath("~/Product_images/");
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }

                fnm = "Product_images/" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath("~/" + fnm));
            }
            else
            {
                fnm = "";
            }
        }

        void clear()
        {
            DropDownList1.ClearSelection();
            TextBox6.Text = "";
            TextBox1.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
        }

        void fillcompany()
        {
            getcon();
            da = new SqlDataAdapter("select * from Company_tbl1", con);
            ds = new DataSet();
            da.Fill(ds);

            DropDownList1.Items.Clear();
            DropDownList1.Items.Add("---Select---");

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DropDownList1.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 0)
            {
                Label2.Text = "Please select a company!";
                return;
            }

            getcon();
            imageupload();

            da = new SqlDataAdapter("select * from Company_tbl1 where Comp_Name = '" + DropDownList1.SelectedItem.Text + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int cid = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
                ViewState["cid"] = cid;

                cmd = new SqlCommand("insert into Product_tbl1(Prod_Comp_id, Prod_Name, Prod_Model, Prod_Descrip, Prod_Config, Prod_Wight, Prod_Imag) values('" + ViewState["cid"] + "','" + TextBox1.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + fnm + "')", con);
                cmd.ExecuteNonQuery();

                Label2.Text = "Product Added Successfully!";
                clear();
            }
            con.Close();
        }
    }
}