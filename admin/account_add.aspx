<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="account_add.aspx.cs" Inherits="user_account_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
        <table style="width:100%;">
            <tr>
                <td class="style1" colspan="2">
                <h4>
                    新增帳號</h4>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 80px;">角色：</td>
                <td>
                    <asp:DropDownList ID="ddlAddUserRole" runat="server" CssClass="textbox" 
                        DataSourceID="SqlDataSource1" DataTextField="roles_name" 
                        DataValueField="roles_no">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                        SelectCommand="SELECT * FROM [roles] ORDER BY [roles_no]">
                    </asp:SqlDataSource>
                    </td>
            </tr>
            <tr>
                <td style="text-align: right; ">帳號：</td>
                <td>
                        <asp:TextBox ID="txtUserId" runat="server" CssClass="textbox" MaxLength="20" 
                            Width="150px"></asp:TextBox>
                        <span  class="warning">*</span>
                        <asp:Button ID="btnCheckAccount" runat="server" Text="檢查" Height="20px" 
                            onclick="btnCheckAccount_Click" />
                        <asp:Label ID="lblCheckAccount" runat="server" CssClass="warning"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td style="text-align: right; ">密碼：</td>
                <td>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" 
                            TextMode="Password" Width="150px"></asp:TextBox>
                        <span  class="warning">*</span>
                        <asp:Label ID="lblPassword" runat="server" CssClass="warning" 
                            Text="密碼最短長度為6個字元。"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td style="text-align: right; ">確認密碼：</td>
                <td>
                        <asp:TextBox ID="txtPasswordConfirm" runat="server" CssClass="textbox" 
                            TextMode="Password" Width="150px"></asp:TextBox>
                        <span  class="warning">*</span>
                        <asp:CompareValidator ID="cvtPasswordComfirm" runat="server" 
                            ControlToCompare="txtPassword" ControlToValidate="txtPasswordConfirm" 
                            ErrorMessage="密碼不符！"></asp:CompareValidator>
                    </td>
            </tr>
            <tr>
                <td style="text-align: right; ">電子郵件：</td>
                <td>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" Width="280px"></asp:TextBox>
                        <span class="warning">*</span>
                        <asp:Label ID="lblCheckEmail" runat="server" CssClass="warning"></asp:Label>
                        <asp:RegularExpressionValidator ID="revCheckEmail" runat="server" 
                            ControlToValidate="txtEmail" ErrorMessage="電子郵件格式錯誤" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td style="text-align: right; ">身分證：</td>
                <td>
                        <asp:TextBox ID="txtAddUserPID" runat="server" CssClass="textbox" Width="150px"></asp:TextBox>
                        <span  class="warning">*</span>
                        <asp:Label ID="lblCheckID" runat="server" CssClass="warning"></asp:Label>
                    </td>
            </tr>
            <%--<tr>
                <td style="text-align: right; "></td>
                <td>
                    <asp:CheckBox ID="cbEpaper" runat="server" Text="是否接收電子報" />
                </td>
            </tr>--%>
            <tr>
                <td style="text-align:right;">備註：</td>
                <td><span class="warning">*字數300字為限</span></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="txt_memo" runat="server" Height="100px" TextMode="MultiLine" 
                        Width="100%" MaxLength="300"></asp:TextBox></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: center; " class="style1" colspan="2">
                    <asp:Label ID="lblAddUserMsg" runat="server" Font-Bold="True" ForeColor="Red" 
                        Text="*為必填欄位！"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" class="style1" colspan="2">                    
                    <div style="text-align: center; padding: 5px;">
                        <asp:Button ID="btnAddUserSubmit" runat="server" Text="新增" Height="20px" 
                            onclick="btnAddUserSubmit_Click" />
                    &nbsp;<asp:Button ID="btnAddUserCancel" runat="server" Text="重設" Height="20px" 
                            onclick="btnAddUserCancel_Click" />
                    </div>
                </td>
            </tr>
        </table>
</asp:Content>

