<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="myaccount.aspx.cs" Inherits="myaccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 117px;
            height: 41px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="all" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner_up" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="banner_down" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="nav" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="main" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td>
                <img alt="" class="style1" src="image/lelecoco/會員功能.png" /></td>
            <td>
                <img alt="" class="style1" src="image/lelecoco/客服中心.png" /></td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="shopCar" runat="server" 
                    NavigateUrl="car.aspx" ImageUrl="image/lelecoco/購物車.png">購物車</asp:HyperLink>
            <asp:HyperLink ID="orderer" runat="server" NavigateUrl="shoppinghistory.aspx" 
                    ImageUrl="image/lelecoco/訂單查詢.png">訂單查詢</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="FAQ" runat="server" NavigateUrl="FAQ.aspx" 
                    ImageUrl="image/lelecoco/FAQ.png">FAQ</asp:HyperLink>
                <asp:HyperLink ID="aboutUs" runat="server" NavigateUrl="aboutUs.aspx" 
                    ImageUrl="image/lelecoco/關於VIP商城.png">關於VIP商城</asp:HyperLink>
                <asp:HyperLink ID="aboutVIP" runat="server" NavigateUrl="aboutVIP.aspx" 
                    ImageUrl="image/lelecoco/關於VIP.png">關於VIP</asp:HyperLink>
                <asp:HyperLink ID="callUs" runat="server" NavigateUrl="callUs.aspx" 
                    ImageUrl="image/lelecoco/聯絡我們.png">聯絡我們</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
            <asp:HyperLink ID="rename" runat="server" NavigateUrl="user_edit.aspx" 
                    ImageUrl="image/lelecoco/資料修改.png">資料修改</asp:HyperLink>
                <asp:HyperLink ID="coupon" runat="server" NavigateUrl="coupon.aspx" 
                    ImageUrl="image/lelecoco/下載優惠單.png">下載優惠券</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="messageboard" runat="server" 
                    NavigateUrl="msg.aspx" ImageUrl="image/lelecoco/留言板.png">留言板</asp:HyperLink>
                <asp:HyperLink ID="obligations" runat="server" NavigateUrl="obligations.aspx" 
                    ImageUrl="image/lelecoco/客戶權利義務.png">客戶權利義務</asp:HyperLink>
                <asp:HyperLink ID="privacy" runat="server" NavigateUrl="privacy.aspx" 
                    ImageUrl="image/lelecoco/個人隱私保密政策.png">個人隱私保密政策</asp:HyperLink>
            </td>
        </tr>
        </table>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>