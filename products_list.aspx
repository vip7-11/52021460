<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="products_list.aspx.cs" Inherits="products_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 960px;
            margin:0px auto;
        }
    </style>
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
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="pdt_id" 
        DataSourceID="show_productsList" EnableModelValidation="True" 
        GroupItemCount="4" style="margin-right: 92px">
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        未傳回資料。</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
<td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr ID="itemPlaceholderContainer" runat="server">
                <td ID="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td runat="server" style="">
                <table cellpadding="0" cellspacing="0" border="0" width="212">
                    <tr>
                        <td style=" height:280px;">
                            <asp:HyperLink ID="HyperLink1" runat="server"
                                NavigateUrl='<%# "products_show.aspx?page=" + Eval("pdt_no") %>' >
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "image/products/" + Eval("pdt_img1") %>' Height="280px" Width="210px" />
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td style=" height:32px; text-align:left; padding-left:5px;">
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("pdt_name") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style=" height:30px; text-align:left; padding-left:5px;">
                            <asp:Label ID="Label9" runat="server" Text='<%# "價格：" + Eval("pdt_price") + "元" %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style=" height:30px; text-align:left; padding-left:5px;">
                            <asp:Label ID="Label1" runat="server" Text='<%# "批發價：" + Eval("pdt_sell") + "元" %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style=" height:30px; text-align:left; padding-left:5px;">
                            <asp:Label ID="Label10" runat="server" 
                                Text='<%# "數量：" + Eval("pdt_stocks") + Eval("pdt_units") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server" class="style1">
                        <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr ID="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="width:960px;text-align:center;">
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
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        SelectCommand="SELECT pdt_id, pdt_no, pdt_name, pdt_img1, pdt_price, pdt_content, pdt_stocks, pdt_units, pdt_sell FROM pdt WHERE (pdt_itemA = @pdt_itemA)">
        <SelectParameters>
            <asp:QueryStringParameter Name="pdt_itemA" QueryStringField="page" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>