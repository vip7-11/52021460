<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="messageboard.aspx.cs" Inherits="messageboard" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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

    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" 
        EnableModelValidation="True">
        <EmptyDataTemplate>
            無留言資料。
        </EmptyDataTemplate>
        <ItemTemplate>
            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") + "說：" %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="emailLabel" runat="server" Text="電子信箱" NavigateUrl='<%# "mailto:" + Eval("email") %>'></asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date", "{0:d}")%>' ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="introductionLabel" runat="server" Text='<%# Eval("introduction") %>' ></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <LayoutTemplate>
            <ul ID="itemPlaceholderContainer" runat="server" style="">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        
        SelectCommand="SELECT messageboard.introduction, messageboard.date, messageboard.remessageID, member.name, member.email FROM messageboard INNER JOIN member ON messageboard.remessageID = member.id WHERE (messageboard.id = @id) ORDER BY messageboard.num DESC">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="loginer_id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <FCKeditorV2:FCKeditor ID="newMessage" runat="server" BasePath="fckeditor/" ToolbarSet="Basic">
    </FCKeditorV2:FCKeditor>
    <br />
    <asp:Button ID="newMessageB" runat="server" Text="新增留言" 
        onclick="newMessageB_Click" />
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>

