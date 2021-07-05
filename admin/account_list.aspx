<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="account_list.aspx.cs" Inherits="user_account_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td class="style1">
            <h4>
                帳號列表</h4>
            </td>
        </tr>
        <tr>
            <td class="style1">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="text-align: right" width="80">查詢：</td>
                    <td width="100"><asp:DropDownList ID="ddlSelect" runat="server" CssClass="textbox" 
                            Width="90px">
                    <asp:ListItem Value="users_id">會員帳號</asp:ListItem>
                    <asp:ListItem Value="users_mail">電子郵件</asp:ListItem>
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
                    <td width="100">
                        <asp:DropDownList ID="ddlSRole" runat="server" AutoPostBack="True" 
                    CssClass="textbox" Width="90px" 
                            onselectedindexchanged="ddlUserRole_SelectedIndexChanged">
                </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
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
                    <asp:ListItem Value="users_role">依角色</asp:ListItem>
                    <asp:ListItem Value="users_id">依帳號</asp:ListItem>
                    <asp:ListItem Value="users_registerdate">依註冊日</asp:ListItem>
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
                <asp:GridView ID="usersGv" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BorderWidth="0px" EnableViewState="False" 
                    onpageindexchanging="usersGv_PageIndexChanging" 
                    onrowcommand="usersGv_RowCommand" PageSize="15" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="roles_name" HeaderText="角色">
                        <ItemStyle Height="30px" HorizontalAlign="Left" Width="100px" />
                        </asp:BoundField>
                        <asp:ButtonField CommandName="SELECT" DataTextField="users_id" HeaderText="帳號" 
                            Text="帳號">
                        <ItemStyle HorizontalAlign="Left" Width="150px" />
                        </asp:ButtonField>
                        <asp:BoundField DataField="users_mail" HeaderText="電子郵件">
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="users_registerdate" HeaderText="註冊日期">
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="users_logindate" HeaderText="最後登入">
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