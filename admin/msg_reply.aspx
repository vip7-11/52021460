<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="msg_reply.aspx.cs" Inherits="admin_msg_reply" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
        <table style="width:100%;">
            <tr>
                <td class="style1" colspan="2">
                <h4>
                    留言資訊</h4>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 80px;">標題：</td>
                <td width="580">
                        <asp:Label ID="lblTitle" runat="server" Text="lblTitle"></asp:Label>
&nbsp;<asp:Label ID="lblmsg_no" runat="server" Text="lblmsg_no" Visible="False"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td style="text-align: right; ">內容：</td>
                <td>
                    <asp:Label ID="lblContent" runat="server" Text="lblContent"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: left; " colspan="2">
                    <h4>回覆資訊</h4>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; " colspan="2">
                                    <asp:Panel ID="pnMsg" runat="server">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td align="center" height="50" valign="middle">
                                                    <asp:Label ID="lblmsg" runat="server" Text="lblmsg" ForeColor="Red"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:Panel ID="pnList" runat="server">
                                        <asp:GridView ID="replyGv" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BorderWidth="0px" DataSourceID="SqlDataSource1" 
                        EnableViewState="False" Width="100%" onrowcreated="replyGv_RowCreated" 
                                            onpageindexchanging="replyGv_PageIndexChanging" 
                                            onrowcommand="replyGv_RowCommand">
                                            <Columns>
                                                <asp:BoundField DataField="msg_no" HeaderText="留言編號" SortExpression="msg_no">
                                                <ItemStyle HorizontalAlign="Center" Width="70px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="msgsub_no" HeaderText="回覆編號" 
                                SortExpression="msgsub_no">
                                                <ItemStyle HorizontalAlign="Center" Width="70px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="msgsub_author" HeaderText="回覆者" 
                                                    SortExpression="msgsub_author">
                                                <ItemStyle Height="30px" HorizontalAlign="Center" Width="100px" 
                                                    BorderStyle="Solid" BorderWidth="1px" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="回覆內容" SortExpression="msgsub_content">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("msgsub_content") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("msgsub_content") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="msgsub_date" HeaderText="回覆日期" 
                                SortExpression="msgsub_date">
                                                <ItemStyle HorizontalAlign="Center" Width="100px" BorderStyle="Solid" 
                                                    BorderWidth="1px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="msgsub_time" HeaderText="回覆時間" 
                                SortExpression="msgsub_time">
                                                <ItemStyle HorizontalAlign="Center" Width="100px" BorderStyle="Solid" 
                                                    BorderWidth="1px" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="刪除" ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" 
                                                            CommandName="DEL" ImageUrl="~/admin/image/del_s.png" CommandArgument='<%# Eval("msg_no") + "," + Eval("msgsub_no") %>'
                                                            onclientclick="if(confirm('確定刪除？')==false) return false;" Text="刪除" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="30px" BorderStyle="Solid" 
                                                        BorderWidth="1px" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle BackColor="#CCCCCC" Height="30px" HorizontalAlign="Center" />
                                            <PagerSettings FirstPageText="第一頁" LastPageText="最末頁" Mode="NumericFirstLast" 
                            NextPageText="下一頁" PreviousPageText="上一頁" />
                                            <PagerStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                            
                            SelectCommand="SELECT * FROM [msgsub] WHERE ([msg_no] = @msg_no) ORDER BY [msgsub_no] DESC">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblmsg_no" Name="msg_no" PropertyName="Text" 
                                    Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </asp:Panel>
                                </td>
            </tr>
            <tr>
                <td style="text-align: center; " colspan="2">
                    <asp:Button ID="btnReply" runat="server" Text="回覆" Height="20px" 
                        onclick="btnReply_Click" Width="40px" />
                    &nbsp;<asp:Button ID="btnDelete" runat="server" Text="刪除" Height="20px" 
                        OnClientClick="if(confirm('刪除該留言，會將該留言之下所有回覆一併刪除。確定刪除？')==false) return false;" 
                        onclick="btnDelete_Click"/>
                    &nbsp;<asp:Button ID="btnBack" runat="server" Text="回上頁" Height="20px" 
                        onclick="btnBack_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="pnAdd" runat="server" Visible="False">
                        <table style="width:100%;">
                            <tr>
                                <td style="text-align: left; ">
                                    <h4>新增回覆</h4>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; ">
                                    <FCKeditorV2:FCKeditor ID="txtContent" runat="server" BasePath="../editor/" 
                                        Height="300px" ToolbarSet="seo">
                                    </FCKeditorV2:FCKeditor>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center; ">
                                    <div style="text-align: center; padding: 5px;">
                                        <asp:Button ID="btnAdd" runat="server" Height="20px" Text="新增" 
                                            onclick="btnAdd_Click" Width="40px" />
                                        &nbsp;<asp:Button ID="btnCancel" runat="server" Height="20px" 
                                            onclick="btnCancel_Click" Text="取消" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
</asp:Content>

