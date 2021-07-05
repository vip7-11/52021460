<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="pdt_list.aspx.cs" Inherits="user_pdt_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
        <table style="width:100%;">
            <tr>
                <td class="style1">
                <h4>
                    商品清單</h4>
                </td>
            </tr>
            <tr>
                <td class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td style="text-align: right" width="80">查詢：</td>
                        <td width="100"><asp:DropDownList ID="ddlSelect" runat="server" CssClass="textbox" 
                                Width="90px">
                        <asp:ListItem Value="pdt_name">商品名稱</asp:ListItem>
                        <asp:ListItem Value="pdt_id">商品編號</asp:ListItem>
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
                            <asp:DropDownList ID="ddlSitemA" runat="server" AutoPostBack="True" 
                                CssClass="textbox" onselectedindexchanged="ddlUserRole_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                </td> 
            </tr> 
            <tr>
                <td class="style1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td style="text-align: right" width="80">&nbsp;</td>
                        <td>
                        <%--<asp:CheckBox ID="chkpdt_stateA" runat="server" Text="新品" AutoPostBack="True" 
                                Checked="True" oncheckedchanged="chkpdt_stateA_CheckedChanged" />
                        <asp:CheckBox ID="chkpdt_stateB" runat="server" Text="限量" AutoPostBack="True" 
                                Checked="True" oncheckedchanged="chkpdt_stateB_CheckedChanged" />
                        <asp:CheckBox ID="chkpdt_stateC" runat="server" Text="暢銷" AutoPostBack="True" 
                                Checked="True" oncheckedchanged="chkpdt_stateC_CheckedChanged" />--%>
                        <asp:CheckBox ID="chkpdt_stateD" runat="server" Text="隱藏" AutoPostBack="True" 
                                oncheckedchanged="chkpdt_stateC_CheckedChanged" />
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
                        <asp:ListItem Value="pdt_id">依編號</asp:ListItem>
                        <asp:ListItem Value="pdt_itemA">依分類</asp:ListItem>
                        <asp:ListItem Value="pdt_stocks">依庫存</asp:ListItem>
                    </asp:DropDownList>
                        </td>
                        <td width="120">
                    <asp:RadioButtonList ID="rblOrderBy" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="rbl_order_SelectedIndexChanged" 
                        RepeatDirection="Horizontal" Width="106px">
                        <asp:ListItem Selected="True" Value="ASC">遞增</asp:ListItem>
                        <asp:ListItem Value="DESC">遞減</asp:ListItem>
                    </asp:RadioButtonList>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:GridView ID="pdtGv" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BorderWidth="0px" EnableViewState="False" 
                        PageSize="15" Width="100%" onpageindexchanging="pdtGv_PageIndexChanging" 
                        onrowcommand="pdtGv_RowCommand" onrowcreated="pdtGv_RowCreated">
                        <Columns>
                            <asp:BoundField DataField="pdt_no" HeaderText="系統編號">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pdt_id" HeaderText="編號">
                            <ItemStyle HorizontalAlign="Left" Width="110px" Height="30px" />
                            </asp:BoundField>
                            <asp:ButtonField CommandName="SELECT" DataTextField="pdt_name" HeaderText="名稱" 
                                Text="名稱">
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="itemA_name" HeaderText="分類">
                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pdt_sell" HeaderText="售價">
                            <ItemStyle HorizontalAlign="Right" Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pdt_stocks" HeaderText="庫存">
                            <ItemStyle HorizontalAlign="Right" Width="50px" />
                            </asp:BoundField>
                            <%--<asp:BoundField DataField="pdt_count" HeaderText="人氣">
                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </asp:BoundField>--%>
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