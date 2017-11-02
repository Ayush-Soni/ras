using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void OnClick_BackToMainMenu(object sender, EventArgs e)
    {
        Response.Redirect("menu.aspx");
    }

    int getValueFromTextBox(TextBox t1)
    {
        int x;
        try
        {
            x = int.Parse(t1.Text);
        }
        catch (FormatException ex)
        {
            Debug.WriteLine(ex.ToString());
            return 0;
        }
        return x;
    }

    protected void Button_NewOrder_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            int burgerQuantity = 0, saladQuantity = 0, sandwichQuantity = 0, gbQuantity = 0, friesQuantity = 0;
            burgerQuantity = getValueFromTextBox(TextBox_BurgerQuantity);
            saladQuantity = getValueFromTextBox(TextBox_SaladQuantity);
            sandwichQuantity = getValueFromTextBox(TextBox_SandwichQuantity);
            gbQuantity = getValueFromTextBox(TextBox_GarlicBreadQuantity);
            friesQuantity = getValueFromTextBox(TextBox_FriesQuantity);
            Debug.WriteLine(burgerQuantity + " " + friesQuantity + " " + saladQuantity + " " + gbQuantity + " " + sandwichQuantity);

            //Now we are to calculate bill, and upload data to database
            //Perform checks for availability of ingredients
            //Update ingredients' stock
            //To find ingredients of items: Items JOIN ingredients (how?)
            //To find current stock: select * from ingredients

            Response.Redirect("order_result.aspx?" +
                "burgerQ=" + burgerQuantity + "&" +
                "friesQ=" + friesQuantity + "&" +
                "gbQ=" + gbQuantity + "&" +
                "saladQ=" + saladQuantity + "&" +
                "sandwichQ=" + sandwichQuantity);
        }
    }
 }