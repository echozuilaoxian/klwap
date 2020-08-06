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
<card title="分类修改结果">
<p>
<%
        id=request.querystring("id")
        class1=request.form("class1")
        lx=request.querystring("lx")
        pid=request.form("pid")
        br=request.form("br")
        lx=request.form("lx")
        img=request.form("img")
        url=request.form("url")
        active=request.form("active")
        opera=request.form("opera")
        set rs=server.createobject("adodb.recordset")
	sql="select * from class where classid="&id
	rs.open sql,conn,1,3
        rs("class")=class1
        rs("pid")=pid
        rs("br")=br
        rs("lx")=lx
        rs("img")=img
        rs("url")=url
        rs("active")=active
        rs("opera")=opera
        rs.update
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
response.write "修改成功!"
%>
<br/>----------<br/>
<%if id<>0 then %>
<a href="Clist.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;lx=<%=lx%>">[栏目分类]</a><br/>
<%end if%>
<a href='class.asp?sid=<%=sid%>'>[栏目分类]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>
