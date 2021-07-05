<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="aboutUs.aspx.cs" Inherits="aboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="all" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner_up" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="banner_down" Runat="Server">
    <%--<asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource1" 
        EnableModelValidation="True" ondatabound="FormView2_DataBound" 
        onitemcreated="FormView2_ItemCreated">
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        SelectCommand="SELECT intor FROM page WHERE (name = '關於我們')"></asp:SqlDataSource>--%>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="nav" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="main" Runat="Server">
    <asp:SqlDataSource ID="showAboutUs" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        SelectCommand="SELECT intor FROM page WHERE (name = '關於我們')"></asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="showAboutUs" 
        EnableModelValidation="True">
        <ItemTemplate>
            <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("intor") %>'></asp:Literal>
            <br />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>

