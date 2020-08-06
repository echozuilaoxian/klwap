<% @LANGUAGE="VBScript" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->

<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card id="afund" title="龙宝中心">
<p>
<img src='logo.gif' alt=''/><br/>
<%
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlss="190"
lasttlls="190"
lasttls
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
      else
        Session("ltlybz")=""
    End if
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
 Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
End if

Response.write "1.<a href='Help.asp?SessionID=" & SessionID & "'>龙宝说明</a><br/>2.<a href='Afund.asp?SessionID=" & SessionID & "'>龙宝列表</a><br/>3.<a href='Afund_index.asp?SessionID=" & SessionID & "'>我的龙宝</a><br/>4.<a href='JJ_Cs.asp?SessionID=" & SessionID & "'>龙宝走势</a><br/>5.<a href='chats.asp?SessionID=" & SessionID & "'>交流大厅</a><br/>6.<a href='JJ_Cs_jy.asp?SessionID=" & SessionID & "'>交易记录</a><br/><a href='afund.asp?pages=" & pages & "&amp;SessionID=" & SessionID & "'>龙宝大厅</a>.<a href='index.asp?SessionID=" & SessionID & "'>龙宝中心</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a>.<a href='/index.asp'>网站首页</a>"
if Session("useid")="1" then 
Response.write "<br/>◆<a href='lbgl.asp?SessionID=" & SessionID & "'>管理员操作</a>◆<br/>"
End if
%><%
conn.close
set conn=nothing%></p></card></wml>

