<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="msgsub, App_Web_msgsub.aspx.cdcab7d2" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="all" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner_up" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="banner_down" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="nav" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="main" Runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
        <tr>
            <td>
                </td>
        </tr>        
        <tr>
            <td style="padding: 10px; border-style: dashed; border-width: 1px; border-color: #cbcbcb;">               
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="right" height="30" width="80">
                                    作　　者：</td>
                                <td>
                                    <asp:Label ID="lblmsg_author" runat="server" Text="lblmsg_author"></asp:Label>
                                    <asp:Label ID="lblmsg_no" runat="server" Text="lblmsg_no" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" height="30">
                                    標　　題：</td>
                                <td>
                                    <asp:Label ID="lblmsg_title" runat="server" Text="lblmsg_title"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" height="30">
                                    發表時間：</td>
                                <td>
                                    <asp:Label ID="lblmsg_date" runat="server" Text="lblmsg_date"></asp:Label>
                                    &nbsp;-
                                    <asp:Label ID="lblmsg_time" runat="server" Text="lblmsg_time"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" height="30">
                                    內　　容：</td>
                                <td>
                                    <asp:Label ID="lblmsg_content" runat="server" Text="lblmsg_content"></asp:Label>
                                </td>
                            </tr>
                        </table>
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
        <tr>
            <td height="30">
                </td>
        </tr>        
        <tr>
            <td style="padding: 10px; border-style: dashed; border-width: 1px; border-color: #BC6987;">
                
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
                                            onpageindexchanging="replyGv_PageIndexChanging">
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
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("msgsub_content") %>'></asp:Label>
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
                                            </Columns>
                                            <HeaderStyle BackColor="#BC6987" Height="30px" HorizontalAlign="Center" 
                                                ForeColor="White" />
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
    </table>
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
        <tr>
            <td height="30">
                </td>
        </tr>        
        <tr>
            <td style="padding: 10px; border-style: dashed; border-width: 1px; border-color: #BC6987;">
            <asp:Panel ID="pnmsg1" runat="server">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td height="30" align="left">
                            <asp:Label ID="Label1" runat="server" ForeColor="Red" 
                                Text="您必需登入會員，方可於意見交流留下您的意見。"></asp:Label>
                        </td>
                    </tr>
                </table>                                        
            </asp:Panel>
            <asp:Panel ID="pnmsg2" runat="server">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td style="text-align: right; " height="30" width="80">內容：</td>
                        <td width="580">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; " class="style1" colspan="2">
                            <fckeditorv2:fckeditor ID="txtContent" runat="server" BasePath="editor/" 
                                Height="200px" ToolbarSet="msg">
                            </fckeditorv2:fckeditor>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;" class="style1" colspan="2">                    
                            <div style="text-align: center; padding: 5px;">
                                <asp:Button ID="btnAdd" runat="server" Text="發表回覆" Height="20px" 
                                    onclick="btnAdd_Click" />
                            </div>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            </td>
        </tr>
    </table> 
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>