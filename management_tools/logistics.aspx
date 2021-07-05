<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="management_tools_logistics, App_Web_logistics.aspx.8728bb32" %>

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

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" EnableModelValidation="True" 
        DataKeyNames="id">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="序號" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:TemplateField HeaderText="物流廠商" SortExpression="name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="../fckeditor/" 
                        Height="350px" Value='<%# Bind("name") %>' Width="400" ToolbarSet="Default">
                    </FCKeditorV2:FCKeditor>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="url" HeaderText="超連結" SortExpression="url" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        DeleteCommand="DELETE FROM [logistics] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [logistics] ([name], [url]) VALUES (@name, @url)" 
        SelectCommand="SELECT * FROM [logistics]" 
        UpdateCommand="UPDATE [logistics] SET [name] = @name, [url] = @url WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="url" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="url" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>