<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="user_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" width="99%">
    <tr>
        <td colspan="3" style="font-weight:700;font-size:16px;color:#1C1B6C">系統資訊 - 管理中心總覽</td>
    </tr>
    <tr>
        <td width="33%" style="padding-top:10px;vertical-align:top;" align="center">
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr><td height="20px" align="center" style="background-color:#E8E8E8">系統狀態</td></tr>
                <tr><td height="20px" align="left">瀏覽人次：<asp:Label ID="lb_counter" runat="server" Text="Label"></asp:Label>
                    人(2012/03/01起)</td></tr>
                <tr><td height="20px" align="left">目前會員總數：<asp:Label ID="lb_member_count" runat="server" Text="Label"></asp:Label></td></tr>
                <tr><td height="20px" align="left">上架中商品數量：<asp:Label ID="lb_pdton_num" runat="server" 
                        Text="Label"></asp:Label>
                    </td></tr>
                <tr><td height="20px" align="left">下架中商品數量：<asp:Label ID="lb_pdtoff_num" runat="server" 
                        Text="Label"></asp:Label>
                    </td></tr>
            </table>
        </td>
        <td width="33%" style="padding-top:10px;vertical-align:top;" align="center">
            <table border="0" cellpadding="0" cellspacing="0" width="95%">
                <tr><td height="20px" align="center" style="background-color:#E8E8E8">訂單總覽</td></tr>
                <tr><td height="20px" align="left">未處理訂單數：<asp:Label ID="lb_od_state_1" runat="server" 
                        Text="Label"></asp:Label>
                    </td></tr>
                <tr><td height="20px" align="left">未付款訂單數：<asp:Label ID="lb_od_state_2" runat="server" 
                        Text="Label"></asp:Label>
                    </td></tr>
                <tr><td height="20px" align="left">有<asp:Label ID="lb_atm_unchk" runat="server" 
                        Text="Label"></asp:Label>
                    筆已匯款訂單待確認</td></tr>
                <tr><td height="20px" align="left">有<asp:Label ID="lb_notpayed" runat="server" 
                        Text="Label"></asp:Label>
                    筆已出貨之未收款訂單</td></tr>
            </table>
        </td>
        <td>

        </td>
    </tr>
</table>
</asp:Content>