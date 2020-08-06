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
<card title="添加文件栏目">
<p>
<%      class1=request.form("class1")
	set rs=server.createobject("adodb.recordset")
	sql="select * from wjclass" 
	rs.open sql,conn,1,3
	rs.addnew
	rs("name")=class1
	rs.update
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
%>
文件大类栏目添加成功!
<br/>----------<br/>
<a href='wjclass.asp?sid=<%=sid%>'>[文件分类]</a><br/>
<a href="wjcl.asp?sid=<%=sid%>">[文件管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>
