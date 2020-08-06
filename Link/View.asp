<!--#include file="Head.asp"-->
<%
'============================================================

'============================================================
%>
<!--#include file="Config.asp"-->
<card title='网站信息'><p>
<%Dim rss,rs,sql,sqll,classs,rsst,sqllt,ID
id=request.Querystring("id")
classs=request.Querystring("class")
set Rss=Server.CreateObject("ADODB.Recordset")
Sqll="select * from [linkclass] Where Classid="&classs
Rss.open Sqll,conn,1,1
cl=Rss("class")
call rssClose()
set Rsst=Server.CreateObject("ADODB.Recordset")
Sqllt="select [urll],[title] from [link_admin]"
Rsst.open Sqllt,conn,1,1
urll=Rsst("urll")
title=Rsst("title")
       Rsst.close
set Rsst=Nothing
set Rs=Server.CreateObject("ADODB.Recordset")
Sql="select * from [link] Where ID="&ID
Rs.open Sql,conn,1,3
If Not rs.eof	Then
Rs("OUT")=Rs("OUT")+1
Rs.update()
Response.Write	"您将离开＂"&usb(title)&""&urll&"＂而进入其它站点，请谨慎点击!<br/>"
Response.Write	"网站名称: "&usb(rs("NAME"))&"<br/>"
Response.Write	"网站地址:"&usb(rs("URL"))&"<br/>"
Response.Write	"所在分类:"&usb(Cl)&"<br/>"
Response.Write	"网站简介:"&usb(rs("JIAN"))&"<br/>"
Response.Write	"回链地址:"&urll&"/link/Go.asp?id="&ID&"<br/>"
Response.Write	"最后点击:"&usb(rs("TIME"))&"<br/>"
Response.Write	"反馈量:"&usb(rs("IN"))&"<br/>"
Else
Response.Write	("该友链不存在")
End If%>
马上访问<a href='<%=usb(rs("URL"))%>'><%=usb(rs("NAME"))%></a><br/>
<%call ALLClose()%>
<%call lasts()%>