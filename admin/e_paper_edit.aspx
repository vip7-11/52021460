<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="e_paper_edit.aspx.cs" Inherits="admin_e_paper_edit" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td colspan="2" style="font-weight:700;font-size:16px;color:#1C1B6C">修改電子報</td>
    </tr>
    <tr>
        <td width="15%">標題：</td>
        <td width="85%">
            <asp:TextBox ID="txt_title" runat="server" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="vld_title" runat="server" 
                ErrorMessage="標題不可為空" ControlToValidate="txt_title" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>發佈日期：</td>
        <td>
            <asp:Label ID="lb_postdate" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <td>上次修改日期：</td>
        <td>
            <asp:Label ID="lb_editdate" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <td colspan="2">內容：</td>
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
            <asp:Button ID="btn_edit" runat="server" Text="修改完成" onclick="btn_edit_Click" />
        </td>
    </tr>
</table>
</asp:Content>

