<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="pdt_num.aspx.cs" Inherits="admin_pdt_num" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td class="style1">
            <h4>
                限量商品</h4>
            </td>
        </tr>
        <tr>
            <td class="style1">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="text-align: right" width="80">連結：</td>
                    <td>
                    <asp:TextBox ID="txt_pdt_num_link" runat="server" CssClass="textbox" 
                        Width="250px"></asp:TextBox>
                    &nbsp;</td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="是否顯示於桌面" />
                    </td>
                </tr>
            </table>
            </td>
        </tr>
        <tr>
            <td class="style1">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="text-align: right" width="80">圖片：</td>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="90px" Width="168px" />
                        <br />
                        <asp:FileUpload ID="ful_pdt_num_pic" runat="server" />
                        <span class="warning">*圖片大小為168*90<asp:Label ID="lblpdt_num_pic" runat="server" 
                            Text="lblpdt_num_pic" Visible="False"></asp:Label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right" width="80">&nbsp;</td>
                    <td>
                        <asp:Button ID="btn_update" runat="server" Text="更新" 
                            onclick="btn_update_Click" />
                    </td>
                </tr>
            </table>
            </td> 
        </tr> 
    </table>
</asp:Content>

