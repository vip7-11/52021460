<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="management_tools_callUs_M, App_Web_callus_m.aspx.8728bb32" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="form" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="all" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="main" Runat="Server">

    <asp:FormView ID="FormView1" runat="server" DataSourceID="callUs" 
        EnableModelValidation="True">
        <EditItemTemplate>
            聯絡我們：<br /> 
            <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="200px" 
                Value='<%# Bind("intor") %>' Width="900px" BasePath="../fckeditor/" ToolbarSet="Default">
            </FCKeditorV2:FCKeditor>
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
        </EditItemTemplate>
        <InsertItemTemplate>
            intor:
            <asp:TextBox ID="intorTextBox" runat="server" Text='<%# Bind("intor") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="插入" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
        </InsertItemTemplate>
        <ItemTemplate>
            聯絡我們：<br /> 
            <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("intor") %>'></asp:Literal>
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="編輯" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="callUs" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        SelectCommand="SELECT intor FROM page WHERE (name = '聯絡我們')" 
        UpdateCommand="UPDATE page SET intor = @intor WHERE (name = '聯絡我們')">
        <UpdateParameters>
            <asp:Parameter Name="intor" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

