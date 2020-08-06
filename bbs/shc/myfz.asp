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
<card id="card1" title="房子转让"><p>房子转让<br/>---------<br/>
<%
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select fanj from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?"
End if
if objgbrs("fanj")=0 then
response.write "你没有房子"
end if
if objgbrs("fanj")=1 then
response.write "<img src='/bbs/gift/68.jpg' awapzmya='.'/><br/><a href='zr1.asp?fanj=1;ampSessionID=" & SessionID & "'>转让单身公寓</a>"
end if
if objgbrs("fanj")=2 then
response.write "<img src='/bbs/gift/69.jpg' awapzmya='.'/><br/><a href='zr2.asp?fanj=2;ampSessionID=" & SessionID & "'>转让帝豪庭苑</a>"
end if
if objgbrs("fanj")=3 then 
response.write "<img src='/bbs/gift/70.jpg' awapzmya='.'/><br/><a href='zr3.asp?fanj=3;ampSessionID=" & SessionID & "'>转让彩色家园</a>"
end if
if objgbrs("fanj")=4 then 
response.write "<img src='/bbs/gift/71.jpg' awapzmya='.'/><br/><a href='zr4.asp?fanj=4;ampSessionID=" & SessionID & "'>转让环山套房</a>"
end if
if objgbrs("fanj")=5 then
response.write "<img src='/bbs/gift/72.jpg' awapzmya='.'/><br/><a href='zr5.asp?fanj=5;ampSessionID=" & SessionID & "'>转让海湾别墅</a>"
end if
if objgbrs("fanj")=6 then
response.write "<img src='/bbs/gift/64.jpg' awapzmya='.'/><br/><a href='zr6.asp?fanj=6;ampSessionID=" & SessionID & "'>转让赏月台</a>"
end if
if objgbrs("fanj")=7 then 
response.write "<img src='/bbs/gift/65.jpg' awapzmya='.'/><br/><a href='zr7.asp?fanj=7;ampSessionID=" & SessionID & "'>转让观月台</a>"
end if
if objgbrs("fanj")=8 then 
response.write "<img src='/bbs/gift/66.jpg' awapzmya='.'/><br/><a href='zr8.asp?fanj=8;ampSessionID=" & SessionID & "'>转让许愿台</a>"
end if
if objgbrs("fanj")=9 then
response.write "<img src='/bbs/gift/67.jpg' awapzmya='.'/><br/><a href='zr9.asp?fanj=9;ampSessionID=" & SessionID & "'>转让摘月台</a>"
end if

Response.write "<br/><a href='index.asp?SessionID=" & SessionID & "'>回交易市场</a><br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>回我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing

%>