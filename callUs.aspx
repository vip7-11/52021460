<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="callUs, App_Web_callus.aspx.cdcab7d2" %>

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

    <asp:FormView ID="FormView1" runat="server" DataSourceID="showCallUs" 
        EnableModelValidation="True">
        <ItemTemplate>
            <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("intor") %>'></asp:Literal>
            <br />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="showCallUs" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        SelectCommand="SELECT intor FROM page WHERE (name = '聯絡我們')">
    </asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>

