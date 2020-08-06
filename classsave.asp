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
<card title="添加栏目类别">
<p>
<%      id= cint(request("id"))
        lxl= cint(request("lxl"))
        class1=request("class1")
if class1="" then
response.write"栏目名称不能为空!"
else
        pid=request.form("pid")
        br=request.form("br")
        lx=request.form("lx")
        parent=request.form("parent")
        if parent="" then parent=0
        lid=request.form("lid")
        img=request.form("img")
        url=request.form("url")
        active=request.form("active")
        opera=request.form("opera")
	set rs=server.createobject("adodb.recordset")
	sql="select * from class" 
	rs.open sql,conn,2,3
	rs.addnew
	rs("class")=class1
        rs("pid")=pid
        rs("br")=br
        rs("lx")=lx
        rs("parent")=parent
        rs("lid")=lid
        rs("img")=img
        rs("url")=url
        rs("active")=active
        rs("opera")=opera
	rs.update
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
%>
栏目添加成功!
<%end if%>
<br/>----------<br/>
<%if id<>0 then %>
<a href="Clist.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;lx=<%=lxl%>">[栏目分类]</a><br/>
<%end if%>
<a href='class.asp?sid=<%=sid%>'>[栏目分类]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>
