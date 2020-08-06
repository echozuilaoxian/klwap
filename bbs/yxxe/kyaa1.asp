<%
set rsc=Server.CreateObject("ADODB.Recordset")
strSQL="select * from tz where cstr(ids)="&ids
rsc.open strSQL,Conn,1,2
if rsc.recordcount>0 then
response.redirect "jjss.asp?pid="&rsc("pid")&"&wap="&wap&""
end if
   rsc.close
set rsc=Nothing
%>