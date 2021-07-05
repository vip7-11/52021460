<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="webinfo.aspx.cs" validateRequest="False" Inherits="user_webinfo" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
        <table style="width:100%;">
            <tr>
                <td colspan="2">
                    <h4>網站資料</h4>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 110px;">網站名稱：</td>
                <td>
                    <asp:TextBox ID="txtWebTitle" runat="server" CssClass="textbox" Width="300px"  
                        MaxLength="100"></asp:TextBox>
                    <asp:Label ID="lblWebid" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">網站標語：</td>
                <td>
                    <asp:TextBox ID="txtWebSlogan" runat="server" CssClass="textbox" Width="300px"  
                        MaxLength="200"></asp:TextBox>
                </td>
            </tr>
            <%--<tr>
                <td style="text-align: right; ">首頁跑馬燈：</td>
                <td>
                    <asp:TextBox ID="txtMarquee" runat="server" CssClass="textbox" MaxLength="200" 
                        Width="300px"></asp:TextBox>
                </td>
            </tr> --%>           
            <tr>
                <td style="text-align: left; " colspan="2">
                    <h4>公司資訊</h4>
                </td>
            </tr> 
            <tr>
                    <td style="text-align: right;">公司名稱：</td>
                    <td>
                        <asp:TextBox ID="txtCompany" runat="server" CssClass="textbox"  MaxLength="100" Width="350"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">公司電話1：</td>
                    <td>
                        <asp:TextBox ID="txtCompanyPhone" runat="server" CssClass="textbox"   MaxLength="20"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">公司電話2：</td>
                    <td>
                        <asp:TextBox ID="txtCompanyCellPhone" runat="server" CssClass="textbox" MaxLength="20"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">公司傳真：</td>
                    <td>
                        <asp:TextBox ID="txtCompanyFax" runat="server" CssClass="textbox" 
                            MaxLength="20"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                <td style="text-align: right; ">公司地址：</td>
                <td>
                        <asp:DropDownList ID="ddlCompanyCity" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource5" DataTextField="city_area" 
                            DataValueField="city_no" CssClass="textbox">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlCompanyDistrict" runat="server" DataSourceID="SqlDataSource6" 
                            DataTextField="village_area" DataValueField="postal_no" CssClass="textbox">
                        </asp:DropDownList>
                        <asp:TextBox ID="txtCompanyAddress" runat="server" CssClass="textbox" 
                            Width="300px"></asp:TextBox>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                            SelectCommand="SELECT * FROM [city_area] ORDER BY [city_no]">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                            SelectCommand="SELECT * FROM [city_village] WHERE ([city_no] = @city_no) ORDER BY [postal_no]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlCompanyCity" Name="city_no" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </td>
            </tr>
                <tr>
                    <td style="text-align: right;">統一編號：</td>
                    <td>
                        <asp:TextBox ID="txtTaxID" runat="server" CssClass="textbox"  MaxLength="10"></asp:TextBox>
                    </td>
                </tr>
                <%--<tr>
                    <td style="text-align: left; " colspan="2">
                        <h4>公司LOGO</h4>
                    </td>
                
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="Img_logo" runat="server" />
                        <br />
                        <asp:FileUpload ID="FUL_logo" runat="server" />
                        <asp:Label ID="lblimg1" runat="server" Text="lblimg1" Visible="False"></asp:Label>
                    </td>
                
                </tr> --%>      
            <tr>
                <td style="text-align: left; " colspan="2">
                    <h4>搜尋引擎最佳化</h4>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                <ajaxToolkit:TabContainer ID="objTab" runat="server" ActiveTabIndex="0" 
                        Width="100%" CssClass="ajax__tab_yuitabview-theme" > 
                    <ajaxToolkit:TabPanel runat="server" ID="keyword">
                        <HeaderTemplate>關鍵字</HeaderTemplate>
                        <ContentTemplate>
                            <span class="warning">*限五至十個詞彙。</span>
                            <asp:TextBox ID="txtWebKeyword" runat="server" Height="150px" TextMode="MultiLine" Width="100%" MaxLength="500"></asp:TextBox>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" ID="scription">
                        <HeaderTemplate>網站描述</HeaderTemplate>
                        <ContentTemplate>
                            <span class="warning">*填入您的店家簡介，字數約百字內佳。</span>
                            <asp:TextBox ID="txtWebDescription" runat="server" Height="150px" TextMode="MultiLine" Width="100%" MaxLength="500"></asp:TextBox>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="btnUpdate" runat="server" Text="更新" onclick="btnUpdate_Click" 
                        Height="20px" />
                </td>
            </tr>            
        </table>
</asp:Content>

