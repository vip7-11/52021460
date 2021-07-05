<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="management_tools_FAQ_M, App_Web_faq_m.aspx.8728bb32" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="form" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="all" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="main" Runat="Server">

    <asp:DropDownList ID="selectFAQ_D" runat="server" AutoPostBack="True" 
        DataSourceID="selectFAQ" DataTextField="Q" DataValueField="id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="selectFAQ" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        SelectCommand="SELECT [id], [Q] FROM [FAQ]"></asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="id" 
        DataSourceID="FAQ" EnableModelValidation="True" ForeColor="#333333" 
        onitemdeleted="FormView1_ItemDeleted" oniteminserted="FormView1_ItemInserted" 
        onitemupdated="FormView1_ItemUpdated">
        <EditItemTemplate>
            id:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
            <br />
            Q:
            <asp:TextBox ID="QTextBox" runat="server" Text='<%# Bind("Q") %>' Columns="50" 
                Rows="10" TextMode="MultiLine" />
            <br />
            A:
            <asp:TextBox ID="ATextBox" runat="server" Text='<%# Bind("A") %>' Columns="50" 
                Rows="10" TextMode="MultiLine" />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            Q:
            <asp:TextBox ID="QTextBox" runat="server" Text='<%# Bind("Q") %>' Columns="50" 
                Rows="10" TextMode="MultiLine" />
            <br />
            A:
            <asp:TextBox ID="ATextBox" runat="server" Text='<%# Bind("A") %>' Columns="50" 
                Rows="10" TextMode="MultiLine" />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="插入" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
        </InsertItemTemplate>
        <ItemTemplate>
            序號：<asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            常見問題：<br />
            <asp:Label ID="QLabel" runat="server" Text='<%# Bind("Q") %>' />
            <br />
            回應問題： 
            <br />
            <asp:Label ID="ALabel" runat="server" Text='<%# Bind("A") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="編輯" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="刪除" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="新增" />
        </ItemTemplate>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
    </asp:FormView>
    <asp:SqlDataSource ID="FAQ" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        DeleteCommand="DELETE FROM [FAQ] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [FAQ] ([Q], [A]) VALUES (@Q, @A)" 
        SelectCommand="SELECT * FROM [FAQ] WHERE ([id] = @id)" 
        UpdateCommand="UPDATE [FAQ] SET [Q] = @Q, [A] = @A WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Q" Type="String" />
            <asp:Parameter Name="A" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="selectFAQ_D" Name="id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Q" Type="String" />
            <asp:Parameter Name="A" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

