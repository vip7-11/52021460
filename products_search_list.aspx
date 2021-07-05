<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="products_search_list.aspx.cs" Inherits="products_list" %>

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
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "products_show.aspx?page=" + Eval("pdt_no") %>' ><img src='<%# "image/products/" + Eval("pdt_img1") %>' width="210px" height="280px" /></asp:HyperLink>
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
    </asp:ListView>
    <asp:SqlDataSource ID="show_productsList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>">
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>

