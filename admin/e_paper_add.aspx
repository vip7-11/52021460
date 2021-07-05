<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="e_paper_add.aspx.cs" Inherits="admin_e_paper_add" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td colspan="2" style="font-weight:700;font-size:16px;color:#1C1B6C">新增電子報</td>
    </tr>
    <tr>
        <td width="15%" class="style1">標題：</td>
        <td width="85%" class="style1">
            <asp:TextBox ID="txt_title" runat="server" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="vld_title" runat="server" 
                ErrorMessage="標題不可為空" ControlToValidate="txt_title" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>內容：</td>
        <td align="right">
            發佈時間：<asp:Label ID="lb_todate" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <FCKeditorV2:FCKeditor ID="text_newpromote" runat="server" 
                BasePath="../editor/" ToolbarSet="user_advance" Width="95%" Height="300px">
            </FCKeditorV2:FCKeditor>
        </td>
    </tr>
    <tr>
        <td width="15%"></td>
        <td width="85%">
            <asp:Button ID="btn_add" runat="server" Text="確定新增" onclick="btn_add_Click" />
        </td>
    </tr>
</table>
</asp:Content>

