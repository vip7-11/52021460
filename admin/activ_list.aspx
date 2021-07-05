<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="activ_list.aspx.cs" Inherits="user_activ_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
        <table style="width:100%;">
            <tr>
                <td class="style1">
                <h4>
                    活動清單</h4>
                </td>
            </tr>
            <tr>
                <td class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td style="text-align: right" width="80">查詢：</td>
                        <td width="100"><asp:DropDownList ID="ddlSelect" runat="server" CssClass="textbox" 
                                Width="90px">
                        <asp:ListItem Value="activ_title">標題</asp:ListItem>
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
                        <td style="text-align: right" width="80">篩選：</td>
                        <td>
                        <asp:CheckBox ID="chkactiv_stateA" runat="server" Text="顯示" AutoPostBack="True" 
                                Checked="True" oncheckedchanged="chkpdt_stateA_CheckedChanged" />
                        <asp:CheckBox ID="chkactiv_stateB" runat="server" Text="隱藏" AutoPostBack="True" 
                                Checked="True" oncheckedchanged="chkactiv_stateB_CheckedChanged" />
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
                                <asp:ListItem Value="activ_id">依系統編號</asp:ListItem>
                        <asp:ListItem Value="activ_state">依狀態</asp:ListItem>
                        <asp:ListItem Value="activ_date">依發表日</asp:ListItem>
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
                    <asp:GridView ID="activGv" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BorderWidth="0px" 
                        onpageindexchanging="activGv_PageIndexChanging" onrowcommand="activGv_RowCommand" 
                        onrowcreated="activGv_RowCreated" PageSize="15" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="activ_id" HeaderText="編號" SortExpression="activ_id">
                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="activstate_name" HeaderText="狀態" 
                                SortExpression="activstate_name">
                            <ItemStyle HorizontalAlign="Center" Width="70px" Height="30px" />
                            </asp:BoundField>
                            <asp:ButtonField CommandName="SELECT" DataTextField="activ_title" 
                                HeaderText="標題" SortExpression="activ_title" Text="標題">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="activ_date" HeaderText="發表日期" 
                                SortExpression="activ_date">
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