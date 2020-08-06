<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="添加黑名单">
<p>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
iduse=Session("useid")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from myfriend where CStr(ids)='" & iduse & "'"
  objgbrr.open ssql,conn,1,1
if objgbrr.RecordCount>100 and Session("ltglzdl")="" then
   Response.write "您的黑名单数已达到最高限制100个,不能再添加!"
   Response.write "<br/><a href='/bbs/friandbook/myfriend.asp?SessionID=" & SessionID & "'>我的好友</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
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
请输入要添加的ID号:
<br/><input type="text" format="*N" name="frid"/>
<br/><anchor>提 交
<go method="post" href='addnocl.asp?SessionID=<%=SessionID%>'>
<postfield name="frid" value="$(frid)"/>
</go>
</anchor>
<%
response.write "<br/>-----------<br/><a href='/bbs/friandbook/nofriend.asp?SessionID=" & SessionID & "'>黑名列表</a>-<a href='/bbs/friandbook/subnofriend.asp?SessionID=" & SessionID & "'>删除黑名</a>"
Response.write "<br/><a href='/bbs/friandbook/myfriend.asp?SessionID=" & SessionID & "'>我的好友</a>-<a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a>-<a href='/index.asp?SessionID=" & SessionID & "'>网站首页</a><br/>"
%>
</p>
</card>
</wml>