<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="logistics.aspx.cs" Inherits="admin_logistics" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
    <asp:View ID="View1" runat="server">
        <asp:GridView ID="GV_logistics" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" EnableModelValidation="True" 
            DataKeyNames="id" onrowcommand="GV_logistics_RowCommand">
            <Columns>
                <asp:ButtonField CommandName="SELECT" DataTextField="id" HeaderText="序號" 
                    Text="序號"><ItemStyle HorizontalAlign="Left" Width="40px" /></asp:ButtonField>
                <asp:TemplateField HeaderText="物流廠商" SortExpression="name"><ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label></ItemTemplate><ItemStyle /></asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
            SelectCommand="SELECT * FROM [logistics]" >
        </asp:SqlDataSource>
    </asp:View>
    <asp:View ID="View2" runat="server">
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td style=" width:80px; text-align:right; height:30px;">
                    序號：
                </td>
                <td style=" text-align:left;">
                    <asp:Label ID="lbl_id" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style=" text-align:right; height:30px;">
                    物流廠商：
                </td>
                <td style=" text-align:left;">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <FCKeditorV2:FCKeditor ID="txtCon_name" runat="server" BasePath="../editor/" 
                        Height="350px" Value='<%# Bind("name") %>' Width="400" ToolbarSet="Default"></FCKeditorV2:FCKeditor>
                </td>
            </tr>
            <tr>
                <td style=" text-align:right; height:30px;">
                    超連結：
                </td>
                <td style=" text-align:left;">
                    <asp:TextBox ID="txt_link" runat="server" Width="350px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btn_ok" runat="server" Text="修改" onclick="btn_ok_Click" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btn_cancel" runat="server" Text="取消" 
                        onclick="btn_cancel_Click" />
                </td>
            </tr>
        </table>
    </asp:View>
</asp:MultiView>
</asp:Content>