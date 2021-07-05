<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="msg_update.aspx.cs" Inherits="admin_msg_update" %>
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
                    編輯留言</h4>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 80px;">標題：</td>
                <td style="width: 580px">
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="textbox"   
                            MaxLength="25" Width="250px"></asp:TextBox>
                        <asp:Label ID="lblmsg_no" runat="server" Text="lblmsg_no" Visible="False"></asp:Label>
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
                        <asp:Button ID="btnUpdate" runat="server" Text="更新" onclick="btnUpdate_Click" 
                            Height="20px" />
                    &nbsp;<asp:Button ID="btnDelete" runat="server" Text="刪除" Height="20px" 
                            onclick="btnDelete_Click" 
                            OnClientClick="if(confirm('確定刪除？')==false) return false;"/>
                    &nbsp;<asp:Button ID="btnBack" runat="server" Text="回上頁" onclick="btnBack_Click" 
                            Height="20px" />
                    </div>
                </td>
            </tr>
        </table>
</asp:Content>

