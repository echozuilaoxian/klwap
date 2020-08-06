<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")

	sql="update usereg set gongzuo=2,zhiye=11 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
Response.write "<card id='card1' title='进入成功' ontimer='ent.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>"
Response.write "<timer value='50'/><p>成功加入娱乐圈！好好甘发挥你的才能吧！。创一番事业！正在返回..."

Response.write "<br/>------------<br/>"
Response.write "<a href='/bbs/job/ent.asp?SessionID="&SessionID&"'>返回娱乐圈</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
conn.close
set conn=nothing
%>





