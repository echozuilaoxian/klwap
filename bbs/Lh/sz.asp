<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
kyzc=request("kyzc")
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from ltsy where Id=1"
rs.open rspl,conn,1,2
%>
<card id="main" title="设置下期开奖"><p>
<%
if Cstr(Session("yxxezb"))<>"" or Cstr(Session("yxxexc"))<>"" or Session("Counter")="pass_numbers_55556666" then

if kyzc="" then %>
设置下期开奖<br/>
--------------<br/>
开奖时间:<input name='Systemhy<%=minute(now)%><%=second(now)%>' title='项目名称' value='<%=rs("wel")%>'/><br/>
<anchor>确定修改<go href='/BBS/LHC/sz.asp?kyzc=ok&amp;SessionID=<%=request("SessionID")%>' method='post' accept-charset='utf-8'>
<postfield name='Systemhy' value='$(Systemhy<%=minute(now)%><%=second(now)%>)'/>
</go></anchor><br/>
<%
rs.close
set rs=nothing

Elseif kyzc="ok" then
Systemhy=request("Systemhy")

set rss=Server.CreateObject("ADODB.Recordset")
rspls="select * from ltsy where Id=1"
rss.open rspls,conn,1,2
if Systemhy<>"" then rss("wel")=Systemhy
rss.update
'---关闭数据----
rss.close
set rss=nothing

%>
设置成功！<br/>
<%End if
End if
conn.close
set conn=nothing
%>
--------------<br/>
<a href="/BBS/LHC/kjhm.Asp?SessionID=<%=request("SessionID")%>">返回彩票管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
报时:<%=time%>
</p></card></wml>
