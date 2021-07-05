<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="rename, App_Web_rename.aspx.cdcab7d2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server" onactivate="View1_Activate">
            ．我的帳戶<br /> ．個人基本資料<br /> 會員身份：<asp:Label ID="status0" runat="server"></asp:Label>
            <br />
            姓　　名：<asp:Label ID="name0" runat="server"></asp:Label>
            <br />
            身份字號：<asp:Label ID="idcard0" runat="server"></asp:Label>
            <br />
            生　　日：<asp:Label ID="birthday0" runat="server"></asp:Label>
            <br />
            聯絡地址：<asp:Label ID="address0" runat="server"></asp:Label>
            <br />
            聯絡電話：<asp:Label ID="telephone0" runat="server"></asp:Label>
            <br />
            行動電話：<asp:Label ID="mobile0" runat="server"></asp:Label>
            <br />
            電子信箱：<asp:Label ID="email0" runat="server"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="修改個人資料" />
        </asp:View>
        <asp:View ID="View2" runat="server">
            ．
            個人基本資料維護<br />
            會員身份：<asp:Label ID="status" runat="server"></asp:Label>
            <br />
            姓　　名：<asp:Label ID="name" runat="server"></asp:Label>
            <br />
            身份字號：<asp:Label ID="idcard" runat="server"></asp:Label>
            <br />
            生　　日：<asp:Label ID="birthday" runat="server"></asp:Label>
            <br />
            聯絡地址：<asp:TextBox ID="address" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="addressCK" runat="server" 
                ControlToValidate="address" ErrorMessage="請輸入地址" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            聯絡電話：<asp:TextBox ID="telephone" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="telephoneCK" runat="server" 
                ControlToValidate="telephone" ErrorMessage="請輸入聯絡電話" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            行動電話：<asp:TextBox ID="mobile" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="mobileCK" runat="server" 
                ControlToValidate="mobile" ErrorMessage="請輸入行動電話" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            電子信箱：<asp:TextBox ID="email" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="emailCK1" runat="server" 
                ControlToValidate="email" ForeColor="Red" ErrorMessage="請輸入電子信箱"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="emailCK2" runat="server" 
                ControlToValidate="email" ErrorMessage="請輸入正確的信箱格式" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ForeColor="Red"></asp:RegularExpressionValidator>
            <br />
            ．是否重設密碼<asp:RadioButton ID="repassword1" runat="server" AutoPostBack="True" 
                Checked="True" GroupName="repassword" 
                oncheckedchanged="repassword1_CheckedChanged" Text="不重新設定" />
            <asp:RadioButton ID="repassword2" runat="server" AutoPostBack="True" 
                GroupName="repassword" oncheckedchanged="repassword2_CheckedChanged" 
                Text="重新設定" />
            <br />
            <asp:Label ID="passwordL" runat="server" Text="登入密碼：" Visible="False"></asp:Label>
            <asp:TextBox ID="passwordT" runat="server" TextMode="Password" Visible="False"></asp:TextBox>
            <br />
            <asp:Label ID="repasswordL" runat="server" Text="密碼確認：" Visible="False"></asp:Label>
            <asp:TextBox ID="repasswordT" runat="server" TextMode="Password" 
                Visible="False"></asp:TextBox>
            <asp:CompareValidator ID="repasswordCK" runat="server" 
                ControlToCompare="passwordT" ControlToValidate="repasswordT" 
                ErrorMessage="請輸入相同密碼" ForeColor="Red"></asp:CompareValidator>
            <br />
            <asp:Button ID="renameOK" runat="server" onclick="renameOK_Click" Text="確認" />
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="aboutUs" Runat="Server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="buttonS" Runat="Server">
</asp:Content>

