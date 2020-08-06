<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="删除好友">
<p>
<%SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
%>
输入要删除的ID号:
<br/><input type="text" format="*N" name="frid"/>
<br/><anchor>[-确定-]
<go method="post" href='subcl.asp?SessionID=<%=SessionID%>'>
<postfield name="frid" value="$(frid)"/>
</go>
</anchor><br/>
-----------
<br/><a href='myfriend.asp?SessionID=<%=SessionID%>'>返回我的好友</a>
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>返回我的地盘</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p>
</card>
</wml>



