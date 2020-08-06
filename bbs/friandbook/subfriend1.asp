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
 dim friid
Response.write "要删除的ID号:" &friid& ""
Response.write "<br/><input type='text' format='*N' name='" &friid& "'/>"%>
<br/><anchor>提 交
<go method="post" href='subcl.asp?SessionID=<%=SessionID%>'>
<postfield name="frid" value="$(frid)"/>
</go>
</anchor>
<br/><a href='myfriend.asp?SessionID=<%=SessionID%>'>我的好友</a>
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>我的地盘</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>
</p>
</card>
</wml>



