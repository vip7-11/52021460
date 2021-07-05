<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="dm_load.aspx.cs" Inherits="admin_dm_load" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
        <table style="width:100%;">
            <tr>
                <td colspan="2"><h4>新增型錄</h4>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                        <div style="border: solid 1px #ccc; background-color: #ffe; padding: 3px;  line-height: 22px; margin: 3px">
                                    1. 只可上傳Word、Excel、PDF檔案。<br />
                                    2. 檔案名稱請使用中文、英文，請勿使用特殊符號。<br />
                                    3. 請注意檔案名稱是否重覆，檔案名稱重複將會將先前上傳之檔案覆蓋。<br /> 
                                    </div>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; " width="80">檔案：</td>
                <td width="580">
                        <asp:FileUpload runat="server" CssClass="fileupload" ID="fudPdtFile"></asp:FileUpload>
                        <asp:Button ID="btnLogoUpload" runat="server" Text="上傳" Height="20px" 
                            onclick="btnLogoUpload_Click" />                        
                        </td>
            </tr>
            <tr>
                <td colspan="2"><h4>型錄清單</h4>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; " colspan="2">
                    <asp:GridView ID="dmGv" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" 
                        onrowcreated="dmGv_RowCreated" Width="100%" onrowcommand="dmGv_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="dm_no" HeaderText="編號">
                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="刪除" ShowHeader="False">
                                <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" 
                                    CommandName="DEL" ImageUrl="~/admin/image/del_s.png" CommandArgument='<%# Eval("dm_no") + "," + Eval("dm_name") %>'
                                    onclientclick="if(confirm('確定刪除？')==false) return false;" Text="刪除" />
                                </ItemTemplate>
                                <ItemStyle Height="30px" HorizontalAlign="Center" Width="30px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="dm_name" HeaderText="檔案名稱">
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                        </Columns>
                        <HeaderStyle BackColor="#CCCCCC" Height="30px" HorizontalAlign="Center" />
                        <PagerSettings FirstPageText="第一頁" LastPageText="最末頁" Mode="NumericFirstLast" 
                            NextPageText="下一頁" PreviousPageText="上一頁" />
                        <PagerStyle HorizontalAlign="Center" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                        SelectCommand="SELECT * FROM [dm] ORDER BY [dm_no] DESC">
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
</asp:Content>

