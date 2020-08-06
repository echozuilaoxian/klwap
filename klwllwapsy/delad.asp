<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% 
'============================================================
' 更新: 2007-12-10
' 主页: http://wap.twapp.cn
' 电邮: xivn@163.com
' Q Q : QQ:531233814
' 版权: 燃点真情All Rights Reserved.
'============================================================ 
%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!-- #include file="conn.asp" -->
<!--#include file="admin.asp"-->
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="广告记录清空">
<p>
<%dim del
del=Request.querystring("del")
if del=1 then
sql="delete from ltgg"
  conn.Execute(sql) 
%>
成功清除广告记录
<%else%>
注意:本操作将清除全部的广告记录，记录删除无法恢复！确定要清除吗？
<br/>
<a href="delad.asp?sid=<%=sid%>&amp;del=1">是,确定清除</a><br/>
<a href="todayad.asp?sid=<%=sid%>">不,取消操作</a>
<%end if%>
<br/>----------<br/>
<a href="admin_go.asp?sid=<%=sid%>">[广告管理]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>