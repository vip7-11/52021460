<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="order, App_Web_order.aspx.cdcab7d2" %>

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

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="id" DataSourceID="SqlDataSource1" 
        EnableModelValidation="True" 
        onrowcommand="GridView1_RowCommand" onprerender="GridView1_PreRender">
        <Columns>
            <asp:CommandField ButtonType="Button" 
                SelectText="顯示清單" EditText="編輯物流廠商" ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="序號" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:TemplateField HeaderText="日期" SortExpression="date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Enabled="False" 
                        Text='<%# Bind("date") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("date", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="狀態" SortExpression="state">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Enabled="False" 
                        Text='<%# Bind("state") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="總價" SortExpression="price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Enabled="False" 
                        Text='<%# Bind("price") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="批發總價" SortExpression="wholesale_price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Enabled="False" 
                        Text='<%# Bind("wholesale_price") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("wholesale_price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="物流廠商" SortExpression="logistics">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name" 
                        SelectedValue='<%# Bind("logistics") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                        SelectCommand="SELECT [name] FROM [logistics]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("logistics") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="物流編號" SortExpression="logistics_num">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Enabled="False" 
                        Text='<%# Bind("logistics_num") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("logistics_num") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField ButtonType="Button" CommandName="orderV" Text="確認訂單" />
            <asp:ButtonField ButtonType="Button" CommandName="deleteV" Text="刪除訂單" />
            <asp:ButtonField ButtonType="Button" CommandName="selectV" Text="顯示清單" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        
        
        SelectCommand="SELECT [id], [date], [state], [price], [logistics], [logistics_num], [wholesale_price] FROM [orderer] WHERE ([member_id] = @member_id)" 
        DeleteCommand="DELETE FROM [orderer] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [orderer] ([date], [state], [price], [logistics], [logistics_num], [wholesale_price]) VALUES (@date, @state, @price, @logistics, @logistics_num, @wholesale_price)" 
        
        UpdateCommand="UPDATE [orderer] SET [date] = @date, [state] = @state, [price] = @price, [logistics] = @logistics, [logistics_num] = @logistics_num, [wholesale_price] = @wholesale_price WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="date" Type="DateTime" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="price" Type="Int32" />
            <asp:Parameter Name="logistics" Type="String" />
            <asp:Parameter Name="logistics_num" Type="String" />
            <asp:Parameter Name="wholesale_price" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="member_id" SessionField="loginer_id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="date" Type="DateTime" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="price" Type="Int32" />
            <asp:Parameter Name="logistics" Type="String" />
            <asp:Parameter Name="logistics_num" Type="String" />
            <asp:Parameter Name="wholesale_price" Type="Int32" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="id" DataSourceID="SqlDataSource2" 
        EnableModelValidation="True" onprerender="GridView2_PreRender">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="更新" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="取消" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="編輯" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="刪除" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="序號" InsertVisible="False" SortExpression="id">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="訂單序號" SortExpression="order_id">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("order_id") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Enabled="False" 
                        Text='<%# Bind("order_id") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="商品序號" SortExpression="products_id">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("products_id") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Enabled="False" 
                        Text='<%# Bind("products_id") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="名稱" SortExpression="name">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Enabled="False" 
                        Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="單價" SortExpression="price">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Enabled="False" 
                        Text='<%# Bind("price") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="批發價" SortExpression="wholesale_price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Enabled="False" 
                        Text='<%# Bind("wholesale_price") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("wholesale_price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="訂購數量" SortExpression="quantity">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("quantity") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("quantity") %>'></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="TextBox5" ControlToValidate="TextBox7" 
                        ErrorMessage="訂購數量不可大於庫存數量！" ForeColor="red" 
                        Operator="GreaterThanEqual" Type="Integer"></asp:CompareValidator>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="單位" SortExpression="units">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("units") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Enabled="False" 
                        Text='<%# Bind("units") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="庫存量" SortExpression="Expr1">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Expr1") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Enabled="False" 
                        Text='<%# Bind("Expr1") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="圖片" SortExpression="pic">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="40px" 
                        ImageUrl='<%# "image/products/" + Eval("pic") %>' Width="30px" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("pic") %>' 
                        Visible="False"></asp:TextBox>
                    <asp:Image ID="Image2" runat="server" Height="40px" 
                        ImageUrl='<%# "image/products/" + Eval("pic") %>' Width="30px" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="訂單確認" SortExpression="state">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("state") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        DeleteCommand="DELETE FROM order_list WHERE (id = @id)"
        UpdateCommand="UPDATE order_list SET quantity = @quantity WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="quantity" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>

