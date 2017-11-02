<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orders.aspx.cs" Inherits="Pages_orders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Orders</title>
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
           <p>Previous Orders</p>
        </h3>
        <asp:SqlDataSource ID="SqlDataSourceOrders" runat="server" SelectCommand="Select * from orders" ConnectionString="<%$ConnectionStrings:RASConnString %>" />
        <asp:GridView ID="GridView_Orders" runat="server" DataSourceID="SqlDataSourceOrders" AllowSorting="true" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="true"/>
                <asp:BoundField DataField="total_amt" HeaderText="Total Amount (Rs.)" ReadOnly="true"/>
                <asp:BoundField DataField="date" HeaderText="DateTime" ReadOnly="true"/>
            </Columns>
        </asp:GridView>
        <asp:Button ID="Button_Back" runat="server" CssClass="button special" Text="Back to Main Menu" OnClick="OnClick_BackToMainMenu"/>
    </div>
    <div class="box">
        			<section id="two" class="wrapper style2 special">
				<div class="inner narrow">
					<header>
						<h2>Place a new order...</h2>
					</header>
						<asp:Table ID="TableOrder" runat="server">
                            <asp:TableRow>
                                <asp:TableCell><img src="../Images/burger.jpg"/></asp:TableCell>
                                <asp:TableCell><b>Burger</b></asp:TableCell>
                                <asp:TableCell><asp:TextBox ID="TextBox_BurgerQuantity" runat="server"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow VerticalAlign="Top">
                                <asp:TableCell><img src="../Images/fries.jpg"/></asp:TableCell>
                                <asp:TableCell><b>Fries</b></asp:TableCell>
                                <asp:TableCell><asp:TextBox ID="TextBox_FriesQuantity" runat="server"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell><img src="../Images/garlic_bread.jpg"/></asp:TableCell>
                                <asp:TableCell><b>Garlic Bread</b></asp:TableCell>
                                <asp:TableCell><asp:TextBox ID="TextBox_GarlicBreadQuantity" runat="server"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell><img src="../Images/salad.jpg"/></asp:TableCell>
                                <asp:TableCell><b>Salad</b></asp:TableCell>
                                <asp:TableCell><asp:TextBox ID="TextBox_SaladQuantity" runat="server"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell><img src="../Images/sandwich.jpg"/></asp:TableCell>
                                <asp:TableCell><b>Sandwich</b></asp:TableCell>
                                <asp:TableCell><asp:TextBox ID="TextBox_SandwichQuantity" runat="server"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>

						</asp:Table>
                        <asp:CompareValidator ID="BurgerQuantityValidator" runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="TextBox_BurgerQuantity" ErrorMessage="Burger Quantity value must be a whole number" ForeColor ="Red"/>
                        <asp:CompareValidator ID="SaladQuantityValidator" runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="TextBox_SaladQuantity" ErrorMessage="Salad Quantity value must be a whole number" ForeColor ="Red"/>
                        <asp:CompareValidator ID="FriesQuantityValidator" runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="TextBox_FriesQuantity" ErrorMessage="Fries Quantity value must be a whole number" ForeColor ="Red"/>
                        <asp:CompareValidator ID="SandwichQuantityValidator" runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="TextBox_SandwichQuantity" ErrorMessage="Sandwich Quantity value must be a whole number" ForeColor ="Red"/>
                        <asp:CompareValidator ID="GarlicBreadQuantityValidator" runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="TextBox_GarlicBreadQuantity" ErrorMessage="Garlic Bread Quantity value must be a whole number" ForeColor ="Red"/>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Following error occurs....." ShowMessageBox="false" DisplayMode="BulletList" ShowSummary="true" Width="500"  ForeColor="Red" Font-Size="Large" />
						<asp:Button ID="Button_NewOrder" runat="server" Text="Place Order" OnClick="Button_NewOrder_Click" />
				</div>
			</section>
    </div>
    </form>
</body>
</html>
