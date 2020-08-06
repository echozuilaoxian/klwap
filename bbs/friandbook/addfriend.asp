<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="添加好友">
<p>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
iduse=Session("useid")
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
	Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?forumID=1"
End if
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from myfriend where CStr(ids)='" & iduse & "'"
  objgbrr.open ssql,conn,1,1
if objgbrr.RecordCount>300 and Session("ltglzdl")="" then
   Response.write "您的好友数已达到最高限制300个,不能再添加,请删掉一些不常联系的再添加。"
   Response.write "<br/><a href='myfriend.asp?SessionID=" & SessionID & "'>我的好友</a></p></card></wml>"
conn.close
set objgbrr=nothing
set conn=nothing
   response.end
End if
objgbrr.close
conn.close
set objgbrr=nothing
set conn=nothing
%>
请输入ID号:
<br/><input type="text" format="*N" name="frid"/>
<br/><anchor>提 交
<go method="post" href='addcl.asp?SessionID=<%=SessionID%>'>
<postfield name="frid" value="$(frid)"/>
</go>
</anchor><br/>--------------
<br/><a href='myfriend.asp?SessionID=<%=SessionID%>'>返回我的好友</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<br/><a href='/index.asp?SessionID=<%=SessionID%>'>返回网站首页</a>
</p>
</card>
</wml>



