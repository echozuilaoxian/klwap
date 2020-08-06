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
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<!-- #include file="conn.asp" -->
<?xml version="1.0" encoding="utf-8"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="上传文章">
<p>
<%
        set rs = server.createobject("adodb.recordset")
        sql="select * from twapp"
        rs.open sql,conn,1,1
 if rs("open")="2" then
 Response.write ("上传已关闭啦!等站长再开放吧!谢谢咯!!<br/>")
else
dim rs,sql
set rs=server.createobject("adodb.recordset")
sql = "select classid,class from wzclass"
rs.open sql,conn,1,1
%>
谢谢您的上传！<br/>
<br/>标题:<input name="title<%=minute(now)%><%=second(now)%>" value=""/><br/>
内容:<input name="test<%=minute(now)%><%=second(now)%>" title="内容" type="text" value=""/><br/>
您的名字：<input name="user<%=minute(now)%><%=second(now)%>" title="名字" maxlength="20"/><br/>
选择类别：<select name="classid<%=minute(now)%><%=second(now)%>">
<% 
        do while not rs.eof
%><option value='<%=rs("classid")%>'><%=rs("class")%></option>
<%
        rs.movenext
        loop
	rs.close
%></select><br/>
<anchor>确定提交
    <go href="post.asp?hk=<%=hk%>" method="post" accept-charset="utf-8">
        <postfield name="title" value="$(title<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="test" value="$(test<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="user" value="$(user<%=minute(now)%><%=second(now)%>)"/>
        <postfield name="classid" value="$(classid<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor>
<%end if%>
<br/>------------
<br/><anchor>返回上页<prev/></anchor><br/><a href='index.asp?hk=<%=hk%>'>返回首页</a></p>
</card></wml>
