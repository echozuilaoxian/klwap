<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/ wml_1.1.xml">
<!--#include file="ccnn.inc"-->
<!--#include file="ubb.inc"-->
<wml>
<card id="id" title="被告上诉">
<p>上诉300金币1次，并且只有3次机会(和原告各1.5次)<br/>
<%
id=request("id")
p=request("p")

set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from urls where id=" & id
rs.open rsstr,conn,1,2

if rs.recordcount=0 then 
response.write("无此案件！<br/>")
else
idd=rs("idd")
name=rs("title")
url=rs("url")
about=rs("about")
check=rs("check")
%>

上诉内容:<br/><input name="newabout<%=minute(now)%><%=second(now)%>" maxlength="30" value="<%=ubb(about)%>"/>
<br/>
<anchor title="确定更改">确定更改
<go href="bgsscl.asp?SessionID=<%=SessionID%>&amp;idss=<%=idss%>&amp;ids=<%=ids%>&amp;id=<%=id%>&amp;p=<%=p%>" method="post" accept-charset='utf-8'>
<postfield name="about1" value="$(newabout<%=minute(now)%><%=second(now)%>)"/>
<postfield name="check1" value="0"/>
</go>
</anchor><br/>
<anchor><prev/>返回上页</anchor><br/>
<!--#include file="aa.asp"-->

<% 
end if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
</p>
</card>
</wml>