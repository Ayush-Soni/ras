using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void OnClick_Accounting(object sender, EventArgs e)
    {
        Response.Redirect("accounting.aspx");
    }

    protected void OnClick_OrderProcessing(object sender, EventArgs e)
    {
        //4:16PM 28th October: Uses SqlDataSource to show orders of the past month
        //4:16PM 28th October: Allows making new orders

        //!! Needs to use validation (Basic)
        Response.Redirect("orders.aspx");
    }

    protected void OnClick_Items(object sender, EventArgs e)
    {
        //4:16PM 28th October: Uses SqlDataSource to select, update items table
        //4:16PM 28th October: Uses GridView with Edit Button

        //!! Needs to use validation (Basic)
        Response.Redirect("items.aspx");
    }

    protected void OnClick_Inventory(object sender, EventArgs e)
    {
        //4:16PM 28th October: Uses SqlDataSource to select, update ingredients table
        //4:16PM 28th October: Uses GridView with Edit Button

        //!! Needs to use validation (Basic)
        //!! Needs to show statistics(Advanced)
        Response.Redirect("inventory.aspx");
    }
}