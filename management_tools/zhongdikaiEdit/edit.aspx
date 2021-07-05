<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="management_tools_zhongdikaiEdit_edit, App_Web_edit.aspx.6413ccee" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../style/management_tools.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mmain" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
        <table style="width:700px;">
            <tr>
                <td class="style1">
                    <asp:GridView ID="pdtGv" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BorderWidth="0px" EnableViewState="False" 
                        PageSize="15" Width="100%" onpageindexchanging="pdtGv_PageIndexChanging" 
                        onrowcommand="pdtGv_RowCommand" onrowcreated="pdtGv_RowCreated">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="序號">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:ButtonField CommandName="SELECT" DataTextField="id" HeaderText="序號">
                            <ItemStyle HorizontalAlign="Left" Width="80px" Height="30px" />
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="SELECT2" DataTextField="name" HeaderText="名稱" 
                                Text="名稱">
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:ButtonField>
                            <asp:BoundField DataField="class" HeaderText="類別">
                            <ItemStyle HorizontalAlign="Center" Width="130px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ps" HeaderText="圖片寬:高(像素)">
                            <ItemStyle HorizontalAlign="Left" Width="150px" />
                            </asp:BoundField>
                        </Columns>
                        <HeaderStyle BackColor="#CCCCCC" Height="30px" HorizontalAlign="Center" />
                        <PagerSettings FirstPageText="第一頁" LastPageText="最末頁" Mode="NumericFirstLast" 
                            NextPageText="下一頁" PreviousPageText="上一頁" />
                        <PagerStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
                <td style=" width:150px; text-align:right; height:30px;">
                序號：</td>
                <td style=" text-align:left;">
                    <asp:Label ID="lbl_id" runat="server" CssClass="textbox" 
                        Width="150px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style=" text-align:right; height:30px;">
                名稱：</td>
                <td style=" text-align:left;">
                    <FCKeditorV2:FCKeditor ID="txt_name" runat="server" 
                        BasePath="../../editor/" ToolbarSet="user_advance" Height="350px" 
                        Width="400px">
                        
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FCKeditorV2:FCKeditor>
                </td>
            </tr>
            <tr>
                <td style=" text-align:right; height:30px;">
                超連結：</td>
                <td style=" text-align:left;">
                    <asp:TextBox ID="txt_link" runat="server" CssClass="textbox" Width="350px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style=" text-align:right; height:30px;">
                類別：</td>
                <td style=" text-align:left;">
                    <asp:Label ID="lbl_class" runat="server" CssClass="textbox"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">圖一：</td>
                <td>
                    <asp:FileUpload runat="server" CssClass="fileupload" ID="fudPdtImg1"></asp:FileUpload>
                    <asp:Button ID="btnLogoUpload1" runat="server" Text="上傳" Height="20px" 
                        onclick="btnLogoUpload1_Click" />                        
                    <asp:Panel ID="pnimg1" runat="server">
                        <asp:Image ID="pdtimg1" runat="server" />
                        <asp:Label ID="lblimg1" runat="server" Text="lblimg1" Visible="False"></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td style=" text-align:right; height:30px;">
                圖片寬:高(像素px)：</td>
                <td style=" text-align:left;">
                    <asp:Label ID="lbl_ps" runat="server" CssClass="textbox" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <div style="text-align: left; padding: 5px;">
                        <asp:Button ID="btnUpdate" runat="server" Text="修改" Height="20px" 
                            onclick="btnUpdate_Click" />
                    &nbsp;<asp:Button ID="btnCancel" runat="server" Text="取消" Height="20px" 
                            onclick="btnCancel_Click" />
                    </div>
                </td>
            </tr>
        </table>
        </asp:View>
    </asp:MultiView>
    <asp:Label ID="lbl_ad_id" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lbl_ad_class" runat="server" Visible="false"></asp:Label>
</asp:Content>