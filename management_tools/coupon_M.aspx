<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="coupon_M, App_Web_coupon_m.aspx.8728bb32" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
    function uploadC(p_id) {
        window.open("c_upload.aspx?page=" + p_id, "Upload", "height=100, width=400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="form" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="all" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="main" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <asp:Button ID="Button1" runat="server" Text="新增優惠券" onclick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="修改 / 刪除優惠券" 
                onclick="Button2_Click" />
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table style="width: 100%;">
                <tr>
                    <td class="style1">
                        優惠券名稱：</td>
                    <td class="style1">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        優惠券圖片：</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                            Text="回編輯優惠券目錄" />
                    </td>
                    <td>
                        <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="新增優惠券" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
                DataSourceID="SqlDataSource1" EnableModelValidation="True">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                        ShowEditButton="True" />
                    <asp:BoundField DataField="id" HeaderText="序號" InsertVisible="False" 
                        ReadOnly="True" SortExpression="id" />
                    <asp:TemplateField HeaderText="名稱" SortExpression="name"><ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox></EditItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="日期" SortExpression="date"><ItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Bind("date", "{0:d}") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("date", "{0:d}") %>'></asp:TextBox><asp:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="TextBox2"></asp:CalendarExtender></EditItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="圖片" SortExpression="pic"><ItemTemplate><asp:Image ID="Image1" runat="server" Height="40px" 
                                ImageUrl='<%# "../image/coupon/" + Eval("pic") %>' Width="30px" /><asp:Button 
                            ID="Button5" runat="server" Text="更新圖片" 
                            onclientclick='<%# "uploadC(" + Eval("id") + ")" %>' /></ItemTemplate><EditItemTemplate><asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("pic") %>' 
                                Visible="False"></asp:TextBox><asp:Image ID="Image2" runat="server" Height="40px" 
                                ImageUrl='<%# "../image/coupon/" + Eval("pic") %>' Width="30px" /></EditItemTemplate></asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                DeleteCommand="DELETE FROM [coupon] WHERE [id] = @id" 
                InsertCommand="INSERT INTO [coupon] ([name], [date], [pic]) VALUES (@name, @date, @pic)" 
                SelectCommand="SELECT * FROM [coupon]" 
                UpdateCommand="UPDATE [coupon] SET [name] = @name, [date] = @date, [pic] = @pic WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="date" Type="DateTime" />
                    <asp:Parameter Name="pic" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="date" Type="DateTime" />
                    <asp:Parameter Name="pic" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>