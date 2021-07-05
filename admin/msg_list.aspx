<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="msg_list.aspx.cs" Inherits="admin_msg_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
        <table style="width:100%;">
            <tr>
                <td class="style1">
                <h4>
                    留言清單</h4>
                </td>
            </tr>
            <tr>
                <td class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td style="text-align: right" width="80">查詢：</td>
                        <td width="100"><asp:DropDownList ID="ddlSelect" runat="server" CssClass="textbox" 
                                Width="90px">
                        <asp:ListItem Value="msg_title">標題</asp:ListItem>
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
                                <asp:ListItem Value="msg_no">依系統編號</asp:ListItem>
                        <asp:ListItem Value="msg_date">依發表日</asp:ListItem>
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
                    <asp:GridView ID="msgGv" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BorderWidth="0px" PageSize="15" Width="100%" 
                        onrowcommand="msgGv_RowCommand" 
                        onpageindexchanging="msgGv_PageIndexChanging" onrowcreated="msgGv_RowCreated">
                        <Columns>
                            <asp:BoundField DataField="msg_no" HeaderText="編號" SortExpression="msg_no">
                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="msg_author" HeaderText="作者" 
                                SortExpression="msg_author">
                            <ItemStyle Height="30px" HorizontalAlign="Center" Width="120px" />
                            </asp:BoundField>
                            <asp:ButtonField CommandName="SELECT" DataTextField="msg_title" 
                                HeaderText="標題" SortExpression="msg_title" Text="標題">
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="msg_date" HeaderText="發表日期" 
                                SortExpression="msg_date">
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="msg_time" HeaderText="發表時間" 
                                SortExpression="msg_time">
                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                            </asp:BoundField>
                            <asp:ButtonField CommandName="REPLY" HeaderText="查看回覆" Text="觀看">
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                            </asp:ButtonField>
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