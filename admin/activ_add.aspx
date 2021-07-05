<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="activ_add.aspx.cs" Inherits="user_activ_add" %>
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
                    新增活動</h4>
                </td>
            </tr>
            <tr>
                    <td colspan="2" align="left"><div style="border: solid 1px #ccc; background-color: #ffe; padding: 3px;  line-height: 22px; margin: 3px">
                        1. 您必需上傳一張圖片。<br />
                        2. 圖片最適大小為：寬度 
                        180 (像素)，高度 250 (像素)。<br />3. 圖片大小如超過最適大小，將會自動壓縮成最適大小。</div></td>
                </tr>
            <tr>
                <td style="text-align: right; width: 80px;">標題：</td>
                <td style="width: 580px">
                        <asp:TextBox ID="txtactivTitle" runat="server" CssClass="textbox"   
                            MaxLength="25" Width="250px"></asp:TextBox>
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
                        <asp:Button ID="btnAdd" runat="server" Text="新增" onclick="btnAdd_Click" 
                            Height="20px" />
                    </div>
                </td>
            </tr>
        </table>
</asp:Content>

