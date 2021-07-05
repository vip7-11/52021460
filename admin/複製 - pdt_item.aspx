<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="複製 - pdt_item.aspx.cs" Inherits="user_pdt_item" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 80px;
            height: 16px;
        }
        .style2
        {
            height: 16px;
        }
    </style>
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
                <asp:TabContainer ID="tbcCoupon1" runat="server" ActiveTabIndex="1" 
                    CssClass="ajax__tab_yuitabview-theme" Width="100%">
                    <asp:TabPanel runat="server" HeaderText="品牌設定" ID="itemA">
                        <HeaderTemplate>
                            品牌設定
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align: right; width: 80px;">品牌：</td>
                                    <td><asp:TextBox ID="txtItemAName" runat="server" CssClass="textbox" Width="150px"></asp:TextBox>
                                        &nbsp;<asp:Button ID="btnItemAAdd" runat="server" Height="20px" Text="新增" 
                                            onclick="btnItemAAdd_Click" />
                                        &nbsp;<asp:Button ID="btnItemADelete" runat="server" Height="20px" 
                                            OnClientClick="if(confirm('刪除該品牌，會將該品牌之下所有款式一併刪除。確定刪除？')==false) return false;" 
                                            Text="刪除" onclick="btnItemADelete_Click" />
                                        &nbsp;<asp:Label ID="lblItemANo" runat="server" CssClass="warning" 
                                            Text="lblItemANo" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; width: 80px;" valign="top">清單：</td>
                                    <td>
                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                            AutoGenerateColumns="False" BorderWidth="0px" DataSourceID="SqlDataSource1" 
                                            EnableViewState="False" OnRowCommand="GridView1_RowCommand" Width="100%" 
                                            onpageindexchanging="GridView1_PageIndexChanging">
                                            <Columns>
                                                <asp:BoundField DataField="itemA_no" HeaderText="編號" 
                                                    SortExpression="itemA_no" >
                                                <ItemStyle Height="30px" HorizontalAlign="Center" Width="50px" />
                                                </asp:BoundField>
                                                <asp:ButtonField CommandName="SELECT" DataTextField="itemA_name" 
                                                    HeaderText="品牌" SortExpression="itemA_name" Text="品牌">
                                                <ItemStyle HorizontalAlign="Left" />
                                                </asp:ButtonField>
                                            </Columns>
                                            <HeaderStyle BackColor="#FFFFCC" HorizontalAlign="Center" />
                                            <PagerSettings FirstPageText="第一頁" LastPageText="最末頁" Mode="NumericFirstLast" NextPageText="下一頁" PreviousPageText="上一頁" />
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
                            <div style="border: solid 1px #ccc; background-color: #ffe; padding: 3px;  line-height: 22px; margin: 3px">
                                1. 您可以自行設定各品牌內之款式。<br />
                                2. 選擇品牌 ( 拉下式選單 ) ，將會於下方產生相對應之款式。</div>
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align: right; width: 80px;">品牌：</td>
                                    <td>
                                        <asp:DropDownList ID="ddlItemB1" runat="server" AutoPostBack="True" 
                                            CssClass="textbox" 
                                            OnSelectedIndexChanged="ddlItemB1_SelectedIndexChanged" 
                                            DataSourceID="SqlDataSource2" DataTextField="itemA_name" 
                                            DataValueField="itemA_no"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                                            SelectCommand="SELECT * FROM [ItemA] ORDER BY [itemA_no]">
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; ">款式：</td>
                                    <td class="style2">
                                        <asp:TextBox ID="txtItemBName" runat="server" CssClass="textbox" Width="150px"></asp:TextBox>&nbsp;<asp:Button 
                                            ID="btnItemBAdd" runat="server" Height="20px" Text="新增" 
                                            onclick="btnItemBAdd_Click" />
                                        &nbsp;<asp:Button ID="btnItemBDelete" runat="server" Height="20px" 
                                            OnClientClick="if(confirm('刪除該款式，會將該款式之下所有系列一併刪除。確定刪除？')==false) return false;" Text="刪除" 
                                            onclick="btnItemBDelete_Click" />
                                        &nbsp;<asp:Label ID="lblItemBNo1" runat="server" CssClass="warning" 
                                            Text="lblItemBNo1" Visible="False"></asp:Label>
                                        &nbsp;<asp:Label ID="lblItemBNo2" runat="server" CssClass="warning" 
                                            Text="lblItemBNo2" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; " valign="top">清單：</td>
                                    <td class="style2">
                                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                                        BorderWidth="0px" EnableViewState="False" 
                                        OnRowCommand="GridView2_RowCommand" OnRowCreated="GridView2_RowCreated" 
                                        Width="100%" DataSourceID="SqlDataSource3" 
                                            onpageindexchanging="GridView2_PageIndexChanging">
                                            <Columns>
                                                <asp:BoundField DataField="itemB_no" HeaderText="編號" SortExpression="itemB_no">
                                                <ItemStyle Height="30px" HorizontalAlign="Center" Width="50px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="itemA_no" HeaderText="品牌編號" 
                                                    SortExpression="itemA_no">
                                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                                                </asp:BoundField>
                                                <asp:ButtonField CommandName="SELECT" DataTextField="itemB_name" 
                                                    HeaderText="款式" SortExpression="itemB_name" Text="款式">
                                                <ItemStyle HorizontalAlign="Left" />
                                                </asp:ButtonField>
                                            </Columns>
                                        <HeaderStyle BackColor="#FFFFCC" HorizontalAlign="Center" />
                                        <PagerSettings FirstPageText="第一頁" LastPageText="最末頁" Mode="NumericFirstLast" NextPageText="下一頁" PreviousPageText="上一頁" />
                                        <PagerStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                                            SelectCommand="SELECT * FROM [ItemB] WHERE ([itemA_no] = @itemA_no) ORDER BY [itemB_no]">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlItemB1" Name="itemA_no" 
                                                    PropertyName="SelectedValue" Type="String" />
                                            </SelectParameters>
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
                            <div style="border: solid 1px #ccc; background-color: #ffe; padding: 3px;  line-height: 22px; margin: 3px">
                                1. 您可以自行設定各款式內之系列。<br />
                                2. 選擇品牌 ( 拉下式選單 ) ，將會於下方產生相對應之款式。<br />
                                3. 選擇款式 ( 拉下式選單 ) ，將會於下方產生相對應之系列。</div>
                            <table style="width:100%;">
                                <tr>
                                    <td class="style1" style="text-align: right; ">
                                        品牌：</td>
                                    <td class="style2">
                                        <asp:DropDownList ID="ddlItemC1" runat="server" AutoPostBack="True" 
                                            CssClass="textbox" DataSourceID="SqlDataSource4" 
                                            DataTextField="itemA_name" DataValueField="itemA_no">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                                            SelectCommand="SELECT * FROM [ItemA] ORDER BY [itemA_no]">
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; width: 80px;">
                                        款式：</td>
                                    <td>
                                        <asp:DropDownList ID="ddlItemC2" runat="server" AutoPostBack="True" 
                                            CssClass="textbox" DataSourceID="SqlDataSource5" 
                                            DataTextField="itemB_name" DataValueField="itemB_no">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                                            SelectCommand="SELECT * FROM [ItemB] WHERE ([itemA_no] = @itemA_no) ORDER BY [itemB_no]">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlItemC1" Name="itemA_no" 
                                                    PropertyName="SelectedValue" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; ">
                                        系列：</td>
                                    <td class="style2">
                                        <asp:TextBox ID="txtItemCName" runat="server" CssClass="textbox" Width="150px"></asp:TextBox>
                                        &nbsp;<asp:Button ID="btnItemCAdd" runat="server" Height="20px" Text="新增" 
                                            onclick="btnItemCAdd_Click" />
                                        &nbsp;<asp:Button ID="btnItemCDelete" runat="server" Height="20px" 
                                            OnClientClick="if(confirm('確定刪除？')==false) return false;" Text="刪除" 
                                            onclick="btnItemCDelete_Click" />
                                        &nbsp;<asp:Label ID="lblItemCNo1" runat="server" CssClass="warning" 
                                            Text="lblItemCNo1" Visible="False"></asp:Label>
                                        &nbsp;<asp:Label ID="lblItemCNo2" runat="server" CssClass="warning" 
                                            Text="lblItemCNo2" Visible="False"></asp:Label>
                                        &nbsp;<asp:Label ID="lblItemCNo3" runat="server" CssClass="warning" 
                                            Text="lblItemCNo3" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; " valign="top">
                                        清單：</td>
                                    <td class="style2">
                                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
                                            AutoGenerateColumns="False" BorderWidth="0px" 
                                            EnableViewState="False" Width="100%" DataSourceID="SqlDataSource6" 
                                            onrowcommand="GridView3_RowCommand" onrowcreated="GridView3_RowCreated" 
                                            onpageindexchanging="GridView3_PageIndexChanging">
                                            <Columns>
                                                <asp:BoundField DataField="itemC_no" HeaderText="編號" SortExpression="itemC_no">
                                                <ItemStyle Height="30px" HorizontalAlign="Center" Width="50px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="itemA_no" HeaderText="品牌編號" 
                                                    SortExpression="itemA_no">
                                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="itemB_no" HeaderText="款項編號" 
                                                    SortExpression="itemB_no">
                                                <ItemStyle HorizontalAlign="Center" Width="50px" />
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
                                            SelectCommand="SELECT * FROM [ItemC] WHERE (([itemA_no] = @itemA_no) AND ([itemB_no] = @itemB_no)) ORDER BY [itemC_no]">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlItemC1" Name="itemA_no" 
                                                    PropertyName="SelectedValue" Type="String" />
                                                <asp:ControlParameter ControlID="ddlItemC2" Name="itemB_no" 
                                                    PropertyName="SelectedValue" Type="String" />
                                            </SelectParameters>
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

