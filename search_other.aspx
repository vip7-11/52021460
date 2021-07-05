<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="search_other.aspx.cs" Inherits="search_other" %>

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
<table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
        <td style=" width:80px; height:30px; text-align:right;">
            類別：</td>
        <td style=" text-align:left;">
            <asp:DropDownList ID="search_class" runat="server" 
                AppendDataBoundItems="True" CssClass="imgstyle" DataSourceID="sds_itemA" 
                DataTextField="itemA_name" DataValueField="itemA_no">
                <asp:ListItem Value="00">商品全分類</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style=" height:30px; text-align:right;">
            商品序號：</td>
        <td style=" text-align:left;">
            <asp:TextBox ID="Sid" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style=" height:30px; text-align:right;">
            商品名稱：</td>
        <td style=" text-align:left;">
            <asp:TextBox ID="Sname" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style=" height:30px; text-align:right;">
            商品描述：</td>
        <td style=" text-align:left;">
            <asp:TextBox ID="Sintro" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style=" height:30px; text-align:right;">
            價格區間：</td>
        <td style=" text-align:left;">
            從<asp:TextBox ID="Sprice1" runat="server" Width="80">0</asp:TextBox>~<asp:TextBox ID="Sprice2"
                runat="server" Width="80">10000000</asp:TextBox>元
        </td>
    </tr>
    <tr>
        <td style=" height:30px; text-align:right;">
            &nbsp;</td>
        <td style=" text-align:left;">
            <asp:Button ID="Button1" runat="server" Text="搜尋" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="pdt_no" 
                DataSourceID="show_productsList" EnableModelValidation="True" 
                GroupItemCount="4" style="margin-right: 92px" 
                onprerender="ListView1_PreRender" onload="ListView1_Load">
                <EmptyDataTemplate>
                    <table id="Table1" runat="server" style="">
                        <tr>
                            <td>
                                未有相關商品。</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td id="Td3" runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr ID="itemPlaceholderContainer" runat="server">
                        <td ID="itemPlaceholder" runat="server">
                        </td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td id="Td5" runat="server" style="">
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "products_show.aspx?page=" + Eval("pdt_no") %>' ><img src='<%# "image/products/" + Eval("pdt_img1") %>' width="210px" height="280px" border='0' /></asp:HyperLink>
                        <br />
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("pdt_name") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label9" runat="server" Text='<%# "價格：" + Eval("pdt_price") + "元" %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label10" runat="server" 
                            Text='<%# "數量：" + Eval("pdt_stocks") + Eval("pdt_units") %>'></asp:Label>
                        <br />
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table2" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td6" runat="server" class="style1">
                                <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                                    <tr ID="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr2" runat="server">
                            <td id="Td7" runat="server" class="style1">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td id="Td8" runat="server" style="">
                        id:
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        <br />name:
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                        <br />pic:
                        <asp:Label ID="picLabel" runat="server" Text='<%# Eval("pic") %>' />
                        <br />price:
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        <br />quantity:
                        <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                        <br />units:
                        <asp:Label ID="unitsLabel" runat="server" Text='<%# Eval("units") %>' />
                        <br />
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="show_productsList" runat="server" 
                ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" >
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_itemA" runat="server" 
                ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                SelectCommand="SELECT [itemA_name], [itemA_no] FROM [ItemA] ORDER BY [itemA_no]">
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>

