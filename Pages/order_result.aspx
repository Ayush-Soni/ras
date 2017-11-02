<%@ Page Language="C#" AutoEventWireup="true" CodeFile="order_result.aspx.cs" Inherits="Pages_order_result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class ="box fa-align-center">
            <h2 class="fa-header">
                <p><asp:Label ID="OrderResultLabel" runat="server" ForeColor="Maroon"></asp:Label></p>
            </h2>
        </div>
        <div class="box">
            <h2 class="fa-header">
                <p>Order Details</p>
            </h2>
            <asp:GridView ID="GV1" runat="server" /><!--for debugging-->
            <br />
        <!--</div>
        <div class="box"> -->
            <h2 class="fa-header">
                <p>Item-Ingredient details</p>
            </h2>
            <asp:GridView ID="GV" runat="server" /><!--for debugging-->
            <br />
        <!--</div>
        <div class="box"> -->
            <h2 class="fa-header">
                <p>Ingredient details</p>
            </h2>
            <asp:GridView ID="GV2" runat="server" /><!--for debugging-->
        </div>
        <br />
        <asp:Button ID="Button_BackToMain" runat="server" OnClick="Button_BackToMain_Click" Text="Back to Main Menu"/>
    </div>
    </form>
</body>
</html>
