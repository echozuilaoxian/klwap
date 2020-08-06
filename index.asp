<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!-- #include file="conn.asp" -->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<link rel="Shortcut Icon" href='/favicon.ico'/>
<%
dim sqlh,rsh
Set Rsh = Server.CreateObject("Adodb.Recordset")
Sqlh = "SELECT * FROM admin"
Rsh.Open Sqlh,conn,1,1
if not (rsh.bof and rsh.eof)  then 
%>
<card id="index" title="<%=rsh("title")%>">
<p align="<%=rsh("const")%>">
<%if rsh("logo")<>"" then%>
<img src="<%=rsh("logo")%>" alt='<%=rsh("title")%>'/><br/>
<%end if%>
<%end if%>
<%if rsh("op")=1 then%>
<%browsers=Lcase(Left(Request.ServerVariables("HTTP_USER_AGENT"),4))
if browsers="oper"  or  browsers="winw"  or  browsers="wapi" or browsers="mc21" or browsers="up.b" or browsers="upg1" or browsers="upsi" or browsers="qwap" or browsers="jigs" or browsers="java" or browsers="alca" or browsers="wapj" or browsers="cdr/" or browsers="nec-" or browsers="fetc" or browsers="r380" or browsers="winw" or browsers="mozi" or browsers="mozi" or browsers="m3ga" then response.redirect"Opera.asp"
end if
%>
<%if myid<>0 then%>

<%
end if%>


<%
Dim rs,i	'定义变量
set rs = server.createobject("adodb.recordset")
	sql="select * from class where parent=0 and active=0 order by pid asc"
	rs.open sql,conn,1,1
if rs.eof then 
response.write("网站建设中。。<br/>")
else
rs.Move(0)
dim j
j=1
do while not rs.EOF %>
<%if rs("lx")="0" then%>
<a href='class.asp?class=<%=rs("classid")%>&amp;hk=<%=hk%>'><%=ubb(rs("class"))%></a>
<%elseif rs("lx")="1" then%>
<a href='list.asp?class=<%=rs("lid")%>&amp;hk=<%=hk%>'><%=ubb(rs("class"))%></a>
<%elseif rs("lx")="2" then%>
<%=ubb1(rs("class"))%>
<%elseif rs("lx")="3" then%>
<img src="<%=ubb1(rs("img"))%>" alt="<%=ubb(rs("class"))%>"/>
<%elseif rs("lx")="4" then%>
<a href="<%=ubb(rs("url"))%>?hk=<%=hk%>"><%=ubb(rs("class"))%></a>
<%elseif rs("lx")="5" then%>
<%=usb(rs("class"))%>
<%elseif rs("lx")="6" then%>
<a href='<%=rs("url")%>?hk=<%=hk%>'><%=ubb(rs("class"))%></a>
<%elseif rs("lx")="7" then%>
<a href='soft.asp?cid=<%=rs("lid") %>&amp;hk=<%=hk%>'><%=ubb(rs("class"))%></a>
<%elseif rs("lx")="8" then%>
<!-- #include file="gg.asp" -->
<%elseif rs("lx")="10" then%>
<%=ubb1(rs("class"))%><br/><!-- #include file="zxwz.asp" -->
<%elseif rs("lx")="11" then%>
<%=ubb1(rs("class"))%><br/><!-- #include file="zrwz.asp" -->
<%elseif rs("lx")="12" then%>
<%=ubb1(rs("class"))%><br/><!-- #include file="sjwz.asp" -->
<%elseif rs("lx")="13" then%>
<%=ubb1(rs("class"))%><br/><!-- #include file="zxwj.asp" -->
<%elseif rs("lx")="14" then%>
<%=ubb1(rs("class"))%><br/><!-- #include file="zrwj.asp" -->
<%elseif rs("lx")="15" then%>
<%=ubb1(rs("class"))%><br/><!-- #include file="sjwj.asp" -->
<%elseif rs("lx")="16" then%>
<%=ubb1(rs("class"))%><br/><!-- #include file="zxtz.asp" -->
<%elseif rs("lx")="17" then%>
<%=ubb1(rs("class"))%><br/><!-- #include file="zrtz.asp" -->
<%elseif rs("lx")="18" then%>
<%=ubb1(rs("class"))%><br/><!-- #include file="sjtz.asp" -->
<%end if%>
<%if rs("br")="1" then%><br/>
<%end if%>
<%
rs.MoveNext
j=j+1
loop
end if
rs.close
set rs=nothing
%>
<%if rsh("links")=1 then
linknum=rsh("linknum")%>
<!-- #include file="link/Dtlink.asp" --><br/>

<%end if%>
<%if rsh("Copyright")<>"" then%>
<%=rsh("Copyright")%>
<%end if
rsh.close
set rsh=nothing
conn.close
set conn=nothing
%><br/><small>您的IP：<% =Request.ServerVariables("REMOTE_ADDR")%><br/><%
ua=Request.ServerVariables("HTTP_USER_AGENT")
if instr(ua,"Opera")>0 then
Response.Write "模拟器访问,隐私内容自动屏蔽!<br/>"
%>
<% else %>
<%
end if
%>
<b>本站成立:<%response.write DateDiff("d",#2009-11-17#,date())%>天</b>
<br/><img src='/bs.gif' alt=''/><%=Month(Now)&"月"&Day(Now)&"日("&right(WeekDayName(DatePart("w",Now)),1)&")"&FormatDateTime(Now,vbshortTime)%></small>
</p>
</card>
</wml>