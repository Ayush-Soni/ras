using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_order_result : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["RASConnString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("Select item.id, item.name, item.price, " +
            "ingredients.id, ingredients.name, itemingredient.quantity " +
            "From item inner join itemingredient inner join ingredients " +
            "on (item.id=itemingredient.item_id and itemingredient.ingredient_id=ingredient.id)", conn);
        DataSet dataSet = new DataSet();
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        try
        {
            conn.Open();
            adapter.Fill(dataSet, "");
        }
        catch (Exception)
        {
            Debug.WriteLine("Error occured in Button_NewOrder_Click()");
        }
        finally
        {
            conn.Close();
        }
    }
}