using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Test
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=(local);initial catalog=Testing;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btninsert_Click(object sender, EventArgs e)
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("insert into Emp1(name,email_id,age,salary) values('"+txtname.Text+"','"+txtemail.Text+"','"+txtage.Text+"','"+txtsal.Text+"')",con);
           
            cmd.ExecuteNonQuery();

            con.Close();

        }
    }
}