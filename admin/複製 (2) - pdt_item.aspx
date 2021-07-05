<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="複製 (2) - pdt_item.aspx.cs" Inherits="user_pdt_item" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <table width="100%">
        <tr>
            <td><h4>分類設定</h4></td>
        </tr>
        <tr>
            <td>
                <asp:TabContainer ID="tbcCoupon1" runat="server" ActiveTabIndex="3" 
                    CssClass="ajax__tab_yuitabview-theme" Width="100%">
                    <asp:TabPanel runat="server" HeaderText="品牌設定" ID="itemA">
                        <HeaderTemplate>
                            新增品牌
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align: right; width: 80px;">
                                        品牌：</td>
                                    <td width="580">
                                        <asp:TextBox ID="txtItemAName" runat="server" CssClass="textbox" Width="150px"></asp:TextBox>
                                        &nbsp;<asp:Button ID="btnItemAAdd" runat="server" Height="20px" 
                                            OnClick="btnItemAAdd_Click" Text="新增" />
                                        &nbsp;<asp:Button ID="btnItemADelete" runat="server" Height="20px" 
                                            OnClick="btnItemADelete_Click" 
                                            OnClientClick="if(confirm('確定刪除？')==false) return false;" Text="刪除" />
                                        &nbsp;<asp:Label ID="lblItemANo" runat="server" CssClass="warning" Text="lblItemANo" 
                                            Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; width: 80px;">
                                        介紹：</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: right; ">
                                        <FCKeditorV2:FCKeditor ID="txtpdt_content" runat="server" BasePath="../editor/" 
                                            Height="200px" ToolbarSet="user_advance" Width="100%">
                                        </FCKeditorV2:FCKeditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; width: 80px;" valign="top">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: left; " valign="top">
                                    <h4>品牌清單</h4></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; width: 80px;" valign="top">
                                        清單：</td>
                                    <td>
                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                            AutoGenerateColumns="False" BorderWidth="0px" DataSourceID="SqlDataSource1" 
                                            EnableViewState="False" OnPageIndexChanging="GridView1_PageIndexChanging" 
                                            OnRowCommand="GridView1_RowCommand" Width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="itemA_no" HeaderText="編號" SortExpression="itemA_no">
                                                <ItemStyle Height="30px" HorizontalAlign="Center" Width="50px" />
                                                </asp:BoundField>
                                                <asp:ButtonField CommandName="SELECT" DataTextField="itemA_name" 
                                                    HeaderText="品牌" SortExpression="itemA_name" Text="品牌">
                                                <ItemStyle HorizontalAlign="Left" />
                                                </asp:ButtonField>
                                            </Columns>
                                            <HeaderStyle BackColor="#FFFFCC" HorizontalAlign="Center" />
                                            <PagerSettings FirstPageText="第一頁" LastPageText="最末頁" Mode="NumericFirstLast" 
                                                NextPageText="下一頁" PreviousPageText="上一頁" />
                                            <PagerStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                                            SelectCommand="SELECT * FROM [ItemA] ORDER BY [itemA_no]">
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" HeaderText="款式設定" ID="itemB">
                        <HeaderTemplate>
                            款式設定
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align: right; ">清單：</td>
                                    <td class="style2">
                                        <asp:TextBox ID="txtItemBName" runat="server" CssClass="textbox" Width="150px"></asp:TextBox>&nbsp;<asp:Button 
                                            ID="btnItemBAdd" runat="server" Height="20px" Text="新增" 
                                            onclick="btnItemBAdd_Click" />
                                        &nbsp;<asp:Button ID="btnItemBDelete" runat="server" Height="20px" 
                                            OnClientClick="if(confirm('確定刪除？')==false) return false;" Text="刪除" 
                                            onclick="btnItemBDelete_Click" />
                                        &nbsp;&nbsp;<asp:Label ID="lblItemBNo" runat="server" CssClass="warning" 
                                            Text="lblItemBNo" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; " valign="top">款式：</td>
                                    <td class="style2">
                                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                                            AutoGenerateColumns="False" BorderWidth="0px" DataSourceID="SqlDataSource3" 
                                            EnableViewState="False" OnPageIndexChanging="GridView2_PageIndexChanging" 
                                            OnRowCommand="GridView2_RowCommand" 
                                            Width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="itemB_no" HeaderText="編號" SortExpression="itemB_no">
                                                <ItemStyle Height="30px" HorizontalAlign="Center" Width="50px" />
                                                </asp:BoundField>
                                                <asp:ButtonField CommandName="SELECT" DataTextField="itemB_name" 
                                                    HeaderText="款式" SortExpression="itemB_name" Text="款式">
                                                <ItemStyle HorizontalAlign="Left" />
                                                </asp:ButtonField>
                                            </Columns>
                                            <HeaderStyle BackColor="#FFFFCC" HorizontalAlign="Center" />
                                            <PagerSettings FirstPageText="第一頁" LastPageText="最末頁" Mode="NumericFirstLast" 
                                                NextPageText="下一頁" PreviousPageText="上一頁" />
                                            <PagerStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>"                                             
                                            SelectCommand="SELECT * FROM [ItemB] ORDER BY [itemB_no]">
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                    <tr>
                                        <td colspan="2">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="itemC" runat="server" HeaderText="系列設定">
                        <ContentTemplate>
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align: right; ">
                                        系列：</td>
                                    <td class="style2">
                                        <asp:TextBox ID="txtItemCName" runat="server" CssClass="textbox" Width="150px"></asp:TextBox>
                                        &nbsp;<asp:Button ID="btnItemCAdd" runat="server" Height="20px" 
                                            OnClick="btnItemCAdd_Click" Text="新增" />
                                        &nbsp;<asp:Button ID="btnItemCDelete" runat="server" Height="20px" 
                                            OnClick="btnItemCDelete_Click" 
                                            OnClientClick="if(confirm('確定刪除？')==false) return false;" Text="刪除" />
                                        &nbsp;<asp:Label ID="lblItemCNo" runat="server" CssClass="warning" Text="lblItemCNo" 
                                            Visible="False"></asp:Label>
                                        &nbsp;&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; " valign="top">
                                        清單：</td>
                                    <td class="style2">
                                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
                                            AutoGenerateColumns="False" BorderWidth="0px" DataSourceID="SqlDataSource6" 
                                            EnableViewState="False" OnPageIndexChanging="GridView3_PageIndexChanging" 
                                            OnRowCommand="GridView3_RowCommand" 
                                            Width="100%">
                                            <Columns>
                                                <asp:BoundField DataField="itemC_no" HeaderText="編號" SortExpression="itemC_no">
                                                <ItemStyle Height="30px" HorizontalAlign="Center" Width="50px" />
                                                </asp:BoundField>
                                                <asp:ButtonField CommandName="SELECT" DataTextField="itemC_name" 
                                                    HeaderText="系列" SortExpression="itemC_name" Text="系列">
                                                <ItemStyle HorizontalAlign="Left" />
                                                </asp:ButtonField>
                                            </Columns>
                                            <HeaderStyle BackColor="#FFFFCC" HorizontalAlign="Center" />
                                            <PagerSettings FirstPageText="第一頁" LastPageText="最末頁" Mode="NumericFirstLast" 
                                                NextPageText="下一頁" PreviousPageText="上一頁" />
                                            <PagerStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>"                                             
                                            SelectCommand="SELECT * FROM [ItemC] ORDER BY [itemC_no]">
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </td>
        </tr>
    </table>
</asp:Content>

