<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="pdt_add.aspx.cs" Inherits="user_pdt_add" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="style/user.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td colspan="2">
                <h4>新增商品</h4>
            </td>
        </tr>
        <tr>
            <td style="text-align: right; width: 80px;">編號：</td>
            <td>
                <asp:TextBox ID="txtpdt_id" runat="server" CssClass="textbox" Width="300px"  
                    MaxLength="30"></asp:TextBox>&nbsp;<span class="warning">*</span>
            </td>
        </tr>
            <tr>
                <td style="text-align: right;">名稱：</td>
                <td>
                <asp:TextBox ID="txtpdt_name" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>&nbsp;<span class="warning">*</span></td>
            </tr>         
            <tr>
                <td style="text-align: right;">成本：</td>
                <td>
                <asp:TextBox ID="txtpdt_cost" runat="server" CssClass="textbox"></asp:TextBox>
                &nbsp;<span class="warning">可不填</span></td>
            </tr>         
            <tr>
                <td style="text-align: right;">原價：</td>
                <td>
                <asp:TextBox ID="txtpdt_price" runat="server" CssClass="textbox"></asp:TextBox>
                &nbsp;<span class="warning">可不填</span></td>
            </tr>         
            <tr>
                <td style="text-align: right;">批發價：</td>
                <td>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="100">
                <asp:TextBox ID="txtpdt_sell" runat="server" CssClass="textbox"></asp:TextBox>&nbsp;<span class="warning">*</span>
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
                <td style="text-align: right;">運費：</td>
                <td>
                <asp:TextBox ID="txtpdt_convey" runat="server" CssClass="textbox"></asp:TextBox>
                &nbsp;<span class="warning">不填為預設運費</span></td>
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
                    <asp:UpdatePanel ID="updPnl" runat="server"><ContentTemplate>
                    <asp:DropDownList ID="ddlpdt_itemA" runat="server" 
                        CssClass="textbox" DataSourceID="SqlDataSource1" DataTextField="itemA_name" 
                        DataValueField="itemA_no">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                        SelectCommand="SELECT * FROM [ItemA] ORDER BY [itemA_no]">
                    </asp:SqlDataSource>
                    </ContentTemplate></asp:UpdatePanel>
                </td>
            </tr>         
            <tr>
                <td style="text-align: right;">狀態：</td>
                <td>
                    <%--<asp:CheckBox ID="chkpdt_stateA" runat="server" Text="新品" />
                    <asp:CheckBox ID="chkpdt_stateB" runat="server" Text="館長推薦" />
                    <asp:CheckBox ID="chkpdt_stateC" runat="server" Text="暢銷" />--%>
                    <asp:CheckBox ID="chkpdt_stateD" runat="server" Text="隱藏" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">量詞：</td>
                <td>
                    <asp:TextBox ID="txtpdt_units" runat="server" CssClass="textbox" Width="30px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">商品規格：</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:DataList ID="dltSpecific" runat="server" DataKeyField="specific_group_id" 
                        DataSourceID="sdsSpecific" RepeatDirection="Horizontal" onprerender="dltSpecific_PreRender">
                        <ItemStyle BorderWidth="0px" VerticalAlign="Top" Width="135px" />
                        <ItemTemplate>
                            <div style="background-color: #fc9; padding: 2px 4px; border: solid 1px #fff;">
                                <asp:CheckBox ID="specific_group" runat="server" />
                                <asp:Label ID="specific_group_id" runat="server" Text='<%# Eval("specific_group_id") %>' Visible="false" />
                                <asp:Label ID="specific_group_name" runat="server" Text='<%# Eval("specific_group_name") %>' Font-Bold="true" />
                            </div>
                            <div style="width: 120px; padding: 2px; border: solid 1px #fff; margin: 0 auto;">
                                <asp:CheckBoxList ID="specification" runat="server" Width="100%" 
                                    DataSourceID="sdsSpecification" DataTextField="specification" 
                                    DataValueField="specific_id" RepeatLayout="Flow">
                                </asp:CheckBoxList>
                            </div>
                            <asp:SqlDataSource ID="sdsSpecification" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                                SelectCommand="SELECT [specification], [specific_id] FROM [specification] WHERE ([specific_group_id] = @specific_group_id) ORDER BY [specific_id]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="specific_group_id" Name="specific_group_id" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="sdsSpecific" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                        SelectCommand="SELECT [specific_group_id], [specific_group_name] FROM [specific_group] WHERE ([web_id] = @web_id) ORDER BY [specific_group_id]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblWebId" Name="web_id" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="left"><div style="border: solid 1px #ccc; background-color: #ffe; padding: 3px;  line-height: 22px; margin: 3px">1. 您最少需上傳一張圖片，最多可上傳五張圖片。<br />2. 圖片最適大小為：寬度 
                    210 (像素)，高度 280 (像素)。<br />3. 圖片大小如超過最適大小，將會自動壓縮成最適大小。</div></td>
            </tr>       
            <tr>
                <td style="text-align: right;">圖示：</td>
                <td>                    
                    <asp:FileUpload ID="fudPdtImg1" runat="server" CssClass="fileupload" />
                </td>
            </tr>       
            <%--<tr>
                <td style="text-align: right;">圖二：</td>
                <td>
                    <asp:FileUpload ID="fudPdtImg2" runat="server" CssClass="fileupload" />
                </td>
            </tr>       
            <tr>
                <td style="text-align: right;">圖三：</td>
                <td>
                    <asp:FileUpload ID="fudPdtImg3" runat="server" CssClass="fileupload" />
                </td>
            </tr>       
            <tr>
                <td style="text-align: right;">圖四：</td>
                <td>
                    <asp:FileUpload ID="fudPdtImg4" runat="server" CssClass="fileupload" />
                </td>
            </tr>       
            <tr>
                <td style="text-align: right;">圖五：</td>
                <td>
                    <asp:FileUpload ID="fudPdtImg5" runat="server" CssClass="fileupload" />
                </td>
            </tr>--%>
            <tr>
                <td style="text-align: right;">商品描述：</td>
                <td>
                    &nbsp;</td>
            </tr>         
            <tr>
                <td style="text-align: right;" colspan="2">
                <FCKeditorV2:FCKeditor ID="txtpdt_content" runat="server" BasePath="../editor/" 
                    Height="340px" ToolbarSet="user_advance">
                </FCKeditorV2:FCKeditor>
                </td>
            </tr>         
        <tr>
            <td colspan="2" style="text-align: center;">
                <span class="warning">*為必填欄位！</span></td>
        </tr>            
        <tr>
            <td colspan="2" style="text-align: center;">
                <asp:Button ID="btnAdd" runat="server" Text="新增" 
                    Height="20px" onclick="btnAdd_Click" />
            </td>
        </tr>            
    </table>
    <asp:Label ID="lblWebId" runat="server" Visible="false"></asp:Label>
</asp:Content>