﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shopcar.aspx.cs" Inherits="shopcar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            PostBackUrl="shopcar.aspx" Text="送出訂單" />

        <asp:HyperLink ID="no_Loginer" runat="server" Visible="False" Target="_blank"></asp:HyperLink>

    </div>
    </form>
</body>
</html>
