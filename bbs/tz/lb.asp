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
<card id="id" title="挑战列表">
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
  ssql="select * from marry1 where reuseid=" & iduse & " and about='J' order by id desc"
  objgbrs.open ssql,conn,1,1
if objgbrs.eof then
response.write "暂时还没有人向你发起挑战<br/>"
Else
response.write "别人对我发起的挑战列表:<br/>"
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
dim id1,num,objgbrs1,ssql1
id1=objgbrs("useid")
num=objgbrs("num")
  set objgbrs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usename,id from usereg where id=" & id1
  objgbrs1.open ssql1,conn
    Response.write (page-1)*jdshow+j & ".<a href='/bbs/reg/useinfo.asp?id=" & id1 & "&amp;SessionID=" & SessionID& "'>" & converttowidebaiti(objgbrs1("usename")) & "ID:" & id1 & "</a>向你发起挑战<br/>下注金额为" & objgbrs("num") & "金币<br/>出拳><a href='1.asp?id=" & id1 & "&amp;SessionID=" & SessionID& "'>剪刀</a>.<a href='2.asp?id=" & id1 & "&amp;SessionID=" & SessionID& "'>石头</a>.<a href='3.asp?id=" & id1 & "&amp;SessionID=" & SessionID& "'>布</a><br/><a href='fq.asp?id=" & id1 & "&amp;SessionID=" & SessionID& "'>放弃本次挑战</a><br/>"
    objgbrs.Movenext
j=j+1
loop
end if

if page*jdshow<objgbrs.recordcount then response.write("<a href='lb.asp?SessionID=" & SessionID& "&amp;page=" & page+1 & "'>下一页</a>")
if page>1 then response.write("<a href='lb.asp?SessionID=" & SessionID& "&amp;page=" & page-1 & "'>上一页</a>")

if page*jdshow<objgbrs.recordcount or page>1 then response.write("<br/>")
if page*jdshow<objgbrs.recordcount then response.write("----------<br/>("& page & "/" & (int(objgbrs.recordcount/jdshow+1)) &"/" & objgbrs.recordcount & ")<br/>")
%>

<%if page*jdshow<objgbrs.recordcount or page>1 then%>
跳到第<input name="gpage<%=minute(now)%><%=second(now)%>" title="页码" type="text" format="*N" emptyok="true" size="3" value="<%response.write(page+1)%>" maxlength="3"/>页
<anchor>[GO]
    <go href="lb.asp?SessionID=<%=SessionID%>" accept-charset='utf-8'>
        <postfield name="page" value="$(gpage<%=minute(now)%><%=second(now)%>)"/>
    </go>
</anchor><br/>
<%
objgbrs1.close
set objgbrs1=nothing
objgbrs.close
set objgbrs=nothing
conn.close
set conn=nothing
end if
%>
-----------<br/>
<a href='index.asp?SessionID=<%=SessionID%>'>[竞技中心]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[&#x793E;&#x533A;&#x9996;&#x9875;]</a><br/>
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