<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<card id="hotpk" title="果园-留言板"><p>
<%
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?m=m"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
hotid=request("hotid")
Server.ScriptTimeout=9999
iduse=Session("useid")
wapgywz="我的果园"
wapgydz=Request.ServerVariables("PATH_INFO")&"?"
lasttlls=525
lasttls
hoid=request("hoid")


'--------------------
'宠物PK

'结束
'-------------------
  set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id,usename from usereg where CStr(id)='" &hoid & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误,该号不存在"
else

if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?bd=&amp;"
End if
Response.write "<a href='index.asp?SessionID="&SessionID&"'>我的果园</a>〓<a href='index1.Asp?hoid=" &hoid & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(objgbrs("usename"))&"果园</a><br/><img src='img/logo.gif' alt=''/><br/>"


Response.write ""&objgbrs("usename")&"的果园留言板<br/>"
dim hd,objgbrsd
  set objgbrsd=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
   ssql="select  * from hualy where idid="& hoid &" and kkys<1 order by id desc"
  objgbrsd.open ssql,conn,1,1
if objgbrsd.eof then
   Response.write "最近还没有留言......."
Else
objgbrsd.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrc.PageCount then pages=objgbrc.PageCount
objgbrsd.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrsd.PageSize 
 bihaocont=bihaocont+1
Response.write ""&bihao+bihaocont&":"&converttowidebaiti (objgbrsd("lytxt"))&"<br/><a href='index1.Asp?hoid=" &objgbrsd("ids")& "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(objgbrsd("lname"))&"</a>[" &objgbrsd("times")& "]<br/>"
objgbrsd.Movenext
if objgbrsd.EOF then Exit for
 Next
End if
If pages<objgbrsd.PageCount then
Response.Write "<a href='hualy.asp?hoid=" &hoid & "&amp;pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "|" & "<a href='hualy.asp?hoid=" &hoid & "&amp;pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrsd.PageCount>1 then
response.write "(" & pages & "/" & objgbrsd.PageCount & ")<br/>"
End if

	objgbrsd.close
	set objgbrsd=nothing
end if

Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/long/klwll.asp"-->
</p></card></wml>


