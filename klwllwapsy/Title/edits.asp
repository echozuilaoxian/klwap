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
<card title="文章修改">
<p>
<% id=request("id")
   classid=request("classid") 
        set rs = server.createobject("adodb.recordset")
	sql="select * from sms where id="&id
	rs.open sql,conn,1,1
	if rs.eof and rs.bof then
	response.write "文章不存在<br/>"
	else
  response.write " 文章详情:  <br/>"
end if%>标题: <%=ubb1(rs("title"))%><br/>
作者: <%=ubb1(rs("user"))%><br/>
<%if rs("pic")<>"" then
response.write "图片文件:"&ubb1(rs("pic"))&"<br/>"
else
response.write "图片文件:暂无图片<br/>"
end if
%>
添加日期: <%=ubb1(rs("date"))%><br/>
人气: <%=ubb1(rs("hit"))%><br/>

            标题:<input name="title<%=minute(now)%><%=second(now)%>" value="<%=ubb(rs("title"))%>"/><br/>
作者:<input name="user<%=minute(now)%><%=second(now)%>" maxlength="10" value="<%=ubb(rs("user"))%>"/><br/>
  文章内容:<input name="test<%=minute(now)%><%=second(now)%>" value="<%=ubb(rs("test"))%>"/><br/>
<anchor>修改文章
    <go href="post.asp?sid=<%=sid%>&amp;id=<%=id%>&amp;classid=<%=classid%>" method="post" accept-charset="utf-8">
        <postfield name="user" value="$(user<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="test" value="$(test<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="title" value="$(title<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor>
<%
rs.close
set rs=nothing
%>
<br/>----------<br/>
<a href="adminsmscl.asp?sid=<%=sid%>&amp;id=<%=classid%>">[文章列表]</a>
<br/><a href="wzclass.asp?sid=<%=sid%>">[返回分类]</a><br/>
<a href="wzcl.asp?sid=<%=sid%>">[文章管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>