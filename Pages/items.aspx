<%@ Page Language="C#" AutoEventWireup="true" CodeFile="items.aspx.cs" Inherits="Pages_items" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Items</title>
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
           <p>Items</p>
        </h3>
        <asp:SqlDataSource ID="SqlDataSourceItems" runat="server" SelectCommand="Select * from item" UpdateCommand="Update item set price=@price where id=@id" ConnectionString="<%$ConnectionStrings:RASConnString %>" />
        <asp:GridView ID="GridView_Items" runat="server" DataSourceID="SqlDataSourceItems" AllowSorting="true" DataKeyNames="id" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="true"/>
                <asp:BoundField DataField="name" HeaderText="Name" ReadOnly="true"/>
                <asp:BoundField DataField="price" HeaderText="Price"/>
                <asp:CommandField ShowEditButton="true" HeaderText="Options" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="Button_Back" runat="server" CssClass="button special" Text="Back to Main Menu" OnClick="OnClick_BackToMainMenu"/>
    </div>
    </form>
</body>
</html>
