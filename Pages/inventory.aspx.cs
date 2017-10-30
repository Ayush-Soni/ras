using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_inventory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Add option to purchase new stock
    }

    protected void OnClick_BackToMainMenu(object sender, EventArgs e)
    {
        Response.Redirect("menu.aspx");
    }
}