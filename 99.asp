<%
a=Request("textfield")
randomize
n1=CInt(8*rnd)+1
n2=CInt(8*rnd)+1
'Session("ans")=n1*n2
%>

<html>
<head>
<title>99</title>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
</head>

<body bgcolor="#FFFFFF">
<%
if a<>"" then
	if CInt(a) = Session("ans") then
		response.write "����F"
	else
		response.write "�����F"
	end if
end if
%>
<form method="post" action="99.asp">
  <%=n1%> 
  x<%=n2%>=
    <input type="text" name="textfield">
  <p>
    <input type="submit" name="Submit" value="�e�X">
  </p>
</form>
<%
Session("ans")=n1*n2
%>
</body>
</html>

