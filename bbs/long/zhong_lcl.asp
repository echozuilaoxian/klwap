<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<card id="hotpk" title="果园留言"><p>
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
mmwt=request("mmwt")
mmwt=untowide(mmwt)
'--------------------
'宠物PK

'结束
'-------------------
set objgbrs1=Server.CreateObject("ADODB.Recordset")
       ssql="select id,usename from usereg where CStr(id)='" & iduse & "'"
       objgbrs1.open ssql,conn
lname=objgbrs1("usename")
objgbrs1.close
Set objgbrs1= Nothing
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
Response.write "<a href='index.asp?SessionID="&SessionID&"'>返回我的果园</a><br/><img src='img/logo.gif' alt=''/><br/>"

if mmwt="" then 
Response.write "内容不能为空！<br/>返回<a href='index1.Asp?hoid="&hoid&"&amp;SessionID="&SessionID&"'>"&objgbrs("usename")&"</a>的果园<br/></p></card></wml>"
response.end
end if
If (len(mmwt))>30  Then
Response.write "留言内容不能超过30字符！<br/>返回<a href='index1.Asp?hoid=" &hoid & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(objgbrs("usename"))&"</a>的果园<br/></p></card></wml>"
    response.end
  End if
if CStr(hoid)=CStr(Session("useid")) then
Response.write "自己不用给自己留言吧！<br/>返回<a href='index1.Asp?hoid=" &hoid & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(objgbrs("usename"))&"</a>的果园<br/></p></card></wml>"
    response.end
  End if
Response.write ""&objgbrs("usename")&"的果园留言板<br/>"

  set objgbrsd=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
   ssql="select  * from hualy  order by id desc"
  objgbrsd.open ssql,conn,1,2
objgbrsd.addnew
if mmwt<>"" then objgbrsd("lytxt")=mmwt
objgbrsd("ids")=iduse
objgbrsd("idid")=hoid
objgbrsd("lname")=lname
objgbrsd.update
objgbrsd.close
	set objgbrsd=nothing
sql="update hua set huaf=huaf+1  where CStr(ids)='" & hoid & "'" 				
                conn.execute sql
Response.write "留言成功<br/>返回<a href='index1.Asp?hoid=" &hoid & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(objgbrs("usename"))&"</a>的果园<br/>"

end if

Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/long/klwll.asp"-->
</p></card></wml>


