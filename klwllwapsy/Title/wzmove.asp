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
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.2//EN" "http://www.wapforum.org/DTD/wml12.dtd">
<wml>
<!-- #include file="../conn.asp" -->
<!--#include file="../admin.asp"-->
<head>
<meta http-equiv="Cache-Control" content="must-revalidate" forua="true"/>
<meta http-equiv="Cache-Control" content="no-cache" forua="true"/>
<meta http-equiv="Cache-Control" content="max-age=0" forua="true"/>
<meta http-equiv="Expires" content="0" forua="true"/>
<meta http-equiv="Pragma" content="no-cache" forua="true"/>
</head>
<card id="index" title="文章移动"><p>
<%id= int(request.QueryString("id"))  
  classid= int(request.QueryString("classid"))
        set rs=server.createobject("adodb.recordset")
sql = "select * from sms Where id="&id
rs.open sql,conn,1,3
if rs.eof then 
response.write("操作失败!没有此文章")
else
rs("classid")=classid
rs.update()
response.write("移动文章成功")
end if
rs.close
set rs=nothing
%>
<br/>----------<br/>
<a href="adminsmscl.asp?sid=<%=sid%>&amp;id=<%=classid%>">[文章列表]</a><br/>
<a href="wzclass.asp?sid=<%=sid%>">[文章分类]</a><br/>
<a href="wzcl.asp?sid=<%=sid%>">[文章管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p></card></wml>