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
<!-- #include file="../admin.asp" -->
<wml>
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="文章管理">
<p>
<%
classid=request.querystring("classid")
id=request.querystring("id")
set rs=server.createobject("adodb.recordset")
sql = "select * from SMS where id="&id
rs.open sql,conn,1,1
if rs.bof and rs.eof then
    	response.write "没有此类别！<br/>"
end if
%>
标题: <%=ubb1(rs("title"))%><br/>
作者: <%=ubb1(rs("user"))%><br/>
<%if rs("pic")<>"" then
response.write "图片文件:"&ubb1(rs("pic"))&"<br/>"
else
response.write "图片文件:暂无图片<br/>"
end if
%>
添加日期: <%=ubb1(rs("date"))%><br/>
人气: <%=ubb1(rs("hit"))%><br/>

----------<br/>
<a href='edits.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;classid=<%=classid%>'>[编辑文章]</a><br/>
<a href='dels.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;classid=<%=classid%>'>[删除文章]</a><br/>
<a href="move.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;classid=<%=classid%>">[移动文章]</a><br/>
<a href="adminsmscl.asp?sid=<%=sid%>&amp;id=<%=classid%>">[文章列表]</a><br/>
<a href="wzclass.asp?sid=<%=sid%>">[文章分类]</a><br/>
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