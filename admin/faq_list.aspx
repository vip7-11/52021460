<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="faq_list.aspx.cs" Inherits="admin_faq_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td class="style1">
            <h4>
                FAQ清單</h4>
            </td>
        </tr>
        <tr>
            <td class="style1">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="text-align: right" width="80">查詢：</td>
                    <td width="100"><asp:DropDownList ID="ddlSelect" runat="server" CssClass="textbox" 
                            Width="90px">
                    <asp:ListItem Value="faq_title">標題</asp:ListItem>
                </asp:DropDownList>
                    </td>
                    <td>
                    <asp:TextBox ID="txtSelect" runat="server" CssClass="textbox" MaxLength="20" 
                        Width="150px"></asp:TextBox>
                    &nbsp;<asp:Button ID="btnSelect" runat="server" Height="20px" Text="搜尋" 
                            onclick="btnSelect_Click" />
                    </td>
                </tr>
            </table>
            </td>
        </tr>
        <tr>
            <td class="style1">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="text-align: right" width="80">排序：</td>
                    <td width="100">
                        <asp:DropDownList ID="ddlOrderBy" runat="server" AutoPostBack="True" 
                    CssClass="textbox" Width="90px" 
                            onselectedindexchanged="ddlOrderBy_SelectedIndexChanged">
                            <asp:ListItem Value="faq_no">依系統編號</asp:ListItem>
                    <asp:ListItem Value="faq_date">依發表日</asp:ListItem>
                </asp:DropDownList>
                    </td>
                    <td width="120">
                <asp:RadioButtonList ID="rblOrderBy" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="rbl_order_SelectedIndexChanged" 
                    RepeatDirection="Horizontal" Width="106px">
                    <asp:ListItem Value="ASC">遞增</asp:ListItem>
                    <asp:ListItem Value="DESC" Selected="True">遞減</asp:ListItem>
                </asp:RadioButtonList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:GridView ID="faqGv" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BorderWidth="0px" PageSize="15" Width="100%" 
                    onrowcommand="faqGv_RowCommand" 
                    onpageindexchanging="faqGv_PageIndexChanging" onrowcreated="faqGv_RowCreated">
                    <Columns>
                        <asp:BoundField DataField="faq_no" HeaderText="編號" SortExpression="faq_no">
                        <ItemStyle HorizontalAlign="Center" Width="70px" />
                        </asp:BoundField>
                        <asp:ButtonField CommandName="SELECT" DataTextField="faq_title" 
                            HeaderText="標題" SortExpression="faq_title" Text="標題">
                        <ItemStyle HorizontalAlign="Left" Height="30px" />
                        </asp:ButtonField>
                        <asp:BoundField DataField="faq_date" HeaderText="發表日期" 
                            SortExpression="faq_date">
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="faq_time" HeaderText="發表時間" 
                            SortExpression="faq_time">
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle BackColor="#CCCCCC" Height="30px" HorizontalAlign="Center" />
                    <PagerSettings FirstPageText="第一頁" LastPageText="最末頁" Mode="NumericFirstLast" 
                        NextPageText="下一頁" PreviousPageText="上一頁" />
                    <PagerStyle HorizontalAlign="Center" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>