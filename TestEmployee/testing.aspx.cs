using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace TestEmployee
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["abc"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Display();
            }
        }
        public void Display()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Employee", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grd.DataSource = dt;
            grd.DataBind();
         }

        public void ClearTextBOx()
        {
            txtname.Text = "";
            txtmob.Text = "";
            txtemail.Text = "";
            txtloc.Text = "";
            btninsert.Text = "Submit";
          
        }

        protected void btninsert_Click(object sender, EventArgs e)
        {
            if (btninsert.Text == "Submit")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Employee(name,mobile_no,emailid,loc) values('" + txtname.Text + "','" + txtmob.Text + "','" + txtemail.Text + "','" + txtloc.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Display();
                ClearTextBOx();
            }
            else if(btninsert.Text=="Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(" Update Employee set name= '" + txtname.Text + "', mobile_no= '" + txtmob.Text + "', emailid= '" + txtemail.Text + "', loc= '" + txtloc.Text + "' where empid ='" + ViewState["aa"] + "' ", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Display();
                ClearTextBOx();
            }
        }

        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmddel")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from Employee where empid= '" + e.CommandArgument + "' ", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Display();
            }
            else if(e.CommandName=="cmdedit")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(" select * from Employee where empid= '" + e.CommandArgument + "' ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txtname.Text = dt.Rows[0]["name"].ToString();
                txtmob.Text = dt.Rows[0]["mobile_no"].ToString();
                txtemail.Text = dt.Rows[0]["emailid"].ToString();
                txtloc.Text = dt.Rows[0]["loc"].ToString();
                btninsert.Text = "Update";
                ViewState["aa"] = e.CommandArgument;

            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Employee where name like'%"+txtsearch.Text+"%'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                grd.DataSource = dt;
                grd.DataBind();
            }
            else
            {
                lblmsg.Text = "Record not found!!";
            }
        }
    }
}