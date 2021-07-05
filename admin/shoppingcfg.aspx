<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="shoppingcfg.aspx.cs" Inherits="admin_shoppingcfg" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
<h3>購物功能設定</h3>
<table style="width: 100%;" class="noborder">
    <tr>
        <td style="padding: 5px 0px;">
            <div style="border: solid 1px #ccc; background-color: #dfffab; padding: 3px;  line-height: 22px;">
                <asp:CheckBox ID="cbxOpenCart" Text=" 開放購物車功能" runat="server" Font-Bold="true" 
                    Visible="False" />
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <ajaxToolkit:TabContainer ID="cartcfgblock" runat="server" ActiveTabIndex="0" 
                Width="100%" CssClass="ajax__tab_yuitabview-theme"> 
                    <ajaxToolkit:TabPanel runat="server" ID="payway">
                        <HeaderTemplate>付款方式</HeaderTemplate>
                        
<ContentTemplate><table border="0" cellpadding="0" cellspacing="0" style="width: 100%;"><tr><td style="padding-left: 15px; border-top: dotted 1px #aaa; padding-top: 3px;">1. <asp:CheckBox ID="cbxATM" Text=" ATM 轉帳" runat="server" Enabled="False" /></td></tr><tr><td style="padding: 0 10px; padding-bottom: 5px;"><div style="border: solid 1px #ccc; background-color: #fdf; padding: 3px;  line-height: 22px;"><span style="color: Red;">ATM匯款帳號</span><br /> 銀行：<asp:TextBox ID="BankName" runat="server" MaxLength="10" Width="100px"></asp:TextBox>&nbsp;&nbsp; 代號：<asp:TextBox ID="BankCode" runat="server" Width="40px"></asp:TextBox>&nbsp;&nbsp; 戶名：<asp:TextBox ID="AccountName" runat="server" MaxLength="10" Width="90px"></asp:TextBox>&nbsp;&nbsp; 帳號：<asp:TextBox ID="AccountNumber" runat="server" Width="120px"></asp:TextBox>&nbsp;&nbsp; <asp:Button ID="btnOpenATM" runat="server" Text="設定" onclick="btnOpenATM_Click" /><ajaxToolkit:FilteredTextBoxExtender ID="BankCode_FilteredTextBoxExtender" 
                runat="server" Enabled="True" FilterType="Numbers" TargetControlID="BankCode"></ajaxToolkit:FilteredTextBoxExtender></div></td></tr><tr><td style="padding-left: 15px; border-top: dotted 1px #aaa; padding-top: 3px;">2. <asp:CheckBox ID="cbxRecPay" Text=" 貨到付款" runat="server" /></td></tr><tr><td style="padding: 0 10px; padding-bottom: 5px;"><div style="border: solid 1px #ccc; background-color: #fdf; padding: 3px;">設定貨到付款手續費，每筆訂單加收 <asp:TextBox ID="recPayCount" runat="server" MaxLength="3" Width="40px"></asp:TextBox>元。 </div></td></tr><tr><td style="padding-left: 15px; padding-top: 3px; border-top: dotted 1px #aaa;">3. <asp:CheckBox ID="cbxWATM" Text=" WebATM 即時付" runat="server" Enabled="False" />&nbsp;(網路ATM即時轉帳，不需輸入店家帳號，需金融卡讀卡機。)</td></tr><tr><td style="padding-left: 15px; padding-top: 3px;">4. <asp:CheckBox ID="cbxCSPay" Text=" 超商代碼繳費" runat="server" Enabled="False" />&nbsp;(取得繳費代碼至，全家 Famiport或萊爾富Life-ET繳費。)</td></tr><tr><td style="padding-left: 15px; padding-top: 3px;">5. <asp:CheckBox ID="cbxVISA" runat="server" Enabled="False" Text="  線上刷卡" />(您必須申請PayPal帳號，並與ECBank接駁後才能使用該付款方式。) </td></tr><tr><td style="padding: 0 10px; padding-bottom: 5px;"><div style="border: solid 1px #ccc; background-color: #fdf; padding: 3px; line-height: 22px;"><table border="0" cellpadding="0" cellspacing="0" style="width: 100%;"><tr><td><span style="color: Red;">以上功能由綠界提供，請先確認您已申請綠界 <a href="http://www.ecbank.com.tw/" target="_blank">ECBank</a> 
    金流服務。</span><br /> 商家代號&nbsp;<asp:TextBox ID="gwStoreCode" runat="server" Width="60px"></asp:TextBox><ajaxToolkit:FilteredTextBoxExtender ID="gwStoreCode_FilteredTextBoxExtender" 
                runat="server" Enabled="True" FilterType="Numbers" TargetControlID="gwStoreCode"></ajaxToolkit:FilteredTextBoxExtender>&nbsp; 交易加密私鑰&nbsp;<asp:TextBox ID="gwStoreCheck" runat="server" Width="200px" MaxLength="30"></asp:TextBox>&nbsp;&nbsp;<asp:Button ID="btnOpenEZPay" runat="server" Text="設定" onclick="btnOpenEZPay_Click" /></td><td style="text-align: right;" valign="top"><a href="https://ecbank.com.tw/login.php" target="_blank">[ 綠界後台 ]</a> </td></tr></table></div></td></tr><tr><td style="padding-left: 15px; border-top: dotted 1px #aaa; padding-top: 3px;">
    6. <asp:CheckBox ID="cbxibon" Text=" 超商代碼繳費/ibon" runat="server" />&nbsp;(取得繳費代碼至，統一超商 I-BON繳費。)</td></tr></table></ContentTemplate>
                    
</ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" ID="shipping">
                        <HeaderTemplate>運費設定</HeaderTemplate>
                        
<ContentTemplate>   
                        
   
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;"><tr><td style="padding-left: 10px; border-bottom: dotted 1px #ccc;"><strong>運費設定</strong> </td></tr><tr><td style="padding-left: 10px; border-bottom: dotted 1px #ddd;">商品預設運費 
                            <asp:TextBox ID="defaultFreight" runat="server" Width="40px"></asp:TextBox><ajaxToolkit:FilteredTextBoxExtender ID="defaultFreight_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="defaultFreight" FilterType="Custom, Numbers" ValidChars="."></ajaxToolkit:FilteredTextBoxExtender>&nbsp;元 </td></tr><tr><td style="padding-left: 10px; border-bottom: dotted 1px #ddd;"><asp:CheckBox ID="cbxFreeFreight" Text=" 消費超過" runat="server" />&nbsp;<asp:TextBox 
                                    ID="txtFreeFreight" Width="60px" runat="server"></asp:TextBox><ajaxToolkit:FilteredTextBoxExtender ID="txtFreeFreight_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="txtFreeFreight" FilterType="Custom, Numbers" ValidChars="."></ajaxToolkit:FilteredTextBoxExtender>&nbsp;元免收運費 </td></tr><tr><td>&nbsp;</td></tr><tr><td style="padding-left: 10px; border-bottom: dotted 1px #ddd;"><strong>運費計算方式</strong> </td></tr><tr><td style="padding-left: 10px; border-bottom: dotted 1px #ddd;"><asp:RadioButton ID="rdoHighestFreight" Text="以消費者訂單商品中最高運費為運費" runat="server" GroupName="Freight" /></td></tr><tr><td style="padding-left: 10px; border-bottom: dotted 1px #ddd;"><asp:RadioButton ID="rdoSumFreight" Text="加總所有商品之運費為運費" runat="server" GroupName="Freight" /></td></tr><tr><td style="padding-left: 10px; border-bottom: dotted 1px #ddd;"><asp:RadioButton ID="rdoLimitFreight" Text="加總所有商品之運費為運費，但不超過" runat="server" GroupName="Freight" />&nbsp;<asp:TextBox 
                                ID="overFreight" Width="60px" runat="server"></asp:TextBox><ajaxToolkit:FilteredTextBoxExtender ID="overFreight_FilteredTextBoxExtender" 
                runat="server" Enabled="True" TargetControlID="overFreight" FilterType="Custom, Numbers" ValidChars="."></ajaxToolkit:FilteredTextBoxExtender>&nbsp;元 </td></tr><tr><td style="height: 160px;"> </td></tr></table></ContentTemplate>
                    
</ajaxToolkit:TabPanel>
                    <%--<ajaxToolkit:TabPanel runat="server" ID="stock">
                        <HeaderTemplate>庫存設定</HeaderTemplate>
                        
<ContentTemplate><table border="0" cellpadding="0" cellspacing="0" style="width: 100%;"><tr><td style="padding-left: 10px; border-bottom: dotted 1px #ddd;">當庫存量低於 <asp:TextBox ID="txtLowStock" runat="server" Width="40"></asp:TextBox>時，標記為低庫存。 <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                runat="server" Enabled="True" TargetControlID="txtLowStock" FilterType="Numbers"></ajaxToolkit:FilteredTextBoxExtender></td></tr><tr><td style="padding-left: 10px; border-bottom: dotted 1px #ddd;"><asp:CheckBox ID="cbxZeroStock" runat="server" Text=" 當庫存為零時，依然接受下單。" /></td></tr><tr><td style="padding-left: 10px; border-bottom: dotted 1px #ddd;"></td></tr><tr><td style="height: 160px;"> </td></tr></table></ContentTemplate>
                    
</ajaxToolkit:TabPanel>--%>
                    <%--<ajaxToolkit:TabPanel runat="server" ID="tradenote">
                        <HeaderTemplate>交易注意事項</HeaderTemplate>
                        
<ContentTemplate>          
                            
          
                            <FCKeditorV2:FCKeditor ID="shoppingnote" runat="server" BasePath="../editor/" Width="99%" Height="350px" ToolbarSet="user_basic"></FCKeditorV2:FCKeditor><div style="text-align: center; padding: 5px;"><asp:Button ID="btnPreview" runat="server" Text="　預覽　" onclick="btnPreview_Click" /></div></ContentTemplate>
                    
</ajaxToolkit:TabPanel>--%>
                </ajaxToolkit:TabContainer>
        </td>
    </tr>    
</table>
<div style="text-align: center; margin: 10px 0px;">
    <asp:Button ID="btnSubmit" runat="server" Text="確認修改" onclick="btnSubmit_Click" />
</div>

</asp:Content>

