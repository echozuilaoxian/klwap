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
<card title="添加文章">
<p><%id= int(request.QueryString("id"))%>
标题:<input name="title<%=minute(now)%><%=second(now)%>" value=""/><br/>
内容:<input name="test<%=minute(now)%><%=second(now)%>" title="内容" type="text" value=""/><br/>
作者：<input name="user<%=minute(now)%><%=second(now)%>" title="名字" maxlength="20"/><br/>
<anchor>确定提交
    <go href="save.asp?sid=<%=sid%>" method="post" accept-charset="utf-8">
        <postfield name="title" value="$(title<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="test" value="$(test<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="user" value="$(user<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="classid" value="<%=id%>"/>
    </go>
</anchor><br/>-----------<br/>
提示:如果要强制分页,请用||来分割.<br/>
<a href="adminsmscl.asp?sid=<%=sid%>&amp;id=<%=id%>">[返回文章]</a><br/>
<a href="wzclass.asp?sid=<%=sid%>">[文章分类]</a><br/>
<a href="wzcl.asp?sid=<%=sid%>">[文章管理]</a><br/>
</p>
</card>
</wml>