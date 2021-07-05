<%@ page title="" language="C#" masterpagefile="~/management_tools/MasterPage.master" autoeventwireup="true" inherits="management_tools_products_M_update, App_Web_products_m_update.aspx.8728bb32" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="form" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="all" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="main" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td colspan="2">
                <h4>編輯商品</h4>
            </td>
        </tr>
            <tr>
                <td style="text-align: right; width:80px;">名稱：</td>
                <td>
                <asp:TextBox ID="txtpdt_name" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>&nbsp;<span class="warning">*<asp:Label 
                        ID="lblpdt_no" runat="server" Text="lblpdt_no" Visible="False"></asp:Label>
                    </span></td>
            </tr>
        <tr>
            <td style="text-align: right;">售價：</td>
            <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100">
            <asp:TextBox ID="txtpdt_sell" runat="server" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td>
                <asp:RadioButtonList ID="rblpdt_sellstate" runat="server" 
                    RepeatDirection="Horizontal" Visible="False">
                    <asp:ListItem Selected="True" Value="01">顯示價格</asp:ListItem>
                    <asp:ListItem Value="02">電詢</asp:ListItem>
                    <asp:ListItem Value="03">面議</asp:ListItem>
                    <asp:ListItem Value="04">不顯示</asp:ListItem>
                </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">批發價：</td>
            <td>
            <asp:TextBox ID="txtpdt_wholesale_price" runat="server" CssClass="textbox"></asp:TextBox>
            &nbsp;<span class="warning">可不填</span></td>
        </tr>
        <tr>
            <td style="text-align: right;">單位：</td>
            <td>
                <asp:TextBox ID="txtpdt_units" runat="server" CssClass="textbox" Width="40"></asp:TextBox>
            </td>
        </tr> 
        <tr>
            <td style="text-align: right;">庫存：</td>
            <td>
                <asp:TextBox ID="txtpdt_stocks" runat="server" CssClass="textbox"></asp:TextBox>
            </td>
        </tr>         
        <tr>
            <td style="text-align: right;">類別：</td>
            <td>
                <asp:DropDownList ID="ddlpdt_itemA" runat="server" 
                    CssClass="textbox" AutoPostBack="True" 
                    onselectedindexchanged="ddlpdt_itemA_SelectedIndexChanged1" >
                </asp:DropDownList>
            </td>
        </tr>         
        <tr>
            <td colspan="2">
                        
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left"><div style="border: solid 1px #ccc; background-color: #ffe; padding: 3px;  line-height: 22px; margin: 3px"><span class="warning">1. 如須更換商品圖檔，才須重新上傳圖片。</span><br />
                2. 圖片最適大小為：寬度 210 (像素)，高度 280 (像素)。<br />3. 圖片大小如超過最適大小，將會自動壓縮成最適大小。</div></td>
        </tr>
        <tr>
            <td style="text-align: right;">圖示：</td>
            <td>
                <asp:FileUpload runat="server" CssClass="fileupload" ID="fudPdtImg1"></asp:FileUpload>
                <asp:Button ID="btnLogoUpload1" runat="server" Text="上傳" Height="20px" 
                    onclick="btnLogoUpload1_Click" />                        
                <asp:Button ID="btnDImg1" runat="server" Text="刪除圖一" Height="20px" 
                    onclick="btnDImg1_Click" Visible="False" />
                <asp:Panel ID="pnimg1" runat="server">
                    <asp:Image ID="pdtimg1" runat="server" Height="120px" Width="90px" />
                    <asp:Label ID="lblimg1" runat="server" Text="lblimg1" Visible="False"></asp:Label>
                </asp:Panel>
            </td>
        </tr>         
        <asp:Panel ID="pan1" runat="server" Visible="false">
        <tr>
            <td style="text-align: right;">圖二：</td>
            <td><asp:FileUpload runat="server" CssClass="fileupload" ID="fudPdtImg2"></asp:FileUpload>
                <asp:Button ID="btnLogoUpload2" runat="server" Text="上傳" Height="20px" 
                    onclick="btnLogoUpload2_Click" />
                <asp:Button ID="btnDImg2" runat="server" Text="刪除圖二" Height="20px" 
                    onclick="btnDImg2_Click" />
                <asp:Panel ID="pnimg2" runat="server">
                    <asp:Image ID="pdtimg2" runat="server" Height="120px" Width="90px" />
                    <asp:Label ID="lblimg2" runat="server" Text="lblimg2" Visible="False"></asp:Label>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">圖三：</td>
            <td><asp:FileUpload runat="server" CssClass="fileupload" ID="fudPdtImg3"></asp:FileUpload>
                <asp:Button ID="btnLogoUpload3" runat="server" Text="上傳" Height="20px" 
                    onclick="btnLogoUpload3_Click" />
                <asp:Button ID="btnDImg3" runat="server" Text="刪除圖三" Height="20px" 
                    onclick="btnDImg3_Click" />
                <asp:Panel ID="pnimg3" runat="server">
                    <asp:Image ID="pdtimg3" runat="server" Height="120px" Width="90px" />
                    <asp:Label ID="lblimg3" runat="server" Text="lblimg3" Visible="False"></asp:Label>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">圖四：</td>
            <td><asp:FileUpload runat="server" CssClass="fileupload" ID="fudPdtImg4"></asp:FileUpload>
                <asp:Button ID="btnLogoUpload4" runat="server" Text="上傳" Height="20px" 
                    onclick="btnLogoUpload4_Click" />
                <asp:Button ID="btnDImg4" runat="server" Text="刪除圖四" Height="20px" 
                    onclick="btnDImg4_Click" />
                <asp:Panel ID="pnimg4" runat="server">
                    <asp:Image ID="pdtimg4" runat="server" Height="120px" Width="90px" />
                    <asp:Label ID="lblimg4" runat="server" Text="lblimg4" Visible="False"></asp:Label>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">圖五：</td>
            <td><asp:FileUpload runat="server" CssClass="fileupload" ID="fudPdtImg5"></asp:FileUpload>
                <asp:Button ID="btnLogoUpload5" runat="server" Text="上傳" Height="20px" 
                    onclick="btnLogoUpload5_Click" />
                <asp:Button ID="btnDImg5" runat="server" Text="刪除圖五" Height="20px" 
                    onclick="btnDImg5_Click" />
                <asp:Panel ID="pnimg5" runat="server">
                    <asp:Image ID="pdtimg5" runat="server" Height="120px" Width="90px" />
                    <asp:Label ID="lblimg5" runat="server" Text="lblimg5" Visible="False"></asp:Label>
                </asp:Panel>
            </td>
        </tr>
        </asp:Panel>
        <tr>
            <td style="text-align: right;">商品描述：</td>
            <td>
                &nbsp;</td>
        </tr>         
        <tr>
            <td style="text-align: right;" colspan="2">
            <fckeditorv2:fckeditor ID="txtpdt_content" runat="server" BasePath="../fckeditor/" 
                Height="340px" ToolbarSet="user_advance">
            </fckeditorv2:fckeditor>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <span class="warning">*為必填欄位！</span></td>
        </tr>            
        <tr>
            <td colspan="2" style="text-align: center;">
                <asp:Button ID="btnUpdate" runat="server" Text="更新" 
                    Height="20px" onclick="btnUpdate_Click" />
            &nbsp;<asp:Button ID="btnDelete" runat="server" Text="刪除" Height="20px" 
                        onclick="btnDelete_Click" 
                    OnClientClick="if(confirm('確定刪除？')==false) return false;"/>
                &nbsp;<asp:Button ID="btnBack" runat="server" Text="回上頁" Height="20px" 
                        onclick="btnUserBack_Click" />
            </td>
        </tr>            
    </table>
</asp:Content>

