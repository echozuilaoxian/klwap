<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")


id=request("id")
iduse=Session("useid")

if id="" then
     response.write "<card id='card1' title='删除分组'><p><br/>分组ID错误<br/><a href='/bbs/friandbook/hyfz/add8.asp?SessionID=" & SessionID & "'>返回重选</a><br/></p></card></wml>"
     response.end
  End if

  acc=request("acc")
if acc="" then
%>
<card id='card1' title='删除分组'><p>确定删除该组?<br/>删除后该组的好友将移至默认组。<br/><a href='dellyall.asp?acc=1&amp;ID=<%=ID%>&amp;SessionID=<%=SessionID%>'>是</a> <a href='/bbs/friandbook/hyfz/add8.asp?SessionID=<%=SessionID%>'>否</a></p></card></wml>
<%
     response.end
else
  sql="delete from wry Where CStr(id)='" & id & "' and idd='"&iduse&"'"
 Application.Lock

    conn.execute(sql)
  sql="update myfriend set useid=0 Where CStr(useid)='" & id & "' and ids='"&iduse&"'"
Application.Lock
            conn.execute(sql)
Application.Unlock

  response.write "<card id='card1' title='删除分组' ontimer='/bbs/friandbook/hyfz/add8.asp?SessionID=" & SessionID & "'><timer value='5'/><p align='left'>"
  response.write"分组已删除，正在返回...<br/><a href='/bbs/friandbook/hyfz/add8.asp?SessionID=" & SessionID & "'>分组管理</a></p></card></wml>"
end if
  conn.close
  set conn=nothing
%>