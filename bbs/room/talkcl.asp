<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.inc"-->
<!--#include file="ubb.inc"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>

<%
dim rs,sql

if SessionID="" then SessionID=Session("SessionID")

set rs=server.createobject("ADODB.Recordset")
sql="select * from gd where idd=" & id & " and idlt=" & idlt & " and jz<>'0'"
rs.open sql,myc,1,2
if not rs.eof then
   response.write "<card title='我要发言'><p align='left'>请注意!你已被禁言!<br/>有问题请返回社区联系室主!<br/>"
    else
dim t,talk,about
talk=usb(request("talk"))
talk=trim(talk)
talk=left(talk,100)
about=usb(request("about"))
if about="" then about="大家"

  if talk="" then 
  response.write "<card title='我要发言'><p align='left'>内容不能为空!<br/>"
	else
 if Session("ltftzl")=talk then
     response.write "<card id='card1' title='我要发言'><p>请不要刷屏！"
else
   Session("ltftzl")=talk
		Session.Timeout=8
dim rss,sqls
set rss=server.createobject("ADODB.Recordset")
sqls="select * from rom where idd=" & id & " order by id desc"
rss.open sqls,myc,1,1
	if rss.eof then
   response.write "<card title='我要发言'><p align='left'>该聊天室不存在!<br/>"
	   else
dim rrss,sqlls
set rrss=server.createobject("ADODB.Recordset")
sqlls="select * from roms order by id desc"
rrss.open sqlls,myc,1,2
rrss.addnew
if id<>"" then rrss("idd")=id
if nam<>"" then rrss("name")=nam
if talk<>"" then rrss("text")=talk
if about<>"" then rrss("about")=about
if idlt<>"" then rrss("idstt")=idlt
rrss.update
if Len(talk)>2 then
  sql="update usereg set roomjfjf=roomjfjf+2 where CStr(id)=" & idlt & ""
  Application.Lock
  conn.execute sql
  Application.Unlock
end if
   response.write "<card title='发言成功' ontimer='room.asp?id=" & id & "&amp;SessionID=" & SessionID & "'><timer value='1'/><p align='left'>发言成功!正在返回聊室..."
rrss.close
set rrss=nothing
	end if
rss.close
set rss=nothing
  end if
end if
end if
%>
<br/>--------<br/>
<a href="talk.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">[继续发言]</a><br/>
<a href="room.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">[返回聊室]</a><br/>
<% 
rs.close
set rs=nothing
myc.close
set myc=nothing
%>
</p>
</card>
</wml>