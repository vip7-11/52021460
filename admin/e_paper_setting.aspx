<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="e_paper_setting.aspx.cs" Inherits="admin_e_paper_setting" %>

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
        <td width="20%" style="height:40px">
            <asp:Button ID="Button1" runat="server" Text="新增電子報" onclick="Button1_Click" />
        </td>
        <td width="80%"></td>
    </tr>
    <tr>
        <td colspan="2">
            <table border="0" width="100%" cellpadding="0" cellspacing="0" style="text-align:left">
                <tr style="background-color:#e8e8e8">
                    <td width="120px">發佈日期</td>
                    <td>標題</td>
                    <td width="50px">修改</td>
                    <td width="50px">刪除</td>
                </tr>
                <asp:Literal ID="lt_list" runat="server"></asp:Literal>
            </table>
            
        </td>
    </tr>
</table>
</asp:Content>

