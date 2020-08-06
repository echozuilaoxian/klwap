<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<card id="main" title="道具管理">
<!--#INCLUDE VIRTUAL="/bbs/bbsdl.asp"-->
<p>我的道具<br/>-----------<br />
<% SessionID=request.querystring("SessionID") 
iduse=Session("useid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
<%if objgbrs("jsy")>0 then %>
<img src='ysy.gif' alt=''/>隐身衣:<% =objgbrs("jsy") %>件<br/>
<%  End if   %>     
<%if objgbrs("zyj")>0 then %>
<img src='hyd.gif' alt=''/>还原丹:<% =objgbrs("zyj") %>件<br/>
<%  End if   %>     
<%if objgbrs("tkj")>0 then %>
<img src='tkj.gif' alt=''/>偷窥镜:<% =objgbrs("tkj") %>件<br/>
<%  End if   %>      
------------<br/>
<a href="/bbs/xhdj/index1.asp?SessionID=<%=SessionID%>">继续购买道具</a><br/><a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a>
</p></card></wml>