<%@ Page Language="C#" AutoEventWireup="true" CodeFile="menu.aspx.cs" Inherits="Pages_menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to RAS</title>
    <meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="assets/css/main.css" />
	<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <section id="banner">
			<h2><strong>Restaurant Automation System</strong></h2>
			<p>Ayush Soni | Rishabh Agarwal</></p>
			<ul class="actions">
				<li><asp:Button ID="Button_Accounting" runat="server" class="button special" Text="Accounting" OnClick="OnClick_Accounting"/></li>
                <li><asp:Button ID="Button_OrderProcessing" runat="server" class="button special" Text="Order Processing" OnClick="OnClick_OrderProcessing"/></li>
                <li><asp:Button ID="Button_Items" runat="server" class="button special" Text="Items" OnClick="OnClick_Items"/></li>
                <li><asp:Button ID="Button_Inventory" runat="server" class="button special" Text="Inventory" OnClick="OnClick_Inventory"/></li>
			</ul>
	    </section>
        <section id="one" class="wrapper special">
		    <div class="inner">
				<header class="major">
					<h2>What R.A.S. can do...</h2>
				</header>
				<div class="features">
					<div class="feature">
						<i class="fa fa-dollar"></i>
						<h3>Accounting</h3>
						<p>To display the current account balance, and corresponding statistics.</p>
					</div>
					<div class="feature">
						<i class="fa fa-tasks"></i>
						<h3>Order Processing</h3>
						<p>To process new orders, and show data of the previous orders.</p>
					</div>
					<div class="feature">
						<i class="fa fa-cutlery"></i>
						<h3>Items</h3>
						<p>To display the available items in the restaurant, along with modification options for their prices.</p>
					</div>
					<div class="feature">
						<i class="fa fa-bar-chart-o"></i>
						<h3>Inventory</h3>
						<p>The inventory with all the available ingredients and their respective quantities.</p>
					</div>
				</div>
			</div>
		</section>
    </div>
    </form>
</body>
</html>
