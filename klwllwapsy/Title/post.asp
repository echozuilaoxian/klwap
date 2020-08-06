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
<card title="文章修改">
<p>
<% id=request.QueryString("id")
 classid=request.QueryString("classid") 
 test=request.form("test")
 user=request.form("user")  
 title=request.form("title")
        set rs=server.createobject("adodb.recordset")
	sql="select * from sms where id="&id
	rs.open sql,conn,3,3
        rs("test")=test
        rs("user")=user
        rs("title")=title
        rs.update
	 rs.close
	 set rs=nothing
         conn.Close
         set conn=Nothing 
        %>
修改成功!
<br/>----------<br/>
<a href="adminsmscl.asp?sid=<%=sid%>&amp;id=<%=classid%>">[返回文章]</a><br/>
<a href="wzclass.asp?sid=<%=sid%>">[返回文章]</a><br/>
<a href="wzcl.asp?sid=<%=sid%>">[文章管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p>
</card>
</wml>