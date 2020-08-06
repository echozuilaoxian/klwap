<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>

<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sql = "select * from jzbl where id="&request("id")
rs.open sql,conn,1,1
if rs.bof and rs.eof then
    	response.write "没有此帮派!"
else
%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='修改帮派' >
<p>帮派名称：<input name='biaoti' type='text' size='10' value='<%=rs("biaoti")%>'/>
<br/>帮派简介：<input name='nai' type='text' size='50' value='<%=rs("nai")%>'/><br/>
<anchor>[-保存-]
<go href='adminbpxgsave.asp?id=<%=request("id")%>&amp;adminmid=<%=request("adminmid")%>' method='post' accept-charset='utf-8'>
<postfield name='biaoti' value='$(biaoti)'/>
<postfield name='nai' value='$(nai)'/>
</go></anchor>
<br/>------------<br/>
<a href="adminbp.asp?adminmid=<%=request("adminmid")%>">返回帮派管理</a>
<br/><a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a>
</p>
</card>
</wml>
<%
	end if
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
%>