<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="login, App_Web_login.aspx.cdcab7d2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
* { margin: 0; padding: 0; outline: 0; }
.style1
{
    height: 30px;
}    
.warning
{
    color: #FF0000;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="all" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner_up" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="banner_down" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="nav" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="main" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
        
                    <td style=" width:80px; text-align:right; height:30px;">
                        帳號：</td>
                    <td style=" text-align:left;">
                        <asp:TextBox ID="txtL_id" runat="server" CssClass="textbox" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style=" text-align:right; height:30px;">
                        密碼：</td>
                    <td style=" text-align:left;">
                        <asp:TextBox ID="txtL_password" runat="server" CssClass="textbox" 
                            Width="150px" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style=" text-align:left;">
                        <asp:Label ID="lblL_msg" runat="server" ForeColor="Red" Text="lblL_msg" 
                            Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style=" text-align:left; height:30px;">
                        <asp:Button ID="logingOK" runat="server" Text="確認" onclick="logingOK_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_passwd" runat="server" Text="忘記密碼" 
                            onclick="btn_passwd_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
        
                    <td style=" width:80px; text-align:right; height:30px;">
                        帳號：</td>
                    <td style=" text-align:left;">
                        <asp:TextBox ID="txt_id" runat="server" CssClass="textbox" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style=" text-align:right; height:30px;">
                        電子郵件：</td>
                    <td style=" text-align:left;">
                        <asp:TextBox ID="txt_email" runat="server" CssClass="textbox" 
                            Width="150px"></asp:TextBox>
                        <span class="warning">請填入您註冊時所輸入的電子郵件。</span>
                        <asp:RegularExpressionValidator ID="revCheckEmail" runat="server" 
                            ControlToValidate="txt_email" ErrorMessage="電子郵件格式錯誤。" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style=" text-align:left;">
                        <asp:Label ID="lblL_msg2" runat="server" ForeColor="Red" Text="lblL_msg" 
                            Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style=" text-align:left; height:30px;">
                        <asp:Button ID="btn_forgetpasswd" runat="server" Text="確認" 
                            onclick="btn_forgetpasswd_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btn_cnl" runat="server" Text="取消" onclick="btn_cnl_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>