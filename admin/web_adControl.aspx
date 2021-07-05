<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="web_adControl.aspx.cs" Inherits="admin_web_adControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <table style="width:100%;">
    <tr>
        <td colspan="2">
            <h4>首頁圖片設定</h4>
        </td>
    </tr>
    <tr>
        <td style="text-align: right; width: 80px;">
            
            新品上市：</td>    
        <td>
            <asp:CheckBox ID="CheckBox1" runat="server" Text="是否顯示於首頁" />
        </td>
    </tr>
    <tr>
        <td style="text-align: right; width: 80px;">
        連結：
        </td>
        <td>
            <asp:TextBox ID="txt_Link1" runat="server" CssClass="textbox" Width="200px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: right;">
            圖示：
        </td> 
        <td>
            <asp:FileUpload ID="fudPdtImg1" runat="server" CssClass="fileupload" />
                        <asp:Button ID="btnLogoUpload1" runat="server" Text="上傳" Height="20px" 
                            onclick="btnLogoUpload1_Click" />                        
            <asp:Label ID="lblImg1" runat="server" Text="Label" Visible="false"></asp:Label>
        </td>   
    </tr>
    <tr>
        <td colspan="2">
            <asp:Image ID="Image1" runat="server" Height="230px" Width="744px" />
        </td>   
    </tr>
    <tr>
        <td style="text-align: right;">
            館長推薦商品：</td>    
        <td>
            <asp:CheckBox ID="CheckBox2" runat="server" Text="是否顯示於首頁" />
        </td>
    </tr>
    <tr>
        <td style="text-align: right; width: 80px;">
        連結：
        </td>
        <td>
            <asp:TextBox ID="txt_link2" runat="server" CssClass="textbox" Width="200px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: right;">
            圖示：
        </td> 
        <td>
            <asp:FileUpload ID="fudPdtImg2" runat="server" CssClass="fileupload" />
                        <asp:Button ID="btnLogoUpload2" runat="server" Text="上傳" Height="20px" 
                            onclick="btnLogoUpload2_Click" />
            <asp:Label ID="lblImg2" runat="server" Text="Label" Visible="false"></asp:Label>
        </td>   
    </tr>
    <tr>
        <td colspan="2">
            <asp:Image ID="Image2" runat="server" Height="230px" Width="744px" />
        </td>   
    </tr>
    <tr>
        <td style="text-align: right;">
            暢銷商品：</td>    
        <td>
            <asp:CheckBox ID="CheckBox3" runat="server" Text="是否顯示於首頁" />
        </td>
    </tr>
    <tr>
        <td style="text-align: right; width: 80px;">
        連結：
        </td>
        <td>
            <asp:TextBox ID="txt_link3" runat="server" CssClass="textbox" Width="200px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: right;">
            圖示：
        </td> 
        <td>
            <asp:FileUpload ID="fudPdtImg3" runat="server" CssClass="fileupload" />
                        <asp:Button ID="btnLogoUpload3" runat="server" Text="上傳" Height="20px" 
                            onclick="btnLogoUpload3_Click" />
            <asp:Label ID="lblImg3" runat="server" Text="Label" Visible="false"></asp:Label>
        </td>   
    </tr>
    <tr>
        <td colspan="2">
            <asp:Image ID="Image3" runat="server" Height="230px" Width="744px" />
        </td>   
    </tr>
    <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="btnAdd" runat="server" Text="修改" 
                        Height="20px" onclick="btnAdd_Click" />
                </td>
            </tr> 
</table>

</asp:Content>

