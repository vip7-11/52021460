<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="account_update.aspx.cs" Inherits="user_account_update" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
    <script language="javascript" type="text/javascript">
        function changMode(sender, args) {
            sender._switchMode("years", true);
        }
    </script>
    <style type="text/css">
        .style1
        {
            width: 110px;
            height: 25px;
        }
        .style2
        {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
        <table style="width:100%;">
            <tr>
                <td colspan="2">
                <h4>
                    帳號資料</h4>
                </td>
            </tr>            
            <tr>
                <td style="text-align: right; " class="style1">帳號：</td>
                <td class="style2">
                    <asp:Label ID="lblUserId" runat="server" Text="lblUserId"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 110px;">密碼：</td>
                <td>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" 
                            TextMode="Password" Width="150px"></asp:TextBox>
                        <asp:Button ID="btnResetPassword" runat="server" Height="20px" 
                            onclick="btnResetPassword_Click" Text="重設密碼" />
                        <asp:Label ID="lblPassword" runat="server" CssClass="warning" 
                            Text="密碼最短長度為6個字元。"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 110px;">角色：</td>
                <td>
                    <asp:DropDownList ID="ddlUserRole" runat="server" CssClass="textbox" 
                        DataSourceID="SqlDataSource7" DataTextField="roles_name" 
                        DataValueField="roles_no">
                    </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 110px;">電子郵件：</td>
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
                <td style="text-align: right; width: 110px;">身分證：</td>
                <td>
                        <asp:TextBox ID="txtUserPID" runat="server" CssClass="textbox" Width="150px"></asp:TextBox>
                        <span  class="warning">*</span>
                        <asp:Label ID="lblCheckID" runat="server" CssClass="warning"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 110px;">姓名：</td>
                <td>
                        <asp:TextBox ID="txtName" runat="server" CssClass="textbox" 
                            Width="150px"></asp:TextBox>
                        </td>
            </tr>
            <tr>
                <td style="text-align: right; " class="style2">暱稱：</td>
                <td class="style2">
                        <asp:TextBox ID="txtNickname" runat="server" CssClass="textbox" 
                            Width="150px"></asp:TextBox>
                        </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 110px;">性別：</td>
                <td>
                        <asp:RadioButton ID="rdoUserSexMale" runat="server" GroupName="UserSex" 
                            Text="男" />
                        <asp:RadioButton ID="rdoUserSexFemale" runat="server" GroupName="UserSex" 
                            Text="女" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 110px;">生日：</td>
                <td>
                        <asp:TextBox ID="txtBirthday" runat="server" CssClass="textbox" 
                            Width="150px"></asp:TextBox>                       
                        <ajaxToolkit:CalendarExtender ID="txtBirthday_CalendarExtender" runat="server" 
                            TargetControlID="txtBirthday" Format="yyyy/MM/dd" DefaultView="Years">
                        </ajaxToolkit:CalendarExtender>                       
                        </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 110px;">聯絡電話：</td>
                <td>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox" 
                            Width="150px"></asp:TextBox>
                        </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 110px;">行動電話：</td>
                <td>
                        <asp:TextBox ID="txtCellphone" runat="server" CssClass="textbox" 
                            Width="150px"></asp:TextBox>
                        </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 110px;">傳真：</td>
                <td>
                        <asp:TextBox ID="txtFax" runat="server" CssClass="textbox" 
                            Width="150px"></asp:TextBox>
                        </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 110px;">地址：</td>
                <td>
                        <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource5" DataTextField="city_area" 
                            DataValueField="city_no" CssClass="textbox">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlVillage" runat="server" DataSourceID="SqlDataSource6" 
                            DataTextField="village_area" DataValueField="postal_no" CssClass="textbox">
                        </asp:DropDownList>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="textbox" 
                            Width="300px"></asp:TextBox>
                        </td>
            </tr>
            <tr>
                <td style="text-align: right; height:25px;">
                    是否驗證：</td>
                <td>
                    <asp:Label ID="lblcheck" runat="server"></asp:Label>
                </td>
            </tr>
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
                <td style="text-align: center;" colspan="2">                    
                    <div style="text-align: center; padding: 5px;">
                        <asp:Button ID="btnUserSubmit" runat="server" Text="更新" Height="20px" 
                            onclick="btnUserSubmit_Click" />
                    &nbsp;<asp:Button ID="btnUserDelete" runat="server" Text="刪除" Height="20px" 
                            onclick="btnUserDelete_Click" OnClientClick="if(confirm('確定刪除？')==false) return false;"/>
                    &nbsp;<asp:Button ID="btnUserBack" runat="server" Text="回上頁" Height="20px" 
                            onclick="btnUserBack_Click" />
                    </div>
                </td>
            </tr>
        </table>
                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
            SelectCommand="select * from roles where roles_no &lt;&gt; '00' order by roles_no DESC">
        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                            SelectCommand="SELECT * FROM [city_village] WHERE ([city_no] = @city_no) ORDER BY [postal_no]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlCity" Name="city_no" PropertyName="SelectedValue" Type="Int64" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                            SelectCommand="SELECT * FROM [city_area] ORDER BY [city_no]">
                        </asp:SqlDataSource>
                        </asp:Content>

