<%@ page title="" language="C#" masterpagefile="~/management_tools/MasterPage.master" autoeventwireup="true" inherits="management_tools_banner_M, App_Web_banner_m.aspx.8728bb32" %>

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
        DataKeyNames="id" DataSourceID="SqlDataSource1" 
        EnableModelValidation="True" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField SelectText="修改" ShowSelectButton="True" />
            <asp:BoundField DataField="id" HeaderText="序號" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:TemplateField HeaderText="圖片" SortExpression="pic">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pic") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" 
                        ImageUrl='<%# "../image/lelecoco/" + Eval("pic") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        DeleteCommand="DELETE FROM [banner] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [banner] ([pic]) VALUES (@pic)" 
        SelectCommand="SELECT * FROM [banner]" 
        UpdateCommand="UPDATE [banner] SET [pic] = @pic WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="pic" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="pic" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Panel ID="Panel1" runat="server" Visible="false">
        <asp:FileUpload ID="FileUpload" runat="server" />
        <asp:Button ID="Button1" runat="server"
            Text="上傳" onclick="Button1_Click" />
    </asp:Panel>
</asp:Content>