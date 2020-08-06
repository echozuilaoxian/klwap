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
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="屏蔽字符设置" ><p>
网友上传文章字符限制
<br/>-----------<br/>
<%If Request("SubmitFlag") <> "" Then
dim smsxx,smsts
smsxx=request.form("smsxx")
smsts=request.form("smsts")
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from xxxx"
rs.open rspl,conn,1,2
if smsts<>"" then rs("smsts")=smsts
if smsxx<>"" then rs("smsxx")=smsxx
rs.update
rs.close
set rs=nothing
%>
屏蔽设置成功<br/>
<%
else
set rs1=Server.CreateObject("ADODB.Recordset")
rspl="select * from xxxx"
rs1.open rspl,conn,1,2
%>
屏蔽字符内容(用|格开):<br/>
<input name='smsxx<%=minute(now)%><%=second(now)%>' title='内容' value='<%=ubb(rs1("smsxx"))%>'/><br/>
错误提示内容:<br/>
<input name='smsts<%=minute(now)%><%=second(now)%>' title='错误提示' value='<%=ubb(rs1("smsts"))%>'/><br/>
<anchor>确定修改<go href='wzpb.asp?SubmitFlag=true&amp;sid=<%=sid%>' method='post' accept-charset='utf-8'> 
<postfield name='smsxx' value='$(smsxx<%=minute(now)%><%=second(now)%>)'/>
<postfield name='smsts' value='$(smsts<%=minute(now)%><%=second(now)%>)'/>
</go></anchor>
<%rs1.close
set rs1=nothing
conn.close
set conn=nothing
end if%>
<br/>----------<br/>
<a href="wzcl.asp?sid=<%=sid%>">[文章管理]</a><br/>
<a href="../index.asp?sid=<%=sid%>">[后台管理]</a>
</p></card></wml>