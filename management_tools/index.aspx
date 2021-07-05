<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="management_tools_index, App_Web_index.aspx.8728bb32" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="form" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="all" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="main" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td>
                ．主版面樣式管理</td>
            <td>
                ．會員功能管理</td>
            <td>
                ．客服中心管理</td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="zhongdikaiEdit" runat="server" Text="編輯主頁面" 
                    NavigateUrl="zhongdikaiEdit/index.aspx"></asp:HyperLink>
                <br />
                <asp:HyperLink ID="logistics" runat="server" Text="編輯查詢出貨進度" NavigateUrl="logistics.aspx"></asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="member_M" runat="server" 
                    NavigateUrl="member_M.aspx">會員管理</asp:HyperLink>
                <br />
                <asp:HyperLink ID="products_M" runat="server" 
                    NavigateUrl="products_M.aspx">商品管理</asp:HyperLink>
                <br />
            <asp:HyperLink ID="orderer_M" runat="server" 
                    NavigateUrl="order_M.aspx">訂單管理</asp:HyperLink>
                <br />
                <asp:HyperLink ID="coupon_M" runat="server" 
                    NavigateUrl="coupon_M.aspx">優惠券管理</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="FAQ_M" runat="server" 
                    NavigateUrl="FAQ_M.aspx">FAQ管理</asp:HyperLink>
                <br />
                <asp:HyperLink ID="messageboard_M" runat="server" 
                    NavigateUrl="messageboard_M.aspx">留言板管理</asp:HyperLink>
                <br />
                <asp:HyperLink ID="aboutVIP" runat="server" 
                    NavigateUrl="aboutVIP_M.aspx">關於VIP管理</asp:HyperLink>
                <br />
                <asp:HyperLink ID="callUs" runat="server" 
                    NavigateUrl="callUs_M.aspx">聯絡我們管理</asp:HyperLink>
                <br />
                <asp:HyperLink ID="aboutUs_M" runat="server" 
                    NavigateUrl="aboutUs_M.aspx">關於VIP商城管理</asp:HyperLink>
                <br />
                <asp:HyperLink ID="obligations" runat="server" 
                    NavigateUrl="obligations_M.aspx">客戶權利義務管理</asp:HyperLink>
                <br />
                <asp:HyperLink ID="privacy" runat="server" 
                    NavigateUrl="privacy_M.aspx">個人隱私保密政策管理</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

