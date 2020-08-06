<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-Cache'/>
<meta http-equiv='Cache-Control' content='max-age=0'/>
</head>
<card id='main' title='帮派修改' >
<p>
<%
        set rs=server.createobject("adodb.recordset")
	sql="select * from jzbl where id="&request("id")
	rs.open sql,conn,1,3
        rs("biaoti")=request("biaoti")
        rs("nai")=request("nai")
        rs.update
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
response.write "修改成功!"
%>
<br/>------------
<br/><a href="adminbp.asp?adminmid=<%=request("adminmid")%>">返回帮派管理</a>
<br/><a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a>
</p>
</card>
</wml>