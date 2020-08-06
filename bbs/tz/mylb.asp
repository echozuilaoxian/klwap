<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="我发起的挑战记录">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if 
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="93"
lasttls
dim objgbrs,ssql
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from marry1 where useid=" & iduse & " and [about]='J' order by id desc"
  objgbrs.open ssql,conn,1,1
if objgbrs.eof then
response.write "你暂时还没有对别人发起『剪刀石头布』挑战的记录!<br/>"
Else
dim page,maxpage,jdshow
jdshow=CLng(Session("showjd"))
  page=CLng(Request("page"))
 if page<1 Or page="" then page=1
maxpage=int((objgbrs.recordcount-1)/jdshow)+2
if page>maxpage then page=maxpage
objgbrs.Move((page-1)*jdshow)
dim j
j=1
do while ((not objgbrs.EOF) and j <=cint(jdshow))
id2=objgbrs("reuseid")
    Response.write (page-1)*jdshow+j & "."
 dim rs2,ssql2
  set rs2=Server.CreateObject("ADODB.Recordset")
  ssql2="select usename from [usereg] where [id]=" & id2 & " order by id desc"
  rs2.open ssql2,conn,1,1
	if not rs2.eof then
    Response.write "向>><a href='/bbs/reg/useinfo.asp?id=" & id2 & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(rs2("usename")) & "</a>发起『剪刀石头布』的挑战!"
	end if
	If objgbrs("open")=0 Then Response.write "[未回应]<br/>"
	If objgbrs("open")=1 Then Response.write "[已回应]<br/>"
    objgbrs.Movenext
j=j+1
loop
end if

if page*jdshow<objgbrs.recordcount then response.write("<a href='mylb.asp?SessionID=" & SessionID & "&amp;page=" & page+1 & "'>下一页</a>")
if page>1 then response.write("<a href='mylb.asp?SessionID=" & SessionID & "&amp;page=" & page-1 & "'>上一页</a>")

if page*jdshow<objgbrs.recordcount or page>1 then response.write("<br/>")
if page*jdshow<objgbrs.recordcount then response.write("----------<br/>("& page & "/" & (int(objgbrs.recordcount/jdshow+1)) &"/" & objgbrs.recordcount & ")<br/>")
%>

<%if page*jdshow<objgbrs.recordcount or page>1 then%>
跳到第<input name="gpage<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" value="<%response.write(page+1)%>" maxlength="3"/>页
<anchor>[GO]
    <go href="mylb.asp?SessionID=<%=SessionID%>" accept-charset='utf-8'>
        <postfield name="page" value="$(gpage<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor><br/>
<%
rs2.close
set rs2=nothing
objgbrs.close
set objgbrs=nothing
conn.close
set conn=nothing
end if
%>
-----------<br/>
<a href='lb0.asp?SessionID=<%=SessionID%>'>[回上一级]</a><br/>
<a href='index.asp?SessionID=<%=SessionID%>'>[竞技中心]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[&#x793E;&#x533A;&#x9996;&#x9875;]</a><br/>
-----------<br/>
&#x73B0;&#x5728;&#x65F6;&#x95F4;:<%
dim distime
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%><br/>
</p>
</card>
</wml>