<%@ Page Language="C#" AutoEventWireup="true" CodeFile="printorders.aspx.cs" Inherits="admin_printorders" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>訂單列印</title>
<style type="text/css">
    /*--------------- 標籤樣式 ------------------------------------- */
.ajax__tab_yuitabview-theme .ajax__tab_header 
{
	border-bottom:solid 5px #2647a0;
}
.ajax__tab_yuitabview-theme .ajax__tab_header .ajax__tab_outer 
{
	margin:0px 0.16em 0px 0px;
	padding:1px 0px 1px 0px;
	vertical-align:bottom;
	border-right-width: 1px;
	border-left-width: 1px;
	border-right-style: solid;
	border-left-style: solid;
	border-right-color: #CCCCCC;
	border-left-color: #CCCCCC;
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: #CCCCCC;
	background-color: #d8d8d8;
}
.ajax__tab_yuitabview-theme .ajax__tab_header .ajax__tab_tab 
{    
    color:#000;
    padding:3px 20px;    
    margin-right:3px;
}
.ajax__tab_yuitabview-theme .ajax__tab_hover .ajax__tab_outer {
	border-top-width: 1px;
	border-right-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-left-style: solid;
	border-top-color: #99CCFF;
	border-right-color: #99CCFF;
	border-left-color: #99CCFF;
	background-color: #bfdaff;
	background-position: 0px 0px;
}  /*標籤滑過底圖 */
.ajax__tab_yuitabview-theme .ajax__tab_active .ajax__tab_tab {color:#fff;}
.ajax__tab_yuitabview-theme .ajax__tab_active .ajax__tab_outer {
	border-right-width: 1px;
	border-left-width: 1px;
	border-right-style: solid;
	border-left-style: solid;
	border-right-color: #2647a0;
	border-left-color: #2647a0;
	border-top-width: 1px;
	border-top-style: solid;
	border-top-color: #3366CC;
	background-color: #2647a0;
	background-position: 0px 0px;
} /*標籤點選底圖 */
.ajax__tab_yuitabview-theme .ajax__tab_body 
{
	padding:3px;
	background-color:#edf5ff;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-right-color: #99CCFF;
	border-bottom-color: #99CCFF;
	border-left-color: #99CCFF;
}
    </style>
</head>
<body>
    <div style="width: 980px; margin: 0 auto;">
    <form id="form" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
    <div style="width: 990px;">
    <div style="text-align: right; margin-bottom: -20px;">
        <img alt="" src="images/layout/user/print.png" 
            style="vertical-align: text-top;" /> 
        <asp:LinkButton ID="btnPrint" Text="列印" Font-Underline="false" runat="server" onclick="btnPrint_Click"></asp:LinkButton>
    </div>
    <ajaxToolkit:TabContainer ID="printblock" runat="server" ActiveTabIndex="1" 
            Width="100%" CssClass="ajax__tab_yuitabview-theme"> 
        <ajaxToolkit:TabPanel runat="server" ID="listPanel">
            <HeaderTemplate>訂單清單</HeaderTemplate>
            <ContentTemplate>
            <div id="listZone" runat="server" style="width: 980px; margin: 0 auto; background-color: White;">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; text-align: center; font-weight: bold; border-bottom: solid 1px #ccc; line-height: 23px;">
                   <tr style="">
                       <td style="padding: 4px; ">訂單編號</td>
                       <td style="padding: 4px; width: 120px;">購買者帳號</td>
                       <td style="padding: 4px; width: 120px;">購買者姓名</td>
                       <td style="padding: 4px; width: 120px;">價格</td>
                       <td style="padding: 4px; width: 100px;">付款方式</td>
                       <td style="padding: 4px; width: 100px;">交易狀態</td>
                       <td style="padding: 4px; width: 100px;">交易進度</td>
                       <td style="padding: 4px; width: 160px;">訂購日期</td>
                   </tr>
              </table>                              
                <asp:DataList ID="dltList" runat="server" RepeatLayout="Flow" ShowFooter="False" ShowHeader="False" Width="100%" onitemdatabound="dltList_ItemDataBound">
                    <ItemTemplate>                        
                        <asp:Label ID="orderid" runat="server" Text='<%# Container.DataItem %>' Visible="false"></asp:Label>
                        <asp:Literal ID="page_break" runat="server"></asp:Literal>                    
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; border-bottom:dotted 1px #ccc; margin-bottom: -15px;">
                            <tr>
                                <td style="padding: 4px 4px 4px 20px;"><asp:Label ID="order_id" runat="server"></asp:Label></td>
                                <td style="padding: 4px 4px 4px 20px; width: 120px;"><asp:Label ID="buyer_id" runat="server"></asp:Label></td>
                                <td style="padding: 4px 4px 4px 10px; width: 120px;"><asp:Label ID="buyer_name" runat="server"></asp:Label></td>
                                <td style="padding: 4px; width: 100px; text-align: right;"><asp:Label ID="price" runat="server"></asp:Label></td>
                                <td style="padding: 4px; width: 100px; text-align: center;"><asp:Label ID="payway" runat="server"></asp:Label></td>
                                <td style="padding: 4px; width: 100px; text-align: center;"><asp:Label ID="state" runat="server"></asp:Label></td>
                                <td style="padding: 4px; width: 100px; text-align: center;"><asp:Label ID="shipping" runat="server"></asp:Label></td>
                                <td style="padding: 4px; text-align: right; padding-right: 10px;"><asp:Label ID="date" runat="server"></asp:Label></td>
                            </tr>
                        </table>                        
                    </ItemTemplate>                    
                </asp:DataList>
            </div>                
            </ContentTemplate>            
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel runat="server" ID="detailPanel">
        <HeaderTemplate>訂單明細</HeaderTemplate>
            <ContentTemplate>
            <div id="detailZone" runat="server" style="width: 980px; margin: 0 auto; background-color: White;">
                <asp:DataList ID="dltDetail" runat="server" RepeatLayout="Flow" ShowFooter="False" ShowHeader="False" Width="100%" onitemdatabound="dltDetail_ItemDataBound">
                    <ItemTemplate>
                        <asp:Literal ID="page_break" runat="server"></asp:Literal>
                        <asp:Label ID="orderid" runat="server" Text='<%# Container.DataItem %>' Visible="false"></asp:Label>
                        <div style="border: solid 1px #ccc; background-color: #fff; padding: 1px; height: 700px;">
                        <asp:DataList ID="dltDetailContent" runat="server" DataSourceID="sdsDetailContent" Width="100%" onitemdatabound="dltDetailContent_ItemDataBound">
                            <ItemTemplate>                    
                                <div style="border: solid 1px #ccc; background-color: #fff; padding: 2px;">
                    <div style="border-bottom: solid 1px #ccc; background-color: #fec;">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 99%;">
                        <tr>
                            <td style=" border-bottom: 0px; line-height: 1.8em;"><span style="font-weight: bold; padding-left: 5px; padding-right: 260px;">訂單編號：<asp:Label ID="order_id" runat="server" Text='<%# Eval("order_id", "{0:00000000}") %>' /></span>訂單時間：<asp:Label ID="order_datetimeLabel" runat="server" Text='<%# Eval("order_datetime", "{0:yyyy/MM/dd hh:mm}") %>' /></td>
                            <td style="text-align: right; color: Red; font-weight: bold; padding-right: 5px; border-bottom: 0px;">總價：<asp:Label ID="total_priceLabel" runat="server" Text='<%# Eval("total_price") %>' />元</td>
                        </tr>
                    </table>
                    </div>
                    <div style="padding: 5px;">
                    <div style="border-bottom: dotted 1px #ccc; font-weight: bold; clear: both; margin-bottom: 5px;">購買者資訊</div>
                        姓名：<asp:Label ID="buyer_nameLabel" runat="server" Text='<%# Eval("buyer_name") %>' />&nbsp;&nbsp;
                    手機：&nbsp;&nbsp; 手機：<asp:Label ID="buyer_cellphoneLabel" runat="server" Text='<%# Eval("buyer_cellphone") %>' />&nbsp;&nbsp;
                    電話：&nbsp;&nbsp; 電話：<asp:Label ID="buyer_phoneLabel" runat="server" Text='<%# Eval("buyer_phone") %>' />&nbsp;&nbsp;
                    信箱：&nbsp;&nbsp; 信箱：<asp:Label ID="buyer_mailLabel" runat="server" Text='<%# Eval("buyer_mail") %>' />&nbsp;&nbsp;
                    地址：&nbsp;&nbsp; 地址：<asp:Label ID="buyer_postalcodeLabel" runat="server" 
                        Text='<%# Eval("buyer_postalcode") %>' />&nbsp;<asp:Label ID="buyer_cityLabel" runat="server" 
                        Text='<%# Eval("buyer_city") %>' /><asp:Label ID="buyer_districtLabel" runat="server" 
                        Text='<%# Eval("buyer_district") %>' /><asp:Label ID="buyer_addressLabel" runat="server" 
                        Text='<%# Eval("buyer_address") %>' />
                    <br />
                        <br />
                    <div style="border-bottom: dotted 1px #ccc; font-weight: bold; margin-top: 10px; margin-bottom: 5px;">收件人資訊</div>
                        姓名：<asp:Label ID="receiver_nameLabel" runat="server" Text='<%# Eval("receiver_name") %>' />&nbsp;&nbsp;
                    手機：&nbsp;&nbsp; 手機：<asp:Label ID="receiver_cellphoneLabel" runat="server" Text='<%# Eval("receiver_cellphone") %>' />&nbsp;&nbsp;
                    電話：&nbsp;&nbsp; 電話：<asp:Label ID="receiver_phoneLabel" runat="server" Text='<%# Eval("receiver_phone") %>' />&nbsp;&nbsp;
                    信箱：&nbsp;&nbsp; 信箱：<asp:Label ID="receiver_mailLabel" runat="server" Text='<%# Eval("receiver_mail") %>' />&nbsp;&nbsp;
                    地址：&nbsp;&nbsp; 地址：<asp:Label ID="receiver_postalcode" runat="server" 
                        Text='<%# Eval("receiver_postalcode") %>' />&nbsp;<asp:Label ID="receiver_cityLabel" runat="server" 
                        Text='<%# Eval("receiver_city") %>' /><asp:Label ID="receiver_districtLabel" runat="server" 
                        Text='<%# Eval("receiver_district") %>' /><asp:Label ID="receiver_addressLabel" runat="server" 
                        Text='<%# Eval("receiver_address") %>' />
                    <br /> 
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
            </asp:DataList>
                        <div id="ATMPanel" style="border: solid 1px #ccc; padding: 5px;" runat="server" visible="false">
                            <strong>買方ATM匯款紀錄</strong>&nbsp;&nbsp;&nbsp;&nbsp;
                            匯款帳戶名稱：&nbsp;&nbsp;&nbsp;&nbsp; 匯款帳戶名稱：<asp:Label ID="AccountName" runat="server"></asp:Label>&nbsp;&nbsp;
                            帳號末五碼：&nbsp;&nbsp; 帳號末五碼：<asp:Label ID="AccountNumber" runat="server"></asp:Label>&nbsp;&nbsp;
                            匯款金額：&nbsp;&nbsp; 匯款金額：<asp:Label ID="Pay" runat="server"></asp:Label>&nbsp;&nbsp;
                            匯款日期：&nbsp;&nbsp; 匯款日期：<asp:Label ID="PayDate" runat="server"></asp:Label>
                        </div>
                <asp:ListView ID="ltvPdtList" runat="server" DataSourceID="sdsOrderDetail">
                <ItemTemplate>
                    <tr style="">
                        <td style="height: 30px; border-bottom: dotted 1px #ccc; padding-left: 10px;">
                            <asp:Label ID="obj_name" runat="server" Font-Bold="true" Text='<%# Eval("obj_name") %>' />
                        </td>
                        <td style="text-align: center; border-bottom: dotted 1px #ccc;">
                            <asp:Label ID="obj_id" Text='<%# Eval("obj_id") %>' runat="server" />&nbsp;
                        &nbsp;
                        </td>
                        <td style="height: 30px; border-bottom: dotted 1px #ccc; padding-left: 10px;">
                            <asp:Label ID="obj_specific" runat="server" Text='<%# Eval("specification") %>' />
                        </td>
                        <%--<td style="text-align: center; border-bottom: dotted 1px #ccc;">
                            <asp:Label ID="obj_color" Text='<%# Eval("color") %>' runat="server" />&nbsp;
                        &nbsp;
                        </td>
                        <td style="text-align: center; border-bottom: dotted 1px #ccc;">
                            <asp:Label ID="obj_size" Text='<%# Eval("size") %>' runat="server" />&nbsp;
                        &nbsp;
                        </td>--%>
                        <td style="text-align: right; border-bottom: dotted 1px #ccc;">
                            <asp:Label ID="obj_price" runat="server" Text='<%# Eval("price") %>' /> &nbsp;元</td>
                        <td style="text-align: center; border-bottom: dotted 1px #ccc;">
                            <asp:Label ID="obj_count" runat="server" Text='<%# Eval("count") %>' />
                        </td>
                        <td style="text-align: right; color: Red; border-bottom: dotted 1px #ccc; padding-right: 10px;">
                            <asp:Label ID="obj_pricecount" Text='<%# Eval("totalprice") %>' runat="server" />元 
                        &nbsp; 
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
                    <table id="Table1" border="0" cellpadding="0" cellspacing="1" runat="server" style="width: 100%; background-color: #fff;">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server" style="border-bottom: 0px;">
                                    <table ID="itemPlaceholderContainer" runat="server" border="0" cellpadding="4" cellspacing="0" style="width: 100%;">
                                        <tr id="Tr2" runat="server" style="">
                                            <th id="Th1" runat="server" style="font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc; padding-left: 5px;">商品名稱</th>
                                            <th id="Th7" runat="server" style="font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc;">商品編號</th>
                                            <th id="Th2" runat="server" style="font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc;">商品規格</th>
                                            <%--<th id="Th2" runat="server" style="width: 10%; font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc;">顏色</th>
                                            <th id="Th6" runat="server" style="width: 10%; font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc;">尺寸</th>--%>
                                            <th id="Th3" runat="server" style="width: 10%; font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc; text-align: center;">單價</th>
                                            <th id="Th4" runat="server" style="width: 8%; font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc; text-align: center;">數量</th>
                                            <th id="Th5" runat="server" style="width: 15%; font-weight: bold; background-color: #fec; border-bottom: solid 1px #ccc; text-align: center;">小計</th>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>            
            </div>                        
                        <asp:SqlDataSource ID="sdsDetailContent" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                            SelectCommand="SELECT [order].*, delivery_time.delivery_time FROM [order] inner join delivery_time on [order].delivery_no=delivery_time.delivery_no WHERE ([order].order_id = @order_id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="orderid" Name="order_id" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="sdsOrderDetail" runat="server" 
                ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                SelectCommand="SELECT obj_name, obj_id, specification, color, size, price, count, totalprice FROM order_detail WHERE (order_detail.order_id = @order_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="orderid" Name="order_id" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
                    </ItemTemplate>                    
                </asp:DataList>
            </div>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel runat="server" ID="sentPanel">
            <HeaderTemplate>郵寄清單</HeaderTemplate>
            <ContentTemplate>
            <div id="sentZone" runat="server" style="width: 980px; margin: 0 auto; background-color: White;">                
                <asp:DataList ID="dltSent" runat="server" RepeatLayout="Flow" ShowFooter="False" ShowHeader="False" Width="100%" onitemdatabound="dltSent_ItemDataBound">
                    <ItemTemplate>
                        <asp:Literal ID="page_break" runat="server"></asp:Literal>
                        <asp:Label ID="orderid" runat="server" Text='<%# Container.DataItem %>' Visible="false"></asp:Label>
                        <asp:DataList ID="dltSentContent" runat="server" DataSourceID="sdsSentContent" Width="100%" onitemdatabound="dltSentContent_ItemDataBound">
                            <ItemTemplate> 
                                <asp:Label ID="store_id" runat="server" Text='<%# Eval("owner_id") %>' Visible="false"></asp:Label>                           
                                <table border="0" cellspacing="0" cellpadding="0" style="width: 980px; height: 450px;">
                                    <tr>
                                        <td colspan="2" style="height:140px; padding-left: 20px; font-size: 14pt line-height: 1.5em;">
                                            <asp:Label ID="store_poatolcode" runat="server"></asp:Label><br />
                                            <br />
                                            <asp:Label ID="store_address" runat="server"></asp:Label><br />
                                            <br />
                                            <asp:Label ID="store_name" runat="server"></asp:Label>
                                        <td style="width: 33%">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="height:150px; width: 33%;">&nbsp;</td>
                                        <td colspan="2" style="font-size: 16pt; padding-left: 20px; line-height: 1.5em;">
                                            <asp:Label ID="receiver_poatalcode" runat="server" Text='<%# Eval("receiver_postalcode") %>'></asp:Label><br />
                                            <br />
                                            <asp:Label ID="receiver_city" runat="server" Text='<%# Eval("receiver_city") %>'></asp:Label><asp:Label ID="receiver_district" runat="server" Text='<%# Eval("receiver_district") %>'></asp:Label><asp:Label ID="receiver_address" runat="server" Text='<%# Eval("receiver_address") %>'></asp:Label><br />
                                            <br />
                                            <span style="letter-spacing: 5px; padding-right: 20px;"><asp:Label ID="receiver_name" runat="server" Text='<%# Eval("receiver_name") %>'></asp:Label></span>
                                            先生/小姐 收&nbsp;
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>                                
                            </ItemTemplate>
                        </asp:DataList>                        
                        <asp:SqlDataSource ID="sdsSentContent" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                            SelectCommand="SELECT [order].* FROM [order] WHERE ([order].order_id = @order_id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="orderid" Name="order_id" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ItemTemplate> 
                </asp:DataList>
            </div>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
    </ajaxToolkit:TabContainer>
    </div>
    </form>
    </div>
</body>
</html>