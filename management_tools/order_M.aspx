<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="management_tools_order_M, App_Web_order_m.aspx.8728bb32" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="form" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="all" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="main" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1" 
        EnableModelValidation="True" Height="50px" 
        onitemdeleted="DetailsView1_ItemDeleted" 
        onitemdeleting="DetailsView1_ItemDeleting" Width="960px">
        <Fields>
            <asp:BoundField DataField="id" HeaderText="序號" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:TemplateField HeaderText="下單日期" SortExpression="date">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("date", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("date", "{0:d}") %>'></asp:TextBox>
                    <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="TextBox1">
                    </asp:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("date", "{0:d}") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="處理狀況" SortExpression="state">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        SelectedValue='<%# Bind("state") %>'>
                        <asp:ListItem>未確認</asp:ListItem>
                        <asp:ListItem>已確認</asp:ListItem>
                        <asp:ListItem>未處理</asp:ListItem>
                        <asp:ListItem>已處理</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("state") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="總價" SortExpression="price">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="wholesale_price" HeaderText="批發總價" 
                SortExpression="wholesale_price" />
            <asp:TemplateField HeaderText="物流廠商" SortExpression="logistics">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("logistics") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("logistics") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("logistics") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="物流單號" SortExpression="logistics_num">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("logistics_num") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("logistics_num") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("logistics_num") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="會員序號" SortExpression="member_id">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("member_id") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Enabled="False" 
                        Text='<%# Bind("member_id") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("member_id") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="姓名" SortExpression="name">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Enabled="False" 
                        Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="身份字號" SortExpression="idcard">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("idcard") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Enabled="False" 
                        Text='<%# Bind("idcard") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("idcard") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="地址" SortExpression="address">
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Enabled="False" 
                        Text='<%# Bind("address") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="電話" SortExpression="telephone">
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("telephone") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Enabled="False" 
                        Text='<%# Bind("telephone") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("telephone") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="手機" SortExpression="mobile">
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("mobile") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Enabled="False" 
                        Text='<%# Bind("mobile") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("mobile") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="電子信箱" SortExpression="email">
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Enabled="False" 
                        Text='<%# Bind("email") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="身份" SortExpression="status">
                <ItemTemplate>
                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" Enabled="False" 
                        Text='<%# Bind("status") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        DeleteCommand="DELETE FROM [orderer] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [orderer] ([member_id], [date], [state], [price], [logistics], [logistics_num]) VALUES (@member_id, @date, @state, @price, @logistics, @logistics_num)" 
        SelectCommand="SELECT member.name, member.idcard, member.address, member.telephone, member.mobile, member.email, member.status, orderer.id, orderer.member_id, orderer.date, orderer.state, orderer.price, orderer.logistics, orderer.logistics_num, orderer.wholesale_price FROM orderer INNER JOIN member ON orderer.member_id = member.id ORDER BY orderer.id DESC" 
        
        UpdateCommand="UPDATE [orderer] SET [member_id] = @member_id, [date] = @date, [state] = @state, [price] = @price, [logistics] = @logistics, [logistics_num] = @logistics_num WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="member_id" Type="Int32" />
            <asp:Parameter Type="DateTime" Name="date" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="price" Type="Int32" />
            <asp:Parameter Name="logistics" Type="String" />
            <asp:Parameter Name="logistics_num" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="member_id" Type="Int32" />
            <asp:Parameter Type="DateTime" Name="date" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="price" Type="Int32" />
            <asp:Parameter Name="logistics" Type="String" />
            <asp:Parameter Name="logistics_num" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="order_id" DataSourceID="SqlDataSource2" 
        EnableModelValidation="True">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="序號" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="order_id" HeaderText="訂單序號" 
                SortExpression="order_id" />
            <asp:BoundField DataField="products_id" HeaderText="商品序號" 
                SortExpression="products_id" />
            <asp:BoundField DataField="name" HeaderText="名稱" SortExpression="name" />
            <asp:BoundField DataField="price" HeaderText="單價" SortExpression="price" />
            <asp:BoundField DataField="wholesale_price" HeaderText="批發價" 
                SortExpression="wholesale_price" />
            <asp:BoundField DataField="quantity" HeaderText="訂購數量" 
                SortExpression="quantity" />
            <asp:BoundField DataField="units" HeaderText="單位" SortExpression="units" />
            <asp:BoundField DataField="Expr2" HeaderText="庫存量" SortExpression="Expr2" />
            <asp:TemplateField HeaderText="圖片" SortExpression="pic">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="40px" 
                        ImageUrl='<%# "../image/products/" + Eval("pic") %>' Width="30px" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pic") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="state" HeaderText="確認狀況" SortExpression="state" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        SelectCommand="SELECT order_list.id, order_list.order_id, order_list.products_id, order_list.quantity, order_list.price, order_list.state, products.name, products.pic, products.quantity AS Expr2, products.units, order_list.wholesale_price FROM order_list INNER JOIN products ON order_list.products_id = products.id WHERE (order_list.order_id = @order_id)" 
        DeleteCommand="DELETE FROM order_list WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DetailsView1" Name="order_id" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

