using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Web.Configuration;

public partial class Pages_accounting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            HttpCookie myCookie = Request.Cookies["balanceCookie"];
            if (myCookie == null)
            {
                BalanceLabel.Text = "No balance data found!";
            }

            //ok - cookie is found.
            //Gracefully check if the cookie has the key-value as expected.
            if (!string.IsNullOrEmpty(myCookie.Values["balance"]))
            {
                string balance = myCookie.Values["balance"].ToString();
                BalanceLabel.Text = "The account balance is Rs." +balance + ".";
                //Yes userId is found. Mission accomplished.
            }
            string connectionString = WebConfigurationManager.ConnectionStrings["RASConnString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("with temp1 as (Select item_id, count(quantity) as times_ordered from orderitem group by item_id) select temp1.item_id, item.name, times_ordered from temp1, item where temp1.item_id = item.id order by times_ordered DESC", conn);
            DataSet dataSet = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            try
            {
                conn.Open();
                adapter.Fill(dataSet, "tempTable");
            }
            catch (Exception er)
            {
                Debug.WriteLine("Error occured in showing top used items" + er.ToString());
            }
            finally
            {
                conn.Close();
            }
            GV.DataSource = dataSet.Tables["tempTable"];
            GV.DataBind();
            
        }
    }

    protected void BackToMainMenu_Click(object sender, EventArgs e)
    {
        Response.Redirect("menu.aspx");
    }
}