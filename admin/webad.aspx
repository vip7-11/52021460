<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="webad.aspx.cs" Inherits="user_webintro" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 285px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td>
                <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
                    CssClass="ajax__tab_yuitabview-theme" Width="100%">
                    <asp:TabPanel runat="server" HeaderText="廣告一" ID="TabPanel1">
                        <ContentTemplate>
                            <div style="border: solid 1px #ccc; background-color: #ffe; padding: 3px;  line-height: 22px; margin: 3px">
                                1. 圖片最大寬度 : 960 (像素)，超過此寬度將會造成版面錯位。<br />
                                2. 圖片最大高度 : 320 (像素)，超過此寬度將會造成版面錯位。</div>
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align: right; " class="style1">
                                        <asp:Image ID="webadimg1" runat="server" Width="100%" Height="266px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:left; ">
                                        <asp:FileUpload ID="FUD_web_ad1" runat="server" />
                                        <asp:Label ID="lblimg1" runat="server" Text="lblimg1"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        超連結&nbsp;
                                        <asp:TextBox ID="txt_web_ad1_link" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;">
                                        <div style="text-align: center; padding: 5px;">
                                            <asp:Button ID="btnUpdateWebAd1" runat="server" Height="20px" Text="更新" 
                                                onclick="btnUpdateWebAd1_Click" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" HeaderText="廣告二" ID="TabPanel2">
                        <ContentTemplate>
                            <div style="border: solid 1px #ccc; background-color: #ffe; padding: 3px;  line-height: 22px; margin: 3px">
                                1. 圖片最大寬度 : 960 (像素)，超過此寬度將會造成版面錯位。<br />
                                2. 圖片最大高度 : 320 (像素)，超過此寬度將會造成版面錯位。</div>
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align: right; " class="style1">
                                        <asp:Image ID="webadimg2" runat="server" Width="100%" Height="266px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:left; ">
                                        <asp:FileUpload ID="FUD_web_ad2" runat="server" />
                                        <asp:Label ID="lblimg2" runat="server" Text="lblimg2"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        超連結&nbsp;
                                        <asp:TextBox ID="txt_web_ad2_link" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;">
                                        <div style="text-align: center; padding: 5px;">
                                            <asp:Button ID="btnUpdateWebAd2" runat="server" Height="20px" Text="更新" 
                                                onclick="btnUpdateWebAd2_Click" />
                                        </div>
                                    </td>
                                </tr>
                            </table>                            
                        </ContentTemplate>                        
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" HeaderText="廣告三" ID="TabPanel3">
                        <ContentTemplate>
                            <div style="border: solid 1px #ccc; background-color: #ffe; padding: 3px;  line-height: 22px; margin: 3px">
                                1. 圖片最大寬度 : 960 (像素)，超過此寬度將會造成版面錯位。<br />
                                2. 圖片最大高度 : 320 (像素)，超過此寬度將會造成版面錯位。</div>
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align: right; " class="style1">
                                        <asp:Image ID="webadimg3" runat="server" Width="100%" Height="266px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:left; ">
                                        <asp:FileUpload ID="FUD_web_ad3" runat="server" />
                                        <asp:Label ID="lblimg3" runat="server" Text="lblimg2"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        超連結&nbsp;
                                        <asp:TextBox ID="txt_web_ad3_link" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;">
                                        <div style="text-align: center; padding: 5px;">
                                            <asp:Button ID="btnUpdateWebAd3" runat="server" Height="20px" Text="更新" 
                                                onclick="btnUpdateWebAd3_Click" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" HeaderText="廣告四" ID="TabPanel4">
                        <ContentTemplate>
                            <div style="border: solid 1px #ccc; background-color: #ffe; padding: 3px;  line-height: 22px; margin: 3px">
                                1. 圖片最大寬度 : 960 (像素)，超過此寬度將會造成版面錯位。<br />
                                2. 圖片最大高度 : 320 (像素)，超過此寬度將會造成版面錯位。</div>
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align: right; " class="style1">
                                        <asp:Image ID="webadimg4" runat="server" Width="100%" Height="266px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:left; ">
                                        <asp:FileUpload ID="FUD_web_ad4" runat="server" />
                                        <asp:Label ID="lblimg4" runat="server" Text="lblimg4"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        超連結&nbsp;
                                        <asp:TextBox ID="txt_web_ad4_link" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;">
                                        <div style="text-align: center; padding: 5px;">
                                            <asp:Button ID="btnUpdateWebAd4" runat="server" Height="20px" Text="更新" 
                                                onclick="btnUpdateWebAd4_Click" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" HeaderText="廣告五" ID="TabPanel5">
                        <ContentTemplate>
                            <div style="border: solid 1px #ccc; background-color: #ffe; padding: 3px;  line-height: 22px; margin: 3px">
                                1. 圖片最大寬度 : 960 (像素)，超過此寬度將會造成版面錯位。<br />
                                2. 圖片最大高度 : 320 (像素)，超過此寬度將會造成版面錯位。</div>
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align: right; " class="style1">
                                        <asp:Image ID="webadimg5" runat="server" Width="100%" Height="266px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align:left; ">
                                        <asp:FileUpload ID="FUD_web_ad5" runat="server" />
                                        <asp:Label ID="lblimg5" runat="server" Text="lblimg5"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        超連結&nbsp;
                                        <asp:TextBox ID="txt_web_ad5_link" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;">
                                        <div style="text-align: center; padding: 5px;">
                                            <asp:Button ID="btnUpdateWebAd5" runat="server" Height="20px" Text="更新" 
                                                onclick="btnUpdateWebAd5_Click" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </td>
        </tr>
    </table>
</asp:Content>

