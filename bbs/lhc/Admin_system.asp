<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="cnscucsb.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
kyzc=request("kyzc")
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from System where Id=1"
rs.open rspl,myc,1,2
%>
<card id='main' title='<%=ubb(title)%>-网站设置'>
<p align='<%=duiji%>'>
<%

 if logo<>"" then 
    response.write "<img src='"&logo&"' alt='"&ubb(Url)&"'/><br/>"
end if

 if wel<>"" then 
    response.write "下期开奖:"&wel&""
end if

%>
</p>
<p align="left">
<%
if Cstr(Session("yxxecp"))<>"" or Session("cg")<>"" or Session("Counter")="pass_numbers_55556666" then

if kyzc="" then %>
<a href="Admin_system.asp?SessionID=<%=request("SessionID")%>&amp;kyzc=kyaa">修改网站设置</a><br/>
<a href="Admin_system.asp?SessionID=<%=request("SessionID")%>&amp;kyzc=kywap">修改下期开奖</a><br/>--------------<br/>
<%
Elseif kyzc="kyaa" then%>
首页名称:<input name='SystemSiteName<%=minute(now)%><%=second(now)%>' title='项目名称' value='<%=rs("title")%>'/><br/>
网站域名:<input name='SystemUrl<%=minute(now)%><%=second(now)%>' title='项目名称' value='<%=rs("Url")%>'/><br/>
首页图标:<input name='Systemlogo<%=minute(now)%><%=second(now)%>' title='项目名称' value='<%=rs("logo")%>'/><br/>
投注开关:<select name='Systemcpkg<%=minute(now)%><%=second(now)%>' value='<%=rs("cpkg")%>'>
<option value="1">开放</option>
<option value="2">关闭</option>
</select><br/>
对齐方式:<select name='Systemdj<%=minute(now)%><%=second(now)%>' value='<%=rs("duiji")%>'>
<option value="left">居左对齐</option>
<option value="center">居中对齐</option>
<option value="right">居右对齐</option>
</select><br/>
<anchor>确定修改<go href='/BBS/LHC/Admin_system.asp?kyzc=kyaa_cl&amp;SessionID=<%=request("SessionID")%>' method='post' accept-charset='utf-8'>
<postfield name='SystemSiteName' value='$(SystemSiteName<%=minute(now)%><%=second(now)%>)'/>
<postfield name='SystemUrl' value='$(SystemUrl<%=minute(now)%><%=second(now)%>)'/>
<postfield name='Systemlogo' value='$(Systemlogo<%=minute(now)%><%=second(now)%>)'/>
<postfield name='Systemcpkg' value='$(Systemcpkg<%=minute(now)%><%=second(now)%>)'/>
<postfield name='Systemdj' value='$(Systemdj<%=minute(now)%><%=second(now)%>)'/>
</go></anchor><br/>

--------------<br/><a href="Admin_system.asp?SessionID=<%=request("SessionID")%>">返回网站设置</a><br/>

<%
Elseif kyzc="kyaa_cl" then

SystemSiteName=request("SystemSiteName")
SystemUrl=request("SystemUrl")
Systemlogo=request("Systemlogo")
Systemcpkg=request("Systemcpkg")
Systemdj=request("Systemdj")

set rsk=Server.CreateObject("ADODB.Recordset")
rsplk="select * from System where Id=1"
rsk.open rsplk,myc,1,2

if SystemSiteName<>"" then rsk("title")=SystemSiteName
if SystemUrl<>"" then rsk("url")=SystemUrl
if Systemlogo<>"" then rsk("logo")=Systemlogo
if Systemcpkg<>"" then rsk("cpkg")=Systemcpkg
if Systemdj<>"" then rsk("duiji")=Systemdj
rsk.update
'---关闭数据----
rsk.close
set rsk=nothing
%>
网站设置成功！<br/>--------------<br/><a href="Admin_system.asp?SessionID=<%=request("SessionID")%>">返回网站设置</a><br/>

<%
Elseif kyzc="kywap" then%>

设置下期开奖时间.<br/>
时间:<input name='Systemhy<%=minute(now)%><%=second(now)%>' title='项目名称' value='<%=rs("wel")%>'/><br/>
<anchor>修改<go href='/BBS/LHC/Admin_system.asp?kyzc=kywap_net&amp;SessionID=<%=request("SessionID")%>' method='post' accept-charset='utf-8'>
<postfield name='Systemhy' value='$(Systemhy<%=minute(now)%><%=second(now)%>)'/>
</go></anchor><br/>--------------<br/><a href="Admin_system.asp?SessionID=<%=request("SessionID")%>">返回网站设置</a><br/>


<%
Elseif kyzc="kywap_net" then

Systemhy=request("Systemhy")
set rss=Server.CreateObject("ADODB.Recordset")
rspls="select * from System where Id=1"
rss.open rspls,myc,1,2
if Systemhy<>"" then rss("wel")=Systemhy
rss.update
'---关闭数据----
rss.close
set rss=nothing
%>
设置开奖时间成功！<br/>--------------<br/><a href="Admin_system.asp?SessionID=<%=request("SessionID")%>">返回网站设置</a><br/>
<%End if

End if

rs.close
set rs=nothing

myc.close
set myc=nothing
%>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">返回彩票管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
