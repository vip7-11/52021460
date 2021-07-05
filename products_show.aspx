<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="products_show.aspx.cs" Inherits="products_show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="form" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="all" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="banner_up" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="banner_down" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="nav" Runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="main" Runat="Server">
    <table style="width:100%;">
    <tr>
        <td width="210" valign="top">
            <asp:Image ID="Image1" runat="server" Height="280px" 
                ImageUrl="" Width="210px" />
        </td>
        <td rowspan="2" valign="top">
            <asp:Literal ID="ltpdt_content" runat="server" Text=""></asp:Literal>
        </td>
    </tr>
    <tr>
        <td style=" vertical-align:top;">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td style=" width:70px; height:30px; text-align:right;">
                        商品編號：</td>
                    <td style=" text-align:left;">
                        <asp:Label ID="lblpdt_no" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lblpdt_convey" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lblpdt_stocks" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lblpdt_id" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style=" height:30px; text-align:right;">
                        商品名稱：</td>
                    <td style=" text-align:left;">
                        <asp:Label ID="lblpdt_name" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style=" height:30px; text-align:right;">
                        商品規格：</td>
                    <td style=" text-align:left;">
                        <asp:Literal ID="lt_objtype" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td style=" height:30px; text-align:right;">
                        價格：</td>
                    <td style=" text-align:left;">
                        <asp:Label ID="lblpdt_price" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style=" height:30px; text-align:right;">
                        批發價：</td>
                    <td style=" text-align:left;">
                        <asp:Label ID="lblpdt_sell" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style=" height:30px; text-align:right;">
                        購買數量：</td>
                    <td valign="middle">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center" height="20" valign="middle" width="15">
                                            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/image/lelecoco/list_close.png" 
                                                onclick="imgbtn02_Click" />
                                        </td>
                                        <td align="center" height="20" valign="middle" width="30">
                                            <asp:Label ID="lblnum" runat="server" Text="1"></asp:Label>
                                        </td>
                                        <td align="center" height="20" valign="middle" width="15">
                                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image/lelecoco/list_open.png" 
                                            onclick="imgbtn01_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td style=" height:30px; text-align:right;">
                        上架日期：</td>
                    <td style=" text-align:left;">
                        <asp:Label ID="lblpdt_updatetime" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style=" height:30px; text-align:right;">&nbsp;</td>
                    <td>
                        <asp:Button ID="btn_car" runat="server" Text="加入購物車" 
                            onclientclick='<%# "shopcar("+ Eval("id") + ")" %>' 
                            onclick="btn_car_Click" />
                    </td>
                </tr>
            </table>
            
        </td>
    </tr>
</table>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>