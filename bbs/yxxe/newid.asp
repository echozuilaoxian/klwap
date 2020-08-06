<%
Server.ScriptTimeout=999
set rs11=Server.CreateObject("ADODB.Recordset")
strsQL="select ids from zb where cstr(ids)='"&ids& "'"
rs11.open strsQL,Conn,1,2
if rs11.recordcount<1 then
rs11.addnew
rs11("ids")=ids
rs11.update
end if
        rs11.Close
	Set rs11=Nothing
set rs12=Server.CreateObject("ADODB.Recordset")
strsQL="select ids from sx where cstr(ids)='"&ids& "'"
rs12.open strsQL,Conn,1,2
if rs12.recordcount<1 then
rs12.addnew
rs12("ids")=ids
rs12.update
end if
        rs12.Close
	Set rs12=Nothing
set rs13=Server.CreateObject("ADODB.Recordset")
strsQL="select ids from wupin where cstr(ids)='"&ids& "'"
rs13.open strsQL,Conn,1,2
if rs13.recordcount<1 then
rs13.addnew
rs13("ids")=ids
rs13.update
end if
        rs13.Close
	Set rs13=Nothing
     Conn.Close
      Set Conn=Nothing
%>
