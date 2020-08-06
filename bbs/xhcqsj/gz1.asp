<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<card id="hotpk" title="唇枪舌剑-咬好友"><p>
<%
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
      Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?hotid="&request("hotid")&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=9999
iduse=Session("useid")
lasttlls=540
lasttls
hotid=request("hotid")
set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id,usename,usejf,usesex from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误,该号不存在"
end if
if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?hotid=" & hotid & ""
End if
if objgbrs("usejf")<10000  then 
                 %>
您的金币不够，进入游戏PK必须要10000金币以上<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<%
Response.Write "</p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
response.end
end if
set rs9=Server.CreateObject("ADODB.Recordset")
       ssql="select * from scsj where CStr(ids)='" & iduse & "'"
       rs9.open ssql,conn,1,1
if rs9.eof then
  Call Error("你还没有加入游戏！")
end if
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from scsj where CStr(ids)='" &hotid & "'"
       rs8.open ssql,conn,1,1
if rs8.eof then
  Call Error("TA还没有加入游戏！")
end if
Response.write "你要怎样进攻TA的嘴唇?<br/>=============<br/>"
if rs9("zhong")="y" then dong="咬一口" 
if rs9("zhong")="l" then dong="抓一抓" 
if rs9("zhong")="x" then dong="捏一把" 
zuj=rs8("zuj")
Response.write "<a href='gzcl.asp?jb=1&amp;hotid="&hotid&"&amp;SessionID="&SessionID&"'>温柔的"&dong&"("&zuj&"金币)</a><br/>"
Response.write "<a href='gzcl.asp?jb=2&amp;hotid="&hotid&"&amp;SessionID="&SessionID&"'>狂热的"&dong&"("&zuj+100&"金币)</a><br/>"
Response.write "<a href='gzcl.asp?jb=3&amp;hotid="&hotid&"&amp;SessionID="&SessionID&"'>凶狠的"&dong&"("&zuj+200&"金币)</a><br/>"
Response.write "<a href='gzcl.asp?jb=4&amp;hotid="&hotid&"&amp;SessionID="&SessionID&"'>贪恋的"&dong&"("&zuj+300&"金币)</a><br/>"
Response.write "<a href='gzcl.asp?jb=5&amp;hotid="&hotid&"&amp;SessionID="&SessionID&"'>深情的"&dong&"("&zuj+400&"金币)</a>"
rs8.close
Set rs8= Nothing
rs9.close
Set rs9= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/klwll.asp"-->
</p></card></wml>


