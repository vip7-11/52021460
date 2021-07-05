<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="reg, App_Web_reg.aspx.cdcab7d2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
* { margin: 0; padding: 0; outline: 0; }
        .style1
        {
            height: 30px;
        }    
.warning
{
    color: #FF0000;
}

</style>
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
    <script language="javascript" type="text/javascript">
    function changMode(sender, args) {
        sender._switchMode("years", true);
    }
    </script>
    <div style=" margin:0px auto; width:803px;">
    <div style="font-weight: bold; padding-bottom: 10px; border-bottom: dotted 1px #ddd; text-align: justify;">
        <asp:MultiView ID="registerMultiView" runat="server" ActiveViewIndex="0">
            <asp:View ID="regulationView" runat="server">
                <div style="height: 490px; overflow: auto; background-color: White; color: Black; font-size: 10pt; font-weight: normal; padding: 5px;">
                    <p align="center">
                親愛的朋友，當您在瀏覽或使用本網站所提供的服務時，<br />
                即表示您已經明確理解並同意接受以下所有條款：</p>
                    <h3 align="center">
                        <strong>資訊與服務之提供 </strong>
                    </h3>
                    <p>
                【本網站】就各項服務之穩定、安全、無誤、時效及不中斷，不負任何明示或默示之擔保責任。您同意承擔使用本服務之所有風險及應該風險可能造成之任何損害。 
                    </p>
                    <p>
                【本網站】網站上刊登個人廣告、商業廣告及各種商品的促銷資訊，其內容均是由個人、廣告商或商品、服務提供人所為，【本網站】僅是提供刊登的媒介。您根據廣告內容所購買的任何商品、服務，其交易關係均存在於您與商品、服務提供人之間，若有任何瑕疵或擔保責任發生，均與【本網站】無關。 
                    </p>
                    <p>
                【本網站】使用者必須自行評量資訊的價值及投資風險。【本網站】不推薦或建議或偏好任何相關產品或交易策略；本網站不為使用者自己的投資決策及結果負任何責任。 
                    </p>
                    <p>
                【本網站】網站上所表達的觀點、建議和其他所有訊息僅代表這些訊息、內容、資料、和張貼的作者本人看法，非本網站的觀點。本網站決不擔保聊天室、留言版或討論區中的任何參與人是他們自己所聲稱的人。 
                    </p>
                    <p>
                【本網站】明確聲明不對本網站上或任何由本站下載軟體所提供訊息的商業價值、合適性、有效性、時間性、完整性及精確性提供任何擔保，包括但不限於未侵犯第三人權利及利益、銷售適應性、對特殊目的之適合性以及無電腦病毒等擔保。且明示否認該資料內之錯誤或遺漏負任何賠償責任。 
                    </p>
                    <p>
                使用者有權決定是否要進入網站上其他協力廠商的鏈結網站並應自行評量該網站內容的價值；【本網站】對於被鏈結之該等個人、公司或組織之網站上所提供的產品、服務或資訊，不擔保其真實性、完整性、即時性或可信度，而該等個人、公司或組織亦不因此而當然與本網站有任何僱用、委任、代理、合夥或其他類似之關係。     
                    </p>
                    <h3 align="center">
                智慧財產權聲明</h3>
                    <p>
                【本網站】網站上之所有著作及資料以及網站畫面資料之安排，其著作權、專利權、商標、營業秘密及其他智慧財產權，均為本網站或授權本網站使用之合法權利人所有，除事先經【本網站】網站上刊登個人廣告、商業廣告及各種商品的促銷資訊，其內容均係由該個人、廣告商或商品、服務提供人所為，【本網站】僅係提供刊登的媒介。您根據廣告內容所購買的任何商品、服務，其交易關係均存在於您與商品、服務提供人間，若有任何瑕疵或擔保責任發生，均與【本網站】無關或其權利人之合法授權，任何人皆不得擅自以任何形式複製、改作、編輯、散佈、傳輸或基於租用、出售或其他目的加以使用，否則應負所有法律責任，【本網站】得依法請求賠償。</p>
                    <p>
                【本網站】網站之內容及程式為本網站之智慧財產，未經本網站授權，不得擅自複製、進行還原工程（reverse 
                    engineering）、解編(de-compile)或反向組譯(disassemble)任何功能或程式。  
                    </p>
                    <h3 align="center">
                利用守則 
                    </h3>
                    <p>
                        您承諾不以任何方式企圖破壞及干擾【本網站】上各項資料與功能，且沒有入侵或破壞網路上任何系統之企圖或行為。否則依法追究。</p>
                    <p>
                        您瞭解【本網站】為一提供公眾服務之開放場所，您同意對您公佈於【本網站】或透過【本網站】傳輸的一切內容應自負全責，並承諾遵守中華民國相關法規及一切國際網際網路規定與慣例。若使用本網站台灣地區以外之網站，同意遵守各該網站當地之法令及網路慣例。  
                    </p>

                    <div style="text-align: center; padding-bottom: 10px;">
                        <asp:CheckBox ID="ckbArgee" runat="server" AutoPostBack="True" oncheckedchanged="ckbArgee_CheckedChanged" Text="我已仔細閱讀並同意以上條款。" />
                    </div>
                </div>
                
                <div style="text-align: center; margin-top: 10px;">
                    <asp:Button ID="btnAgree" runat="server" Text="同意" onclick="btnAgree_Click" Enabled="false"  Height="20px" Width="60px" STYLE="text-align: center "/>
                    <asp:Button ID="btnNotAgree" runat="server" Text="不同意" onclick="btnNotAgree_Click"  Height="20px" Width="60px" STYLE="text-align: center "/>
                </div>
            </asp:View>
            <asp:View ID="registerView" runat="server">
                <table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
                    <tr>
                        <td height="30">
                            <img alt="" src="image/lelecoco/register.bmp" /></td>
                    </tr>
                    <tr>
                        <td style="padding: 10px; border-style: dashed; border-width: 1px; border-color: #cbcbcb;">
                    <table style="width:100%;" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="text-align: right; " class="style1">帳號：</td>
                            <td>                        
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txtUserId" runat="server" CssClass="textbox" MaxLength="20" 
                                            Width="150px"></asp:TextBox>
                                        <span  class="warning">*</span>
                                        <asp:Button ID="btnCheckAccount" runat="server" Text="檢查" Height="20px" 
                                            onclick="btnCheckAccount_Click" />
                                        <asp:Label ID="lblCheckAccount" runat="server" CssClass="warning"></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; " class="style1">密碼：</td>
                            <td>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" 
                                    TextMode="Password" Width="150px"></asp:TextBox>
                                <span  class="warning">*</span>
                                <asp:Label ID="lblPassword" runat="server" CssClass="warning" 
                                    Text="密碼最短長度為6個字元。"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; " class="style1">確認密碼：</td>
                            <td>
                                <asp:TextBox ID="txtPasswordConfirm" runat="server" CssClass="textbox" 
                                    TextMode="Password" Width="150px"></asp:TextBox>
                                <span  class="warning">*</span>
                                <asp:CompareValidator ID="cvtPasswordComfirm" runat="server" 
                                    ControlToCompare="txtPassword" ControlToValidate="txtPasswordConfirm" 
                                    ErrorMessage="密碼不符！"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; " class="style1">電子郵件：</td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" Width="280px"></asp:TextBox>
                                <span  class="warning">*</span>
                                <asp:Label ID="lblCheckEmail" runat="server" CssClass="warning"></asp:Label>
                                <asp:RegularExpressionValidator ID="revCheckEmail" runat="server" 
                                    ControlToValidate="txtEmail" ErrorMessage="電子郵件格式錯誤" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; " class="style1">身分證：</td>
                            <td>
                                <asp:TextBox ID="txtUserPID" runat="server" CssClass="textbox" Width="150px"></asp:TextBox>
                                <span  class="warning">*</span>
                                <asp:Label ID="lblCheckID" runat="server" CssClass="warning"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; " class="style1">姓名：</td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server" CssClass="textbox" 
                                    Width="150px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; " class="style1">暱稱：</td>
                            <td class="style2">
                                <asp:TextBox ID="txtNickname" runat="server" CssClass="textbox" 
                                    Width="150px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; " class="style1">性別：</td>
                            <td>
                                <asp:RadioButton ID="rdoUserSexMale" runat="server" GroupName="UserSex" 
                                    Text="男" Checked="True" />
                                <asp:RadioButton ID="rdoUserSexFemale" runat="server" GroupName="UserSex" 
                                    Text="女" />
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; " class="style1">生日：</td>
                            <td>
                                <asp:TextBox ID="txtBirthday" runat="server" CssClass="textbox" 
                                    Width="150px"></asp:TextBox>                       
                                <ajaxtoolkit:calendarextender ID="txtBirthday_CalendarExtender" runat="server" 
                                    TargetControlID="txtBirthday" Format="yyyy/MM/dd" DefaultView="Years">
                                </ajaxtoolkit:calendarextender>                       
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; " class="style1">聯絡電話：</td>
                            <td>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox" 
                                    Width="150px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; " class="style1">行動電話：</td>
                            <td>
                                <asp:TextBox ID="txtCellphone" runat="server" CssClass="textbox" 
                                    Width="150px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; " class="style1">傳真：</td>
                            <td>
                                <asp:TextBox ID="txtFax" runat="server" CssClass="textbox" 
                                    Width="150px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; " class="style1">地址：</td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" 
                                    DataSourceID="SqlDataSource5" DataTextField="city_area" 
                                    DataValueField="city_no" CssClass="textbox">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="ddlVillage" runat="server" CssClass="textbox" 
                                            DataSourceID="SqlDataSource6" DataTextField="village_area" 
                                            DataValueField="postal_no">
                                        </asp:DropDownList>
                                        <asp:TextBox ID="txtAddress" runat="server" CssClass="textbox" Width="300px"></asp:TextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center; " class="style1" colspan="2">
                                <asp:Label ID="lblAddUserMsg" runat="server" Font-Bold="True" ForeColor="Red" 
                                    Text="*為必填欄位！"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center;" colspan="2">                    
                                <div style="text-align: center; padding: 5px;">
                                    <asp:Button ID="btnRegister" runat="server" Text="註冊" Height="20px" 
                                        onclick="btnRegister_Click" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" Text="取消" Height="20px" />
                                </div>
                            </td>
                        </tr>
                    </table>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                                SelectCommand="SELECT * FROM [city_village] WHERE ([city_no] = @city_no) ORDER BY [postal_no]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlCity" Name="city_no" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" 
                                SelectCommand="SELECT * FROM [city_area] ORDER BY [city_no]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="successView" runat="server">
                <div style="margin: 100px auto; text-align: center;">
                        註冊成功！<br /> 
                        <br />
                        恭喜您已成為VIP7-11商城購物網會員，快去盡情購物吧！<br />
                     
                        <br />
                        <a href="index.aspx">回首頁</a>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>