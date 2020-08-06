<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<wml> 
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card id='main' title='操作提示'>
<p><%
set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from gogo"
rs.open sql,conn,1,2

rs.addnew
rs("name")=request("name")
rs("url")=request("url")
rs.update

conn.close
set conn=nothing
Response.Write "广告添加成功！"     
%>
<br/>----------
<br/><a href='addgg.asp?adminmid=<%=request("adminmid")%>'>返回继续添加</a>
<br/><a href='admingg.asp?adminmid=<%=request("adminmid")%>'>返回广告管理</a>
<br/><a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a>
<br/><a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
报时:<%=time%>
</p></card></wml>