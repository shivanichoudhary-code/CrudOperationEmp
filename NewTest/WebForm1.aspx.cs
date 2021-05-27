using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace NewTest
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(local);initial catalog= Test; integrated security=true");
       
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
        }

        public void BindData()
        {
            con.Open();
           
            SqlCommand cmd = new SqlCommand("Select * from customer", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
      
            da.Fill(dt);

            //For grid view of data shown on the page
            grd.DataSource = dt;
            con.Close();
            grd.DataBind();
            

        }

        protected void btninsert_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into customer(name,city,mobile_no) values('"+txtname.Text+"','"+txtcity.Text+"','"+txtmob.Text+"')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            BindData();
        }

       
        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from customer where id='"+e.CommandArgument+"'",con);
            cmd.ExecuteNonQuery();
            BindData();
            con.Close();
        
        }
    }
}