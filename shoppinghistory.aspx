<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="shoppinghistory, App_Web_shoppinghistory.aspx.cdcab7d2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>  
    <asp:MultiView ID="orderMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="orderView" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
            <td colspan="2" style=" padding-left:15px;">
                <%--<asp:Image ID="Image1" runat="server" ImageUrl="~/Images/car05.png" />--%>
                <span style=" color:#787878; font-size:14pt;">VIP商城購物網--訂單查詢</span>
            </td>
        </tr>
            <tr>
                <td><%--<h3>購物清單</h3>--%></td>
                <td style="text-align: right;">
                  <asp:LinkButton ID="btnAllOrder" Text="全部" runat="server" onclick="btnAllOrder_Click"></asp:LinkButton> | <asp:LinkButton ID="AtmConfirm" runat="server" onclick="AtmConfirm_Click"></asp:LinkButton>
                   <span style="color: Red;">[點選清單中<img alt="" src="./image/lelecoco/atm_confirm.png" />圖示回填匯款資訊]</span>
              </td></tr></table>                  
    <asp:ListView ID="ltvShopping" runat="server" DataKeyNames="order_id" 
      DataSourceID="sdsShopping" onitemdatabound="ltvShopping_ItemDataBound" onitemcommand="ltvShopping_ItemCommand">                   
        <ItemTemplate>
            <tr style="">
                <td style="height: 30px; font-weight: bold; padding-left: 5px;">
                    <%--<asp:Label ID="order_id" runat="server" Text='<%# Eval("order_id", "{0:00000000}") %>' />--%>
                    <asp:LinkButton ID="order_id" CssClass="a6" Text='<%# Eval("order_id") %>' runat="server" CommandArgument='<%# Eval("order_id", "dtl{0}") %>'></asp:LinkButton>
                </td>
                <td>
                    <asp:Literal ID="Store" runat="server"></asp:Literal><asp:Label ID="owner_id" runat="server" Text='<%# Eval("owner_id") %>' Visible="false" />
                </td>
                <td style="color: Red; text-align:right;">
                    <asp:Label ID="total_price" runat="server" Text='<%# Eval("total_price") %>' />元
                </td>                
                <td>
                    <asp:Label ID="payway" runat="server" Text='<%# Eval("payway_name") %>' />
                </td>
                <td>
                    <asp:Label ID="paystate" runat="server" Text='<%# Eval("paystate_name") %>' />
                    <asp:ImageButton ID="btnAtmConfirm" AlternateText="回填付款確認資料" ImageUrl="./image/lelecoco/atm_confirm.png" CommandArgument='<%# Eval("order_id", "atm{0}") %>' Visible="false" ToolTip="回填付款確認資料"  runat="server" />
                </td>
                <td>
                    <asp:Label ID="shippingstate" runat="server" Text='<%# Eval("shipping_state_name") %>' />
                </td>
                <td>
                    <asp:Label ID="order_datetime" runat="server" Text='<%# Eval("order_datetime", "{0:yyyy/MM/dd}") %>' />
                </td>
                <td>
                    &nbsp;<asp:ImageButton ID="btnDetail" runat="server" CommandArgument='<%# Eval("order_id", "dtl{0}") %>' ImageUrl="image/lelecoco/paper.gif" ToolTip="詳細資料" />&nbsp;
                    <%--<asp:ImageButton ID="btnDel" runat="server" OnClientClick="if(confirm('確定刪除？') == false) return false;" CommandArgument='<%# Eval("order_id", "del{0}") %>' ImageUrl="image/del_s.png" />--%>

                    <%--<asp:LinkButton ID="btnDetail" Text="詳細" runat="server" CommandArgument='<%# Eval("order_id", "dtl{0}") %>'></asp:LinkButton>
                    <asp:LinkButton ID="btnDel" Text="刪除" OnClientClick="if(confirm('確定刪除？') == false) return false;" runat="server" CommandArgument='<%# Eval("order_id", "del{0}") %>'><img src="image/del_s.png" /></asp:LinkButton></td></tr>--%>
                    <tr id="atmConfirmTr" runat="server" visible="false">
                <td colspan="8" style="padding-left: 5px; background-color: #fdd; padding: 4px;">
                    匯款帳戶名稱：<asp:TextBox ID="accountName" runat="server" Width="60"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
                    帳號末五碼：<asp:TextBox ID="accountNum" runat="server" Width="40" MaxLength="5"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
                    匯款金額：<asp:TextBox ID="payCount" runat="server" Width="50" MaxLength="6"></asp:TextBox>元&nbsp;&nbsp;&nbsp;&nbsp;
                    匯款日期：<asp:TextBox ID="payDate" runat="server" Width="70" MaxLength="10"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnAtmSent" runat="server" OnClientClick="if(confirm('您已確實匯款並確定送出確認資料(所有欄位都必填)？') == false) return false;" Text="送出" CommandArgument='<%# Eval("order_id", "acm{0}") %>' Font-Size="8"  />                    
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                runat="server" Enabled="True" FilterType="Numbers"  TargetControlID="accountNum">
            </ajaxToolkit:FilteredTextBoxExtender>
            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" 
                runat="server" Enabled="True" FilterType="Custom, Numbers" ValidChars="." TargetControlID="payCount">
            </ajaxToolkit:FilteredTextBoxExtender>
            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" 
                runat="server" Enabled="True" FilterType="Custom, Numbers" ValidChars="/" TargetControlID="payDate">
            </ajaxToolkit:FilteredTextBoxExtender>
            <ajaxToolkit:CalendarExtender ID="txtEndTime_CalendarExtender" runat="server" Enabled="True" TargetControlID="payDate" Format="yyyy/MM/dd">
            </ajaxToolkit:CalendarExtender>
                </td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server" style="">
                <tr>
                    <td>無訂單資料！</td></tr></table></EmptyDataTemplate><LayoutTemplate>
            <table id="Table2" runat="server" border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server" style="border-bottom: 0px;">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr id="Tr2" runat="server" style="">
                                <th id="Th1" runat="server" style="height: 30px; width: 150px; background-color: #BC6987; color:#fff; padding-left: 5px;">訂單編號</th><th id="Th2" runat="server" style=" background-color: #BC6987; color:#fff; text-align: center;">訂購店家</th><th id="Th3" runat="server" style="width: 100px; background-color: #BC6987; color:#fff;">價格</th><th id="Th4" runat="server" style="width: 120px; background-color: #BC6987; color:#fff;">付款方式</th><th id="Th5" runat="server" style="width: 80px; background-color: #BC6987; color:#fff;">交易狀態</th><th id="Th6" runat="server" style="width: 80px; background-color: #BC6987; color:#fff;">交易進度</th><th id="Th7" runat="server" style="width: 100px; background-color: #BC6987; color:#fff;">訂購日期</th><th id="Th8" runat="server" style="width: 60px; background-color: #BC6987; color:#fff;"></th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr3" runat="server">
                    <td id="Td2" runat="server" style="text-align: center; border-bottom: 0px;">
                        <div class="page">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="30"  >
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" ShowNextPageButton="False"
                                        ShowPreviousPageButton="True" FirstPageText="第一頁" PreviousPageText="上一頁" />
                                    <asp:NumericPagerField ButtonCount="10" />
                                    <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ShowNextPageButton="True"
                                        ShowPreviousPageButton="False" LastPageText="最末頁" NextPageText="下一頁" />
                                </Fields>
                            </asp:DataPager>
                            </div>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="sdsShopping" runat="server" 
        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
        SelectCommand="SELECT [order].order_id, [order].total_price, [order].order_datetime, [order].shipping_state, [order].owner_id, [order].user_id, paystate.paystate_name, payway.payway_name, shipping_state.shipping_state_name FROM [order] INNER JOIN payway ON [order].payway_id = payway.payway INNER JOIN paystate ON [order].pay_state = paystate.paystate_id INNER JOIN shipping_state ON [order].shipping_state = shipping_state.shipping_state_id  WHERE ([order].user_id = @user_id) AND ([order].user_hide != 1) ORDER BY [order].order_datetime DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="UserId" Name="user_id" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="detailView" runat="server">
        <h3>訂單明細</h3><div style="border: solid 1px #ccc; background-color: #fec; margin-bottom: 15px; padding: 1px;">
            <asp:FormView ID="frvOrder" runat="server" DataSourceID="sdsOrder" Width="100%" OnPreRender="frvOrder_OnDataBound">                
                <ItemTemplate>
                    <div style="border: solid 1px #ccc; background-color: #eff; padding: 2px;">
                    <div style="border-bottom: solid 1px #ccc; background-color: #fec;">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td style=" border-bottom: 0px; height:25px;"><span style="font-weight: bold; padding-left: 5px;">訂單編號：<asp:Label ID="order_id" runat="server" Text='<%# Eval("order_id", "{0:00000000}") %>' /></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;訂單時間：<asp:Label ID="order_datetimeLabel" runat="server" Text='<%# Eval("order_datetime", "{0:yyyy/MM/dd hh:mm}") %>' /></td>
                            <td style="text-align: right; color: Red; font-weight: bold; padding-right: 5px; border-bottom: 0px;">手續費：<asp:Label ID="lbl_service_cost" runat="server" Text='<%# Eval("service_cost") %>' />元&nbsp;&nbsp;&nbsp;運費：<asp:Label ID="lbl_shipping_coust" runat="server" Text='<%# Eval("shipping_cost") %>' />元&nbsp;&nbsp;&nbsp;總價：<asp:Label ID="total_priceLabel" runat="server" Text='<%# Eval("total_price") %>' />元</td></tr></table></div>
                    <div style="padding: 5px;">                    
                    <div style="border-bottom: dotted 1px #ccc; font-weight: bold; clear: both; margin-bottom: 5px;">購買者資訊</div>姓名：<asp:Label ID="buyer_nameLabel" runat="server" Text='<%# Eval("buyer_name") %>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    電話：<asp:Label ID="buyer_cellphoneLabel" runat="server" Text='<%# Eval("buyer_cellphone") %>' /> / <asp:Label ID="buyer_phoneLabel" runat="server" Text='<%# Eval("buyer_phone") %>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    地址：<asp:Label ID="buyer_cityLabel" runat="server" 
                        Text='<%# Eval("buyer_city") %>' />&nbsp;<asp:Label ID="buyer_districtLabel" runat="server" 
                        Text='<%# Eval("buyer_district") %>' />&nbsp;<asp:Label ID="buyer_addressLabel" runat="server" 
                        Text='<%# Eval("buyer_address") %>' />&nbsp;<asp:Label ID="buyer_postalcodeLabel" runat="server" 
                        Text='<%# Eval("buyer_postalcode") %>' />
                    <br />
                    <div style="border-bottom: dotted 1px #ccc; font-weight: bold; margin-top: 10px; margin-bottom: 5px;">收件人資訊</div>姓名：<asp:Label ID="receiver_nameLabel" runat="server" Text='<%# Eval("receiver_name") %>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    電話：<asp:Label ID="receiver_cellphoneLabel" runat="server" Text='<%# Eval("receiver_cellphone") %>' /> / <asp:Label ID="receiver_phoneLabel" runat="server" Text='<%# Eval("receiver_phone") %>' />&nbsp;&nbsp;&nbsp;&nbsp;
                    地址：<asp:Label ID="receiver_cityLabel" runat="server" 
                        Text='<%# Eval("receiver_city") %>' />&nbsp;<asp:Label ID="receiver_districtLabel" runat="server" 
                        Text='<%# Eval("receiver_district") %>' />&nbsp;<asp:Label ID="receiver_addressLabel" runat="server" 
                        Text='<%# Eval("receiver_address") %>' />&nbsp;<asp:Label ID="receiver_postalcode" runat="server" 
                        Text='<%# Eval("receiver_postalcode") %>' />
                    <br />
                    <div style="border-bottom: dotted 1px #ccc; font-weight: bold; margin-top: 10px; margin-bottom: 5px;">發票開立
                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lbl_buyerbill" runat="server" Text='<%# Eval("receiver_bill") %>' /></div>
                    <asp:Panel ID="pnl_bill" runat="server" Visible="false">
                        統編：<asp:Label ID="lbl_receiver_compid" runat="server" Text='<%# Eval("receiver_compid") %>' />&nbsp;&nbsp;&nbsp;&nbsp;
                        公司抬頭：<asp:Label ID="lbl_receiver_comname" runat="server" Text='<%# Eval("receiver_comname") %>' />
                    </asp:Panel>
                    <div style="border-bottom: dotted 1px #ccc; font-weight: bold; margin-top: 10px; margin-bottom: 5px;"><span style=" color:Red">※</span>宅配時段</div><asp:Label ID="lbldelivery_time" runat="server" Text='<%# Eval("delivery_time") %>' />
                    <div style="border-bottom: dotted 1px #ccc; font-weight: bold; margin-top: 10px; margin-bottom: 5px;">備註</div><asp:Label ID="order_memoLabel" runat="server" Text='<%# Eval("order_memo") %>' />&nbsp;</div></div></ItemTemplate>
             </asp:FormView>
            <asp:ListView ID="ltvPdtList" runat="server" DataSourceID="sdsOrderDetail">
                <ItemTemplate>
                    <tr style="">
                        <td style="height: 30px; border-bottom: dotted 1px #ccc; padding-left: 10px;">
                            <asp:Label ID="lbljog_id" runat="server" Font-Bold="true" Text='<%# Eval("obj_id") %>' />
                        </td>
                        <td style=" border-bottom: dotted 1px #ccc; padding-left: 10px;">
                            <asp:Label ID="obj_name" runat="server" Font-Bold="true" Text='<%# Eval("obj_name") %>' />
                        </td>
                        <td style="text-align: left; border-bottom: dotted 1px #ccc;">
                            <asp:Label ID="obj_specific" Text='<%# Eval("specification") %>' runat="server" />&nbsp;
                        </td>
                        <td style="text-align: right; border-bottom: dotted 1px #ccc;">
                            <asp:Label ID="obj_price" runat="server" Text='<%# Eval("price") %>' /> 元
                        </td>
                        <td style="text-align: center; border-bottom: dotted 1px #ccc;">
                            <asp:Label ID="obj_count" runat="server" Text='<%# Eval("count") %>' />
                        </td>
                        <td style="text-align: right; color: Red; border-bottom: dotted 1px #ccc; padding-right: 10px;">
                            <asp:Label ID="obj_pricecount" Text='<%# Eval("totalprice") %>' runat="server" />元 
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
                    <table ID="Table2" border="0" cellpadding="0" cellspacing="1" runat="server" style="width: 100%; background-color: #fff;">
                        <tr ID="Tr1" runat="server">
                            <td ID="Td1" runat="server" style="border-bottom: 0px;">
                                    <table ID="itemPlaceholderContainer" runat="server" border="0" cellpadding="4" cellspacing="0" style="width: 100%;">
                                        <tr ID="Tr2" runat="server" style="">
                                            <th id="Th16" runat="server" style="font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc; height: 25px; padding-left: 5px; width:100px;">商品編號</th><th id="Th9" runat="server" style="font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc; height: 25px; padding-left: 5px;">商品名稱</th><th id="Th10" runat="server" style="width: 20%; font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc;">規格</th><th id="Th11" runat="server" style="width: 10%; font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc; text-align: center;">單價</th><th id="Th12" runat="server" style="width: 8%; font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc; text-align: center;">數量</th><th id="Th13" runat="server" style="width: 15%; font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc; text-align: center;">小計</th></tr><tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="sdsOrderDetail" runat="server" 
                ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                SelectCommand="SELECT obj_id, obj_name, specification, price, count, totalprice FROM order_detail WHERE (order_detail.order_id = @order_id)">
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
            銀行：<asp:Label ID="BankName" runat="server"></asp:Label>&nbsp;&nbsp;
            代號：<asp:Label ID="BankCode" runat="server"></asp:Label>&nbsp;&nbsp;
            戶名：<asp:Label ID="AccountName" runat="server"></asp:Label>&nbsp;&nbsp;
            帳號：<asp:Label ID="AccountNumber" runat="server"></asp:Label>
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
    <asp:Label ID="UserId" runat="server" Visible="false"></asp:Label><asp:Label ID="OrderId" runat="server" Visible="false"></asp:Label>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>