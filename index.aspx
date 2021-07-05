<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="style/tab.css" rel="stylesheet" type="text/css" />
    <link href="style/menu1.css" rel="stylesheet" type="text/css" />
    <link href="style/m2_left_U.css" rel="stylesheet" type="text/css" />
    <script src="scripts/jquery.js" type="text/javascript"></script>
    <script src="scripts/minwtAdShow.js" type="text/javascript"></script>
<script type="text/javascript">
    function changeTab1(tabIndex) {
        var tabBehavior = $get('<%=TabContainer1.ClientID%>').control;
        tabBehavior.set_activeTabIndex(tabIndex);
    }
    function changeTab2(tabIndex) {
        var tabBehavior = $get('<%=TabContainer2.ClientID%>').control;
        tabBehavior.set_activeTabIndex(tabIndex);
    }
    function changeTab3(tabIndex) {
        var tabBehavior = $get('<%=TabContainer3.ClientID%>').control;
        tabBehavior.set_activeTabIndex(tabIndex);
    }
    function changeTab4(tabIndex) {
        var tabBehavior = $get('<%=TabContainer4.ClientID%>').control;
        tabBehavior.set_activeTabIndex(tabIndex);
    }
    function changeTab5(tabIndex) {
        var tabBehavior = $get('<%=TabContainer5.ClientID%>').control;
        tabBehavior.set_activeTabIndex(tabIndex);
    }
    function changeTab6(tabIndex) {
        var tabBehavior = $get('<%=TabContainer6.ClientID%>').control;
        tabBehavior.set_activeTabIndex(tabIndex);
    }
    function changeTab7(tabIndex) {
        var tabBehavior = $get('<%=TabContainer7.ClientID%>').control;
        tabBehavior.set_activeTabIndex(tabIndex);
    }
    function changeTab8(tabIndex) {
        var tabBehavior = $get('<%=TabContainer8.ClientID%>').control;
        tabBehavior.set_activeTabIndex(tabIndex);
    }
    function changeTab9(tabIndex) {
        var tabBehavior = $get('<%=TabContainer9.ClientID%>').control;
        tabBehavior.set_activeTabIndex(tabIndex);
    }
    function changeTab10(tabIndex) {
        var tabBehavior = $get('<%=TabContainer10.ClientID%>').control;
        tabBehavior.set_activeTabIndex(tabIndex);
    }
    function changeTab11(tabIndex) {
        var tabBehavior = $get('<%=TabContainer11.ClientID%>').control;
        tabBehavior.set_activeTabIndex(tabIndex);
    }
    function changeTab12(tabIndex) {
        var tabBehavior = $get('<%=TabContainer12.ClientID%>').control;
        tabBehavior.set_activeTabIndex(tabIndex);
    }
    function changeTab13(tabIndex) {
        var tabBehavior = $get('<%=TabContainer13.ClientID%>').control;
        tabBehavior.set_activeTabIndex(tabIndex);
    }
    function changeTab14(tabIndex) {
        var tabBehavior = $get('<%=TabContainer14.ClientID%>').control;
        tabBehavior.set_activeTabIndex(tabIndex);
    }
    function changeTab15(tabIndex) {
        var tabBehavior = $get('<%=TabContainer15.ClientID%>').control;
        tabBehavior.set_activeTabIndex(tabIndex);
    }
    function changeTab16(tabIndex) {
        var tabBehavior = $get('<%=TabContainer16.ClientID%>').control;
        tabBehavior.set_activeTabIndex(tabIndex);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="all" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="banner" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="banner_up" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="banner_down" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="nav" Runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="main" Runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td width="210" valign="top" align="left">
                <div class="m1_left_U">
                    <asp:HyperLink ID="m1_left_U" runat="server"></asp:HyperLink>
                </div>
                <div class="m1_left_D">
                    <span>查詢出貨進度</span><br />
                    <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" ></asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink2" runat="server" Target="_blank" ></asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink3" runat="server" Target="_blank" ></asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink4" runat="server" Target="_blank" ></asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink5" runat="server" Target="_blank" ></asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink6" runat="server" Target="_blank" ></asp:HyperLink><br />
                    <asp:HyperLink ID="HyperLink7" runat="server" Target="_blank" ></asp:HyperLink>
                </div>
            </td>
            <td valign="top">
                <div>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="360">
                                <asp:TabContainer ID="TabContainer1" runat="server" Width="350px" 
                                    ActiveTabIndex="0" CssClass="menu1">
                                    <asp:TabPanel runat="server" ID="m_right_L_U_LTP1">
                                        <HeaderTemplate>
                                            <a onmousemove="changeTab1(0)">
                                                <asp:Label ID="m1_right_L_U_LTP1" runat="server" Text="LTP1"></asp:Label>
                                            </a>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <asp:HyperLink ID="m1_right_L_U_LHL01" runat="server" Text="LTP01"></asp:HyperLink>
                                        </ContentTemplate>
                                    </asp:TabPanel>
                                    <asp:TabPanel runat="server" ID="m_right_L_U_LTP2">
                                        <HeaderTemplate>
                                            <a onmousemove="changeTab1(1)">
                                                <asp:Label ID="m1_right_L_U_LTP2" runat="server" Text="LTP2"></asp:Label>
                                            </a>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <asp:HyperLink ID="m1_right_L_U_LHL02" runat="server" Text="LTP02"></asp:HyperLink>
                                        </ContentTemplate>
                                    </asp:TabPanel>
                                    <asp:TabPanel runat="server" ID="m_right_L_U_LTP3">
                                        <HeaderTemplate>
                                            <a onmousemove="changeTab1(2)">
                                                <asp:Label ID="m1_right_L_U_LTP3" runat="server" Text="LTP3"></asp:Label>
                                            </a>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <asp:HyperLink ID="m1_right_L_U_LHL03" runat="server" Text="LTP03"></asp:HyperLink>
                                        </ContentTemplate>
                                    </asp:TabPanel>
                                    <asp:TabPanel runat="server" ID="m_right_L_U_LTP4">
                                        <HeaderTemplate>
                                            <a onmousemove="changeTab1(3)">
                                                <asp:Label ID="m1_right_L_U_LTP4" runat="server" Text="LTP4"></asp:Label>
                                            </a>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <asp:HyperLink ID="m1_right_L_U_LHL04" runat="server" Text="LTP04"></asp:HyperLink>
                                        </ContentTemplate>
                                    </asp:TabPanel>
                                    <asp:TabPanel runat="server" ID="m_right_L_U_LTP5">
                                        <HeaderTemplate>
                                            <a onmousemove="changeTab1(4)">
                                                <asp:Label ID="m1_right_L_U_LTP5" runat="server" Text="LTP5"></asp:Label>
                                            </a>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <asp:HyperLink ID="m1_right_L_U_LHL05" runat="server" Text="LTP05"></asp:HyperLink>
                                        </ContentTemplate>
                                    </asp:TabPanel>
                                    <asp:TabPanel runat="server" ID="m_right_L_U_LTP6">
                                        <HeaderTemplate>
                                            <a onmousemove="changeTab1(5)">
                                                <asp:Label ID="m1_right_L_U_LTP6" runat="server" Text="LTP6"></asp:Label>
                                            </a>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <asp:HyperLink ID="m1_right_L_U_LHL06" runat="server" Text="LTP06"></asp:HyperLink>
                                        </ContentTemplate>
                                    </asp:TabPanel>
                                </asp:TabContainer>
                            </td>
                        <td valign="top">
                                <asp:TabContainer ID="TabContainer2" runat="server" Width="180px" 
                                    ActiveTabIndex="0" CssClass="menu2">
                                    <asp:TabPanel runat="server" ID="m_right_L_U_RTP1">
                                        <HeaderTemplate>
                                            <a onmousemove="changeTab2(0)">
                                                <asp:Label ID="m1_right_L_U_RTP1" runat="server" Text="RTP1"></asp:Label>
                                            </a>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <asp:HyperLink ID="m1_right_L_U_RHL01" runat="server" Text="RTP01"></asp:HyperLink>
                                        </ContentTemplate>
                                    </asp:TabPanel>
                                    <asp:TabPanel runat="server" ID="m_right_L_U_RTP2">
                                        <HeaderTemplate>
                                            <a onmousemove="changeTab2(1)">
                                                <asp:Label ID="m1_right_L_U_RTP2" runat="server" Text="RTP2"></asp:Label>
                                            </a>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <asp:HyperLink ID="m1_right_L_U_RHL02" runat="server" Text="RTP02"></asp:HyperLink>
                                        </ContentTemplate>
                                    </asp:TabPanel>
                                    <asp:TabPanel runat="server" ID="m_right_L_U_RTP3">
                                        <HeaderTemplate>
                                            <a onmousemove="changeTab2(2)">
                                                <asp:Label ID="m1_right_L_U_RTP3" runat="server" Text="RTP3"></asp:Label>
                                            </a>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <asp:HyperLink ID="m1_right_L_U_RHL03" runat="server" Text="RTP03"></asp:HyperLink>
                                        </ContentTemplate>
                                    </asp:TabPanel>
                                </asp:TabContainer>
                            </td>
                    </tr>
                    </table>
                </div>
                <div>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td height="8"></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td height="90" width="90">
                            <asp:HyperLink ID="m1_right_L_D_L1" runat="server" Font-Size="10pt">L1</asp:HyperLink>
                        </td>
                        <td valign="top" width="5">&nbsp;</td>
                        <td valign="top" width="170">
                            <span style="font-family: 微軟正黑體; font-size: 18px; ">
                            <asp:HyperLink ID="m1_right_L_D_L2" runat="server" ForeColor="Fuchsia">L2</asp:HyperLink></span><br />
                            <span style="font-family: 微軟正黑體; font-size: 18px; ">
                            <asp:HyperLink ID="m1_right_L_D_L3" runat="server" ForeColor="Blue">L3</asp:HyperLink></span><br />
                            <asp:HyperLink ID="m1_right_L_D_L4" runat="server" Font-Size="10pt">L4</asp:HyperLink><br />
                            <asp:HyperLink ID="m1_right_L_D_L5" runat="server" Font-Size="10pt">L5</asp:HyperLink>
                        </td>
                        <td height="90" width="90">
                            <asp:HyperLink ID="m1_right_L_D_R1" runat="server" Font-Size="10pt">R1</asp:HyperLink>
                        </td>
                        <td valign="top" width="5">&nbsp;</td>
                        <td valign="top">
                            <span style="font-family: 微軟正黑體; font-size: 18px; ">
                            <asp:HyperLink ID="m1_right_L_D_R2" runat="server" ForeColor="Fuchsia">R2</asp:HyperLink></span><br />
                            <span style="font-family: 微軟正黑體; font-size: 18px; ">
                            <asp:HyperLink ID="m1_right_L_D_R3" runat="server" ForeColor="Blue">R3</asp:HyperLink></span><br />
                            <asp:HyperLink ID="m1_right_L_D_R4" runat="server" Font-Size="10pt">R4</asp:HyperLink><br />
                            <asp:HyperLink ID="m1_right_L_D_R5" runat="server" Font-Size="10pt">R5</asp:HyperLink>
                        </td>
                    </tr>
                </table>
                </div>
            </td>
            <td width="200" valign="top">
                            <table>
                                <tr>
                                    <td>
                                        <img src="image/lelecoco/hotkey.png" alt=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:HyperLink ID="m1_right_R_U1" runat="server" ForeColor="#64A0B1">[m1_right_R_U1]</asp:HyperLink>
                                        <asp:HyperLink ID="m1_right_R_U2" runat="server" ForeColor="#986C9F">[m1_right_R_U2]</asp:HyperLink>
                                        <asp:HyperLink ID="m1_right_R_U3" runat="server" ForeColor="#7E3771">[m1_right_R_U3]</asp:HyperLink>
                                        <asp:HyperLink ID="m1_right_R_U4" runat="server" ForeColor="#9EBE37">[m1_right_R_U4]</asp:HyperLink>
                                        <asp:HyperLink ID="m1_right_R_U5" runat="server" ForeColor="#ED1E79">[m1_right_R_U5]</asp:HyperLink>
                                        <asp:HyperLink ID="m1_right_R_U6" runat="server" ForeColor="#FBB03B">[m1_right_R_U6]</asp:HyperLink>
                                        <asp:HyperLink ID="m1_right_R_U7" runat="server" ForeColor="#D6B44A">[m1_right_R_U7]</asp:HyperLink>
                                        <asp:HyperLink ID="m1_right_R_U8" runat="server" ForeColor="#666666">[m1_right_R_U8]</asp:HyperLink>
                                        <asp:HyperLink ID="m1_right_R_U9" runat="server" ForeColor="#C4688B">[m1_right_R_U9]</asp:HyperLink><asp:HyperLink ID="m1_right_R_U10" runat="server"></asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td colspan="3">
                                        <img src="image/lelecoco/hotseal.png" alt=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:HyperLink ID="m1_right_R_D1" runat="server">D1</asp:HyperLink>
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="m1_right_R_D2" runat="server">D2</asp:HyperLink>
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="m1_right_R_D3" runat="server">D3</asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>
                                        <asp:HyperLink ID="m1_right_R_D4" runat="server">D4</asp:HyperLink>
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="m1_right_R_D5" runat="server">D5</asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
            </td>
        </tr>
        <tr>
            <td height="8"></td>
            <td></td>
            <td></td>
        </tr>
        </table>
            <div class="advertising1">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="102">
                            <asp:HyperLink ID="advertising1_1" runat="server">Ad1</asp:HyperLink>
                        </td>
                        <td width="102">
                            <asp:HyperLink ID="advertising1_2" runat="server">Ad2</asp:HyperLink>
                        </td>
                        <td>
                    <asp:HyperLink ID="advertising1_3" runat="server">Ad3</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="m2">
                <div class="m2_left">
                    <div class="m2_left_U">
                        <div id="TopAD1">
                              <div class="TopAdright1"><a href="#"><img src="" border="0"/></a></div>
                              <div class="link1"></div>     
                        </div>
                        <div class="list1" style="display:none;">
                            <asp:Literal ID="m2_left_U" runat="server"></asp:Literal> 
                        </div>
                    </div>
                    <div class="m2_left_D">
                        <div id="TopAD2">
                              <div class="TopAdright2"><a href="#"><img src="" border="0"/></a></div>
                              <div class="link2"></div>     
                        </div>

                        <div class="list2" style="display:none;">
                            <asp:Literal ID="m2_left_D" runat="server"></asp:Literal> 
                        </div>
                    </div>
                </div>
                <div class="m2_right">
                    <div class="m2_right_L">
                        <div id="TopAD3">
                              <div class="TopAdright3"><a href="#"><img src="" border="0"/></a></div>
                              <div class="link3"></div>     
                        </div>

                        <div class="list3" style="display:none;">
                            <asp:Literal ID="m2_right_L" runat="server"></asp:Literal>  
                        </div>
                    </div>
                    <div class="m2_right_R">
                        <div class="m2_right_R_U">
                            <div id="TopAD4">
                                  <div class="TopAdright4"><a href="#"><img src="" border="0"/></a></div>
                                  <div class="link4"></div>     
                            </div>

                            <div class="list4" style="display:none;">
                                <asp:Literal ID="m2_right_R_U" runat="server"></asp:Literal>  
                            </div>
                        </div>
                        <div class="m2_right_R_D">
                            <div id="TopAD5">
                                  <div class="TopAdright5"><a href="#"><img src="" border="0"/></a></div>
                                  <div class="link5"></div>     
                            </div>

                            <div class="list5" style="display:none;">
                                <asp:Literal ID="m2_right_R_D" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="curatorRecommended">
                <div class="CR_title">
                    <asp:Image ID="Image2" runat="server" ImageUrl="image/lelecoco/curatorRecommendedBK.jpg" />
                </div>
                <div class="CR_main">
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td width="20%">
                            <asp:HyperLink ID="CR_main_left_L" runat="server"></asp:HyperLink>
                            </td>
                            <td width="20%">
                            <asp:HyperLink ID="CR_main_left_R" runat="server"></asp:HyperLink>
                            </td>
                            <td width="20%">
                                <asp:HyperLink ID="CR_main_right_L_L" runat="server"></asp:HyperLink>
                            </td>
                            <td width="20%">
                                <asp:HyperLink ID="CR_main_right_L_R" runat="server"></asp:HyperLink>
                            </td>
                            <td width="20%">
                            <asp:HyperLink ID="CR_main_right_R" runat="server"></asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="hotIssues">
                <div class="HI_title">
                    <asp:Image ID="Image3" runat="server" ImageUrl="image/lelecoco/hotIssuesBK.jpg" />
                </div>
                <div class="HI_main">
                    <asp:TabContainer ID="TabContainer3" runat="server" Width="970" 
                        CssClass="menu3" Height="240px">
                        <asp:TabPanel runat="server" ID="HI_Tab1">
                            <HeaderTemplate>
                            <a onmousemove="changeTab3(0)">
                                <asp:Label ID="HI_Tab1IMG" runat="server"></asp:Label>
                            </a>
                            </HeaderTemplate>
                            <ContentTemplate>
                            <div class="HI_Tabmain">
                                 <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="35"></td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB1_1" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB1_2" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB1_3" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB1_4" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB1_5" runat="server"></asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel runat="server" ID="HI_Tab2">
                            <HeaderTemplate>
                            <a onmousemove="changeTab3(1)">
                                <asp:Label ID="HI_Tab2IMG" runat="server" Text="Label"></asp:Label>
                            </a>
                            </HeaderTemplate>
                            <ContentTemplate>
                            <div class="HI_Tabmain">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="35"></td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB2_1" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB2_2" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB2_3" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB2_4" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB2_5" runat="server"></asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel runat="server" ID="HI_Tab3">
                            <HeaderTemplate>
                            <a onmousemove="changeTab3(2)">
                                <asp:Label ID="HI_Tab3IMG" runat="server" Text="Label"></asp:Label>
                            </a>
                            </HeaderTemplate>
                            <ContentTemplate>
                            <div class="HI_Tabmain">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="35"></td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB3_1" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB3_2" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB3_3" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB3_4" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB3_5" runat="server"></asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel runat="server" ID="HI_Tab4">
                            <HeaderTemplate>
                            <a onmousemove="changeTab3(3)">
                                <asp:Label ID="HI_Tab4IMG" runat="server" Text="Label"></asp:Label>
                            </a>
                            </HeaderTemplate>
                            <ContentTemplate>
                            <div class="HI_Tabmain">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="35"></td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB4_1" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB4_2" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB4_3" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB4_4" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB4_5" runat="server"></asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>                                
                            </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel runat="server" ID="HI_Tab5">
                            <HeaderTemplate>
                            <a onmousemove="changeTab3(4)">
                                <asp:Label ID="HI_Tab5IMG" runat="server" Text="Label"></asp:Label>
                            </a>
                            </HeaderTemplate>
                            <ContentTemplate>
                            <div class="HI_Tabmain">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="35"></td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB5_1" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB5_2" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB5_3" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB5_4" runat="server"></asp:HyperLink>
                                        </td>
                                        <td width="200">
                                            <asp:HyperLink ID="HI_TAB5_5" runat="server"></asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            </ContentTemplate>
                        </asp:TabPanel>
                    </asp:TabContainer>
                </div>
            </div>
            <div class="VIP">
                <div class="VIP_title">
                    <asp:Image ID="Image1" runat="server" ImageUrl="image/lelecoco/VIPBK.jpg" />
                </div>
                    <div class="VIP_TI1">
                        <asp:HyperLink ID="VIP_TI1" runat="server"></asp:HyperLink>
                    </div>
                    <div class="VIP_TT1">
                        <asp:HyperLink ID="VIP_TT1" runat="server"></asp:HyperLink>
                    </div>
                    <div class="VIP_TI2">
                        <asp:HyperLink ID="VIP_TI2" runat="server"></asp:HyperLink>
                    </div>
                    <div class="VIP_TT2">
                        <asp:HyperLink ID="VIP_TT2" runat="server"></asp:HyperLink>
                    </div>
                    <div class="VIP_TI3">
                        <asp:HyperLink ID="VIP_TI3" runat="server"></asp:HyperLink>
                    </div>
                    <div class="VIP_TT3">
                        <asp:HyperLink ID="VIP_TT3" runat="server"></asp:HyperLink>
                    </div>
                    <div class="VIP_TI4">
                        <asp:HyperLink ID="VIP_TI4" runat="server"></asp:HyperLink>
                    </div>
                    <div class="VIP_TT4">
                        <asp:HyperLink ID="VIP_TT4" runat="server"></asp:HyperLink>
                    </div>
                    <div class="VIP_TI5">
                        <asp:HyperLink ID="VIP_TI5" runat="server"></asp:HyperLink>
                    </div>
                    <div class="VIP_TT5">
                        <asp:HyperLink ID="VIP_TT5" runat="server"></asp:HyperLink>
                    </div>
                    <div class="VIP_TI6">
                        <asp:HyperLink ID="VIP_TI6" runat="server"></asp:HyperLink>
                    </div>
                    <div class="VIP_TT6">
                        <asp:HyperLink ID="VIP_TT6" runat="server"></asp:HyperLink>
                    </div>
                    <div class="VIP_TI7">
                        <asp:HyperLink ID="VIP_TI7" runat="server"></asp:HyperLink>
                    </div>
                    <div class="VIP_TT7">
                        <asp:HyperLink ID="VIP_TT7" runat="server"></asp:HyperLink>
                    </div>
                    <div class="VIP_TI8">
                        <asp:HyperLink ID="VIP_TI8" runat="server"></asp:HyperLink>
                    </div>
                    <div class="VIP_TT8">
                        <asp:HyperLink ID="VIP_TT8" runat="server"></asp:HyperLink>
                    </div>                    
                <div class="VIP_main">
                    <div class="VIP_main_m1">
                        <div class="VIP_main_m1_L">
                            <asp:TabContainer ID="TabContainer4" runat="server" Width="210px" CssClass="menu4">
                                <asp:TabPanel runat="server" ID="VIP_main_m1_L1">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab4(0)">
                                        <asp:Label ID="VIP_main_m1_L1H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2" >
                                                    <div class="tab1_L">
                                                        <asp:HyperLink ID="VIP_main_m1_L1C" runat="server"></asp:HyperLink>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="tab1_R">
                                                        <asp:HyperLink ID="VIP_main_m1_L1C1" runat="server"></asp:HyperLink>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab1_R">
                                                        <asp:HyperLink ID="VIP_main_m1_L1C2" runat="server"></asp:HyperLink>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="VIP_main_m1_L2">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab4(1)">
                                        <asp:Label ID="VIP_main_m1_L2H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab1_L"><asp:HyperLink ID="VIP_main_m1_L2C" runat="server"></asp:HyperLink></div>
                                                </td>
                                                <td>
                                                    <div class="tab1_R"><asp:HyperLink ID="VIP_main_m1_L2C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab1_R"><asp:HyperLink ID="VIP_main_m1_L2C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="VIP_main_m1_L3">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab4(2)">
                                        <asp:Label ID="VIP_main_m1_L3H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab1_L"><asp:HyperLink ID="VIP_main_m1_L3C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab1_R"><asp:HyperLink ID="VIP_main_m1_L3C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab1_R"><asp:HyperLink ID="VIP_main_m1_L3C2" runat="server"></asp:HyperLink></div>                                                   
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel4">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab4(3)">
                                        <asp:Label ID="VIP_main_m1_L4H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab1_L"><asp:HyperLink ID="VIP_main_m1_L4C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab1_R"><asp:HyperLink ID="VIP_main_m1_L4C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab1_R"><asp:HyperLink ID="VIP_main_m1_L4C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                        </div>
                        <div class="VIP_main_m1_R">
                            <div class="VIP_main_m1_R_L">
                            <asp:TabContainer ID="TabContainer5" runat="server" Width="210px" CssClass="menu5">
                                <asp:TabPanel runat="server" ID="TabPanel1">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab5(0)">
                                        <asp:Label ID="VIP_main_m1_L5H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab2_L"><asp:HyperLink ID="VIP_main_m1_L5C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab2_R"><asp:HyperLink ID="VIP_main_m1_L5C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab2_R"><asp:HyperLink ID="VIP_main_m1_L5C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel2">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab5(1)">
                                        <asp:Label ID="VIP_main_m1_L6H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab2_L"><asp:HyperLink ID="VIP_main_m1_L6C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab2_R"><asp:HyperLink ID="VIP_main_m1_L6C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab2_R"><asp:HyperLink ID="VIP_main_m1_L6C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel3">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab5(2)">
                                        <asp:Label ID="VIP_main_m1_L7H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab2_L"><asp:HyperLink ID="VIP_main_m1_L7C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab2_R"><asp:HyperLink ID="VIP_main_m1_L7C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab2_R"><asp:HyperLink ID="VIP_main_m1_L7C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel5">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab5(3)">
                                        <asp:Label ID="VIP_main_m1_L8H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab2_L"><asp:HyperLink ID="VIP_main_m1_L8C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab2_R"><asp:HyperLink ID="VIP_main_m1_L8C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab2_R"><asp:HyperLink ID="VIP_main_m1_L8C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                            </div>
                            <div class="VIP_main_m1_R_R">
                            <asp:TabContainer ID="TabContainer6" runat="server" Width="210px" CssClass="menu6">
                                <asp:TabPanel runat="server" ID="TabPanel6">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab6(0)">
                                        <asp:Label ID="VIP_main_m1_L9H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab3_L"><asp:HyperLink ID="VIP_main_m1_L9C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab3_R"><asp:HyperLink ID="VIP_main_m1_L9C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab3_R"><asp:HyperLink ID="VIP_main_m1_L9C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel7">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab6(1)">
                                        <asp:Label ID="VIP_main_m1_L10H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab3_L"><asp:HyperLink ID="VIP_main_m1_L10C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab3_R"><asp:HyperLink ID="VIP_main_m1_L10C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab3_R"><asp:HyperLink ID="VIP_main_m1_L10C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel8">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab6(2)">
                                        <asp:Label ID="VIP_main_m1_L11H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab3_L"><asp:HyperLink ID="VIP_main_m1_L11C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab3_R"><asp:HyperLink ID="VIP_main_m1_L11C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab3_R"><asp:HyperLink ID="VIP_main_m1_L11C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel9">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab6(3)">
                                        <asp:Label ID="VIP_main_m1_L12H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab3_L"><asp:HyperLink ID="VIP_main_m1_L12C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab3_R"><asp:HyperLink ID="VIP_main_m1_L12C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab3_R"><asp:HyperLink ID="VIP_main_m1_L12C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                            </div>
                        </div>
                    </div>
                    <div class="VIP_main_m2">
                        <div class="VIP_main_m2_L">
                            <asp:TabContainer ID="TabContainer7" runat="server" Width="210px" CssClass="menu7">
                                <asp:TabPanel runat="server" ID="TabPanel10">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab7(0)">
                                        <asp:Label ID="VIP_main_m1_L13H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab4_L"><asp:HyperLink ID="VIP_main_m1_L13C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab4_R"><asp:HyperLink ID="VIP_main_m1_L13C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab4_R"><asp:HyperLink ID="VIP_main_m1_L13C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel11">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab7(1)">
                                        <asp:Label ID="VIP_main_m1_L14H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab4_L"><asp:HyperLink ID="VIP_main_m1_L14C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab4_R"><asp:HyperLink ID="VIP_main_m1_L14C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab4_R"><asp:HyperLink ID="VIP_main_m1_L14C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel12">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab7(2)">
                                        <asp:Label ID="VIP_main_m1_L15H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab4_L"><asp:HyperLink ID="VIP_main_m1_L15C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab4_R"><asp:HyperLink ID="VIP_main_m1_L15C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab4_R"><asp:HyperLink ID="VIP_main_m1_L15C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel13">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab7(3)">
                                        <asp:Label ID="VIP_main_m1_L16H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab4_L"><asp:HyperLink ID="VIP_main_m1_L16C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab4_R"><asp:HyperLink ID="VIP_main_m1_L16C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab4_R"><asp:HyperLink ID="VIP_main_m1_L16C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                        </div>
                        <div class="VIP_main_m2_R">
                            <div class="VIP_main_m2_R_L">
                            <asp:TabContainer ID="TabContainer8" runat="server" Width="210px" CssClass="menu8">
                                <asp:TabPanel runat="server" ID="TabPanel14">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab8(0)">
                                        <asp:Label ID="VIP_main_m1_L17H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab5_L"><asp:HyperLink ID="VIP_main_m1_L17C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab5_R"><asp:HyperLink ID="VIP_main_m1_L17C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab5_R"><asp:HyperLink ID="VIP_main_m1_L17C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel15">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab8(1)">
                                        <asp:Label ID="VIP_main_m1_L18H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab5_L"><asp:HyperLink ID="VIP_main_m1_L18C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab5_R"><asp:HyperLink ID="VIP_main_m1_L18C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab5_R"><asp:HyperLink ID="VIP_main_m1_L18C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel16">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab8(2)">
                                        <asp:Label ID="VIP_main_m1_L19H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab5_L"><asp:HyperLink ID="VIP_main_m1_L19C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab5_R"><asp:HyperLink ID="VIP_main_m1_L19C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab5_R"><asp:HyperLink ID="VIP_main_m1_L19C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel17">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab8(3)">
                                        <asp:Label ID="VIP_main_m1_L20H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab5_L"><asp:HyperLink ID="VIP_main_m1_L20C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab5_R"><asp:HyperLink ID="VIP_main_m1_L20C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab5_R"><asp:HyperLink ID="VIP_main_m1_L20C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                            </div>
                            <div class="VIP_main_m2_R_R">
                            <asp:TabContainer ID="TabContainer9" runat="server" Width="210px" CssClass="menu9">
                                <asp:TabPanel runat="server" ID="TabPanel18">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab9(0)">
                                        <asp:Label ID="VIP_main_m1_L21H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab6_L"><asp:HyperLink ID="VIP_main_m1_L21C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab6_R"><asp:HyperLink ID="VIP_main_m1_L21C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab6_R"><asp:HyperLink ID="VIP_main_m1_L21C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel19">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab9(1)">
                                        <asp:Label ID="VIP_main_m1_L22H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab6_L"><asp:HyperLink ID="VIP_main_m1_L22C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab6_R"><asp:HyperLink ID="VIP_main_m1_L22C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab6_R"><asp:HyperLink ID="VIP_main_m1_L22C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel20">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab9(2)">
                                        <asp:Label ID="VIP_main_m1_L23H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab6_L"><asp:HyperLink ID="VIP_main_m1_L23C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab6_R"><asp:HyperLink ID="VIP_main_m1_L23C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab6_R"><asp:HyperLink ID="VIP_main_m1_L23C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel21">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab9(3)">
                                        <asp:Label ID="VIP_main_m1_L24H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab6_L"><asp:HyperLink ID="VIP_main_m1_L24C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab6_R"><asp:HyperLink ID="VIP_main_m1_L24C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab6_R"><asp:HyperLink ID="VIP_main_m1_L24C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                            </div>
                        </div>
                    </div>
                    <div class="VIP_main_m3">
                        <div class="VIP_main_m3_L">
                            <asp:TabContainer ID="TabContainer10" runat="server" Width="210px" CssClass="menu10">
                                <asp:TabPanel runat="server" ID="TabPanel22">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab10(0)">
                                        <asp:Label ID="VIP_main_m1_L25H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab7_L"><asp:HyperLink ID="VIP_main_m1_L25C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab7_R"><asp:HyperLink ID="VIP_main_m1_L25C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab7_R"><asp:HyperLink ID="VIP_main_m1_L25C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel23">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab10(1)">
                                        <asp:Label ID="VIP_main_m1_L26H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab7_L"><asp:HyperLink ID="VIP_main_m1_L26C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab7_R"><asp:HyperLink ID="VIP_main_m1_L26C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab7_R"><asp:HyperLink ID="VIP_main_m1_L26C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel24">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab10(2)">
                                        <asp:Label ID="VIP_main_m1_L27H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab7_L"><asp:HyperLink ID="VIP_main_m1_L27C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab7_R"><asp:HyperLink ID="VIP_main_m1_L27C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab7_R"><asp:HyperLink ID="VIP_main_m1_L27C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel25">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab10(3)">
                                        <asp:Label ID="VIP_main_m1_L28H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab7_L"><asp:HyperLink ID="VIP_main_m1_L28C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab7_R"><asp:HyperLink ID="VIP_main_m1_L28C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab7_R"><asp:HyperLink ID="VIP_main_m1_L28C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                        </div>
                        <div class="VIP_main_m3_R">
                            <div class="VIP_main_m3_R_L">
                            <asp:TabContainer ID="TabContainer11" runat="server" Width="210px" CssClass="menu11">
                                <asp:TabPanel runat="server" ID="TabPanel26">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab11(0)">
                                        <asp:Label ID="VIP_main_m1_L29H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab8_L"><asp:HyperLink ID="VIP_main_m1_L29C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab8_R"><asp:HyperLink ID="VIP_main_m1_L29C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab8_R"><asp:HyperLink ID="VIP_main_m1_L29C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel27">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab11(1)">
                                        <asp:Label ID="VIP_main_m1_L30H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab8_L"><asp:HyperLink ID="VIP_main_m1_L30C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab8_R"><asp:HyperLink ID="VIP_main_m1_L30C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab8_R"><asp:HyperLink ID="VIP_main_m1_L30C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel28">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab11(2)">
                                        <asp:Label ID="VIP_main_m1_L31H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab8_L"><asp:HyperLink ID="VIP_main_m1_L31C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab8_R"><asp:HyperLink ID="VIP_main_m1_L31C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab8_R"><asp:HyperLink ID="VIP_main_m1_L31C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel29">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab11(3)">
                                        <asp:Label ID="VIP_main_m1_L32H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab8_L"><asp:HyperLink ID="VIP_main_m1_L32C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab8_R"><asp:HyperLink ID="VIP_main_m1_L32C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab8_R"><asp:HyperLink ID="VIP_main_m1_L32C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                            </div>
                            <div class="VIP_main_m3_R_R">
                            <asp:TabContainer ID="TabContainer12" runat="server" Width="210px" CssClass="menu12">
                                <asp:TabPanel runat="server" ID="TabPanel30">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab12(0)">
                                        <asp:Label ID="VIP_main_m1_L33H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab9_L"><asp:HyperLink ID="VIP_main_m1_L33C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab9_R"><asp:HyperLink ID="VIP_main_m1_L33C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab9_R"><asp:HyperLink ID="VIP_main_m1_L33C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel31">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab12(1)">
                                        <asp:Label ID="VIP_main_m1_L34H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab9_L"><asp:HyperLink ID="VIP_main_m1_L34C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab9_R"><asp:HyperLink ID="VIP_main_m1_L34C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab9_R"><asp:HyperLink ID="VIP_main_m1_L34C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel32">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab12(2)">
                                        <asp:Label ID="VIP_main_m1_L35H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab9_L"><asp:HyperLink ID="VIP_main_m1_L35C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab9_R"><asp:HyperLink ID="VIP_main_m1_L35C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab9_R"><asp:HyperLink ID="VIP_main_m1_L35C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel33">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab12(3)">
                                        <asp:Label ID="VIP_main_m1_L36H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab9_L"><asp:HyperLink ID="VIP_main_m1_L36C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab9_R"><asp:HyperLink ID="VIP_main_m1_L36C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab9_R"><asp:HyperLink ID="VIP_main_m1_L36C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                            </div>
                        </div>
                    </div>
                    <div class="VIP_main_m4">
                        <div class="VIP_main_m4_L">
                            <asp:TabContainer ID="TabContainer13" runat="server" Width="210px" CssClass="menu13">
                                <asp:TabPanel runat="server" ID="TabPanel34">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab13(0)">
                                        <asp:Label ID="VIP_main_m1_L37H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab10_L"><asp:HyperLink ID="VIP_main_m1_L37C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab10_R"><asp:HyperLink ID="VIP_main_m1_L37C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab10_R"><asp:HyperLink ID="VIP_main_m1_L37C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel35">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab13(1)">
                                        <asp:Label ID="VIP_main_m1_L38H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab10_L"><asp:HyperLink ID="VIP_main_m1_L38C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab10_R"><asp:HyperLink ID="VIP_main_m1_L38C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab10_R"><asp:HyperLink ID="VIP_main_m1_L38C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel36">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab13(2)">
                                        <asp:Label ID="VIP_main_m1_L39H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab10_L"><asp:HyperLink ID="VIP_main_m1_L39C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab10_R"><asp:HyperLink ID="VIP_main_m1_L39C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab10_R"><asp:HyperLink ID="VIP_main_m1_L39C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel37">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab13(3)">
                                        <asp:Label ID="VIP_main_m1_L40H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab10_L"><asp:HyperLink ID="VIP_main_m1_L40C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab10_R"><asp:HyperLink ID="VIP_main_m1_L40C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab10_R"><asp:HyperLink ID="VIP_main_m1_L40C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                        </div>
                        <div class="VIP_main_m4_R">
                            <div class="VIP_main_m4_R_L">
                            <asp:TabContainer ID="TabContainer14" runat="server" Width="210px" CssClass="menu14">
                                <asp:TabPanel runat="server" ID="TabPanel38">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab14(0)">
                                        <asp:Label ID="VIP_main_m1_L41H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab11_L"><asp:HyperLink ID="VIP_main_m1_L41C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab11_R"><asp:HyperLink ID="VIP_main_m1_L41C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab11_R"><asp:HyperLink ID="VIP_main_m1_L41C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel39">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab14(1)">
                                        <asp:Label ID="VIP_main_m1_L42H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab11_L"><asp:HyperLink ID="VIP_main_m1_L42C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab11_R"><asp:HyperLink ID="VIP_main_m1_L42C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab11_R"><asp:HyperLink ID="VIP_main_m1_L42C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel40">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab14(2)">
                                        <asp:Label ID="VIP_main_m1_L43H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab11_L"><asp:HyperLink ID="VIP_main_m1_L43C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab11_R"><asp:HyperLink ID="VIP_main_m1_L43C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab11_R"><asp:HyperLink ID="VIP_main_m1_L43C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel41">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab14(3)">
                                        <asp:Label ID="VIP_main_m1_L44H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab11_L"><asp:HyperLink ID="VIP_main_m1_L44C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab11_R"><asp:HyperLink ID="VIP_main_m1_L44C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab11_R"><asp:HyperLink ID="VIP_main_m1_L44C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                            </div>
                            <div class="VIP_main_m4_R_R">
                            <asp:TabContainer ID="TabContainer15" runat="server" Width="210px" CssClass="menu15">
                                <asp:TabPanel runat="server" ID="TabPanel42">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab15(0)">
                                        <asp:Label ID="VIP_main_m1_L45H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab12_L"><asp:HyperLink ID="VIP_main_m1_L45C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab12_R"><asp:HyperLink ID="VIP_main_m1_L45C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab12_R"><asp:HyperLink ID="VIP_main_m1_L45C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel43">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab15(1)">
                                        <asp:Label ID="VIP_main_m1_L46H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab12_L"><asp:HyperLink ID="VIP_main_m1_L46C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab12_R"><asp:HyperLink ID="VIP_main_m1_L46C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab12_R"><asp:HyperLink ID="VIP_main_m1_L46C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel44">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab15(2)">
                                        <asp:Label ID="VIP_main_m1_L47H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab12_L"><asp:HyperLink ID="VIP_main_m1_L47C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab12_R"><asp:HyperLink ID="VIP_main_m1_L47C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab12_R"><asp:HyperLink ID="VIP_main_m1_L47C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel runat="server" ID="TabPanel45">
                                    <HeaderTemplate>
                                    <a onmousemove="changeTab15(3)">
                                        <asp:Label ID="VIP_main_m1_L48H" runat="server"></asp:Label>
                                    </a>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table>
                                            <tr>
                                                <td rowspan="2">
                                                    <div class="tab12_L"><asp:HyperLink ID="VIP_main_m1_L48C" runat="server"></asp:HyperLink></div>                                                    
                                                </td>
                                                <td>
                                                    <div class="tab12_R"><asp:HyperLink ID="VIP_main_m1_L48C1" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="tab12_R"><asp:HyperLink ID="VIP_main_m1_L48C2" runat="server"></asp:HyperLink></div>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="advertising2">
                <asp:HyperLink ID="advertising2" runat="server"></asp:HyperLink>
            </div>
            <div class="top_Board">
                <span class="TBIMG"><asp:Image ID="Image4" runat="server" ImageUrl="image/lelecoco/TB.png" /></span>
                <div class="TB_photo">
                    <div class="TB_2pic">
                        <div class="TB_2pic_left">
                            <div class="TB1"><asp:HyperLink ID="TB1" runat="server"></asp:HyperLink></div>
                        </div>
                        <div class="TB_2pic_right">
                             <div class="TB1"><asp:HyperLink ID="TB2" runat="server"></asp:HyperLink></div>
                        </div>
                    </div>
                    <div class="TB_5pic">
                        <div class="TB_5pic_2">
                            <div class="TB_5pic_2_left">
                                 <div class="TB1"><asp:HyperLink ID="TB3" runat="server"></asp:HyperLink></div>
                            </div>
                            <div class="TB_5pic_2_right">
                                 <div class="TB1"><asp:HyperLink ID="TB4" runat="server"></asp:HyperLink></div>
                            </div>
                        </div>
                        <div class="TB_5pic_3">
                            <div class="TB_5pic_3_2">
                                <div class="TB_5pic_3_2_left">
                                     <div class="TB1"><asp:HyperLink ID="TB5" runat="server"></asp:HyperLink></div>
                                </div>
                                <div class="TB_5pic_3_2_right">
                                     <div class="TB1"><asp:HyperLink ID="TB6" runat="server"></asp:HyperLink></div>
                                </div>
                            </div>
                            <div class="TB_5pic_3_1">
                                 <div class="TB1"><asp:HyperLink ID="TB7" runat="server"></asp:HyperLink></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="TB_text">
                    <div class="TB_2text">
                        <div class="TB_2text_left">
                            <asp:HyperLink ID="TBT1" runat="server"></asp:HyperLink>
                        </div>
                        <div class="TB_2text_right">
                            <asp:HyperLink ID="TBT2" runat="server"></asp:HyperLink>
                        </div>
                    </div>
                    <div class="TB_5text">
                        <div class="TB_5text_2">
                            <div class="TB_5text_2_left">
                                <asp:HyperLink ID="TBT3" runat="server"></asp:HyperLink>
                            </div>
                            <div class="TB_5text_2_right">
                                <asp:HyperLink ID="TBT4" runat="server"></asp:HyperLink>
                            </div>
                        </div>
                        <div class="TB_5text_3">
                            <div class="TB_5text_3_2">
                                <div class="TB_5text_3_2_left">
                                    <asp:HyperLink ID="TBT5" runat="server"></asp:HyperLink>
                                </div>
                                <div class="TB_5text_3_2_right">
                                    <asp:HyperLink ID="TBT6" runat="server"></asp:HyperLink>
                                </div>
                            </div>
                            <div class="TB_5text_3_1">
                                <asp:HyperLink ID="TBT7" runat="server"></asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="m3">
                <div class="m3_Popularbrands">
                    <div style="margin-bottom:5px;">
                        <asp:HyperLink ID="m3_Popularbrands" runat="server"></asp:HyperLink>
                    </div>
                    <div style="margin-bottom:5px;">
                        <div id="TopAD10">
                              <div class="TopAdright10"><a href="#"><img src="" border="0"/></a></div>
                              <div class="link10"></div>     
                        </div>

                        <div class="list10" style="display:none;">
                            <asp:Literal ID="m3_Popularbrands1" runat="server"></asp:Literal> 
                        </div>
                    </div>
                    <div style="margin-bottom:5px;">
                        <div id="TopAD11">
                              <div class="TopAdright11"><a href="#"><img src="" border="0"/></a></div>
                              <div class="link11"></div>     
                        </div>

                        <div class="list11" style="display:none;">
                            <asp:Literal ID="m3_Popularbrands2" runat="server"></asp:Literal> 
                        </div>
                    </div>
                    <div style="margin-bottom:5px;">
                        <div id="TopAD12">
                              <div class="TopAdright12"><a href="#"><img src="" border="0"/></a></div>
                              <div class="link12"></div>     
                        </div>

                        <div class="list12" style="display:none;">
                            <asp:Literal ID="m3_Popularbrands3" runat="server"></asp:Literal> 
                        </div>
                    </div>
                    <div style="margin-bottom:5px;">
                        <div id="TopAD13">
                              <div class="TopAdright13"><a href="#"><img src="" border="0"/></a></div>
                              <div class="link13"></div>     
                        </div>

                        <div class="list13" style="display:none;">
                            <asp:Literal ID="m3_Popularbrands4" runat="server"></asp:Literal> 
                        </div>
                    </div>
                </div>
                <div class="m3_right">
                    <div class="m3_right_L">
                        <div class="m3_right_L_Webmaster">
                            <table>
                                <tr>
                                    <td colspan="3">
                                        <asp:HyperLink ID="m3_right_L_Webmaster" runat="server"></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:HyperLink ID="m3_right_L_Webmaster1" runat="server"></asp:HyperLink>
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="m3_right_L_Webmaster2" runat="server"></asp:HyperLink>
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="m3_right_L_Webmaster3" runat="server"></asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="m3_right_L_New">
                            <table>
                                <tr>
                                    <td colspan="3">
                                        <asp:HyperLink ID="m3_right_L_New" runat="server"></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:HyperLink ID="m3_right_L_New1" runat="server"></asp:HyperLink>
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="m3_right_L_New2" runat="server"></asp:HyperLink>
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="m3_right_L_New3" runat="server"></asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="m3_right_L_Member">
                            <table>
                                <tr>
                                    <td colspan="2">
                                        <asp:HyperLink ID="m3_right_L_Member" runat="server"></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:HyperLink ID="m3_right_L_Member1" runat="server"></asp:HyperLink>
                                    </td>
                                    <td>
                                        <asp:HyperLink ID="m3_right_L_Member2" runat="server"></asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="m3_right_R">
                        <div class="m3_right_R_Exclusive">
                            <table>
                                <tr>
                                    <td>
                                        <asp:HyperLink ID="m3_right_R_Exclusive" runat="server"></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:HyperLink ID="m3_right_R_Exclusive1" runat="server"></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:HyperLink ID="m3_right_R_Exclusive2" runat="server"></asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="m3_right_R_Bank">
                            <table>
                                <tr>
                                    <td>
                                        <asp:HyperLink ID="m3_right_R_Bank" runat="server"></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:HyperLink ID="m3_right_R_Bank1" runat="server"></asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="advertising3">
                <asp:HyperLink ID="advertising3" runat="server"></asp:HyperLink>
            </div>
            <div class="m4">
                <asp:TabContainer ID="TabContainer16" runat="server" Width="960" CssClass="menu16">
                    <asp:TabPanel runat="server" ID="TabPanel46">
                        <HeaderTemplate>
                        <a onmousemove="changeTab16(0)">
                            <asp:Label ID="m4_1T" runat="server"></asp:Label>
                        </a>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:HyperLink ID="m4_1" runat="server"></asp:HyperLink>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="TabPanel47">
                        <HeaderTemplate>
                        <a onmousemove="changeTab16(1)">
                            <asp:Label ID="m4_2T" runat="server"></asp:Label>
                        </a>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:HyperLink ID="m4_2" runat="server"></asp:HyperLink>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="TabPanel48">
                        <HeaderTemplate>
                        <a onmousemove="changeTab16(2)">
                            <asp:Label ID="m4_3T" runat="server"></asp:Label>
                        </a>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:HyperLink ID="m4_3" runat="server"></asp:HyperLink>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="TabPanel49">
                        <HeaderTemplate>
                        <a onmousemove="changeTab16(3)">
                            <asp:Label ID="m4_4T" runat="server"></asp:Label>
                        </a>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:HyperLink ID="m4_4" runat="server"></asp:HyperLink>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="TabPanel50">
                        <HeaderTemplate>
                        <a onmousemove="changeTab16(4)">
                            <asp:Label ID="m4_5T" runat="server"></asp:Label>
                        </a>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:HyperLink ID="m4_5" runat="server"></asp:HyperLink>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="TabPanel51">
                        <HeaderTemplate>
                        <a onmousemove="changeTab16(5)">
                            <asp:Label ID="m4_6T" runat="server"></asp:Label>
                        </a>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:HyperLink ID="m4_6" runat="server"></asp:HyperLink>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="TabPanel52">
                        <HeaderTemplate>
                        <a onmousemove="changeTab16(6)">
                            <asp:Label ID="m4_7T" runat="server"></asp:Label>
                        </a>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:HyperLink ID="m4_7" runat="server"></asp:HyperLink>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="TabPanel53">
                        <HeaderTemplate>
                        <a onmousemove="changeTab16(7)">
                            <asp:Label ID="m4_8T" runat="server"></asp:Label>
                        </a>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:HyperLink ID="m4_8" runat="server"></asp:HyperLink>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="TabPanel54">
                        <HeaderTemplate>
                        <a onmousemove="changeTab16(8)">
                            <asp:Label ID="m4_9T" runat="server"></asp:Label>
                        </a>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:HyperLink ID="m4_9" runat="server"></asp:HyperLink>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="TabPanel55">
                        <HeaderTemplate>
                        <a onmousemove="changeTab16(9)">
                            <asp:Label ID="m4_10T" runat="server"></asp:Label>
                        </a>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:HyperLink ID="m4_10" runat="server"></asp:HyperLink>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="TabPanel56">
                        <HeaderTemplate>
                        <a onmousemove="changeTab16(10)">
                            <asp:Label ID="m4_11T" runat="server"></asp:Label>
                        </a>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:HyperLink ID="m4_11" runat="server"></asp:HyperLink>
                        </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel runat="server" ID="TabPanel57">
                        <HeaderTemplate>
                        <a onmousemove="changeTab16(11)">
                            <asp:Label ID="m4_12T" runat="server"></asp:Label>
                        </a>
                        </HeaderTemplate>
                        <ContentTemplate>
                            <asp:HyperLink ID="m4_12" runat="server"></asp:HyperLink>
                        </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </div>
            <div class="m5">
                <div class="m5_left">
                    <div class="m5_left_U">
                        <div id="TopAD6">                            
                              <div class="TopAdright6"><a href="#"><img src="" border="0"/></a></div>
                              <div class="link6"></div>     
                        </div>

                        <div class="list6" style="display:none;">
                            <asp:Literal ID="m5_left_U" runat="server"></asp:Literal> 
                        </div>
                    </div>
                    <div class="m5_left_D">
                        <div id="TopAD7">
                              <div class="TopAdright7"><a href="#"><img src="" border="0"/></a></div>
                              <div class="link7"></div>     
                        </div>

                        <div class="list7" style="display:none;">
                            <asp:Literal ID="m5_left_D" runat="server"></asp:Literal> 
                        </div>
                    </div>
                </div>
                <div class="m5_right">
                    <div class="m5_right_U">
                        <div id="TopAD8">
                              <div class="TopAdright8"><a href="#"><img src="" border="0"/></a></div>
                              <div class="link8"></div>     
                        </div>

                        <div class="list8" style="display:none;">
                            <asp:Literal ID="m5_right_U" runat="server"></asp:Literal> 
                        </div>
                    </div>
                    <div class="m5_right_D">
                        <div id="TopAD9">
                              <div class="TopAdright9"><a href="#"><img src="" border="0"/></a></div>
                              <div class="link9"></div>     
                        </div>

                        <div class="list9" style="display:none;">
                            <asp:Literal ID="m5_right_D" runat="server"></asp:Literal> 
                        </div>
                    </div>
                </div>
            </div>
            <div class="advertising4">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="20%">
                            <asp:HyperLink ID="advertising4_1" runat="server"></asp:HyperLink>
                        </td>
                        <td width="20%">
                            <asp:HyperLink ID="advertising4_2" runat="server"></asp:HyperLink>
                        </td>
                        <td width="20%">
                            <asp:HyperLink ID="advertising4_3" runat="server"></asp:HyperLink>
                        </td>
                        <td width="20%">
                            <asp:HyperLink ID="advertising4_4" runat="server"></asp:HyperLink>
                        </td>
                        <td width="20%">
                            <asp:HyperLink ID="advertising4_5" runat="server"></asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="advertising5">
                <asp:HyperLink ID="advertising5" runat="server"></asp:HyperLink>
            </div>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>