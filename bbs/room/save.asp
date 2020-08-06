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
set rs=server.createobject("ADODB.Recordset")
sql="select * from gl where idd=" & id & " and idlt=" & idlt & " and jz<>'0'"
rs.open sql,myc,1,2
if not rs.eof then
   response.write "<card title='我要发言'><p align='left'>请注意!你已被禁言!<br/>请联系管理员<br/>"
    else
dim t,talk,about,name
t=usb(request("t"))
name=usb(request("name"))
talk=usb(request("talk"))
 name=trim(name)
talk=trim(talk)
talk=left(talk,30)
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
sqls="select * from room where idd=" & id & " order by id desc"
rss.open sqls,myc,1,1
	if rss.eof then
   response.write "<card title='我要发言'><p align='left'>该聊天室不存在!<br/>"
	   else
dim rrss,sqlls
set rrss=server.createobject("ADODB.Recordset")
sqlls="select * from rooms order by id desc"
rrss.open sqlls,myc,1,2
rrss.addnew
if id<>"" then rrss("idd")=id
if nam<>"" then rrss("name")=nam
if talk<>"" then rrss("text")=talk
if about<>"" then rrss("about")=about
if idlt<>"" then rrss("idst")=idlt
rrss.update
   response.write "<card title='我要发言' ontimer='rooms.asp?id=" & id & "&amp;SessionID=" & SessionID & "'><timer value='1'/><p align='left'>发言成功!正在返回聊室..."
end if
end if
 end if
 end if
%>
<br/>--------<br/>
<a href="add.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">继续发言</a><br/>
<a href="rooms.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">返回聊室</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">回聊室列表</a><br/>
<a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>地盘</a>-
<!--#include file="aa.asp"-->
<%
rs.close
set rs=nothing
myc.close
set myc=nothing
%>
</p>
</card>
</wml>