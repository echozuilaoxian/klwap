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
<card id="main" title="社区设计-编辑项目" >
<p>
<%
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from ltsy where Id=1"
rs.open rspl,conn,1,2
%>
社区名称:<input name='SystemSiteName<%=minute(now)%><%=second(now)%>' title='项目名称' value='<%=rs("title")%>'/><br/>
社区域名:<input name='SystemUrl<%=minute(now)%><%=second(now)%>' title='项目名称' value='<%=rs("Url")%>'/><br/>
社区图标:<input name='Systemlogo<%=minute(now)%><%=second(now)%>' title='项目名称' value='<%=rs("logo")%>'/><br/>
社区迎词:<input name='Systemhy<%=minute(now)%><%=second(now)%>' title='项目名称' value='<%=rs("wel")%>'/><br/>
最新帖数:<input name='Systetop<%=minute(now)%><%=second(now)%>' title='项目名称' value='<%=rs("top")%>'/><br/>
对齐方式:<select name='Systemdj<%=minute(now)%><%=second(now)%>' value='<%=rs("duiji")%>'>
<option value="left">居左对齐</option>
<option value="center">居中对齐</option>
<option value="right">居右对齐</option>
</select><br/>
<anchor>确定修改<go href='yxxe_bbs_xgszcl.asp?adminmid=<%=request("adminmid")%>' method='post' accept-charset='utf-8'>
<postfield name='SystemSiteName' value='$(SystemSiteName<%=minute(now)%><%=second(now)%>)'/>
<postfield name='SystemUrl' value='$(SystemUrl<%=minute(now)%><%=second(now)%>)'/>
<postfield name='Systemlogo' value='$(Systemlogo<%=minute(now)%><%=second(now)%>)'/>
<postfield name='Systemhy' value='$(Systemhy<%=minute(now)%><%=second(now)%>)'/>
<postfield name='Systetop' value='$(Systetop<%=minute(now)%><%=second(now)%>)'/>
<postfield name='Systemdj' value='$(Systemdj<%=minute(now)%><%=second(now)%>)'/>
</go></anchor><br/>
-----------<br/>
<a href="yxxe_bbs_sz.asp?adminmid=<%=request("adminmid")%>">返回社区设置</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
报时:<%=time%>
</p></card></wml>