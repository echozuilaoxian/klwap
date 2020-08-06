<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
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
	sql="update usereg set gongzuo=1,zhiye=1 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
Response.write "<card id='card1' title='进入成功' ontimer='/bbs/job/sy.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>"
Response.write "<timer value='30'/><p>成功加入商业广场,好好地工作吧。创一番事业！正在返回..."
Response.write "<br/>-------------<br/><a href='/bbs/job/sy.asp?SessionID="&SessionID&"'>返回商场广场</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
conn.close
set conn=nothing
%>