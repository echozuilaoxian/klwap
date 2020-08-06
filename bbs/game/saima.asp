<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="赛马场"><p>
<img src="/bbs/logo/sm/dm0.gif" alt="赛马游戏"/><br/>
<% 
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="50"
lasttls
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
End if

  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
您现在的金币有:<% =objgbrs("usejf") %>
<br/>买中可得2倍奖金
<%
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>
<br/>投注额(不限):
<br/><input name="num" value="10" format="*N" maxlength="20"/>
<br/>选择马匹:
<br/><select name="select" value="1">
<option value="1">1号马</option>
<option value="2">2号马</option>
<option value="3">3号马</option>
<option value="4">4号马</option>
</select>
<br/><anchor>开始跑Go
<go method="post" href='saimacl.asp?SessionID=<%=SessionID%>'>
<postfield name="num" value="$(num)"/>
<postfield name="select" value="$(select)"/>
</go>
</anchor>

<br/>--------------<br/>
<a href='/bbs/scyl.asp?SessionID=<%=SessionID%>'>返回社区娱乐</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p></card></wml>