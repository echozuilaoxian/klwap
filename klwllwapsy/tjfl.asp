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
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="id" title="选择栏目类型"><p>
<% id= request.QueryString("id")%>
<% idd= request.QueryString("idd")%>
<% lxl= request.QueryString("lxl")%>
请选择栏目类型<br/>
<a href="tjflcl.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;pp=0">[新的页面]</a><br/>
<a href="tjflcl.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;pp=1">[文章菜单]</a><br/>
<a href="tjflcl.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;pp=2">[UBB标签]</a><br/>
<a href="tjflcl.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;pp=3">[直接显图]</a><br/>
<a href="tjflcl.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;pp=4">[超级链接]</a><br/>
<a href="tjflcl.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;pp=5">[WML标签]</a><br/>
<a href="tjflcl.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;pp=6">[文件栏目]</a><br/>
<a href="tjflcl.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;pp=7">[调用栏目]</a>
<br/>----------<br/>
<%if id<>0 then %>
<a href="Clist.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;lxl=<%=lxl%>">[栏目分类]</a><br/>
<%end if%>
<a href="class.asp?sid=<%=sid%>">[栏目管理]</a><br/>
<a href="index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>