<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
 <head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="编辑版块" >
<p>
<%
ForumID=request("ForumID")
nam=request("nam")
idi=request("idi")
txt=request("txt")
xx=request("xx")
dy=request("dy")
did=request("did")
jrqx=request("jrqx")
gz=request("gz")
ml=request("ml")
logo=request("logo")
tl=request("tl")
jb=request("jb")
hfsj=request("hfsj")
ftsj=request("ftsj")
yc=request("yc")
id=request("id")
brr=request("brr")
if ml="" then ml="0"
if tl="" then tl="0"
if gz="" then gz="0"
if jb="" then jb="0"
if jrqx="" then jrqx="0"
if brr="" then brr="0"
lx=request("lx")
if lx="" then lx="0"
did=request("did")
if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("cw1")<>"" or Session("cg")<>"" or Session("bzbz")=id or Session("Counter")="pass_numbers_55556666" then
if nam="" then response.redirect "bbs_bksz.asp?ForumID="&request("id")&"&cw=1&SessionID="&request("SessionID")&""
if idi="" then response.redirect "bbs_bksz.asp?ForumID="&request("id")&"&cw=2&SessionID="&request("SessionID")&""
if id="" then response.redirect "bbs_bksz.asp?ForumID="&request("id")&"&cw=3&SessionID="&request("SessionID")&""
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&id
rs.open rspl,conn,1,2
if nam<>"" then rs("name")=nam
rs("shuo")=txt
if logo<>"" then rs("ltlogo")=logo
if did<>"" then rs("did")=did
if idi<>"" then rs("pid")=idi
if hfsj<>"" then rs("hfsj")=hfsj
if ftsj<>"" then rs("ftsj")=ftsj
if jrqx<>"" then rs("qx")=jrqx
if gz<>"" then rs("gongzuo")=gz
if ml<>"" then rs("ml")=ml
if tl<>"" then rs("titi")=tl
if jb<>"" then rs("jin")=jb
if brr<>"" then rs("brr")=brr
if yc<>"" then rs("yc")=yc
rs.update
'---关闭数据----
rs.close
set rs=nothing

%>
成功编辑名为<u>[<%=nam%>]</u>的版块
<% 
end if
    Response.Write "<br/>-------------<br/>"
response.write "<anchor>返回上级<prev/></anchor><br/>"
response.write "<a href='/BBS/Forum_content/Contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & nam & "</a><br/>"
response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/><a href='/index.asp?SessionID=" & SessionID & "'>返回网站首页</a><br/>"%>
<small><% 
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