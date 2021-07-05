<%@ control language="C#" autoeventwireup="true" inherits="Mod_user_newObj, App_Web_user_newobj.ascx.f8f3d73d" %>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
        <td valign="top" height="50">
        <img src="/images/layout/user/whats_new_23.jpg" border='0' /></td>
    </tr>
    <tr>
        <td>
            <asp:DataList ID="dltObjImg" runat="server" DataKeyField="obj_id"
                DataSourceID="sdsObjImg" RepeatColumns="7" RepeatDirection="Horizontal" 
                RepeatLayout="Flow" OnItemCommand="dltObjImg_ItemCommand" 
                onitemdatabound="dltObjImg_ItemDataBound" BorderStyle="None" 
                ShowFooter="False" ShowHeader="False">
                <ItemTemplate>
                    <div style="width:119px; overflow: hidden; padding-left:8px; padding-right:8px; float: left;">
                        <table cellpadding="0" cellspacing="0" border="0" width="120px" style=" background:#F4F4F4;" onmouseover="this.bgColor='#FCC';" onmouseout="this.bgColor='#F4F4F4';">
                            <tr>
                                <td style=" padding:5px;">
                                    <table cellpadding="0" cellspacing="0" border="0" width="111px"">
                                        <tr>
                                            <td>
                                                <asp:Literal ID="lt_obj_upload_img" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style=" height:25px; font-size:12pt; text-align:center;">
                                                <asp:Label ID="lblweb_name" runat="server" Text='<%# Eval("web_name") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style=" height:35px; text-align:center; font-size:8pt;">
                                                <asp:Label ID="lblobj_name" runat="server" Text='<%# Eval("obj_name") %>'></asp:Label>
                                                <asp:Label ID="lblobj_id" runat="server" Text='<%# Eval("obj_id") %>' Visible="false"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style=" height:20px; text-align:center; font-size:8pt; font-weight:600; color:#FF0000;">
                                                <asp:Label ID="lblobj_price" runat="server" Text='<%# Eval("obj_price") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="5"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>             
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="sdsObjImg" runat="server" ConnectionString="<%$ ConnectionStrings:zhongdikaiConnectionString %>" >
            </asp:SqlDataSource>
        </td>
    </tr>
</table>