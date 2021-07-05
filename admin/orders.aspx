<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="orders.aspx.cs" Inherits="admin_orders" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
            <td style="border-bottom: 0px;"><h2>訂單管理</h2></td>
            <td style="text-align: right; border-bottom: 0px;" valign="bottom">
                <img alt="" src="images/layout/user/gw_logo_s.png" 
                    style="vertical-align: text-top;" />
                <a href="https://ecbank.com.tw/login.php" target="_blank">進入綠界後台</a>&nbsp;&nbsp;
                <img alt="" src="images/layout/user/print.png" 
                    style="vertical-align: text-top;" /> 
                <asp:LinkButton ID="btnPrint" Text="訂單列印" runat="server" onclick="btnPrint_Click"></asp:LinkButton>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <asp:MultiView ID="orderMultiView" runat="server" ActiveViewIndex="0">
    <asp:View ID="orderView" runat="server">        
    <table border="0" cellpadding="0" cellspacing="0" style="padding:4px; width: 100%; margin-top: 5px;" class="noborder">
        <tr>
            <td>
                <asp:LinkButton ID="btnAllOrder" Text="顯示全部" runat="server" onclick="btnAllOrder_Click"></asp:LinkButton>&nbsp;&nbsp;|&nbsp;
                <strong>狀態：</strong>
                <asp:LinkButton ID="payyet" Text="未付款" runat="server" onclick="payyet_Click"></asp:LinkButton>&nbsp;
                <asp:LinkButton ID="confirm" Text="買方確認" runat="server" onclick="confirm_Click"></asp:LinkButton>&nbsp;
                <asp:LinkButton ID="paid" Text="已付款" runat="server" onclick="paid_Click"></asp:LinkButton>&nbsp;&nbsp;|&nbsp;
                <strong>進度：</strong>
                <asp:LinkButton ID="processing" Text="處理中" runat="server" onclick="processing_Click"></asp:LinkButton>&nbsp;
                <asp:LinkButton ID="processed" Text="備貨中" runat="server" onclick="processed_Click"></asp:LinkButton>&nbsp;
                <asp:LinkButton ID="outofstock" Text="缺貨" runat="server" onclick="outofstock_Click"></asp:LinkButton>&nbsp;
                <asp:LinkButton ID="finished" Text="已出貨" runat="server" onclick="finished_Click"></asp:LinkButton>                
            </td>
        </tr>
        <tr>
            <td>
                <strong>日期：</strong>
                <asp:LinkButton ID="btnDateToday" Text="今日" runat="server" 
                    onclick="btnDateToday_Click"></asp:LinkButton>&nbsp;
                <asp:LinkButton ID="btnDateYestoday" Text="昨日" runat="server" 
                    onclick="btnDateYestoday_Click"></asp:LinkButton>&nbsp;
                <asp:LinkButton ID="btnDateWeek" Text="本週" runat="server" 
                    onclick="btnDateWeek_Click"></asp:LinkButton>&nbsp;
                <asp:LinkButton ID="btnDateMonth" Text="本月" runat="server" 
                    onclick="btnDateMonth_Click"></asp:LinkButton>&nbsp;
                <asp:LinkButton ID="btnDateLastMonth" Text="上個月" runat="server" 
                    onclick="btnDateLastMonth_Click"></asp:LinkButton>&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="dateStartFilter" Width="80" runat="server"></asp:TextBox> 
                <ajaxToolkit:CalendarExtender ID="dateStartFilter_CalendarExtender" runat="server" Enabled="True" TargetControlID="dateStartFilter"></ajaxToolkit:CalendarExtender>
                至 <asp:TextBox ID="dateEndFilter" Width="80" runat="server"></asp:TextBox> 
                <ajaxToolkit:CalendarExtender ID="dateEndFilter_CalendarExtender" runat="server" Enabled="True" TargetControlID="dateEndFilter"></ajaxToolkit:CalendarExtender>
                <asp:ImageButton ID="btnDateFilter" runat="server" 
                    ImageUrl="./images/layout/user/search.png" ImageAlign="AbsMiddle" 
                    onclick="btnDateFilter_Click" />&nbsp;&nbsp;|&nbsp;
                <strong>搜尋</strong>
                <asp:TextBox ID="txtKeywords" Width="100px" runat="server"></asp:TextBox> 
                <asp:ImageButton ID="btnSearch" runat="server" onclick="btnSearch_Click" ImageUrl="./images/layout/user/search.png" ImageAlign="AbsMiddle" />
            </td>               
        </tr>
    </table>
    <div style="border:solid 1px #ccc; padding:4px; background-color: #eef; margin-bottom: 5px;">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;" class="clean">
        <tr>
            <td>
                <span style="color: #000;">設為</span>&nbsp;&nbsp;
                <asp:LinkButton ID="btnPayYet" Text="未付款" runat="server" OnClientClick="if(confirm('確定設為未付款？') == false) return false;" onclick="btnPayYet_Click"></asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="btnPaid" Text="已付款" runat="server" OnClientClick="if(confirm('確定設為已付款？') == false) return false;" onclick="btnPaid_Click"></asp:LinkButton>&nbsp;&nbsp;|&nbsp;
                <asp:LinkButton ID="btnProcessing" Text="處理中" runat="server" OnClientClick="if(confirm('確定設為處理中？') == false) return false;" onclick="btnProcessing_Click"></asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="btnProcessed" Text="備貨中" runat="server" OnClientClick="if(confirm('確定設為備貨中？') == false) return false;" onclick="btnProcessed_Click"></asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="btnOutOfStock" Text="缺貨" runat="server"   OnClientClick="if(confirm('確定設為缺貨？') == false) return false;" onclick="btnOutOfStock_Click"></asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="btnFinished" Text="已出貨" runat="server"   OnClientClick="if(confirm('確定設為已出貨？') == false) return false;" onclick="btnFinished_Click"></asp:LinkButton>
            </td>
            <td style="text-align: right;">
                |&nbsp;       
                <img alt="" src="images/layout/user/cancel.gif" style="vertical-align: text-top;" /> 
                <asp:LinkButton ID="btnDelSelected" Text="刪除" runat="server"   OnClientClick="if(confirm('確定刪除？') == false) return false;" onclick="btnDelSelected_Click"></asp:LinkButton>         
            </td>
        </tr>
    </table>        
    </div>
    <asp:ListView ID="ltvShopping" runat="server" DataKeyNames="order_id" 
        DataSourceID="sdsShopping" onitemdatabound="ltvShopping_ItemDataBound" 
        onitemcommand="ltvShopping_ItemCommand">
        <ItemTemplate>
            <tr style="">
                <td style="height: 30px; text-align: center;">
                    <asp:CheckBox ID="cbxOrder" runat="server" /></td><td style="font-weight: bold; text-align: center;">
                    <%--<asp:Label ID="order_id" runat="server" Text='<%# Eval("order_id", "{0:00000000}") %>' />--%>
                    <asp:LinkButton ID="order_id" CssClass="a1" Text='<%# Eval("order_id") %>' runat="server" CommandArgument='<%# Eval("order_id", "dtl{0}") %>'></asp:LinkButton>
                </td>
        <td>
            <asp:Literal ID="UserName" runat="server"></asp:Literal>
            <asp:Label ID="user_id" runat="server" Text='<%# Eval("user_id") %>' Visible="false" />
        </td>
        <td style="color: Red; text-align:right;">
            <asp:Label ID="total_price" runat="server" Text='<%# Eval("total_price") %>' />元 
        </td>
        <td>
            <asp:Label ID="payway" runat="server" Text='<%# Eval("payway_name") %>' />
        </td>
        <td>
            <asp:Label ID="paystate" runat="server" Text='<%# Eval("paystate_name") %>' />
        </td>
        <td>
            <asp:Label ID="shipping_state" runat="server" Text='<%# Eval("shipping_state_name") %>' />
            <asp:ImageButton ID="btnShipConfirm" AlternateText="填寫配送資料" ImageUrl="./images/layout/user/shipping.png" CommandArgument='<%# Eval("order_id", "shp{0}") %>' Visible="false"  runat="server" ToolTip="填寫配送資料" />
        </td>
        <td>
            <asp:Label ID="order_datetime" runat="server" Text='<%# Eval("order_datetime", "{0:yyyy/MM/dd}") %>' />
        </td>
        <td>
            <asp:LinkButton ID="btnDetail" Text="詳細" runat="server" CommandArgument='<%# Eval("order_id", "dtl{0}") %>'></asp:LinkButton>
            <asp:LinkButton ID="btnDel" Text="刪除"  OnClientClick="if(confirm('確定刪除？') == false) return false;" runat="server" CommandArgument='<%# Eval("order_id", "del{0}") %>'></asp:LinkButton>
        </td>
</tr>
<tr id="shipConfirmTr" runat="server" visible="false">
        <td colspan="9" style="padding: 4px; background-color: #fdd;">
            貨運公司：<asp:TextBox ID="txtShipCompany" runat="server" Width="120"></asp:TextBox>&nbsp;&nbsp;
            貨運單號：<asp:TextBox ID="txtShipSN" runat="server" Width="120"></asp:TextBox>&nbsp;&nbsp;
            寄送日期：<asp:TextBox ID="txtShipDate" runat="server" Width="120"></asp:TextBox>
            <asp:Button ID="btnShipSent" runat="server" Text="送出" CommandArgument='<%# Eval("order_id", "sps{0}") %>' Font-Size="8"  />
            <ajaxToolkit:CalendarExtender ID="txtShipDate_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtShipDate"></ajaxToolkit:CalendarExtender>
        </td>
</tr>
</ItemTemplate>
<EmptyDataTemplate>
    <table id="Table1" runat="server" style="">
        <tr>
            <td>無訂單資料！</td>
        </tr>
    </table>
    </EmptyDataTemplate>
    <LayoutTemplate>
        <table id="Table1" runat="server" border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr id="Tr1" runat="server">
                <td id="Td1" runat="server" style="border-bottom: 0px;">
                    <table ID="itemPlaceholderContainer" runat="server" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr id="Tr2"  runat="server" style="">
                            <th id="Th1" runat="server" style="height: 30px; width: 30px; background-color: #fcc; text-align: center;">
                                <asp:CheckBox ID="CheckBoxHeader" runat="server" AutoPostBack="true" OnCheckedChanged="CheckBoxHeader_CheckedChanged" />
                            </th>
                            <th id="Th2" runat="server" style="background-color: #fcc; text-align: center;" nowrap="nowrap">訂單編號</th>
                            <th id="Th3" runat="server" style="background-color: #fcc; text-align: center;">購買者帳號</th>
                            <th id="Th4" runat="server" style="background-color: #fcc; width: 65px;">價格</th>
                            <th id="Th5" runat="server" style="background-color: #fcc; width: 120px;">付款方式</th>
                            <th id="Th6" runat="server" style="background-color: #fcc; width: 65px;">交易狀態</th>
                            <th id="Th7" runat="server" style="background-color: #fcc; width: 65px;">交易進度</th>
                            <th id="Th8" runat="server" style="background-color: #fcc; width: 80px;">訂購日期</th>
                            <th id="Th9" runat="server" style="width: 60px; background-color: #fcc;"></th>
                        </tr>
                        <tr ID="itemPlaceholder" runat="server"></tr>
                    </table>
                </td>
            </tr>
            <tr id="Tr3" runat="server">
                <td id="Td2" runat="server" style="text-align: center; border-bottom: 0px;">
                    <div class="page">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="50"  >
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" ShowNextPageButton="False"
                                                ShowPreviousPageButton="True" FirstPageText="第一頁" PreviousPageText="上一頁" />
                                            <asp:NumericPagerField ButtonCount="10" />
                                            <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ShowNextPageButton="True"
                                                ShowPreviousPageButton="False" LastPageText="最末頁" NextPageText="下一頁" />
                                        </Fields>
                                    </asp:DataPager>
                                    </div>
                </td></tr></table>
        </LayoutTemplate>
    </asp:ListView>        
    <asp:SqlDataSource ID="sdsShopping" runat="server" ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" >
    </asp:SqlDataSource>
        </asp:View>        
        <asp:View ID="detailView" runat="server">
        <h3>訂單明細</h3>
        <div style="border: solid 1px #ccc; background-color: #fec; margin-bottom: 15px; padding: 1px;">
            <asp:FormView ID="frvOrder" runat="server" DataSourceID="sdsOrder" Width="100%" OnPreRender="frvOrder_OnDataBound">                
                <ItemTemplate>
                    <div style="border: solid 1px #ccc; background-color: #eff; padding: 2px;">
                    <div style="border-bottom: solid 1px #ccc; background-color: #fec;">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td style=" border-bottom: 0px; height:30px;"><span style="font-weight: bold; padding-left: 5px;">訂單編號：<asp:Label ID="order_id" runat="server" Text='<%# Eval("order_id", "{0:00000000}") %>' /></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;訂單時間：<asp:Label ID="order_datetimeLabel" runat="server" Text='<%# Eval("order_datetime", "{0:yyyy/MM/dd hh:mm}") %>' /></td>
                            <td style="text-align: right; color: Red; font-weight: bold; padding-right: 5px; border-bottom: 0px;">手續費：<asp:Label ID="lbl_service_cost" runat="server" Text='<%# Eval("service_cost") %>' />元&nbsp;&nbsp;&nbsp;運費：<asp:Label ID="lbl_shipping_coust" runat="server" Text='<%# Eval("shipping_cost") %>' />元&nbsp;&nbsp;&nbsp;總價：<asp:Label ID="total_priceLabel" runat="server" Text='<%# Eval("total_price") %>' />元</td>
                        </tr>
                    </table>
                    </div>
                    <div style="padding: 5px;">
                    <div style="border-bottom: dotted 1px #ccc; font-weight: bold; clear: both; margin-bottom: 5px;">購買者資訊</div>
                    姓名：<asp:Label ID="buyer_nameLabel" runat="server" Text='<%# Eval("buyer_name") %>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    電話：<asp:Label ID="buyer_cellphoneLabel" runat="server" Text='<%# Eval("buyer_cellphone") %>' /> / <asp:Label ID="buyer_phoneLabel" runat="server" Text='<%# Eval("buyer_phone") %>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    地址：<asp:Label ID="buyer_postalcodeLabel" runat="server" 
                        Text='<%# Eval("buyer_postalcode") %>' />&nbsp;<asp:Label ID="buyer_cityLabel" runat="server" 
                        Text='<%# Eval("buyer_city") %>' />&nbsp;<asp:Label ID="buyer_districtLabel" runat="server" 
                        Text='<%# Eval("buyer_district") %>' />&nbsp;<asp:Label ID="buyer_addressLabel" runat="server" 
                        Text='<%# Eval("buyer_address") %>' />
                    <br />
                    <div style="border-bottom: dotted 1px #ccc; font-weight: bold; margin-top: 10px; margin-bottom: 5px;">收件人資訊</div>
                    姓名：<asp:Label ID="receiver_nameLabel" runat="server" Text='<%# Eval("receiver_name") %>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    電話：<asp:Label ID="receiver_cellphoneLabel" runat="server" Text='<%# Eval("receiver_cellphone") %>' /> / <asp:Label ID="receiver_phoneLabel" runat="server" Text='<%# Eval("receiver_phone") %>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    地址：<asp:Label ID="receiver_postalcode" runat="server" 
                        Text='<%# Eval("receiver_postalcode") %>' />&nbsp;<asp:Label ID="receiver_cityLabel" runat="server" 
                        Text='<%# Eval("receiver_city") %>' />&nbsp;<asp:Label ID="receiver_districtLabel" runat="server" 
                        Text='<%# Eval("receiver_district") %>' />&nbsp;<asp:Label ID="receiver_addressLabel" runat="server" 
                        Text='<%# Eval("receiver_address") %>' />
                    <br />
                    <div style="border-bottom: dotted 1px #ccc; font-weight: bold; margin-top: 10px; margin-bottom: 5px;">發票開立
                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lbl_buyerbill" runat="server" Text='<%# Eval("receiver_bill") %>' /></div>
                    <asp:Panel ID="pnl_bill" runat="server" Visible="false">
                        統編：<asp:Label ID="lbl_receiver_compid" runat="server" Text='<%# Eval("receiver_compid") %>' />&nbsp;&nbsp;&nbsp;&nbsp;
                        公司抬頭：<asp:Label ID="lbl_receiver_comname" runat="server" Text='<%# Eval("receiver_comname") %>' />
                    </asp:Panel>
                    <div style="border-bottom: dotted 1px #ccc; font-weight: bold; margin-top: 10px; margin-bottom: 5px;"><span style=" color:Red">※</span>宅配時段</div><asp:Label ID="lbldelivery_time" runat="server" Text='<%# Eval("delivery_time") %>' />
                    <div style="border-bottom: dotted 1px #ccc; font-weight: bold; margin-top: 10px; margin-bottom: 5px;">備註</div>
                    <asp:Label ID="order_memoLabel" runat="server" Text='<%# Eval("order_memo") %>' />&nbsp;</div>
                    </div>
                </ItemTemplate>
            </asp:FormView>            
            <asp:ListView ID="ltvPdtList" runat="server" DataSourceID="sdsOrderDetail"><ItemTemplate><tr style=""><td style="height: 30px; border-bottom: dotted 1px #ccc; padding-left: 10px;"><asp:Label ID="lbljog_id" runat="server" Font-Bold="true" Text='<%# Eval("obj_id") %>' /></td><td style="height: 30px; border-bottom: dotted 1px #ccc; padding-left: 10px;"><asp:Label ID="obj_name" runat="server" Font-Bold="true" Text='<%# Eval("obj_name") %>' /></td><td style="text-align: Left; border-bottom: dotted 1px #ccc;"><asp:Label ID="obj_specific" Text='<%# Eval("specification") %>' runat="server" />&nbsp; </td><td style="text-align: right; border-bottom: dotted 1px #ccc;"><asp:Label ID="obj_price" runat="server" Text='<%# Eval("price") %>' />元 </td><td style="text-align: center; border-bottom: dotted 1px #ccc;"><asp:Label ID="obj_count" runat="server" Text='<%# Eval("count") %>' /></td><td style="text-align: right; color: Red; border-bottom: dotted 1px #ccc; padding-right: 10px;"><asp:Label ID="obj_pricecount" Text='<%# Eval("totalprice") %>' runat="server" />元 </td></tr></ItemTemplate><EmptyDataTemplate><table ID="Table1" runat="server" style=""><tr><td></td></tr></table></EmptyDataTemplate><LayoutTemplate><table id="Table2" border="0" cellpadding="0" cellspacing="1" runat="server" style="width: 100%; background-color: #fff;"><tr id="Tr3" runat="server"><td id="Td2" runat="server" style="border-bottom: 0px;"><table ID="itemPlaceholderContainer" runat="server" border="0" cellpadding="4" cellspacing="0" style="width: 100%;"><tr id="Tr4" runat="server" style=""><th id="Th16" runat="server" style="font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc; height: 25px; padding-left: 5px; width:100px;">商品編號</th><th id="Th10" runat="server" style="font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc; height: 25px; padding-left: 5px;">商品名稱</th><th id="Th11" runat="server" style="width: 20%; font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc;">規格</th><th id="Th12" runat="server" style="width: 12%; font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc; text-align: center;">單價</th><th id="Th13" runat="server" style="width: 10%; font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc; text-align: center;">數量</th><th id="Th14" runat="server" style="width: 15%; font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc; text-align: center;">小計</th></tr><tr ID="itemPlaceholder" runat="server"></tr></table></td></tr></table></LayoutTemplate></asp:ListView>
            <asp:SqlDataSource ID="sdsOrderDetail" runat="server" 
                ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                SelectCommand="SELECT obj_name, obj_id, specification, color, size, price, count, totalprice FROM order_detail WHERE (order_detail.order_id = @order_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="OrderId" Name="order_id" PropertyName="Text" Type="Int64" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsOrder" runat="server" 
                ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                SelectCommand="SELECT [order].order_id, [order].buyer_name, [order].buyer_cellphone, [order].buyer_phone, [order].buyer_city, [order].buyer_district, [order].buyer_address, [order].buyer_postalcode, [order].receiver_name, [order].receiver_cellphone, [order].receiver_phone, [order].receiver_city, [order].receiver_district, [order].receiver_address, [order].receiver_postalcode, [order].shipping_cost, [order].total_price, [order].order_datetime, [order].order_memo, delivery_time.delivery_time, [order].service_cost, [order].receiver_bill, [order].receiver_compid, [order].receiver_comname FROM [order] inner join delivery_time on [order].delivery_no=delivery_time.delivery_no WHERE ([order].order_id = @order_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="OrderId" Name="order_id" PropertyName="Text" Type="Int64" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div id="shipblock" runat="server" visible="false" style="border: solid 1px #f00; background-color: #fdd; margin-bottom: 15px; padding: 5px;">
            <strong>配送資訊</strong><br />
             貨運公司：<asp:Label ID="ShippingCompany" runat="server"></asp:Label>&nbsp;&nbsp;
             貨運單號：<asp:Label ID="ShippingSN" runat="server"></asp:Label>&nbsp;&nbsp;
             寄送日期：<asp:Label ID="ShippingDate" runat="server"></asp:Label>
        </div>
        <div id="atmblock" runat="server" visible="false" style="border: solid 1px #f00; background-color: #fdd; margin-bottom: 15px; padding: 5px;">
            <strong>ATM匯款資訊</strong><br />
            匯款帳戶名稱：<asp:Label ID="AccountName" runat="server"></asp:Label>&nbsp;&nbsp;
            帳號末五碼：<asp:Label ID="AccountNumber" runat="server"></asp:Label>&nbsp;&nbsp;
            匯款金額：<asp:Label ID="Pay" runat="server"></asp:Label>&nbsp;&nbsp;
            匯款日期：<asp:Label ID="PayDate" runat="server"></asp:Label>
        </div>     
        <div id="watmblock" runat="server" visible="false" style="border: solid 1px #f00; background-color: #fdd; margin-bottom: 15px; padding: 5px;">
            <strong>WebATM轉帳資訊</strong><br />
            付款人銀行代碼：<asp:Label ID="wAccountCode" runat="server"></asp:Label>&nbsp;&nbsp;
            帳號後五碼：<asp:Label ID="wAccountNumber" runat="server"></asp:Label>&nbsp;&nbsp;
            付款日期：<asp:Label ID="wPayDate" runat="server"></asp:Label>
        </div>   
        <div id="cvsblock" runat="server" visible="false" style="border: solid 1px #f00; background-color: #fdd; margin-bottom: 15px; padding: 5px;">
            <strong>超商代碼繳費資訊</strong><br />
            繳費代碼：<asp:Label ID="payno" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>&nbsp;&nbsp;
            繳費期限：<asp:Label ID="expiredate" runat="server"></asp:Label>
        </div>
        <div style="text-align: center; margin: 5px 0px;">
            <asp:Button ID="btnGoback" runat="server" Text="回上頁" onclick="btnGoback_Click" />
        </div>
        </asp:View>
    </asp:MultiView>    
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="UserId" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="OrderId" runat="server" Visible="false"></asp:Label>
</asp:Content>