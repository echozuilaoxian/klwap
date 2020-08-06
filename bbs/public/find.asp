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
<card id="card1" title="缘份交友">
<p align="left">相遇是一中缘份.....<br/>--------------<br/>

<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
%>
<a href='/bbs/public/findcl2.asp?SessionID=<%=SessionID%>'>搜帅哥</a> <a href='/bbs/public/findcl3.asp?SessionID=<%=SessionID%>'>搜美女</a>
<br/>按ID查找>>
<br/>ID:<input type='text' name='namid' format="*N" size="5"/>
<br/><anchor>提 交<go method='post' href='/bbs/public/findcl.asp?SessionID=<%=SessionID%>'><postfield name='namid' value='$(namid)'/></go></anchor>
<%
if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("Counter")="pass_numbers_55556666" then%>
<br/>按手机号查找>>
<br/>号码:<input type='text' name='namid' format="*N" size="5"/>
<br/><anchor>提 交<go method='post' href='/bbs/public/findcl10.asp?SessionID=<%=SessionID%>'><postfield name='namid' value='$(namid)'/><postfield name='namorid' value='2'/></go></anchor>
<%
    End if
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="34"
lasttls
dim objgbrs
       set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select city,r,y,n from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
Response.write "<br/>有缘查找>><br/>"
Response.write "<anchor>+|" & converttowidebaiti(objgbrs("city")) &"用户<go method='post' href='/bbs/public/findcl5.asp?SessionID="&SessionID&"'><postfield name='namid' value='" & converttowidebaiti(objgbrs("city")) &"'/><postfield name='namorid' value='2'/></go></anchor><br/>"
Response.write "<anchor>+|今天生日<go method='post' href='/bbs/public/findcl7.asp?SessionID="&SessionID&"'><postfield name='namid' value='" & Day(date) & "'/><postfield name='namid1' value='" & Month(date) & "'/><postfield name='namorid' value='2'/></go></anchor><br/>"
Response.write "<anchor>+|同日出生<go method='post' href='/bbs/public/findcl7.asp?SessionID="&SessionID&"'><postfield name='namid' value='" & objgbrs("r") &"'/><postfield name='namorid' value='2'/></go></anchor><br/>"
Response.write "<anchor>+|同月同日生<go method='post' href='/bbs/public/findcl7.asp?SessionID="&SessionID&"'><postfield name='namid' value='" & objgbrs("r") &"'/><postfield name='namid1' value='" & objgbrs("y") &"'/><postfield name='namorid' value='2'/></go></anchor><br/>"
Response.write "<anchor>+|同年同月同日生<go method='post' href='/bbs/public/findcl8.asp?SessionID="&SessionID&"'><postfield name='namid2' value='" & objgbrs("n") &"'/><postfield name='namid' value='" & objgbrs("r") &"'/><postfield name='namid1' value='" & objgbrs("y") &"'/><postfield name='namorid' value='2'/></go></anchor>"
objgbrs.close
Set objgbrs= Nothing
dim objgbrss
  set objgbrss=Server.CreateObject("ADODB.Recordset")
  sql="select ip,lasttl,startime from SoftDown_online where CStr(id)='" & iduse & "'"
  objgbrss.open sql,conn,1,3
Response.write "<br/>在线对对碰>><br/><anchor>+|对对碰第1次<go method='post' href='/bbs/public/ddb.asp?SessionID="&SessionID&"'><postfield name='namid' value='" & objgbrss("ip") &"'/><postfield name='namorid' value='2'/></go></anchor>"
Response.write "<br/><anchor>+|对对碰第2次<go method='post' href='/bbs/public/ddb1.asp?SessionID="&SessionID&"'><postfield name='namid' value='" & objgbrss("lasttl") &"'/><postfield name='namorid' value='2'/></go></anchor>"
Response.write "<br/><anchor>+|对对碰第3次<go method='post' href='/bbs/public/ddb2.asp?SessionID="&SessionID&"'><postfield name='namid' value='" & objgbrss("startime") &"'/><postfield name='namorid' value='2'/></go></anchor>"
Response.write "<br/><a href='/bbs/Reg/Ckzxhy.asp?SessionID="&SessionID&"'>+|与你同时在线"&onliner &"人</a>"

Response.write "<br/>--------------<br/><a href='/bbs/public/gygl.asp?SessionID="&SessionID&"'>返回我的地盘</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a></p></card></wml>"
conn.close
	set objgbrss=nothing
	Set conn = Nothing
%>