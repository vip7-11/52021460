<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="management_tools_messageboard_M, App_Web_messageboard_m.aspx.8728bb32" %>

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
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="num" 
        DataSourceID="SqlDataSource1" EnableModelValidation="True" 
        style="margin-top: 3px" onrowcommand="GridView1_RowCommand">
        <Columns>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="板號" SortExpression="id" />
            <asp:TemplateField HeaderText="留言內容" SortExpression="introduction">
                <EditItemTemplate>
                    <FCKeditorV2:FCKeditor ID="FCKeditor2" runat="server" BasePath="../fckeditor/" 
                        Height="200px" ToolbarSet="Basic" Value='<%# Bind("introduction") %>' 
                        Width="100%">
                    </FCKeditorV2:FCKeditor>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("introduction") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="date" DataFormatString="{0:d}" HeaderText="日期" 
                SortExpression="date" />
            <asp:BoundField DataField="remessageID" HeaderText="留言ID" 
                SortExpression="remessageID" />
            <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
            <asp:BoundField DataField="num" HeaderText="序號" InsertVisible="False" 
                ReadOnly="True" SortExpression="num" />
            <asp:ButtonField ButtonType="Button" Text="回覆" CommandName="remessage" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        DeleteCommand="DELETE FROM [messageboard] WHERE [num] = @num" 
        InsertCommand="INSERT INTO [messageboard] ([id], [introduction], [date], [remessageID]) VALUES (@id, @introduction, @date, @remessageID)" 
        SelectCommand="SELECT messageboard.id, messageboard.introduction, messageboard.date, messageboard.remessageID, messageboard.num, member.name FROM messageboard INNER JOIN member ON messageboard.remessageID = member.id ORDER BY messageboard.num DESC" 
        UpdateCommand="UPDATE [messageboard] SET [id] = @id, [introduction] = @introduction, [date] = @date, [remessageID] = @remessageID WHERE [num] = @num">
        <DeleteParameters>
            <asp:Parameter Name="num" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="introduction" Type="String" />
            <asp:Parameter Type="DateTime" Name="date" />
            <asp:Parameter Name="remessageID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="introduction" Type="String" />
            <asp:Parameter Type="DateTime" Name="date" />
            <asp:Parameter Name="remessageID" Type="Int32" />
            <asp:Parameter Name="num" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" BasePath="../fckeditor/" Visible="false">
    </FCKeditorV2:FCKeditor>
    <br />
    <asp:Button ID="Button1" runat="server" Text="回覆留言" onclick="Button1_Click" 
        Visible="False" />
</asp:Content>

