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
<!-- #include file="../conn.asp" -->
<!--#include file="../admin.asp"-->
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="文件分类删除">
<p>
注意:本操作将删除本栏目及其所有文件，栏目删除无法恢复！确定要删除吗？<br/>
<a href='delwjclasscl.asp?sid=<%=sid%>&amp;lid=<%=request("lid")%>'>是,确定删除</a><br/>
<a href='wjclass.asp?sid=<%=sid%>'>不,取消操作</a><br/>
----------<br/>
<a href="wjclass.asp?sid=<%=sid%>">[分类管理]</a>
<br/>
<a href="wjcl.asp?sid=<%=sid%>">[文件管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>