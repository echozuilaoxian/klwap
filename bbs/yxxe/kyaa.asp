<%
set rsa=Server.CreateObject("ADODB.Recordset")
SQLa="select * from kywap where cstr(ids)="&ids
rsa.open SQLa,Conn,1,2
if rsa.recordcount>0 then
response.redirect "/bbs/yxxe/ljzq.asp?pid="&rsa("pid")&"&SessionID="&SessionID&""
end if
   rsa.close
set rsa=Nothing
set rsb=Server.CreateObject("ADODB.Recordset")
SQLb="select * from pk where cstr(ids)="&ids
rsb.open SQLb,Conn,1,2
if rsb.recordcount>0 then
response.redirect "/bbs/yxxe/pk.asp?pid="&rsb("pid")&"&SessionID="&SessionID&""
end if
   rsb.close
set rsb=Nothing

set rsc=Server.CreateObject("ADODB.Recordset")
SQLc="select * from luo where cstr(ids)="&ids
rsc.open SQLc,Conn,1,2
if rsc.recordcount>0 then
response.redirect "/bbs/yxxe/xluo.asp?pid="&rsc("pid")&"&SessionID="&SessionID&""
end if
   rsc.close
set rsc=Nothing

'set rsd=Server.CreateObject("ADODB.Recordset")
'SQLd="select * from tz where cstr(pid)="&ids
'rsd.open SQLd,Conn,1,2
'if rsd("jg")=0 then
'response.redirect "/bbs/yxxe/jjss.asp?id="&rsd("id")&"&lid="&rsd("lid")&"&SessionID="&SessionID&"&"
'end if
'   rsd.close
'set rsd=Nothing
%>