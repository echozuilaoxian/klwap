<%
if hk<>"" then
set ggxxzl=Server.CreateObject("ADODB.Recordset")
rsggxxpl="select sid,fzt,id from tbxx where sid<>0 and sid="&myid&" and fzt=0"
ggxxzl.open rsggxxpl,conn,1,2
if ggxxzl.eof then
ggxxzl.close
set ggxxzl=nothing
Else
iddd=ggxxzl("id")
Response.write "<a href='bbs/xx_view.asp?id=" & iddd & "&amp;hk="&hk&"'>&#x60A8;&#x6709;"&ggxxzl.recordcount&"条新消息</a><br/>"
end if
end if
%>