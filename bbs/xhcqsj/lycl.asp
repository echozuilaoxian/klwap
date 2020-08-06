<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>

<%
hotid=request("hotid")
Server.ScriptTimeout=9999
iduse=Session("useid")
lasttlls=540
lasttls
mmwt=request("mmwt")
mmwt=untowide(mmwt)
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?mmwt="&mmwt&"&amp;hotid="&hotid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<card id="hotpk" title="唇枪舌剑-留言板"  ontimer='index1.asp?SessionID=<%=SessionID%>&amp;hotid=<%=hotid%>'><timer value='20'/><p>
<%
set objgbrs1=Server.CreateObject("ADODB.Recordset")
       ssql="select id,usename from usereg where CStr(id)='" & iduse & "'"
       objgbrs1.open ssql,conn
lname=objgbrs1("usename")
objgbrs1.close
Set objgbrs1= Nothing
  set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id,usename from usereg where CStr(id)='" &hotid & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误,该号不存在1"
else

if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?mmwt="&mmwt&"&amp;hotid="&hotid&""
End if
Response.write "<a href='index.asp?SessionID="&SessionID&"'>返回我的游戏</a>>>>><a href='index1.Asp?hotid=" &hotid & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(objgbrs("usename"))&"</a><br/>"

if mmwt="" then 
Response.write "内容不能为空！<br/>返回<a href='index1.Asp?hotid=" &hotid & "&amp;SessionID="&SessionID&"'>"&objgbrs("usename")&"</a>的游戏<br/></p></card></wml>"
response.end
end if
If (len(mmwt))>50  Then
Response.write "留言内容不能超过50字符！<br/>返回<a href='index1.Asp?hotid=" &hotid & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(objgbrs("usename"))&"</a>的游戏<br/></p></card></wml>"
    response.end
  End if
Response.write ""&objgbrs("usename")&"的留言板<br/>"

  set objgbrsd=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
   ssql="select  * from sjly  order by id desc"
  objgbrsd.open ssql,conn,1,2
objgbrsd.addnew
if mmwt<>"" then objgbrsd("lytxt")=mmwt
objgbrsd("ids")=iduse
objgbrsd("idid")=hotid
objgbrsd("lname")=lname
objgbrsd.update
objgbrsd.close
	set objgbrsd=nothing
Response.write "成功留言了<br/>返回<a href='index1.Asp?hotid=" &hotid & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(objgbrs("usename"))&"</a>的游戏<br/>"

end if

Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/klwll.asp"-->
</p></card></wml>


