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

set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [gbook] where [ID]=" & ID
rs.open rsstr,conn,1,2
%>
<card title="回复留言">
<p>标题：<%=UBB(rs("title"))%><br/>
内容：<%=UBB(rs("text"))%><br/></p>
<p><input name="retext" title="回复" type="text" format="*M" emptyok="true" maxlength="500" value='<%=rs("retext")%>'/><br/>
<anchor>[-提交-]
    <go href="resave.asp?sid=<%=sid%>" method="post" accept-charset="utf-8">
        <postfield name="id" value="<%=id%>"/>
        <postfield name="p" value="<%=p%>"/>
        <postfield name="retext" value="$(retext)"/>
    </go>
</anchor><br/>
----------<br/>
<a href="Admin_ly.asp?sid=<%=sid%>&amp;p=<%=p%>">[留言管理]</a><br/>
<a href="../class.asp?sid=<%=sid%>">[设计中心]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a><br/><br/>
</p>
</card>
</wml>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>