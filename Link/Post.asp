<!--#include file="Head.asp"-->
<%
'============================================================

'============================================================
%>
<!--#include file="Config.asp"-->
<%
ClassID=Request.Form("ClassID")
NAME=Request.Form("NAME")
NAMT=Request.Form("NAMT")
URL=LCase(Request.Form("URL"))
JIAN=Request.Form("JIAN")
if Session("NAME")=1 then
nolink
else
if NAME="" OR NAMT="" OR URL="" OR JIAN="" then
noname
else
dim Rs,Sql,Rss,Sqll
Set RSS=server.createobject("adodb.recordset")
Sqll="select * from [link_admin]"
RSS.open sqll,conn,1,1
active=rss("active")
call RssClose()
Set RS=server.createobject("adodb.recordset")
Sql="select * from [Link]"
RS.open sql,conn,1,3
RS.addnew
RS("NAME")=NAME
RS("NAMT")=NAMT
RS("URL")=URL
RS("CLASSID")=ClassID
RS("JIAN")=JIAN
RS("active")=active
RS.update
session.timeout=1
session("NAME")=1
end if
end if
response.write "<card id='card1' title='申请友链成功' ontimer='youcl.asp?hk="&hk&"'><timer value='1'/><p>"%>
申请友链成功
<%call lasts()%>
<%sub nolink()%>
<card title="重复申请"><p>
你刚才已申请过了！请不要重复申请！<br/>
<%call lasts()%>
<%Response.End%><%End Sub%>
<%sub noname()%>
<card title="出错了吧"><p>
各项都要填写,不能为空！<br/>
<%call lasts()%>
<%Response.End%><%End Sub%>
<%call ALLClose()%>