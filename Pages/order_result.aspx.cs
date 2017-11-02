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
    //Uses dictionary, retrieves values from QueryString and disconnected data access
    protected void Page_Load(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["RASConnString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("Select item.id as itemid, item.name as itemname, item.price as itemprice, ingredients.id as ingredientsid, ingredients.name as ingredientsname, itemingredient.quantity as ingredientsquantity from item, itemingredient, ingredients where item.id=itemingredient.item_id and itemingredient.ingredient_id=ingredients.id", conn);
        DataSet dataSet = new DataSet(); ;
        DataSet dataSetIngredients = new DataSet(); ;
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        try
        {
            conn.Open();
            adapter.Fill(dataSet, "tempTable");
            GV.DataSource = dataSet;//Debug statement
            GV.DataBind();//Debug statement
        }
        catch (Exception)
        {
            Debug.WriteLine("Error occured in Button_NewOrder_Click()");
        }
        finally
        {
            conn.Close();
        }

        //Dictionary which stores item_id, with its associated ingredients' ids and quantity required
        Dictionary<int, Dictionary<int, int>> itemIngredientQuantity = new Dictionary<int, Dictionary<int, int>>();
        
        foreach(DataRow row in dataSet.Tables["tempTable"].Rows)
        {
            Dictionary<int, int> d = itemIngredientQuantity.ContainsKey((int)row["itemid"])?itemIngredientQuantity[(int)row["itemid"]]: null;
            if(d==null)
            {
                d = new Dictionary<int, int>();
                itemIngredientQuantity[(int)row["itemid"]] = d;
            }
            d[(int)row["ingredientsid"]] = (int)row["ingredientsquantity"];
        }

        //Now finding the quantity that is needed using
        //a dictionary storing quantity of items needed storing itemId and quantity required
        Dictionary<int, int> quantityOfItemsNeeded = new Dictionary<int, int>();
        if(int.Parse(Request.QueryString["burgerQ"])>0)
        {
            quantityOfItemsNeeded[2] = int.Parse(Request.QueryString["burgerQ"]);
            Debug.WriteLine("quantityOfItemsNeeded[2]="+quantityOfItemsNeeded[2]);
        }
        if (int.Parse(Request.QueryString["saladQ"]) > 0)
        {
            quantityOfItemsNeeded[1] = int.Parse(Request.QueryString["saladQ"]);
            Debug.WriteLine("quantityOfItemsNeeded[1]=" + quantityOfItemsNeeded[1]);
        }
        if (int.Parse(Request.QueryString["sandwichQ"]) > 0)
        {
            quantityOfItemsNeeded[3] = int.Parse(Request.QueryString["sandwichQ"]);
            Debug.WriteLine("quantityOfItemsNeeded[3]=" + quantityOfItemsNeeded[3]);
        }
        if (int.Parse(Request.QueryString["friesQ"]) > 0)
        {
            quantityOfItemsNeeded[4] = int.Parse(Request.QueryString["friesQ"]);
            Debug.WriteLine("quantityOfItemsNeeded[4]=" + quantityOfItemsNeeded[4]);
        }
        if (int.Parse(Request.QueryString["gbQ"]) > 0)
        {
            quantityOfItemsNeeded[5] = int.Parse(Request.QueryString["gbQ"]);
            Debug.WriteLine("quantityOfItemsNeeded[5]=" + quantityOfItemsNeeded[5]);
        }
        
        //quantityNeeded Dictionary, stores ingredientId and quantity required
        Dictionary<int, int> quantityOfIngredientsNeeded = new Dictionary<int, int>();
        foreach(KeyValuePair<int, int> itemQ in quantityOfItemsNeeded)
        {
            //itemQ.Key gives itemId and itemQ.Value gives itemQuantity
            foreach(KeyValuePair<int,int> entry in itemIngredientQuantity[itemQ.Key])
            {
                if(quantityOfIngredientsNeeded.ContainsKey(entry.Key))
                {
                    quantityOfIngredientsNeeded[entry.Key] += entry.Value * itemQ.Value;
                }
                else
                {
                    quantityOfIngredientsNeeded[entry.Key] = entry.Value * itemQ.Value;
                }
            }
        }

        //Now to query the ingredients currently available
        
        GV1.DataSource = quantityOfIngredientsNeeded; //Debug
        GV1.DataBind();

        cmd.CommandText = "Select * from ingredients";
        try
        {
            conn.Open();
            adapter.Fill(dataSetIngredients, "ingredients");
        } catch(Exception)
        {
            Debug.WriteLine("Exception in query: Select * From Ingredients");
        } finally
        {
            conn.Close();
        }
        GV2.DataSource = dataSetIngredients; //Debug
        GV2.DataBind();
        Dictionary<int, int> quantityOfIngredientsAvailable = new Dictionary<int, int>();
        foreach(DataRow row in dataSetIngredients.Tables["ingredients"].Rows)
        {
            quantityOfIngredientsAvailable[(int)row["id"]] = (int)row["quantity"];
        }
        bool orderFailure = false;
        List<int> ingredientsUnavailable = new List<int>();
        foreach(KeyValuePair<int, int> entry in quantityOfIngredientsAvailable)
        {
            if(entry.Value < quantityOfIngredientsNeeded[entry.Key])
            {
                orderFailure = true;
                ingredientsUnavailable.Add(entry.Key);
            }
        }

        //Calculating total cost

        if(orderFailure)
        {
            //Update owner by using label
            OrderResultLabel.Text = "Order <b>cannot</b> be placed, some ingredients are unavailable. \nPlease purchase ingredients.";
            OrderResultLabel.Text += "\nIngredients unavailable are: ";
            foreach(int item in ingredientsUnavailable)
            {
                OrderResultLabel.Text += item.ToString() + " ";
            }
        }
        else
        {
            //Update all databases with required information
            //Update relation between item and order
            //Update order
            //Update ingredients
        }
        //If we have enough ingredients, update ingredients stock, and show that the order is placed

    }

    protected void Button_BackToMain_Click(object sender, EventArgs e)
    {
        Response.Redirect("menu.aspx");
    }
}