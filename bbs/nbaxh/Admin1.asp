<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="cnscucsb.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="<%=ubb(title)%>-后台管理" >
<p align='<%=duiji%>'>
<%
 if logo<>"" then 
    response.write "<img src='"&logo&"' alt='"&ubb(Url)&"'/><br/>"
end if
%>
<br/><%=Now%>
</p>
<p align="left">

<%
if Cstr(Session("yxxecp"))<>"" or Session("cg")<>"" or Session("Counter")="pass_numbers_55556666" then

dim ky,kyzc
  ky=request.querystring("ky")
  id=request.querystring("id")
  if ky="" then
	ky=1
  end if
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky="&ky&""
End if
if ky="1" then
set objgbrc=Server.CreateObject("ADODB.Recordset")
ssql6="select * from ckjhm where id=" & id & ""
  objgbrc.open ssql6,myc,1,1
if objgbrc.EOF then
Response.write "没有这场球赛.<br/>"
else
Response.write "" & objgbrc("ds") & "VS" & objgbrc("dx") & "" & objgbrc("sx") & ""
Response.write "<br/>执行判决<br/>"
Response.write "" & objgbrc("ds") & "<a href='Admin1.asp?id=" & objgbrc("id") &"&amp;ps=1&amp;ky=2&amp;SessionID=" & SessionID & "'>胜利</a><br/>"
Response.write "" & objgbrc("dx") & "<a href='Admin1.asp?id=" & objgbrc("id") &"&amp;ps=2&amp;ky=2&amp;SessionID=" & SessionID & "'>胜利</a><br/>"
End if
objgbrc.close
Set objgbrc= Nothing
elseif ky="2" then
set objgbrc1=Server.CreateObject("ADODB.Recordset")
ssql6="select * from ckjhm where id=" & id & ""
  objgbrc1.open ssql6,myc,1,1
  if objgbrc1("tm")="h" then
  Response.write "球赛结束,不要重复开奖<br/>"
else
jss=objgbrc1("jss")
ps=request.querystring("ps")
id=request.querystring("id")
sql="update ckjhm set tm='h',ps=" & ps & " where CStr(id)='" & id & "'"
  myc.execute sql
Response.write "球赛结果<br/>"
Response.write "" & objgbrc1("ds") & "VS" & objgbrc1("dx") & "" & objgbrc1("sx") & "<br/>"
if objgbrc1("ps")=1 then
Response.write "胜利:" & objgbrc1("ds") & ""
else
Response.write "胜利:" & objgbrc1("dx") & ""
End if
set objgbrs=Server.CreateObject("ADODB.Recordset")
ssql="select * from ctm where cstr(idss)='"&id& "'"
objgbrs.open ssql,myc,1,3
if objgbrs.EOF then 
'response.write "错误还没有人买彩票<br/>"
else
objgbrs.movefirst 
randomize

For i=1 to objgbrs.recordcount
id1=objgbrs("ids")
ks1=objgbrs("ks")
ks=clng(ks1*jss)
hm1=objgbrs("hm")
if hm1=ps then
sql="update cpjf set usejf=usejf+'" & ks & "' where CStr(ids)='" & id1 & "'"
  myc.execute sql
sql="update cpjf set tmjf=tmjf+'" & ks & "' where CStr(ids)='" & id1 & "'"
myc.execute sql
sql="update cpjf set czjjf=czjjf+'" & ks & "' where CStr(ids)='" & id1 & "'"
myc.execute sql
if ps=1 then
cl= objgbrc1("ds")
else
cl= objgbrc1("dx")
end if 

ltlyuan="虚拟球赛-第"&id&"期胜利的是【[b]"&cl&"[/b]】,你买中了,你下注金额是[b]"&ks1&"球币x" &jss & "倍=" & ks & "球币[/b]系统已自动给你加了[b]" & ks & "[/b]球币,请查收!这是系统信息,请勿回复!"
gftz()
end if 

objgbrs.Movenext
  if objgbrs.EOF then Exit for
 Next
End if
%>

<%
objgbrs.close
Set objgbrs= Nothing
End if

objgbrc1.close
Set objgbrc1= Nothing
End if

%>
<br/>--------------<br/>
<a href="Admin_system.asp?SessionID=<%=SessionID%>">网站设置</a>-<a href="admin_affiche.asp?SessionID=<%=SessionID%>">公告管理</a><br/>
<a href="Cai_Usegl.asp?SessionID=<%=SessionID%>&amp;Action=delky">删除数据</a>-<a href="Index.Asp?SessionID=<%=SessionID%>">球赛博彩</a><br/>
--------------<br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
报时:<%=time%>
<%else%>
你没有这个权力
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
<%End if
%>
</p></card></wml>
<%
myc.close
set myc=nothing%>