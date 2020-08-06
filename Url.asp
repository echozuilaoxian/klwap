<%@LANGUAGE="VBScript" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<%
Server.ScriptTimeout=999
  id=Request("id")
  ssql="update gogo set tid=tid+1 Where CStr(id)='" & id & "'"
  conn.Execute(ssql)
set objgbrs=Server.CreateObject("ADODB.Recordset")
ssql="select * from gogo Where id=" & request("id")
  objgbrs.open ssql,conn,1,1
if not (objgbrs.bof and objgbrs.eof)  then
id=objgbrs("id")
url=ubb(objgbrs("url"))
end if
%>
<wml>
<card id='card1' title='正在进入...'> <onevent type='onenterforward'>
<go href='<%=url%>'/>
</onevent>
<p align="left">正在进入...<br/>
<a href="<%=url%>">点击进入</a><br/>
</p>
</card>
</wml>
