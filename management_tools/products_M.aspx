<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="management_tools_products_M, App_Web_products_m.aspx.8728bb32" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    function uploadI(p_id) {
        window.open("p_upload.aspx?page=" + p_id, "Upload", "height=100, width=400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
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
            <asp:Button ID="Button1" runat="server" Text="新增商品" onclick="Button1_Click" />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table style="width:100%;">
                    <tr>
                        <td class="style1">
                        <h4>
                            商品清單</h4>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td style="text-align: right" width="80">查詢：</td>
                                <td width="100"><asp:DropDownList ID="ddlSelect" runat="server" CssClass="textbox" 
                                        Width="90px">
                                <asp:ListItem Value="name">商品名稱</asp:ListItem>
                                <asp:ListItem Value="id">商品編號</asp:ListItem>
                            </asp:DropDownList>
                                </td>
                                <td>
                                <asp:TextBox ID="txtSelect" runat="server" CssClass="textbox" MaxLength="20" 
                                    Width="150px"></asp:TextBox>
                                &nbsp;<asp:Button ID="btnSelect" runat="server" Height="20px" Text="搜尋" 
                                        onclick="btnSelect_Click" />
                                </td>
                            </tr>
                        </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td style="text-align: right" width="80">篩選：</td>
                                <td>
                                    <asp:DropDownList ID="ddlSitemA" runat="server" AutoPostBack="True" 
                                CssClass="textbox" 
                                        onselectedindexchanged="ddlUserRoleA_SelectedIndexChanged">
                                        <asp:ListItem Value="00" Selected="True">全部類別</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="Catgory_ID" runat="server" Visible="False" Width="40px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        </td> 
                    </tr> 
                    <tr>
                        <td class="style1">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td style="text-align: right" width="80">排序：</td>
                                <td width="100">
                                    <asp:DropDownList ID="ddlOrderBy" runat="server" AutoPostBack="True" 
                                CssClass="textbox" Width="90px" 
                                        onselectedindexchanged="ddlOrderBy_SelectedIndexChanged">
                                <asp:ListItem Value="id">依編號</asp:ListItem>
                                <asp:ListItem Value="class">依類別</asp:ListItem>
                                <asp:ListItem Value="quantity">依庫存</asp:ListItem>
                            </asp:DropDownList>
                                </td>
                                <td width="160">
                            <asp:RadioButtonList ID="rblOrderBy" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="rbl_order_SelectedIndexChanged" 
                                RepeatDirection="Horizontal" Width="120px">
                                <asp:ListItem Selected="True" Value="ASC">遞增</asp:ListItem>
                                <asp:ListItem Value="DESC">遞減</asp:ListItem>
                            </asp:RadioButtonList>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            <asp:GridView ID="pdtGv" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" BorderWidth="0px" EnableViewState="False" 
                                PageSize="15" Width="100%" onpageindexchanging="pdtGv_PageIndexChanging" 
                                onrowcommand="pdtGv_RowCommand" onrowcreated="pdtGv_RowCreated">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="編號">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="id" HeaderText="編號">
                                    <ItemStyle HorizontalAlign="Center" Width="90px" Height="30px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:ButtonField CommandName="SELECT" DataTextField="name" HeaderText="名稱" 
                                        Text="名稱">
                                    <ItemStyle HorizontalAlign="Center" />
                                    </asp:ButtonField>
                                    <asp:BoundField DataField="class" HeaderText="類別">
                                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="price" HeaderText="價格">
                                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="wholesale_price" HeaderText="批發價">
                                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="quantity" HeaderText="庫存">
                                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="date" HeaderText="時間">
                                    <ItemStyle HorizontalAlign="Center" Width="180px" />
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle BackColor="#cadcd6" Height="30px" HorizontalAlign="Center" />
                                <PagerSettings FirstPageText="第一頁" LastPageText="最末頁" Mode="NumericFirstLast" 
                                    NextPageText="下一頁" PreviousPageText="上一頁" />
                                <PagerStyle HorizontalAlign="Center" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
            </asp:UpdatePanel>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table style="width: 100%;">
                <tr>
                    <td>
                        商品名稱：</td>
                    <td>
                        <asp:TextBox ID="name_T" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        商品類別：</td>
                    <td>
                        <%--<asp:DropDownList ID="class_D" runat="server">
                            <asp:ListItem Value="toy">人氣玩具</asp:ListItem>
                            <asp:ListItem Value="VIP">VIP滿額禮</asp:ListItem>
                            <asp:ListItem Value="woman">女人我最大</asp:ListItem>
                            <asp:ListItem Value="sculpt">內著塑衣</asp:ListItem>
                            <asp:ListItem Value="JnK">日韓服飾</asp:ListItem>
                            <asp:ListItem Value="used">好康二手</asp:ListItem>
                            <asp:ListItem Value="health">保健塑身</asp:ListItem>
                            <asp:ListItem Value="beauty">美妝保養</asp:ListItem>
                            <asp:ListItem Value="fashion">時尚玩家</asp:ListItem>
                            <asp:ListItem Value="house">強打售屋</asp:ListItem>
                            <asp:ListItem Value="3C">暢銷3C</asp:ListItem>
                            <asp:ListItem Value="SnB">精品鞋包</asp:ListItem>
                            <asp:ListItem Value="rent">熱門租屋</asp:ListItem>
                        </asp:DropDownList>--%>
                        <asp:DropDownList ID="class_D" runat="server" 
                            DataSourceID="SqlDataSource2" DataTextField="item_name" 
                            DataValueField="item_no">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                            SelectCommand="SELECT * FROM [itemA] ORDER BY [item_id]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        圖片上傳：</td>
                    <td>
                        <asp:FileUpload ID="pic_F" runat="server" />
                        &nbsp;(寬×高=210px×280px)</td>
                </tr>
                <tr>
                    <td>
                        價格：</td>
                    <td>
                        <asp:TextBox ID="price_T" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        批發價：</td>
                    <td>
                        <asp:TextBox ID="mprice_T" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        數量：</td>
                    <td class="style1">
                        <asp:TextBox ID="quantity_T" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        單位：</td>
                    <td>
                        <asp:TextBox ID="units_T" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        詳細介紹：</td>
                    <td>
                        <FCKeditorV2:FCKeditor ID="introduction_FCK" runat="server" 
                            BasePath="../fckeditor/" Width="1024px" Height="768px" ToolbarSet="Default"></FCKeditorV2:FCKeditor>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                            Text="回編輯商品目錄" />
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Text="新增商品" onclick="Button3_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:Button ID="Button6" runat="server" Text="回編輯商品目錄" 
                onclick="Button6_Click" />

                
        </asp:View>
        <asp:View ID="View4" runat="server">

        </asp:View>
    </asp:MultiView>
</asp:Content>