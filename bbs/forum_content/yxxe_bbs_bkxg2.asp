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
<card id="main" title="编辑版块" >
<p>
<%
SessionID=request.querystring("SessionID")
ForumID=request("ForumID")
id=request("id")
txt=request("txt")
logo=request("logo")
if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("cw1")<>"" or Session("cg")<>"" or Session("bzbz")=id or Session("Counter")="pass_numbers_55556666" then
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&id
rs.open rspl,conn,1,2
rs("shuo")=txt
if logo<>"" then rs("ltlogo")=logo
rs.update
'---关闭数据----

%>
成功编辑名为<u>[<%=rs("name")%>]</u>的版块
<% 
end if
    Response.Write "<br/>-------------<br/>"
response.write "<anchor>返回上级<prev/></anchor><br/>"
response.write "<a href='/BBS/Forum_content/Contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & nam & "</a><br/>"
response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/><a href='/index.asp?SessionID=" & SessionID & "'>返回网站首页</a><br/>"%>
<small><% 
rs.close
set rs=nothing

dim kkwap,distime
kkwap=""
if Month(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Month(date)&"月"
if Day(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Day(date)
response.write kkwap
Response.write"日("
Response.write right(""&WeekDayName(DatePart("w",Now)),1)
Response.write")"
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%></small>
</p></card></wml>