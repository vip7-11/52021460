<%@ Page Language="C#" AutoEventWireup="true" CodeFile="preview.aspx.cs" Inherits="admin_preview" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>預覽</title>
    <asp:Literal ID="themes" Runat="server" />    
    <asp:Literal ID="style" Runat="server" />
    <style type="text/css">
        .banner { margin-bottom: 0px; } /* Moz */
        * html .banner { margin-bottom: -4px; } /* IE6 */
        *+html .banner { margin-bottom: -4px; } /* IE7 */ 
        
         .cart {
            width: 230px; 
            z-index: 65535;
            position: fixed;
            top: 0px;
            right: 0px;            
            margin-right: -200px;
            overflow: hidden;
            padding: 60px 0px;
            background-image: url(../../images/layout/web/cartag.gif);
            background-repeat: no-repeat;
            background-position: 0 24%;
        }
        
        .cart_hover { 
            z-index: 65535;
            position: fixed;
            top: 0px;
            right: 0px;
            margin-right:0px;
            overflow: hidden;
            padding: 60px 0px;
            background-image: url(../../images/layout/web/cartag_over.gif);
            background-repeat: no-repeat;
            background-position: 0 24%;
        }       
        
        .cartag {
            width: 30px; 
            height: 130px;
            float: left;           
            cursor:pointer;
        }       
        
        .cartbody {
            width: 200px;
            float: left;            
        }
        
        .cartbody .box {
	        padding: 4px;
	        border: 1px solid #FFCCCC;
	        background-color: #fff;
        }
        
        * html #cart {display: none;} /* IE6 */
    </style>
</head>
<body>
    <form id="form" runat="server">    
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager" EnableScriptGlobalization="true" EnableScriptLocalization="true" runat="server"></ajaxToolkit:ToolkitScriptManager>
    <div id="page-wrap">
    <%--<div id="top-bg">   		    
		</div>			
		<div id="header">
		    <div id="linkmenu">
		        <a href="#">Yamazoo購物商城</a> ｜ <a href="#">加入最愛</a> ｜ <a href="#">成為粉絲</a> ｜ <a href="#">檢視我的購物車</a>
		    </div>    
			<h1 id="titleText"><asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label></h1>
			<h2 id="sloganText"><asp:Label ID="lblSlogan" runat="server"></asp:Label></h2>
		</div>		
    <div id="wrap">			
		<div id="header-photo">
		    <asp:Literal ID="banner" runat="server"></asp:Literal>            
		</div>		
        <div id="nav1">
	        <ul id="menus">
	            <li><a href="#">回首頁</a></li>
	            <li><a href="#">關於我</a></li>
	            <li><a href="#">最新消息</a></li>
	            <li><a href="#">部落格</a></li>
	            <li><a href="#">商品</a></li>	
	            <li><a href="#">留言板</a></li>
	            <li><a href="#">聯絡我們</a></li>
	        </ul>
        </div>
		<div id="content-wrap">
			<div id="sidebar">	
                <asp:Literal ID="side" runat="server"></asp:Literal>
                <asp:Literal ID="side2" runat="server"></asp:Literal>
			</div>--%>					
			<div id="Dmain">				
                <asp:Literal ID="main" runat="server"></asp:Literal>
			</div>
			<%--<div class="clear"></div>
		</div>
		</div>	
		<div id="footer-wrap">	
			<div id="footer-bottom">
			    <p>
                    版權所有 © 2011 MotoMoto All right reserved. 
				</p>
			</div>	
		</div>--%>
		</div>
    </form>
</body>
</html>