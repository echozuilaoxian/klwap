<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>

<%Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
gfdsa=Session("ltname")
lasttlls=524
lasttls
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
      else
        Session("ltlybz")=""
    End if
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?0=0"
End if
set rxs=Server.CreateObject("ADODB.Recordset")
rsxQL="select * from dahaa where cstr(ids)='"&iduse& "'"
rxs.open rsxQL,conn,1,2
if rxs.recordcount<1 then
rxs.addnew
rxs("ids")=iduse
rxs.update
end if
       
%>
<card id='main' title='疯狂吹牛大王'>
<p align='left'>
<img src='logo.gif' alt=''/><br/>
<%
Response.write "欢迎您<b>" & converttowidebaiti(gfdsa) & "</b>!<br/>---------------<br/>"
set objgbrc1=Server.CreateObject("ADODB.Recordset")
ssql6="select * from usereg where cstr(id)=" &iduse & ""
  objgbrc1.open ssql6,conn,1,1
usejf=objgbrc1("usejf")

%>
<%
Response.write "战绩:胜:" &rxs("daha1")& "负:" &rxs("daha2")& ""
Response.write "<br/>盈利" &rxs("daha3")& ""
 rxs.Close
	Set rxs=Nothing
objgbrc1.close
Set objgbrc1= Nothing
conn.close
set conn=nothing
%>

<br/>---------------<br/><a href='index.Asp?SessionID=<%=SessionID%>'>返回吹牛</a>.<a href="/bbs/SCYL.asp?SessionID=<%=SessionID%>">返回赌场</a><br/>
<a href="/BBS/public/gygl.asp?SessionID=<%=SessionID%>">我的地盘</a>.<a href="/BBS/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
<% 
dim kkwap,distime
kkwap=""
if Month(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Month(date)&"&#x6708;"
if Day(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Day(date)
response.write kkwap
Response.write"&#x65E5;("
Response.write right(""&WeekDayName(DatePart("w",Now)),1)
Response.write")"
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%><br/>
</p></card></wml>