<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="删除黑名单">
<p>
<%SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
%>
请输入要删除的ID号:
<br/><input type="text" format="*N" name="frid"/>
<br/><anchor>提 交
<go method="post" href='subnocl.asp?SessionID=<%=SessionID%>'>
<postfield name="frid" value="$(frid)"/>
</go>
</anchor>
<%
response.write "<br/>-----------<br/><a href='/bbs/friandbook/nofriend.asp?SessionID=" & SessionID & "'>黑名列表</a>-<a href='/bbs/friandbook/addnofriend.asp?SessionID=" & SessionID & "'>添加黑名</a>"
Response.write "<br/><a href='/bbs/friandbook/myfriend.asp?SessionID=" & SessionID & "'>我的好友</a>-<a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a>-<a href='/index.asp?SessionID=" & SessionID & "'>网站首页</a><br/>"
%>
</p>
</card>
</wml>