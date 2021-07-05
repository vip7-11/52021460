<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="e_paper_sending.aspx.cs" Inherits="admin_e_paper_sending" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td colspan="2" style="font-weight:700;font-size:16px;color:#1C1B6C">電子報管理</td>
    </tr>
    <tr>
        <td width="120px" align="right">電子報選擇：</td>
        <td>
            <asp:DropDownList ID="ddl_epaper" runat="server" DataSourceID="SqlDataSource1" 
                DataTextField="pm_title" DataValueField="sn" AppendDataBoundItems="True" 
                AutoPostBack="True" onselectedindexchanged="ddl_epaper_SelectedIndexChanged">
                <asp:ListItem Value="0">請選擇</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                SelectCommand="SELECT * FROM [e_paper] ORDER BY [pm_editdate]">
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td width="120px" align="right">寄送對象篩選：</td>
        <td>
            <table>
                <tr>
                    <td><asp:RadioButton ID="chk_member" runat="server" Text="寄給非會員" GroupName="ely" 
                            oncheckedchanged="chk_member_CheckedChanged" AutoPostBack="True"/>：<br />
                        <asp:Label ID="lbl1" runat="server"></asp:Label>
                    </td>
                    <td><asp:TextBox ID="txt_username" runat="server" Height="60px" 
                            TextMode="MultiLine" Width="310px"></asp:TextBox>
                        <br />
                        (輸入信箱，請以分號&lt;;&gt;做區隔)</td>
                </tr>
                <tr>
                    <td><asp:RadioButton ID="chk_unhappy" runat="server" Text="非會員但已申請寄信" 
                            GroupName="ely" oncheckedchanged="chk_unhappy_CheckedChanged" 
                            AutoPostBack="True"/>
                        <br />
                        <asp:Label ID="lbl2" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_username2" runat="server" Height="60px" 
                            TextMode="MultiLine" Width="310px"></asp:TextBox>
                            <br />
                            (輸入信箱，請以分號&lt;;&gt;做區隔)</td>
                </tr>
                <tr>
                    <td><asp:RadioButton ID="chk_allmb" runat="server" Text="全站會員寄信" GroupName="ely" 
                            oncheckedchanged="chk_allmb_CheckedChanged" AutoPostBack="True"/>
                        <br />
                        <asp:Label ID="lbl3" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_username3" runat="server" Height="60px" 
                            TextMode="MultiLine" Width="310px"></asp:TextBox>
                            <br />
                            (輸入信箱，請以分號&lt;;&gt;做區隔)</td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                SelectCommand="SELECT * FROM [mb_Group] ORDER BY [gp_id]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                SelectCommand="SELECT * FROM [mb_lv]"></asp:SqlDataSource>
            <br />
        </td>
    </tr>
    <tr>
        <td width="120px" align="right">&nbsp;</td>
        <td>
            <asp:Button ID="btn_send" runat="server" Text="確定寄信" onclick="btn_send_Click" OnClientClick="this.value='傳送中，勿重覆點擊';"/><br />
            (大量寄信時，按下按鈕後會有較長等待時間，請耐心等待，切勿重覆點擊)</td>
    </tr>
    <tr>
        <td width="120px" align="left">電子報預覽：</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lb_epaper_view" runat="server" Text=""></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>

