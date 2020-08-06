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
<card title="统计清除">
<p>
<%dim del
del=Request.querystring("del")
if del=1 then
sql="delete from Zzday"
  conn.Execute(sql) 
sql="Update counter set [top]=0,today=0,yesterday=0,browser=0,daynum=1,counter=0"
  conn.Execute(sql) 
%>
成功清除统计记录
<%else%>
注意:本操作清空所有统计记录，统计清除无法恢复！确定要清除吗？
<br/>
<a href="qktj.asp?sid=<%=sid%>&amp;del=1">是,确定清除</a><br/>
<a href="iptj.asp?sid=<%=sid%>">不,取消操作</a>
<%end if%>
<br/>----------<br/>
<a href="iptj.asp?sid=<%=sid%>">[IP统计]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>