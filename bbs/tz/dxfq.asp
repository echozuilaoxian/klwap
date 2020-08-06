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
<card id="id" title="放弃挑战成功">
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
set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from marry1 where reuseid=" & iduse & " and about='D' order by id desc"
  objgbrs.open ssql,conn,1,1
if objgbrs.eof then
response.write "出错了，本次挑战已经结束！<br/>"
Else
    Set objgbrs1=Server.CreateObject("ADODB.Recordset")
    sql="select fying,usename,id from usereg where id=" & iduse
    objgbrs1.open sql,conn,1,1
id=Request("id")
  Set objgbrss=Server.CreateObject("ADODB.Recordset")
    sqls="select * from marry1 where useid=" & id & " and about='D' and reuseid=" & iduse
    objgbrss.open sqls,conn,1,2 
objgbrss("open")=1
objgbrss("about")="A"
objgbrss.update 
 response.write "本次挑战弃权成功，系统已自动发送信息通知对方了!<br/>" 
            ltlyuan="你向会员:[" & objgbrs1("usename") & "ID:" & objgbrs1("id") & "]发出的『猜大小』挑战,对方以弃权结束！"
            gftz()
objgbrs1.close
set objgbrs1=nothing
objgbrss.close
set objgbrss=nothing
objgbrs.close
set objgbrs=nothing
end if
conn.close
set conn=nothing
%>
-----------<br/>
<a href='index.asp?SessionID=<%=SessionID%>'>[竞技中心]</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>[&#x793E;&#x533A;&#x9996;&#x9875;]</a><br/>
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