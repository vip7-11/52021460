<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dii.aspx.cs" Inherits="dii" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        ******還在工作嗎??有我小幫手幫您訂便當唷^^&quot;******<br />
        <br />
        ******壓馬路小幫手訂便當系統 (測試版)******
    <table cellpadding="0" cellspacing="0" border="0" width="800">
        <tr>
            <td style=" width:260px; height:30px; text-align:right;">
            STEP-1 請先填入姓名：：：</td>
            <td style=" text-align:left;">
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style=" height:30px; text-align:right;">
            STEP-2 請選擇想要吃的餐點：</td>
            <td style=" text-align:left;">
                <asp:RadioButtonList ID="rb_list" runat="server">
                    <asp:ListItem Value="1">麥當勞</asp:ListItem>
                    <asp:ListItem Value="2">公司後方</asp:ListItem>
                    <asp:ListItem>其他(請填下方需求單)</asp:ListItem>
                </asp:RadioButtonList>
                <asp:TextBox ID="txtcontent" runat="server" Columns="30" Rows="5" 
                    TextMode="MultiLine"></asp:TextBox>(可填入您的意見)
                <br />
            </td>
        </tr>
        <tr>
            <td style=" height:30px; text-align:right;">
            </td>
            <td style=" text-align:left;">
                <asp:Button ID="btnok" runat="server" Text="確定" onclick="btnok_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
            <asp:Literal ID="lt" runat="server"></asp:Literal></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>