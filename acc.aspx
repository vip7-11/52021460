<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="acc.aspx.cs" Inherits="acc" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
    <asp:Panel ID="show_order" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
        <tr>
            <td height="30" style=" padding-left:15px;">
                <span style=" color:#787878; font-size:14pt;">訂購者資料</span>
            </td>
        </tr>
        <tr>
            <td style="padding: 10px; border-style: dashed; border-width: 1px; border-color: #cbcbcb;">
                <table border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
                    <tr>
                        <td height="30" align="right" width="80">
                            姓　　名：</td>
                        <td height="30">
                            <asp:TextBox ID="txtOname" runat="server" CssClass="textbox"></asp:TextBox>
                        &nbsp;<asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" height="30">
                            電　　話：</td>
                        <td height="30">
                            <asp:TextBox ID="txtOphone" runat="server" CssClass="textbox"></asp:TextBox>
                        &nbsp;<asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" height="30">
                            手　　機：</td>
                        <td height="30">
                            <asp:TextBox ID="txtOcellphone" runat="server" CssClass="textbox"></asp:TextBox>
                            &nbsp;<asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"></asp:Label>
                            </td>
                    </tr>
                    <tr>
                        <td align="right" height="30">
                            地　　址：</td>
                        <td height="30">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlOcity" runat="server" AutoPostBack="True" 
                                        CssClass="textbox" DataSourceID="SqlDataSource1" DataTextField="city_area" 
                                        DataValueField="city_no">
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlOdistrict" runat="server" CssClass="textbox" 
                                        DataSourceID="SqlDataSource2" DataTextField="village_area" 
                                        DataValueField="postal_no" AutoPostBack="True" 
                                        onselectedindexchanged="ddlOdistrict_SelectedIndexChanged" 
                                        onprerender="ddlOdistrict_PreRender">
                                    </asp:DropDownList>
                                    <asp:TextBox ID="txtOaddress" runat="server" CssClass="textbox" Width="350px"></asp:TextBox>
                                    &nbsp;<asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    <asp:Label ID="ddlOdistrict_num" runat="server"></asp:Label>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                                        SelectCommand="SELECT * FROM [city_area] ORDER BY [city_no]">
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                                        SelectCommand="SELECT * FROM [city_village] WHERE ([city_no] = @city_no) ORDER BY [postal_no]">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlOcity" Name="city_no" 
                                                PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" height="30">
                            信　　箱：
                        </td>
                        <td height="30" style=" padding-left:2px;">
                            <asp:TextBox ID="txtOemail" runat="server" CssClass="textbox" Width="210px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" height="30" width="80">
                                        開立發票：</td>
                                    <td height="30" valign="middle">
                                        <asp:RadioButtonList ID="rblcar_bill" runat="server" 
                                            RepeatDirection="Horizontal" AutoPostBack="True" 
                                            onselectedindexchanged="rblcar_bill_SelectedIndexChanged">
                                            <asp:ListItem Value="1" Selected="True">否</asp:ListItem>
                                            <asp:ListItem Value="2">二聯式</asp:ListItem>
                                            <asp:ListItem Value="3">三聯式</asp:ListItem>
                                        </asp:RadioButtonList>
                                    &nbsp;</td>
                                </tr>
                                <asp:Panel ID="pnl_1" runat="server" Visible="false">
                                <tr>
                                    <td align="right" height="30">
                                        統　　編：</td>
                                    <td height="30" style=" padding-left:2px;">
                                        <asp:TextBox ID="txt_cid" runat="server" MaxLength="8" Width="80" CssClass="textbox"></asp:TextBox>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" 
                                            runat="server" Enabled="True" FilterType="Custom, Numbers" TargetControlID="txt_cid">
                                        </asp:FilteredTextBoxExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" height="30">
                                        公司抬頭：</td>
                                    <td height="30">
                                        <asp:TextBox ID="txt_comName" runat="server" CssClass="textbox"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" height="30">
                                        <span style=" padding-left:5px; font-weight:600;">*此筆交易VIP商城購物網將開立發票給消費者</span>
                                    </td>
                                </tr>
                            </asp:Panel>
                            </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
        <tr>
            <td height="30" style=" padding-left:15px;">
                <span style=" color:#787878; font-size:14pt;">收件者資料</span></td>
        </tr>
        <tr>
            <td style="padding: 10px; border-style: dashed; border-width: 1px; border-color: #cbcbcb;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
                            <tr>
                                <td height="30" align="right" width="80">
                                    同訂購者：</td>
                                <td height="30">
                                    <asp:CheckBox ID="chkOR" runat="server" Text="是" AutoPostBack="True" 
                                        oncheckedchanged="chkOR_CheckedChanged" />
                                </td>
                            </tr>
                            <tr>
                                <td height="30" align="right" width="80">
                                    姓　　名：</td>
                                <td height="30">
                                    <asp:TextBox ID="txtRname" runat="server" CssClass="textbox"></asp:TextBox>
                                    &nbsp;<asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" height="30">
                                    電　　話：</td>
                                <td height="30">
                                    <asp:TextBox ID="txtRphone" runat="server" CssClass="textbox"></asp:TextBox>
                                    &nbsp;<asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" height="30">
                                    手　　機：</td>
                                <td height="30">
                                    <asp:TextBox ID="txtRcellphone" runat="server" CssClass="textbox"></asp:TextBox>
                                    &nbsp;<asp:Label ID="Label7" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" height="30">
                                    地　　址：</td>
                                <td height="30">
                                    <asp:DropDownList ID="ddlRcity" runat="server" CssClass="textbox" 
                                        AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="city_area" 
                                        DataValueField="city_no">
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlRdistrict" runat="server" CssClass="textbox" 
                                        DataSourceID="SqlDataSource3" DataTextField="village_area" 
                                        DataValueField="postal_no" AutoPostBack="True" 
                                        onselectedindexchanged="ddlRdistrict_SelectedIndexChanged" 
                                        onprerender="ddlRdistrict_PreRender">
                                    </asp:DropDownList>
                                    <asp:TextBox ID="txtRaddress" runat="server" CssClass="textbox" Width="350px"></asp:TextBox>
                                    &nbsp;<asp:Label ID="Label8" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    <asp:Label ID="ddlRdistrict_num" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" height="30">
                                    信　　箱：</td>
                                <td height="30" style=" padding-left:2px;">
                                    <asp:TextBox ID="txtRemail" runat="server" CssClass="textbox" Width="210px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" height="30" style=" padding-left:20px;">
                                    <h4><span style=" color:Red">※</span>請選擇欲宅配之時段</h4></td>
                            </tr>
                            <tr>
                                <td align="right" height="30">
                                    宅配時段：</td>
                                <td height="30">
                                    <asp:DropDownList ID="ddldelivery_time" runat="server" CssClass="textbox">
                                        <asp:ListItem Value="0">任一時段皆可</asp:ListItem>
                                        <asp:ListItem Value="1">白天(8:00-17:00)</asp:ListItem>
                                        <asp:ListItem Value="2">上午(8:00-12:00)</asp:ListItem>
                                        <asp:ListItem Value="3">下午(13:00-17:00)</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>&nbsp;<asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                            SelectCommand="SELECT * FROM [city_village] WHERE ([city_no] = @city_no) ORDER BY [postal_no]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlRcity" Name="city_no" 
                                    PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
        <tr>
            <td height="30" style=" padding-left:15px;">
                <%--<img alt="" src="images/car03.png" />--%>
                <span style=" color:#787878; font-size:14pt;">備註</span>
            </td>
        </tr>
        <tr>
            <td style="padding: 10px; border-style: dashed; border-width: 1px; border-color: #cbcbcb;">
                <table border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
                    <tr>
                        <td height="30">
                            <asp:TextBox ID="txtcar_ps" runat="server" CssClass="textbox" Rows="5" 
                                TextMode="MultiLine" Width="100%"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
        <tr>
            <td height="30" style=" padding-left:15px;"><%--<img alt="" src="images/car04.png" />--%>
                <span style=" color:#787878; font-size:14pt;">付款方式</span>
            </td>
        </tr>
        <tr>
            <td style="padding: 10px; border-style: dashed; border-width: 1px; border-color: #cbcbcb;">
                <table border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
                    <tr>
                        <td height="30">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; background-color:#F1F1F1;">
                                            <tr>
                                                <td style=" padding-left:10px; width:30px; height:40px; background-color:#FFF;"><asp:RadioButton ID="rdoStore" runat="server" GroupName="payment" Enabled="false" /></td>
                                                <td style=" background-color:#FFF;">來店取貨 (請於備註欄位填妥來店時間以便我們為您服務，運費將自動扣除。)</td>
                                            </tr>
                                            <tr>
                                                <td height="40" style=" padding-left:10px;"><asp:RadioButton ID="rdoATM" runat="server" GroupName="payment" Enabled="false" /></td>
                                                <td style="">ATM 轉帳</td>
                                            </tr>
                                            <tr>
                                                <td height="40" style=" padding-left:10px; background-color:#FFF;"><asp:RadioButton ID="rdoRecPay" runat="server" GroupName="payment" Enabled="false" /></td>
                                                <td style=" background-color:#FFF;">貨到付款 (需加 <asp:Label ID="lblRecPayCount" runat="server" Text="Label" Font-Bold="true" ForeColor="Red"></asp:Label> 元手續費。)</td>
                                            </tr>
                                            <tr>
                                                <td height="40" style=" padding-left:10px;"><asp:RadioButton ID="rdoWATM" runat="server" GroupName="payment" Enabled="false" /></td>
                                                <td style="">WebATM 即時付 (網路ATM即時轉帳，不需輸入店家帳號，需金融卡讀卡機。)</td>
                                            </tr>
                                            <tr>
                                                <td height="40" style=" padding-left:10px; background-color:#FFF;"><asp:RadioButton ID="rdoCSPay" runat="server" GroupName="payment" Enabled="false" /></td>
                                                <td style=" background-color:#FFF;">超商代碼繳費1 (取得繳費代碼至全家 Famiport、OK便利店或萊爾富Life-ET繳費。)</td>
                                            </tr>
                                            <tr>
                                                <td height="40" style=" padding-left:10px; background-color:#FFF;"><asp:RadioButton ID="rdoCSPay_ibon" runat="server" GroupName="payment" Enabled="false" /></td>
                                                <td style=" background-color:#FFF;">超商代碼繳費2 (取得繳費代碼至 統一 I-Bon繳費。)</td>
                                            </tr>
                                            <tr>
                                                <td height="40" style=" padding-left:10px;"><asp:RadioButton ID="rdoVISA" runat="server" GroupName="payment" Enabled="false" /></td>
                                                <td style="">線上刷卡 (ECBank)</td>
                                            </tr>                    
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
        <tr>
            <td align="center" height="30"><asp:Label ID="Label9" runat="server" 
                ForeColor="Red" Text="* 為必填欄位"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" height="30">
            <asp:Button ID="imgbtn" runat="server" Text="完成購物" onclick="imgbtn_Click" />
            </td>
        </tr>
    </table>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>