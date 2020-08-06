<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="../conn.asp"-->
<!--#include file="../admin.asp"-->
<%
id=request.QueryString("id")
p=cint(request.QueryString("p"))
if p="" or p<1 then p=1
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="查看留言">
<p>
<%
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [gbook] where [ID]=" & ID
rs.open rsstr,conn,1,2

set rsn=Server.CreateObject("ADODB.Recordset")
rsstrn="select * from [gbook] where [ID]<"& ID &" order by [ID] desc"
rsn.open rsstrn,conn,1,2
set rspr=Server.CreateObject("ADODB.Recordset")
rsstrpr="select * from [gbook] where [ID]>"& ID &" order by [ID] asc"
rspr.open rsstrpr,conn,1,2

if rs.recordcount=0 then 
response.write("无此留言！<br/>")
else

response.write(UBB(rs("title")) & "<br/>")

response.write("----------<br/>" )
response.write("<img src='/img/face/" & rs("face") & ".gif' alt=''/>" & "<br/>")
response.write(UBB(rs("text")) & "<br/><br/>")
end if
%>
作者：<%=rs("name")%> <br/>      
<%
response.write("时间：" & rs("time") & "<br/>")
response.write "----------<br/>"
response.write("联系方式：" & UBB(rs("lianxi")) & "<br/>")
response.write("手机：" & rs("num") & "<br/>")
response.write("型号：" & rs("agent") & "<br/>")
response.write "----------<br/>"
%>
回复：<%=UBB(rs("retext"))%><br/>

时间：<%=rs("retime")%><br/>
----------<br/>
<a href="Admin_ly.asp?sid=<%=sid%>&amp;p=<%=p%>">[留言管理]</a><br/>
<a href="../class.asp?sid=<%=sid%>">[设计中心]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a><br/><br/>
</p>
</card>
</wml> 
<%
conn.close
set conn=nothing
%>