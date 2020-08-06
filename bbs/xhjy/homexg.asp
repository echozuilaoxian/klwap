<% @LANGUAGE="VBScript" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjnames.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
</head>
<card title="修改家园资料"><p align="left">
<%session.abandon%>
<%
Server.ScriptTimeout=999
iduse=Session("useid")
fkname=Session("ltname")
id=request("id")
yi=request("yi")
if Session("zh")="abcyi" then
 Response.write " 请您<a href='/BBS/UseLogin.asp?SessionID="&SessionID&"'>登陆/注册</a><br/>"
else
Response.write " <a href='/bbs/reg/useinfo.asp?id="&iduse&"&amp;SessionID="&SessionID&"'><img src='/bbs/xhjy/id.gif' alt=''/>"& iduse &"</a>"
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'><img src='/bbs/xhjy/xx.gif' alt=''/>信息("&lycount&")</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?"
else
Response.write " <a href='/bbs/public/gygl.asp?SessionID="&SessionID&"'><img src='/bbs/xhjy/jy.gif' alt=''/>地盘</a><br/>"
end if
end if
if yi="" then
       set obj=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where id=" & iduse & ""
       obj.open ssql,conn
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select * from jyhome where jyid=" & iduse & ""
       objgbrs.open ssql,conn
if objgbrs.eof then
response.write "错误！你没有开通家园.<br/>"
else
response.write "家园名称:<input type='text' name='abcyi1' maxlength='12' value='" & objgbrs("jyname") & "'/><br/>家园迎词:<input type='text' name='abcyi2' maxlength='12' value='" & objgbrs("jyhy") & "'/><br/>家园简介:<input type='text' name='abcyi3' maxlength='20' value='" & objgbrs("jyjj") & "'/><br/>家园公告:<input type='text' name='abcyi4' maxlength='20' value='" & objgbrs("jygg") & "'/><br/><anchor>确定修改<go method='post' href='homexg.asp?yi=zong1&amp;SessionID="&SessionID&"'><postfield name='abcyi1' value='$(abcyi1)'/><postfield name='abcyi2' value='$(abcyi2)'/><postfield name='abcyi3' value='$(abcyi3)'/><postfield name='abcyi4' value='$(abcyi4)'/></go></anchor><br/>"
end if
end if
if yi="zong1" then
abcyi1=request("abcyi1")
abcyi2=request("abcyi2")
abcyi3=request("abcyi3")
abcyi4=request("abcyi4")
 sql="update jyhome set jyname='" & abcyi1 & "',jyhy='" & abcyi2 & "',jyjj='" & abcyi3 & "',jygg='" & abcyi4 & "' Where jyid=" & iduse & ""
  conn.Execute(sql)
  Application.Unlock
response.write "修改成功.<br/>"
end if
Response.write "<a href='home.asp?id=" &iduse & "&amp;SessionID="&SessionID&"'>我的家园</a>>修改资料<br/>"
%>

</p></card></wml>