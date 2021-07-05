<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="msg_add.aspx.cs" Inherits="admin_msg_add" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
        <table style="width:100%;">
            <tr>
                <td class="style1" colspan="2">
                <h4>
                    新增留言</h4>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 80px;">標題：</td>
                <td width="580">
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="textbox"   
                            MaxLength="25" Width="250px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td style="text-align: right; ">內容：</td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right; " class="style1" colspan="2">
                    <fckeditorv2:fckeditor ID="txtContent" runat="server" BasePath="../editor/" 
                        Height="350px" ToolbarSet="seo">
                    </fckeditorv2:fckeditor>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" class="style1" colspan="2">                    
                    <div style="text-align: center; padding: 5px;">
                        <asp:Button ID="btnAdd" runat="server" Text="新增" onclick="btnAdd_Click" 
                            Height="20px" />
                    </div>
                </td>
            </tr>
        </table>
</asp:Content>

