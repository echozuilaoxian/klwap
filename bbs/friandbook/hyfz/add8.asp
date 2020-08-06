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
<card id="card1" title="好友分组管理"><p>
<% 
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
  useid=request("useid")
lasttlls="42"
lasttls
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
	Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?forumID=1"
End if
 set rs=Server.CreateObject("ADODB.Recordset")
  ssql1="select * from wry where Cstr(idd)=" & iduse & "  order by thank"
rs.open ssql1,conn
if rs.eof then
   Response.write "你还没有创建分组<br/>"
 Else
   Response.write "好友分组管理<br/>------------<br/>"
For k=1 to 10
Response.write "<a href='/bbs/friandbook/hyfz/myfzhy.asp?idd=" & rs("id") & "&amp;SessionID=" & SessionID & "'>" & rs("country")&"</a><br/>"
rs.Movenext
if rs.EOF then Exit for
 Next
End if
rs.close
	set rs=nothing
Response.write "------------<br/><a href='fzcz.asp?SessionID=" & SessionID & "'>创建新的分组</a><br/>"
Response.write "<a href='/bbs/friandbook/myfriend.asp?SessionID=" & SessionID & "'>返回默认分组</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID=" &SessionID& "'>返回社区首页</a></p></card></wml>"
%>



