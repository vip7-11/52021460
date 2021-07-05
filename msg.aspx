<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="msg.aspx.cs" Inherits="msg" %>
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
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td class="style1">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td height="30" style="text-align: right" width="80">
                                                查詢：</td>
                                            <td width="100">
                                                <asp:DropDownList ID="ddlSelect" runat="server" CssClass="textbox" Width="90px">
                                                    <asp:ListItem Value="msg_title">標題</asp:ListItem>
                                                    <asp:ListItem Value="msg_author">作者</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSelect" runat="server" CssClass="textbox" MaxLength="20" 
                                                    Width="150px"></asp:TextBox>
                                                &nbsp;<asp:Button ID="btnSelect" runat="server" Height="20px" 
                                                    onclick="btnSelect_Click" Text="搜尋" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td height="30" style="text-align: right" width="80">
                                                排序：</td>
                                            <td width="100">
                                                <asp:DropDownList ID="ddlOrderBy" runat="server" AutoPostBack="True" 
                                                    CssClass="textbox" onselectedindexchanged="ddlOrderBy_SelectedIndexChanged" 
                                                    Width="90px">
                                                    <asp:ListItem Value="msg_date">依發表日</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td width="120">
                                                <asp:RadioButtonList ID="rblOrderBy" runat="server" AutoPostBack="True" 
                                                    onselectedindexchanged="rbl_order_SelectedIndexChanged" 
                                                    RepeatDirection="Horizontal" Width="106px">
                                                    <asp:ListItem Value="ASC">遞增</asp:ListItem>
                                                    <asp:ListItem Selected="True" Value="DESC">遞減</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                            <td align="right">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="msgGv" runat="server" AllowPaging="True" 
                                        AutoGenerateColumns="False" BorderWidth="0px" GridLines="None" 
                                        onpageindexchanging="msgGv_PageIndexChanging" onrowcommand="msgGv_RowCommand" 
                                        onrowcreated="msgGv_RowCreated" PageSize="15" Width="100%">
                                        <Columns>
                                            <asp:BoundField DataField="msg_no" HeaderText="編號" SortExpression="msg_no">
                                                <ItemStyle HorizontalAlign="Center" Width="70px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="msg_author" HeaderText="作者" 
                                                SortExpression="msg_author">
                                                <ItemStyle Height="30px" HorizontalAlign="Left" Width="120px" />
                                            </asp:BoundField>
                                            <asp:ButtonField CommandName="SELECT" DataTextField="msg_title" HeaderText="標題" 
                                                SortExpression="msg_title" Text="標題">
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:ButtonField>
                                            <asp:BoundField DataField="msg_date" HeaderText="發表日期" 
                                                SortExpression="msg_date">
                                                <ItemStyle HorizontalAlign="Center" Width="80px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="msg_time" HeaderText="發表時間" 
                                                SortExpression="msg_time">
                                                <ItemStyle HorizontalAlign="Center" Width="80px" />
                                            </asp:BoundField>
                                        </Columns>
                                        <HeaderStyle BackColor="#BC6987" Height="30px" HorizontalAlign="Center" 
                                            ForeColor="White" />
                                        <PagerSettings FirstPageText="第一頁" LastPageText="最末頁" Mode="NumericFirstLast" 
                                            NextPageText="下一頁" PreviousPageText="上一頁" />
                                        <PagerStyle HorizontalAlign="Center" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
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
                        <td style="text-align: right; width: 80px;" height="30">標題：</td>
                        <td>
                                <asp:TextBox ID="txtTitle" runat="server" CssClass="textbox"   
                                    MaxLength="25" Width="250px"></asp:TextBox>
                            </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; " height="30">內容：</td>
                        <td>&nbsp;</td>
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
                                <asp:Button ID="btnAdd" runat="server" Text="發表意見" Height="20px" 
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