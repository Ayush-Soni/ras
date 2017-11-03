<%@ Page Language="C#" AutoEventWireup="true" CodeFile="accounting.aspx.cs" Inherits="Pages_accounting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="special box">
        <h2 class="header"><p><asp:Label ID="BalanceLabel" runat="server" /></p></h2>
        <asp:Button ID="BackToMainMenu" runat="server" OnClick="BackToMainMenu_Click" Text="Back to Main Menu" />
    </div>
        <div class =" box" >
            <p><b>Item Stats</b> as per past orders</p>
            <asp:GridView ID="GV" runat="server" />
        </div>
    </form>
</body>
</html>
