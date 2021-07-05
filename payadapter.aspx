<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="payadapter, App_Web_payadapter.aspx.cdcab7d2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="form" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="all" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="banner_up" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="banner_down" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="nav" Runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="main" Runat="Server">
    <input type="hidden" name="mer_id" value='<%= YamaZoo.getECBankCode(HttpContext.Current.Session["ownerID"].ToString()) %>' />
    <input type="hidden" name="amt" value='<%= (string)HttpContext.Current.Session["totalPrice"] %>' />
    <input type="hidden" name="od_sob" value='<%= HttpContext.Current.Session["orderID"] %>' />
    <input type="hidden" name="return_url" value="http://www.vip7-11.com.tw/payadapter.aspx" />
    <asp:Panel ID="show_GVlist" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
        <tr>
            <td height="30" style=" padding-left:15px;">
                <span style=" color:#787878; font-size:14pt;">VIP商城購物網--訂單結帳系統</span>
            </td>
        </tr>
        <tr>
            <td style="padding: 10px; border-style: dashed; border-width: 1px; border-color: #cbcbcb;">
                <table border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
                    <tr>
                        <td>
                            <asp:GridView ID="carGv" runat="server" AllowPaging="True" 
                                AutoGenerateColumns="False" GridLines="None" 
                                onpageindexchanging="carGv_PageIndexChanging" 
                                onrowcreated="carGv_RowCreated" PageSize="15" Width="100%" 
                                onrowdatabound="carGv_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="pdt_no" HeaderText="系統編號" SortExpression="pdt_no">
                                        <ItemStyle HorizontalAlign="Center" Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="pdt_id" HeaderText="商品編號" SortExpression="pdt_id">
                                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="pdt_name" HeaderText="商品名稱" 
                                        SortExpression="pdt_name" />
                                    <asp:TemplateField HeaderText="商品規格">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_pdt_no" runat="server" Text='<%# Eval("pdt_no") %>' Visible="false" ></asp:Label>
                                            <asp:Label ID="lb_select" runat="server" Text="" Visible="false" ></asp:Label>
                                            <asp:Label ID="obj_specific" Text='<%# Eval("pdt_specification") %>' runat="server" Visible="false" />
                                            <asp:Literal ID="specific" runat="server"></asp:Literal>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="pdt_count" HeaderText="數量" 
                                        SortExpression="pdt_count">
                                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="pdt_sell" HeaderText="優惠價" SortExpression="pdt_sell">
                                        <ItemStyle Height="30px" HorizontalAlign="Right" Width="60px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="pdt_sum" HeaderText="小計" SortExpression="pdt_sum">
                                        <ItemStyle HorizontalAlign="Right" Width="60px" />
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle BackColor="#BC6987" ForeColor="White" Height="30px" 
                                    HorizontalAlign="Center" />
                                <PagerSettings FirstPageText="第一頁" LastPageText="最末頁" Mode="NumericFirstLast" 
                                    NextPageText="下一頁" PreviousPageText="上一頁" />
                                <PagerStyle HorizontalAlign="Center" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <table border="0" cellpadding="0" cellspacing="0" width="200">
                                <tr>
                                    <td height="30"></td>
                                </tr>
                                <tr>
                                    <td style=" text-align:right; width:100px; height:30px;">
                                        商品合計：</td>
                                    <td style=" text-align:right;">
                                        <asp:Label ID="lblSum" runat="server" Text="lblSum"></asp:Label>元
                                    </td>
                                    <td style=" width:6px;"></td>
                                </tr>
                                <tr>
                                    <td style=" text-align:right; height:30px;">
                                        運費合計：</td>
                                    <td style=" text-align:right;">
                                        <asp:Label ID="lblFees" runat="server" Text="lblFees"></asp:Label>元
                                    </td>
                                </tr>
                                <tr>
                                    <td style=" text-align:right; height:30px;">
                                        手續費：</td>
                                    <td style=" text-align:right;">
                                        <asp:Label ID="lbl_service_cost" runat="server" Text="lbl_service_cost"></asp:Label>元
                                    </td>
                                </tr>
                                <tr>
                                    <td style=" text-align:right; height:30px;">
                                        總　　計：</td>
                                    <td style=" text-align:right;">
                                        <asp:Label ID="lblTotal" runat="server" Text="lblTotal"></asp:Label>元
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </asp:Panel>
    <asp:Panel ID="storePanel" runat="server" Visible="false">        
      <table class="box" border="0" cellspacing="0" cellpadding="0" style="width: 100%; background-color: #BC6987; margin-bottom: 20px;">
        <tr>
            <td class="title" style="height: 30px; text-align:center; color:#fff;">來店取貨 (請於備註欄位填妥來店時間以便我們為您服務)</td>
        </tr>
      </table>      
    </asp:Panel>

    <asp:Panel ID="recpayPanel" runat="server" Visible="false">        
      <table class="box" border="0" cellspacing="0" cellpadding="0" style="width: 100%; background-color: #BC6987; margin-bottom: 20px;">
        <tr>
            <td class="title" style="height: 30px; text-align:center; color:#fff;">貨到付款</td>
        </tr>
      </table>      
    </asp:Panel>

    <asp:Panel ID="atmPanel" runat="server" Visible="false">        
      <table class="box" border="0" cellspacing="0" cellpadding="0" style="width: 100%; background-color: #BC6987; margin-bottom: 20px;">
        <tr>
            <td class="title" style="height: 30px; text-align:center; color:#fff;">ATM 轉帳 (完成購物後我們將提供您匯款資訊)</td>
        </tr>
      </table>        
    </asp:Panel>

    <div id="payForm" style="text-align: center; margin-bottom: 20px;" runat="server" visible="false">
        <asp:Button ID="btnPay" runat="server" Text="完成購物" onclick="btnPay_Click" OnClientClick="this.value='傳送中，勿重覆點擊';" />&nbsp;
        <input type="reset" value="重選付款方式" onclick="history.go(-1)" />
        </div>

    <asp:Panel ID="watmPanel" runat="server" Visible="false">        
      <table class="box" border="0" cellspacing="0" cellpadding="0" style="width: 100%; background-color: #BC6987; margin-bottom: 20px;">
        <tr>
            <td class="title" style="height: 30px; text-align:center; color:#fff;">WebATM 即時付 (網路ATM即時轉帳，不需輸入店家帳號，需金融卡讀卡機。)</td>
        </tr>
      </table>
      <div id="watmError" runat="server" style="margin-bottom: 10px; text-align: center;" visible="false">
        <span style="color: #f00;">* Web ATM 匯款時發生錯誤，此交易並未扣款！您可以再嘗試一次或重選付款方式，如有其他問題請與我們連絡。</span>
      </div>
      <div style="text-align: center;  margin-bottom: 20px;">
        <input type="submit" value="開始付款" />&nbsp;
        <input type="reset" value="重選付款方式" onclick="history.go(-1)" />
      </div>
      <input type="hidden" name="payment_type" value="web_atm" />        
    </asp:Panel>

    <asp:Panel ID="cvsPanel" runat="server" Visible="false">
    <table class="box" border="0" cellspacing="0" cellpadding="0" style="width: 100%; background-color: #BC6987; margin-bottom: 20px;">
        <tr>
            <td class="title" style="height: 30px; text-align:center; color:#fff;">超商代碼繳費 (取得繳費代碼至，全家 Famiport或萊爾富Life-ET繳費。)</td>
        </tr>
    </table>
    <div id="cvsError" runat="server" style="margin-bottom: 10px; text-align: center;" visible="false">
        <span style="color: #f00;">* 取得超商代碼時發生錯誤！您可以再嘗試一次或重選付款方式，如有其他問題請與我們連絡。</span>
    </div>
    <div style="text-align: center; margin-bottom: 20px;">
        <asp:Button ID="btnCsPay" Text="取得超商代碼" runat="server" OnClick="btnCsPay_Click" OnClientClick="this.value='傳送中，勿重覆點擊';" />&nbsp;
        <input type="button" value="重選付款方式" onclick="history.go(-1)" />
    </div>
    </asp:Panel>
    <asp:Panel ID="cvs_ibonPanel" runat="server" Visible="false">
    <table class="box" border="0" cellspacing="0" cellpadding="0" style="width: 100%; background-color: #BC6987; margin-bottom: 20px;">
        <tr>
            <td class="title" style="height: 30px; text-align:center; color:#fff;">超商代碼繳費 (取得繳費代碼至，7-11/I-BON繳費。)</td>
        </tr>
    </table>
    <div id="csv_IBONError" runat="server" style="margin-bottom: 10px; text-align: center;" visible="false">
        <span style="color: #f00;">* 取得超商代碼時發生錯誤！您可以再嘗試一次或重選付款方式，如有其他問題請與我們連絡。</span>
    </div>
    <div style="text-align: center; margin-bottom: 20px;">
        <asp:Button ID="btnCs_ibonPay" Text="取得超商代碼" runat="server" 
            OnClientClick="this.value='傳送中，勿重覆點擊';" onclick="btnCs_ibonPay_Click" />&nbsp;
        <input type="button" value="重選付款方式" onclick="history.go(-1)" />
    </div>
    </asp:Panel>

    <asp:Panel ID="visaPanel" runat="server" Visible="false">
    <table class="box" border="0" cellspacing="0" cellpadding="0" style="width: 100%; background-color: #BC6987; margin-bottom: 20px;">
        <tr>
            <td class="title" style="height: 30px; text-align:center; color:#fff;">線上刷卡 (PayPal)</td>
        </tr>
    </table>
    <div id="visaError" runat="server" style="margin-bottom: 10px; text-align: center;" visible="false">
        <span style="color: #f00;">* PayPal 付款時發生錯誤，此交易並未扣款！您可以再嘗試一次或重選付款方式，如有其他問題請與我們連絡。</span>
      </div>
      <div id="visaWarning" runat="server" style="margin-bottom: 10px; text-align: center;" visible="false">
        <span style="color: #f00;">* PayPal 付款時由於帳號安全性設定發生錯誤，請與我們連絡確認是否已扣款完成。</span>
      </div>
      <div style="text-align: center;  margin-bottom: 20px;">
          <input type="button" value="開始付款" onclick="javascript:aspnetForm.submit();this.value='傳送中，勿重覆點擊';" />&nbsp;
          <input type="reset" value="重選付款方式" onclick="history.go(-1)" />
      </div>
      <input type="hidden" name="payment_type" value="paypal" />
      <input type="hidden" name="item_name" value='<%= YamaZoo.getStoreName(HttpContext.Current.Session["ownerID"].ToString()) %>' />
      <input type="hidden" name="cancel_url" value="http://www.vip7-11.com.tw/acc.aspx" />
      <input type="hidden" name="cur_type" value="TWD" />   
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>