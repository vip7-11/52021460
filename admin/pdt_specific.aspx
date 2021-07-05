<%@ Page Title="" Language="C#" MasterPageFile="~/admin/user.master" AutoEventWireup="true" CodeFile="pdt_specific.aspx.cs" Inherits="admin_pdt_specific" %>
<%@ Register src="../Mod/user_newObj.ascx" tagname="user_newObj" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="side" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
<h3>規格管理</h3>
    <table style="width:100%;">
        <tr>
            <td>
                <h4>規格群組</h4>
            </td>
        </tr>        
        <tr>
            <td>
                <asp:TextBox ID="txtSpecificGroupName" runat="server" Width="120" MaxLength="20"></asp:TextBox>                
                <asp:Button ID="btnAddSpecificGroup" runat="server" Text="新增" onclick="btnAddSpecificGroup_Click" />
            </td>
        </tr>
        <tr>
            <td>
                *您最多可新增五組規格，如：顏色、尺寸 ... 等。
            </td>
        </tr>
        <tr>
            <td>
                <h4>規格</h4>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="ddlSpecificGroup" runat="server" DataSourceID="sdsSpecific" DataTextField="specific_group_name" DataValueField="specific_group_id">
                </asp:DropDownList>
                <asp:TextBox ID="txtSpecification" runat="server" Width="120" MaxLength="20"></asp:TextBox>                
                <asp:Button ID="btnAddSpecification" runat="server" Text="新增" onclick="btnAddSpecification_Click" />
            </td>
        </tr>
        <tr>
            <td>
                *新增規格內容，如：「顏色」 紅、綠、藍 ... 等。
            </td>
        </tr>        
        <tr>
            <td>
                <asp:DataList ID="dltSpecific" runat="server" DataKeyField="specific_group_id"
                    DataSourceID="sdsSpecific" RepeatDirection="Horizontal" onitemcommand="dltSpecific_ItemCommand">
                    <ItemStyle BorderWidth="0px" VerticalAlign="Top" Width="135px" />
                    <ItemTemplate>
                        <asp:Label ID="specific_group_id" runat="server" Text='<%# Eval("specific_group_id") %>' Visible="false" />
                        <div style="background-color: #fc9; padding: 2px 4px; border: solid 1px #fff;">
                            <asp:Label ID="specific_group_name" runat="server" Text='<%# Eval("specific_group_name") %>' Font-Bold="true" />                        
                            <asp:LinkButton ID="btnDelSpecific" runat="server" OnClientClick="if(confirm('確定刪除？這可能會影響到商品中的規格設定！') == false) return false;" Text="[刪除]" CommandArgument='<%# Eval("specific_group_id") %>' Font-Size="8"></asp:LinkButton>
                        </div>
                        <ul style="margin-left: 20px;">
                        <asp:DataList ID="dltSpecification" runat="server" DataKeyField="specific_id" 
                                DataSourceID="sdsSpecification" RepeatLayout="Flow" 
                                onitemcommand="dltSpecification_ItemCommand">
                            <ItemTemplate>
                                <li style="margin-bottom: -10px;">
                                    <asp:Label ID="specificationLabel" runat="server" Text='<%# Eval("specification") %>' />
                                    <asp:LinkButton ID="btnDelSpecification" runat="server" OnClientClick="if(confirm('確定刪除？這可能會影響到商品中的規格設定！') == false) return false;" CommandArgument='<%# Eval("specific_id") %>' Font-Size="8"><img border="0" src="../image/del_s.png" /></asp:LinkButton>
                                    <asp:Label ID="specific_idLabel" runat="server" Text='<%# Eval("specific_id") %>'  Visible="false" />
                                </li>
                            </ItemTemplate>
                        </asp:DataList>
                        </ul>
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
                <br />
            </td>
        </tr>
    </table>

    <!--最新商品開始-->
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td height="20"></td>
        </tr>
        <tr>
            <td>
                <%--<uc1:user_newObj ID="user_newObj1" runat="server" />--%>
            </td>
        </tr>
    </table>
    <!--最新商品結束-->
    <asp:Label ID="lblWebId" runat="server" Visible="false"></asp:Label>
</asp:Content>