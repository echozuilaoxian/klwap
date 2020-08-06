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
<card title="文章分类修改">
<p>
<%
id=request.querystring("id")
set rs=server.createobject("adodb.recordset")
sql = "select * from wzclass where classid="&id
rs.open sql,conn,1,1
if rs.bof and rs.eof then
    	response.write "没有此类别！<br/>"
end if
response.write "类别名称:"&ubb(rs("class"))&"<br/>"
response.write "类别编号:"&ubb(rs("classid"))&"<br/>"
%>
----------<br/>
<a href='editwzclass.asp?sid=<%=sid%>&amp;id=<%=id%>'>[编辑分类]</a><br/>
<a href='delwzclass.asp?sid=<%=sid%>&amp;id=<%=rs("classid")%>'>[删除分类]</a><br/>
<a href='wzclass.asp?sid=<%=sid%>'>[返回分类]</a><br/>
<a href="wzcl.asp?sid=<%=sid%>">[文章管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
<%rs.close
set rs=nothing
conn.close
set conn=nothing
%>
</p>
</card>
</wml>