<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="分组管理"><p>分组管理<br/>-----------<br/>
<% 
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
wap=request.querystring("wap")

Response.write "<a href='fzcz1.asp?wap=" & wap & "'>创建分组</a><br/><a href='myfriend.asp?wap=" & wap & "'>组名修改</a><br/><a href='sc.asp?wap=" & wap & "'>删除分组</a><br/>------------<br/><a href='/bbs/friandbook/myfriend.asp?wap=" & wap & "'>我的好友</a><br/><a href='/bbs/public/gygl.asp?wap=" & wap & "'>我的地盘</a>-<a href='/bbs/index.asp?wap=" & wap & "'>社区首页</a></p></card></wml>"
%>



