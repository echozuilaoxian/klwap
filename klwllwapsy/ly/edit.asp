<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="../conn.asp"-->
<!--#include file="../admin.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
id=request.QueryString("id")
p=cint(request.QueryString("p"))
if p="" or p<1 then p=1

function encode(str)
	if IsNull(str) then exit function
	str=trim(str)
	str=replace(str,"&","&amp;")
	str=replace(str,"<","&lt;")
	str=replace(str,">","&gt;")
        str=replace(str,Chr(13),"<br/>")
	encode=str
end function

set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [gbook] where [ID]="& id
rs.open rsstr,conn,1,2

if rs.recordcount =1 then
%>
<card title="编辑留言"><p>
用户昵称(必填)：<br/>
<input name="name" title="用户昵称" type="text" format="*M" emptyok="true" maxlength="10" value="<%=encode(rs("name"))%>"/><br/>
留言标题(必填)：<br/>
<input name="title" title="留言标题" type="text" format="*M" emptyok="true" maxlength="20" value="<%=encode(rs("title"))%>"/><br/>
留言内容(必填)：<br/>
<input name="text" title="留言内容" type="text" format="*M" emptyok="true" maxlength="500" value="<%=encode(rs("text"))%>"/><br/>
联系方式(隐藏)：<br/>
<input name="lianxi" title="联系方式" type="text" format="*M" emptyok="true" maxlength="50" value="<%=encode(rs("lianxi"))%>"/><br/>
<anchor>[-提交-]
    <go href="editok.asp?sid=<%=sid%>" method="post" accept-charset="utf-8">
        <postfield name="id" value="<%=id%>"/>
        <postfield name="name" value="$(name)"/>
        <postfield name="title" value="$(title)"/>
        <postfield name="text" value="$(text)"/>
        <postfield name="lianxi" value="$(lianxi)"/>
        <postfield name="p" value="<%=p%>"/>
    </go>
</anchor><br/>
----------<br/>
<a href="Admin_ly.asp?sid=<%=sid%>&amp;p=<%=p%>">[留言管理]</a><br/>
<a href="../class.asp?sid=<%=sid%>">[设计中心]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a><br/>
</p>
</card>
<%else%>
<card title="出错了">
<p>
无此留言！<br/>
－－－－－<br/>
<a href="Admin_ly.asp?sid=<%=sid%>&amp;p=<%=p%>">[留言管理]</a><br/>
<a href="../class.asp?sid=<%=sid%>">[设计中心]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a><br/>
</p>
</card>
<%end if%>
</wml>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>