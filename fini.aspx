<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="fini.aspx.cs" Inherits="fini" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
.t18
{
    color:#fff;
    padding-left:15px;
}
.title
{
    color:#fff;
}
</style>
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
    <table border="0" cellpadding="0" cellspacing="0" style=" width:100%">
    <tr>
        <td height="30">
                <%--<img alt="" src="images/shopping004.gif" />--%>
                <span style=" color:#787878; font-size:14pt;">VIP商城購物網--完成訂購</span>
            </td>
    </tr>
    <tr>
        <td style=" padding:10px;">
        <%--<table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
        <tr>
            <td height="30">
                <img alt="" src="images/car.png" /></td>
        </tr>
        <tr>
            <td style="padding: 10px; border-style: dashed; border-width: 1px; border-color: #BC6987;">
                訂購完成。立即查看<a href="#">我的訂單</a>。</td>
        </tr>
    </table>--%>
    <div style="border: solid 1px #ccc; background-color: #eff; margin: 15px 0px; padding: 5px;">
           您的購物流程已完成！您可以至<a href="shoppinghistory.aspx" target="_blank">購物清單</a>中檢視您的購物紀錄及訂單資訊，感謝您的光臨！
    </div>
    <h1><asp:Literal ID="storeName" runat="server"></asp:Literal></h1>
    <img src="./admin/images/layout/cart/h2.jpg" width="440" height="15" />
    <table class="box" border="0" cellspacing="1" cellpadding="0" style="width: 100%; background-color: #BC6987;">
        <tr>
            <td colspan="2" style="background-color: #BC6987;"><img src="./admin/images/layout/cart/h1.png" /><span class="t18">訂單資訊</span></td>
        </tr>
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; width: 150px; height:30px;">付款方式</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Literal ID="ltlPayWay" runat="server"></asp:Literal></td>
        </tr>
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; height:30px;">訂單編號</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Literal ID="ltlOrderID" runat="server"></asp:Literal></td>
        </tr>
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; height:30px;">訂單時間</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Literal ID="ltlDateTime" runat="server"></asp:Literal></td>
        </tr>        
    </table>
    <asp:ListView ID="ltvOrder" runat="server" DataKeyNames="order_id" DataSourceID="sdsOrder" OnItemDataBound="ltvOrder_OnItemDataBound">
        <ItemTemplate>
            <table class="box" border="0" cellspacing="1" cellpadding="0" style="width: 100%; background-color: #BC6987; margin: -1px 0px;">
            <tr>
               <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; width: 150px; height:30px;">運費</td>
               <td style="background-color: #fff; padding-left:10px;"><asp:Label ID="Label1" runat="server" Text='<%# Eval("shipping_cost","{0:n0}") %>' />元</td>
           </tr>
           <tr>
               <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; width: 150px; height:30px;">手續費</td>
               <td style="background-color: #fff; padding-left:10px;"><asp:Label ID="Label2" runat="server" Text='<%# Eval("service_cost","{0:n0}") %>' />元</td>
           </tr>
           <tr>
               <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; width: 150px; height:30px;">消費金額</td>
               <td style="background-color: #fff; color:#FC0000; font-weight:600; padding-left:10px;"><asp:Label ID="total_priceLabel" runat="server" Text='<%# Eval("total_price","{0:n0}") %>' />元</td>
           </tr>
        </table>
            <asp:ListView ID="ltvPdtList" runat="server" DataSourceID="sdsOrderDetail">
        <ItemTemplate>
            <tr style="">
                <td style="background-color: #fff; border-top: solid 1px #969787; height:30px; padding-left:10px;">
                    <asp:Label ID="obj_name" runat="server" Font-Bold="true" Text='<%# Eval("obj_name") %>' />
                </td>
                <td style="background-color: #fff; text-align: center; border-top: solid 1px #969787; padding-left:10px;">
                    <asp:Label ID="obj_specific" Text='<%# Eval("specification") %>' runat="server" />&nbsp;
                </td>
                <td style="background-color: #fff; text-align: right; border-top: solid 1px #969787; padding-left:10px;">
                    <asp:Label ID="obj_price" runat="server" Text='<%# Eval("price","{0:n0}") %>' ForeColor="Red" /> 元
                </td>
                <td style="background-color: #fff; text-align: center; border-top: solid 1px #969787; padding-left:10px;">
                    <asp:Label ID="obj_count" runat="server" Text='<%# Eval("count") %>' />
                </td>
                <td style="background-color: #fff; text-align: right; border-top: solid 1px #969787; padding-left:10px;">
                    <asp:Label ID="obj_pricecount" Text='<%# Eval("totalprice","{0:n0}") %>' runat="server" />元 
                </td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <table ID="Table1" runat="server" style="">
                <tr>
                    <td>
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <LayoutTemplate>
             <table ID="itemPlaceholderContainer" runat="server" class="box" border="0" cellspacing="0" cellpadding="0" style="width: 100%; background-color: #BC6987; border: solid 1px #BC6987;">
                 <tr ID="Tr2" runat="server" style="">
                     <th id="Th1" class="title" runat="server" style=" height:30px;">商品名稱</th>
                     <th id="Th2" class="title" runat="server" style="">規格</th>
                     <th id="Th3" class="title" runat="server" style="width: 10%;">單價</th>
                     <th id="Th4" class="title" runat="server" style="width: 10%;">數量</th>
                     <th id="Th5" class="title" runat="server" style="width: 12%;">小計</th>
                 </tr>
                 <tr ID="itemPlaceholder" runat="server">
                 </tr>
             </table>
        </LayoutTemplate>
    </asp:ListView>         
    <asp:SqlDataSource ID="sdsOrderDetail" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        SelectCommand="SELECT obj_name, specification, price, count, totalprice FROM order_detail WHERE (order_detail.order_id = @order_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="OrderId" Name="order_id" PropertyName="Text" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>       
    <table class="box" border="0" cellspacing="1" cellpadding="0" style="width: 100%; background-color: #BC6987; margin: -1px 0px;">
        <tr>
            <td colspan="2" class="title" style="height: 30px; color:#fff;">送貨資料</td>
        </tr>
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; width: 150px; height:30px;">收件人姓名</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Label ID="receiver_nameLabel" runat="server" Text='<%# Eval("receiver_name") %>' /></td>
        </tr>
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; height:30px;">收件地址</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Label ID="receiver_postalcode" runat="server" 
                Text='<%# Eval("receiver_postalcode") %>' />&nbsp;<asp:Label ID="receiver_cityLabel" runat="server" 
                Text='<%# Eval("receiver_city") %>' />&nbsp;<asp:Label ID="receiver_districtLabel" runat="server" 
                Text='<%# Eval("receiver_district") %>' />&nbsp;<asp:Label ID="receiver_addressLabel" runat="server" 
                Text='<%# Eval("receiver_address") %>' /></td>
        </tr>
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; height:30px;">聯絡電話</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Label ID="receiver_phoneLabel" runat="server" Text='<%# Eval("receiver_phone") %>' /></td>
        </tr>
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; height:30px;">行動電話</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Label ID="receiver_cellphoneLabel" runat="server" Text='<%# Eval("receiver_cellphone") %>' /></td>
        </tr>
    </table>
    <table class="box" border="0" cellspacing="1" cellpadding="0" style="width: 100%; background-color: #BC6987; margin: -1px 0px;">
        <tr>
            <td class="title" style="height: 30px;">備註</td>
        </tr>
        <tr>
          <td style="background-color: #fff; height:30px;">
            <asp:Label ID="order_memoLabel" runat="server" Text='<%# Eval("order_memo") %>' />&nbsp;
          </td>          
        </tr>
    </table>    
        </ItemTemplate>        
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span ID="itemPlaceholder" runat="server" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>        
    </asp:ListView>
    <asp:SqlDataSource ID="sdsOrder" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        SelectCommand="SELECT [order].order_id, [order].buyer_name, [order].buyer_cellphone, [order].buyer_phone, [order].buyer_mail, [order].buyer_city, [order].buyer_district, [order].buyer_address, [order].buyer_postalcode, [order].receiver_name, [order].receiver_cellphone, [order].receiver_phone, [order].receiver_mail, [order].receiver_city, [order].receiver_district, [order].receiver_address, [order].receiver_postalcode, [order].shipping_cost, [order].total_price, [order].order_datetime, [order].order_memo, [order].service_cost FROM [order] WHERE ([order].order_id = @order_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="OrderId" Name="order_id" PropertyName="Text" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:Panel ID="StorePanel" runat="server" Visible="false">
      <table class="box" border="0" cellspacing="1" cellpadding="0" style="width: 100%; background-color: #BC6987; margin-bottom: 20px;">
        <tr>
            <td style="background-color: #BC6987;"><img src="./admin/images/layout/cart/h1.png" /><span class="t18">來店取貨</span></td>
        </tr>
        <tr>
          <td style="background-color: #fff; height:30px">
            不知道我們店家的位址？或是您有任何問題，可以藉由我們網站中的 [<a href="callUs.aspx" target="_blank">聯絡我們</a>] 寄送訊息、E-Mail或來電與我們連絡！
          </td>
        </tr>
      </table>
    </asp:Panel>
    
    <asp:Panel ID="ATMPanel" runat="server" Visible="false">
        <table class="box" border="0" cellspacing="1" cellpadding="0" style="width: 100%; background-color: #BC6987; margin-bottom: -1px;">
        <tr>
            <td colspan="2" style="background-color: #BC6987;"><img src="./admin/images/layout/cart/h1.png" /><span class="t18">ATM轉帳</span></td>
        </tr>
        <tr>
          <td colspan="2" style="background-color: #fff;">
            請您在匯款後至 [<a href="shoppinghistory.aspx" target="_blank">購物清單</a>] 點擊 <img src="./admin/images/layout/cart/atm_confirm.png" /> 圖示回填匯款資料！<br />
            忘了匯款帳號？至後台 [<a href="shoppinghistory.aspx" target="_blank">購物清單</a>] 中檢視訂單詳細資料，裏面就有ATM匯款資訊喔！<br />
            若是您有任何問題，可以藉由我們網站中的 [<a href="callUs.aspx" target="_blank">聯絡我們</a>] 寄送訊息、E-Mail或來電與我們連絡！
          </td>
        </tr>
        <tr>
          <td colspan="2" class="title" style="height: 30px;">
            ATM匯款帳號
          </td>
        </tr>
        </table>
        <table class="box" border="0" cellspacing="1" cellpadding="0" style="width: 100%; background-color: #BC6987; margin-bottom: 20px;">
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; width: 150px; height:30px;">銀行名稱</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Label ID="BankName" runat="server"></asp:Label></td>
        </tr>
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; width: 150px; height:30px;">銀行代號</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Label ID="BankCode" runat="server"></asp:Label></td>
        </tr>
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; width: 150px; height:30px;">匯款戶名</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Label ID="AccountName" runat="server"></asp:Label></td>
        </tr>
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; width: 150px; height:30px;">匯款帳號</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Label ID="AccountNumber" runat="server"></asp:Label></td>
        </tr>
      </table>
    </asp:Panel>
    
    <asp:Panel ID="RecPayPanel" runat="server" Visible="false">
    <table class="box" border="0" cellspacing="1" cellpadding="0" style="width: 100%; background-color: #BC6987; margin-bottom: 20px;">
        <tr>
            <td style="background-color: #BC6987;"><img src="./admin/images/layout/cart/h1.png" /><span class="t18">貨到付款</span></td>
        </tr>
        <tr>
          <td style="background-color: #fff;">
            若是您有任何問題，可以藉由我們網站中的 [<a href="callUs.aspx" target="_blank">聯絡我們</a>] 寄送訊息、E-Mail或來電與我們連絡！
          </td>
        </tr>
      </table>
    </asp:Panel>
    
    <asp:Panel ID="WATMPanel" runat="server" Visible="false">
        <div style="border: solid 1px #ccc; background-color: #fef; margin-bottom: 15px; padding: 5px;">             
      <table class="box" border="0" cellspacing="1" cellpadding="0" style="width: 100%; background-color: #BC6987; margin-bottom: 20px;">
        <tr>
            <td style="background-color: #BC6987;"><img src="./admin/images/layout/cart/h1.png" /><span class="t18">WebATM轉帳</span></td>
        </tr>
        <tr>
          <td style="background-color: #fff;">
            若是您有任何問題，可以藉由我們網站中的 [<a href="callUs.aspx" target="_blank">聯絡我們</a>] 寄送訊息、E-Mail或來電與我們連絡！
          </td>
        </tr>
        <tr>
          <td class="title" style="height: 30px;">
            您匯款資訊
          </td>
        </tr>
        </table>
        <table class="box" border="0" cellspacing="1" cellpadding="0" style="width: 100%; background-color: #BC6987; margin-bottom: 20px;">
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; width: 150px; height:30px;">銀行代號</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Label ID="payer_bank" runat="server"></asp:Label></td>
        </tr>
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; width: 150px; height:30px;">帳號末五碼</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Label ID="payer_acc" runat="server"></asp:Label></td>
        </tr>
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; width: 150px; height:30px;">
              匯款金額</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Label ID="payer_amt" runat="server"></asp:Label></td>
        </tr>
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; width: 150px; height:30px;">
              匯款日期</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Label ID="proc_datetime" runat="server"></asp:Label></td>
        </tr>
      </table>
        </div>
    </asp:Panel>
    
    <asp:Panel ID="CSPayPanel" runat="server" Visible="false">
        <div style="border: solid 1px #ccc; background-color: #fef; margin-bottom: 15px; padding: 5px;">        
            <table class="box" border="0" cellspacing="1" cellpadding="0" style="width: 100%; background-color: #BC6987; margin-bottom: 20px;">
                <tr>
                    <td colspan="2" style="background-color: #BC6987;"><img src="./admin/images/layout/cart/h1.png" /><span class="t18">超商代碼繳費</span></td>
                </tr>
                <tr>
                    <td colspan="2" style="background-color: #fff;">
                        超商代碼繳費支援 <b><a href="http://www.ecbank.com.tw/expenses-famiport.htm" target="_blank">全家Fami Port</a></b> 、
                        <b><a href="http://www.ecbank.com.tw/expenses-life-et.htm" target="_blank">萊爾富Life-ET</a></b>、
                        <b><a href="http://www.ecbank.com.tw/expenses-okgo.htm" target="_blank">OK-GO</a></b>、
                        <b><a href="http://www.ecbank.com.tw/expenses-ibon.htm" target="_blank">IBON</a></b> ，繳費流程請參考連結中的說明。<br />
                        忘了繳費代碼？至後台 [<a href="shoppinghistory.aspx" target="_blank">購物清單</a>] 
                        中檢視訂單詳細資料，裏面就有繳費代碼資料喔！<br />
                        若是您有任何問題，可以藉由我們網站中的 [<a href="callUs.aspx" target="_blank">聯絡我們</a>] 寄送訊息、E-Mail或來電與我們連絡！
                </td>
            </tr>
            <tr>
          <td colspan="2" class="title" style="height: 30px;">
              超商代碼資訊
          </td>
        </tr>
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; width: 150px; height:30px;">繳費代碼</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Literal ID="cvsCode" runat="server"></asp:Literal></td>
        </tr>
        <tr>
          <td style="text-align: center; background-color: #e5f6ff; font-weight:bold; width: 150px; height:30px;">繳費期限</td>
          <td style="background-color: #fff; padding-left:10px;"><asp:Label ID="cvsExpireDate" runat="server"></asp:Label></td>
        </tr>
      </table>
    </div>
    </asp:Panel>
    
    <asp:Panel ID="VISAPanel" runat="server" Visible="false">    
        <table class="box" border="0" cellspacing="1" cellpadding="0" style="width: 100%; background-color: #BC6987; margin-bottom: 20px;">
                <tr>
                    <td colspan="2" style="background-color: #BC6987;"><img src="./admin/images/layout/cart/h1.png" /><span class="t18">線上刷卡</span></td>
                </tr>
                <tr>
                    <td colspan="2" style="background-color: #fff; height:30px;">
                        您的付款已完成！若是您有任何問題，可以藉由我們網站中的 [<a href="callUs.aspx" target="_blank">聯絡我們</a>] 寄送訊息、E-Mail或來電與我們連絡！
                    </td>
                </tr>
            </table>
    </asp:Panel>    
    <asp:Label ID="OrderId" runat="server" Visible="false"></asp:Label>
        </td>
    </tr>
</table>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>