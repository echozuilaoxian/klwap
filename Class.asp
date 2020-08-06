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
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<!-- #include file="conn.asp" -->
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%dim rs1,sql1,id
id=request.QueryString("class")
Set rs1 = Server.CreateObject("ADODB.Recordset")
sql1="Select * from class where classid="&id
rs1.open sql1,conn,1,1 
if not rs1.eof then
classname=rs1("class")
opera=rs1("opera")
end if
rs1.close
set rs1=nothing
%>
<card title="<%=classname%>"><p>
<%
if opera=2 then
browsers=Lcase(Left(Request.ServerVariables("HTTP_USER_AGENT"),4))
if browsers="oper"  or  browsers="winw"  or  browsers="wapi" or browsers="mc21" or browsers="up.b" or browsers="upg1" or browsers="upsi" or browsers="qwap" or browsers="jigs" or browsers="java" or browsers="alca" or browsers="wapj" or browsers="cdr/" or browsers="nec-" or browsers="fetc" or browsers="r380" or browsers="winw" or browsers="mozi" or browsers="mozi" or browsers="m3ga" then response.redirect"Opera.asp"
end if
Dim rs,i,p	'定义变量
set rs = server.createobject("adodb.recordset")
	sql="select * from class where parent="&id&" and active=0 order by pid asc"
	rs.open sql,conn,1,1
if rs.eof then 
response.write("栏目建设中...<br/>")
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
<a href='<%=rs("url") %>?hk=<%=hk%>'><%=ubb(rs("class"))%></a>
<%elseif rs("lx")="7" then%>
<a href='soft.asp?cid=<%=rs("lid")%>&amp;hk=<%=hk%>'><%=ubb(rs("class"))%></a>
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
conn.close
set conn=nothing
%>
</p>
</card>
</wml>