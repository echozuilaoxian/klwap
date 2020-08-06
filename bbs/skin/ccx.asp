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
<card id="card1" title="社区秀">                                                    
<p align="left">
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")%>
<img src="logo.gif" alt="社区秀"/><br/>----------<br/>
<img src="/bbs/skin/mmm19.gif" width='40' height='38' alt=""/> <img src="/bbs/skin/mmm20.gif" width='40' height='38' alt=""/>
<br/><a href='mmm.asp?SessionID=<%=SessionID%>'>帅哥秀</a><br/>
<img src="/bbs/skin/n17.gif" width='40' height='38' alt=""/> <img src="/bbs/skin/n18.gif" width='40' height='38' alt=""/>
<br/><a href='nn.asp?SessionID=<%=SessionID%>'>靓女秀</a>
<br/>------------
<br/>
<a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>地盘</a>-<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
<br/>注：社区秀每个2000金币
</p>
</card>
</wml>