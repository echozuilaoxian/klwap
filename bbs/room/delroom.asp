<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.inc"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>

<%
cz=request("cz")
if cz="" then cz="no"

if cz="no" then
   response.write "<card title='删除聊室'><p align='left'>删除后不可恢复！同时也会把聊天记录一起删除！<br/>你确定删除？<br/><br/>"
   response.write "<a href='delroom.asp?id=" & id & "&amp;wap=" & wap & "&amp;cz=ok'>确定</a><br/>"
   response.write "<a href='list.asp?wap=" & wap & "'>取消</a><br/>"

elseif cz="ok" then
dim sqlls
sqlls="delete from room where idd=" & id
myc.execute sqlls
sqlls="delete from rooms where idd=" & id
myc.execute sqlls

   response.write "<card title='删除聊室' ontimer='list.asp?wap=" & wap & "'><timer value='20'/><p align='left'>"
   response.write "删除成功！正在返回...<br/><br/>"
end if
%>
<a href="index.asp?wap=<%=wap%>">聊室列表</a><br/>
<!--#include file="aa.asp"-->
<%
myc.close
set myc=nothing
%>
</p>
</card>
</wml>