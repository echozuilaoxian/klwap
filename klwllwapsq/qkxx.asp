<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<wml> 
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card title="清空内线消息"><p>
<%
 conn.Execute"delete from guestbook"
Response.write"内线消息清除成功!!!"
response.write "<br/><a href='wapadmin_index.asp?adminmid="&request("adminmid")&"'>返回管理首页</a><br/>"
%>
报时:<%=time%>
</p></card>
</wml>