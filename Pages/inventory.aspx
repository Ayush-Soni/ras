<%@ Page Language="C#" AutoEventWireup="true" CodeFile="inventory.aspx.cs" Inherits="Pages_inventory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventory</title>
    <meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="assets/css/main.css" />
	<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    <div class="box">
        <h3 class="fa-2x align-center">
           <p>Inventory</p>
        </h3>
        <asp:SqlDataSource ID="SqlDataSourceIngredients" runat="server" SelectCommand="Select * from ingredients" UpdateCommand="Update ingredients set price=@price where id=@id" ConnectionString="<%$ConnectionStrings:RASConnString %>" />
        <asp:GridView ID="GridView_Ingredients" runat="server" DataSourceID="SqlDataSourceIngredients" AllowSorting="true" DataKeyNames="id" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="true"/>
                <asp:BoundField DataField="name" HeaderText="Name" ReadOnly="true"/>
                <asp:BoundField DataField="quantity" HeaderText="Quantity" ReadOnly="true"/>
                <asp:BoundField DataField="price" HeaderText="Price"/>
                <asp:CommandField ShowEditButton="true" HeaderText="Options" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="Button_Back" runat="server" CssClass="button special" Text="Back to Main Menu" OnClick="OnClick_BackToMainMenu"/>
    </div>
    </form>
</body>
</html>
