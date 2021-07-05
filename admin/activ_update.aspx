<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="activ_update.aspx.cs" Inherits="user_activ_update" %>
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
                    編輯活動</h4>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 80px;">名稱：</td>
                <td style="width: 580px">
                        <asp:TextBox ID="txtactivTitle" runat="server" CssClass="textbox"   
                            MaxLength="25" Width="250px"></asp:TextBox>
                        <asp:Label ID="lblactivId" runat="server" Text="lblactivId" Visible="False"></asp:Label>
                        <asp:Label ID="lblactivimg" runat="server" Text="lblactivimg" Visible="False"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td style="text-align: right; ">狀態：</td>
                <td>
                        <asp:RadioButton ID="rdoactivStateA" runat="server" GroupName="activState" 
                            Text="顯示" Checked="True" />
                        <asp:RadioButton ID="rdoactivStateB" runat="server" GroupName="activState" 
                            Text="隱藏" />
                        </td>
            </tr>
            <tr>
                <td style="text-align: right; ">圖片：</td>
                <td>
                        <asp:FileUpload runat="server" CssClass="fileupload" ID="fudActivImg"></asp:FileUpload>
                        &nbsp;<asp:Button ID="btnUpload" runat="server" Text="上傳" Height="20px" 
                            onclick="btnUpload_Click" />
                        &nbsp;<span class="warning">如須更換圖檔，才須重新上傳圖片</span></td>
            </tr>
            <tr>
                <td style="text-align: right; ">&nbsp;</td>
                <td>
                        <asp:Image ID="actimg" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right; ">內容：</td>
                <td>
                        &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: right; " class="style1" colspan="2">
                    <fckeditorv2:fckeditor ID="txtactivContent" runat="server" BasePath="../editor/" 
                        Height="540px" ToolbarSet="user_advance">
                    </fckeditorv2:fckeditor>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" class="style1" colspan="2">                    
                    <div style="text-align: center; padding: 5px;">
                        <asp:Button ID="btnactivUpdate" runat="server" Text="修改" onclick="btnactivUpdate_Click" 
                            Height="20px" />
                    &nbsp;<asp:Button ID="btnactivDelete" runat="server" Text="刪除" Height="20px" 
                            onclick="btnactivDelete_Click" 
                            OnClientClick="if(confirm('確定刪除？')==false) return false;"/>
                    &nbsp;<asp:Button ID="btnactivBack" runat="server" Text="回上頁" onclick="btnactivBack_Click" 
                            Height="20px" />
                    </div>
                </td>
            </tr>
        </table>
</asp:Content>

