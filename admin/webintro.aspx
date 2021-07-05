<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="webintro.aspx.cs" Inherits="user_webintro" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td>
                <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="4" 
                    CssClass="ajax__tab_yuitabview-theme" Width="100%">
                    <asp:TabPanel runat="server" HeaderText="關於VIP" ID="TabPanel1">
                        <ContentTemplate>                            
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align: right; ">
                                        <FCKeditorV2:FCKeditor ID="txtWebIntro" runat="server" BasePath="../editor/" 
                                            Height="540px" ToolbarSet="user_advance" Width="100%">
                                        </FCKeditorV2:FCKeditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;">
                                        <div style="text-align: center; padding: 5px;">
                                            <asp:Button ID="btnUpdateWebIntro" runat="server" Height="20px" 
                                                onclick="btnUpdateWebIntro_Click" Text="更新" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" HeaderText="聯絡我們" ID="TabPanel2">
                        <ContentTemplate>
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align: right; ">
                                        <FCKeditorV2:FCKeditor ID="txtWebcontentUs" runat="server" BasePath="../editor/" 
                                            Height="540px" ToolbarSet="user_advance">
                                        </FCKeditorV2:FCKeditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;">
                                        <div style="text-align: center; padding: 5px;">
                                            <asp:Button ID="btnUpdateWebcontentUs" runat="server" Height="20px" 
                                                onclick="btnUpdateWebcontentUs_Click" Text="更新" />
                                        </div>
                                    </td>
                                </tr>
                            </table>                            
                        </ContentTemplate>                        
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" HeaderText="關於VIP商城" ID="TabPanel3">
                        <ContentTemplate>
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align: right; ">
                                        <FCKeditorV2:FCKeditor ID="txtWebIntroStore" runat="server" BasePath="../editor/" 
                                            Height="540px" ToolbarSet="user_advance">
                                        </FCKeditorV2:FCKeditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;">
                                        <div style="text-align: center; padding: 5px;">
                                            <asp:Button ID="btnUpdateWebIntroStore" runat="server" Height="20px" 
                                                onclick="btnUpdateWebIntroStore_Click" Text="更新" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" HeaderText="客戶權利義務" ID="TabPanel4">
                        <ContentTemplate>
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align: right; ">
                                        <FCKeditorV2:FCKeditor ID="txtWebService" runat="server" BasePath="../editor/" 
                                            Height="540px" ToolbarSet="user_advance">
                                        </FCKeditorV2:FCKeditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;">
                                        <div style="text-align: center; padding: 5px;">
                                            <asp:Button ID="btnUpdateWebService" runat="server" Height="20px" 
                                                onclick="btnUpdateWebService_Click" Text="更新" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" HeaderText="個人隱私保密政策" ID="TabPanel5">
                        <ContentTemplate>
                            <table style="width:100%;">
                                <tr>
                                    <td style="text-align: right; ">
                                        <FCKeditorV2:FCKeditor ID="txtWebSecret" runat="server" BasePath="../editor/" 
                                            Height="540px" ToolbarSet="user_advance" Width="100%">
                                        </FCKeditorV2:FCKeditor>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;">
                                        <div style="text-align: center; padding: 5px;">
                                            <asp:Button ID="btnUpdateWebSecret" runat="server" Height="20px" Text="更新" 
                                                OnClick="btnUpdateWebSecret_Click" />
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