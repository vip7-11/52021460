<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="coupon.aspx.cs" Inherits="coupon" %>

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
    <img src="image/My Coupon-OK.bmp" border='0' />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" EnableModelValidation="True" 
        onrowdatabound="GridView1_RowDataBound" Width="100%">
        <Columns>
            <asp:BoundField DataField="name" HeaderText="名稱" SortExpression="name" />
            <asp:TemplateField HeaderText="優惠卷圖片">
                <ItemTemplate>
                    <asp:Literal ID="lt_img" runat="server"></asp:Literal>
                    <asp:Label ID="lbl_img" Text='<%# Eval("pic") %>' runat="server" Visible="false" />
                    <asp:Image ID="Image1" runat="server" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="430px" Height="230px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="下載" SortExpression="pic">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# "image/coupon/" + Eval("pic") %>' Text="下載優惠券" 
                        Target="_blank"></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BorderColor="#F585AA" Height="30px" HorizontalAlign="Center" />
        <RowStyle BorderColor="#F585AA" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        SelectCommand="SELECT [name], [pic] FROM [coupon]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>