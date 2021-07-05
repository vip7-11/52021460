<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="car, App_Web_car.aspx.cdcab7d2" %>

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
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
        <%--<tr>
            <td height="88">
                <img alt="" src="images/shopping001.gif" />
            </td>
        </tr>
        <tr>
            <td height="30">
                <img alt="" src="images/car.gif" /></td>
        </tr>--%>
        <tr>
            <td style="padding: 10px; border-style: dashed; border-width: 1px; border-color: #cbcbcb;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                            <tr>
                                <td>
                                    <asp:Panel ID="pnNolist" runat="server">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" height="30">
                                                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="購物車目前沒有商品。"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="pnGv" runat="server">
                                        <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                                            <tr>
                                                <td>
                                                    <asp:GridView ID="carGv" runat="server" AllowPaging="True" 
                                                        AutoGenerateColumns="False" GridLines="None" 
                                                        onpageindexchanging="carGv_PageIndexChanging" onrowcommand="carGv_RowCommand" 
                                                        onrowcreated="carGv_RowCreated" PageSize="15" Width="100%" 
                                                        EnableModelValidation="True" onrowdatabound="carGv_RowDataBound">
                                                        <Columns>
                                                            <asp:BoundField DataField="pdt_no" HeaderText="系統編號" SortExpression="pdt_no">
                                                                <ItemStyle HorizontalAlign="Center" Width="80px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="pdt_id" HeaderText="商品編號" SortExpression="pdt_id">
                                                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="pdt_name" HeaderText="商品名稱" 
                                                                SortExpression="pdt_name" />
                                                            <asp:TemplateField HeaderText="商品規格">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbl_pdt_no" runat="server" Text='<%# Eval("pdt_no") %>' Visible="false" ></asp:Label>
                                                                    <asp:Label ID="lb_select" runat="server" Text="" Visible="false" ></asp:Label>
                                                                    <asp:Label ID="pdt_specific" Text='<%# Eval("pdt_specification") %>' runat="server" Visible="false" />
                                                                    <asp:Literal ID="specific" runat="server"></asp:Literal>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="" ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imgbtnDel" runat="server" CommandArgument='<%# Eval("pdt_no") %>' CommandName="D" ImageUrl="~/image/lelecoco/list_close.png" ToolTip="減" />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="20px" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="pdt_count" HeaderText="數量" 
                                                                SortExpression="pdt_count">
                                                                <ItemStyle HorizontalAlign="Center" Width="30px" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="" ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imgbtnAdd" runat="server" CommandArgument='<%# Eval("pdt_no") %>' CommandName="A" ImageUrl="~/image/lelecoco/list_open.png" ToolTip="加" />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="20px" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="pdt_sell" HeaderText="優惠價" SortExpression="pdt_sell">
                                                                <ItemStyle Height="30px" HorizontalAlign="Right" Width="60px" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="pdt_sum" HeaderText="小計" SortExpression="pdt_sum">
                                                                <ItemStyle HorizontalAlign="Right" Width="60px" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="刪除" ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imgbtnDelPdt" runat="server" CommandArgument='<%# Eval("pdt_no") %>' CommandName="Del" ImageUrl="~/image/lelecoco/del_s.png" ToolTip="刪除" />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" Width="40px" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <HeaderStyle BackColor="#BC6987" ForeColor="White" Height="30px" 
                                                            HorizontalAlign="Center" />
                                                        <PagerSettings FirstPageText="第一頁" LastPageText="最末頁" Mode="NumericFirstLast" 
                                                            NextPageText="下一頁" PreviousPageText="上一頁" />
                                                        <PagerStyle HorizontalAlign="Center" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" height="30">
                                                <asp:Label ID="lblpdt_pay" runat="server" Text=""></asp:Label>
                                                <asp:Button ID="imgbtn" runat="server" Text="結算" onclick="imgbtn_Click" />
                                                &nbsp;<asp:Button ID="imgbtnBack" runat="server" Text="繼續購物" 
                                                        onclick="imgbtnBack_Click" />
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>