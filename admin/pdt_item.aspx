<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="pdt_item.aspx.cs" Inherits="user_pdt_item" %>
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
                <asp:TabContainer ID="tbcCoupon1" runat="server" ActiveTabIndex="0" 
                    CssClass="ajax__tab_yuitabview-theme" Width="100%">
                    <asp:TabPanel runat="server" HeaderText="品牌設定" ID="itemA">
                        <HeaderTemplate>
                            品牌設定
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:Panel ID="Panel1" runat="server" Visible="False">
                                <div style="border: solid 1px #ccc; background-color: #ffe; padding: 3px;  line-height: 22px; margin: 3px">
                                    1. 您必需上傳一張圖片。<br /> 2. 圖片最適大小為：寬度 300 (像素)，高度 60 (像素)。<br />3. 圖片大小如超過最適大小，將會自動壓縮成最適大小。</div>
                                    </asp:Panel><asp:Panel ID="Panel2" runat="server" Visible="False">
                                <div style="border: solid 1px #ccc; background-color: #ffe; padding: 3px;  line-height: 22px; margin: 3px">
                                    <span class="warning">1. 如須更換商品圖檔，才須重新上傳圖片。</span><br /> 2. 圖片最適大小為：寬度 300 
                                    (像素)，高度 60 (像素)。<br />3. 圖片大小如超過最適大小，將會自動壓縮成最適大小。<br /> 
                                    </div>
                            </asp:Panel>
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align: right; width: 80px;">品牌：</td>
                                    <td align="left" width="580">
                                        <asp:TextBox ID="txtItemAName" runat="server" 
                                            CssClass="textbox" Width="250px"></asp:TextBox>
                                        <asp:Label ID="lblItemANo" runat="server" CssClass="warning" 
                                            Text="lblItemANo" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; width: 80px;">
                                        圖片：</td>
                                    <td align="left">
                                        <asp:FileUpload ID="fudPdtImg" runat="server" CssClass="fileupload" />
                                        <asp:Button ID="btnLogoUpload" runat="server" Height="20px" 
                                            onclick="btnLogoUpload1_Click" Text="上傳" Visible="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; width: 80px;">
                                        &nbsp;</td>
                                    <td align="left">
                                        <asp:Image ID="Image1" runat="server" Height="60px" Width="300px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; width: 80px;">
                                        狀態：</td>
                                    <td align="left">
                                        <asp:CheckBox ID="chkState" runat="server" Text="顯示於首頁" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; width: 80px;" valign="top">介紹：</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>                                
                                <tr>
                                    <td colspan="2" style="text-align: right; " valign="top">
                                        <FCKeditorV2:FCKeditor ID="txtitemA_content" runat="server" 
                                            BasePath="../editor/" Height="200px" ToolbarSet="user_advance" 
                                            Width="100%">
                                        </FCKeditorV2:FCKeditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" valign="top">
                                        <asp:Button ID="btnItemAAdd" runat="server" Height="20px" 
                                            OnClick="btnItemAAdd_Click" Text="新增" />
                                        <asp:Button ID="btnItemAUpdate" runat="server" Height="20px" 
                                            OnClick="btnItemAUpdate_Click" Text="更新" Enabled="False" />
                                        <asp:Button ID="btnItemADelete" runat="server" Enabled="False" Height="20px" 
                                            OnClick="btnItemADelete_Click" 
                                            OnClientClick="if(confirm('確定刪除？')==false) return false;" Text="刪除" />
                                        <asp:Button ID="btnItemACancel" runat="server" Enabled="False" Height="20px" 
                                            OnClick="btnItemACancel_Click" Text="取消" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2"><hr /></td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2" valign="top">
                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                            AutoGenerateColumns="False" BorderWidth="0px" DataSourceID="SqlDataSource1" 
                                            EnableViewState="False" OnPageIndexChanging="GridView1_PageIndexChanging" 
                                            OnRowCommand="GridView1_RowCommand" Width="100%" PageSize="5">
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
                </asp:TabContainer>
            </td>
        </tr>
    </table>
</asp:Content>

