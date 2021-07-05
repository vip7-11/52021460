<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="user_edit.aspx.cs" Inherits="user_edit" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="form" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="all" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="banner_up" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="banner_down" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="nav" Runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="main" Runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
        <tr>
            <td height="30">
                <span style=" color:#787878; font-size:14pt;">會員資料修改</span></td>
        </tr>
        <tr>
            <td style="padding: 10px; border-style: dashed; border-width: 1px; border-color: #cbcbcb;">
        <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="text-align: right; " class="style1">帳號：</td>
                <td>                        
                    <asp:Label ID="lblUserId" runat="server" CssClass="textbox" 
                        Width="150px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;" class="style1">修改密碼：</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" 
                        TextMode="Password" Width="150px"></asp:TextBox>
                    <asp:Label ID="lblPassword" runat="server" CssClass="warning" 
                        Text="密碼最短長度為6個字元。"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;" class="style1">密碼確認：</td>
                <td>
                    <asp:TextBox ID="txtPasswordRe" runat="server" CssClass="textbox" 
                            TextMode="Password" Width="150px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtPassword" ControlToValidate="txtPasswordRe" 
                    ErrorMessage="密碼不符！"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; " class="style1">身分證：</td>
                <td>
                        <asp:TextBox ID="txtUserPID" runat="server" CssClass="textbox" Width="150px" 
                            ReadOnly="True"></asp:TextBox>
                        <span  class="warning">*</span>
                        <asp:Label ID="lblCheckID" runat="server" CssClass="warning"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td style="text-align: right; " class="style1">電子郵件：</td>
                <td>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" Width="280px"></asp:TextBox>
                        <span  class="warning">*</span>
                        <asp:Label ID="lblCheckEmail" runat="server" CssClass="warning"></asp:Label>
                        <asp:RegularExpressionValidator ID="revCheckEmail" runat="server" 
                            ControlToValidate="txtEmail" ErrorMessage="電子郵件格式錯誤" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td style="text-align: right; " class="style1">姓名：</td>
                <td>
                        <asp:TextBox ID="txtName" runat="server" CssClass="textbox" 
                            Width="150px"></asp:TextBox>
                        <span  class="warning">*</span></td>
            </tr>
            <tr>
                <td style="text-align: right; " class="style1">暱稱：</td>
                <td class="style2">
                        <asp:TextBox ID="txtNickname" runat="server" CssClass="textbox" 
                            Width="150px"></asp:TextBox>
                        </td>
            </tr>
            <tr>
                <td style="text-align: right; " class="style1">性別：</td>
                <td>
                        <asp:RadioButton ID="rdoUserSexMale" runat="server" GroupName="UserSex" 
                            Text="男" Checked="True" />
                        <asp:RadioButton ID="rdoUserSexFemale" runat="server" GroupName="UserSex" 
                            Text="女" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right; " class="style1">生日：</td>
                <td>
                        <asp:TextBox ID="txtBirthday" runat="server" CssClass="textbox" 
                            Width="150px"></asp:TextBox>                       
                        <ajaxToolkit:CalendarExtender ID="txtBirthday_CalendarExtender" runat="server" 
                            TargetControlID="txtBirthday" Format="yyyy/MM/dd" DefaultView="Years">
                        </ajaxToolkit:CalendarExtender>                       
                        </td>
            </tr>
            <tr>
                <td style="text-align: right; " class="style1">聯絡電話：</td>
                <td>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox" 
                            Width="150px"></asp:TextBox>
                        </td>
            </tr>
            <tr>
                <td style="text-align: right; " class="style1">行動電話：</td>
                <td>
                        <asp:TextBox ID="txtCellphone" runat="server" CssClass="textbox" 
                            Width="150px"></asp:TextBox>
                        </td>
            </tr>
            <%--<tr>
                <td style="text-align: right; " class="style1">傳真：</td>
                <td>
                        <asp:TextBox ID="txtFax" runat="server" CssClass="textbox" 
                            Width="150px"></asp:TextBox>
                        </td>
            </tr>--%>
            <tr>
                <td style="text-align: right; " class="style1">地址：</td>
                <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource5" DataTextField="city_area" 
                            DataValueField="city_no" CssClass="textbox">
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddlVillage" runat="server" CssClass="textbox" 
                                    DataSourceID="SqlDataSource6" DataTextField="village_area" 
                                    DataValueField="postal_no">
                                </asp:DropDownList>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        </td>
            </tr>
            <%--<tr>
                <td style="text-align: right; " class="style1"></td>
                <td>
                    <asp:CheckBox ID="cbEpaper" runat="server" Text="是否接收電子報" />
                </td>
            </tr>--%>
            <tr>
                <td style="text-align: center; " class="style1" colspan="2">
                    <asp:Label ID="lblAddUserMsg" runat="server" Font-Bold="True" ForeColor="Red" 
                        Text="*為必填欄位！"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" colspan="2">                    
                    <div style="text-align: center; padding: 5px;">
                        <asp:Button ID="btnRegister" runat="server" Text="修改" Height="20px" 
                            onclick="btnRegister_Click" />
                    &nbsp;<asp:Button ID="btnCancel" runat="server" Text="取消" Height="20px" 
                            onclick="btnCancel_Click" />
                    </div>
                </td>
            </tr>
        </table>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                    SelectCommand="SELECT * FROM [city_village] WHERE ([city_no] = @city_no) ORDER BY [postal_no]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCity" Name="city_no" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                    SelectCommand="SELECT * FROM [city_area] ORDER BY [city_no]">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>