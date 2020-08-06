<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="巡逻历练"><p>
<img src='logo.gif' alt='load...'/><br/>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
%>
<% 
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="50"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
%>
<%
Response.write ""
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新消息!</a><br/>"
End if
%>


您现在的状态是<br/>
金币:<% =objgbrs("usejf") %>
<br/>魅力: <% =objgbrs("ml") %>
<br/>体力: <% =objgbrs("tili") %>
<br/>经验: <% =objgbrs("entcont") %>
<%
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
%>
<br/>1.<anchor>娱乐夜总会<go method="post" href='yzh.asp?SessionID=<%=SessionID%>'><postfield name="num" value="5"/><postfield name="select" value="1"/></go></anchor>
<br/>2.<anchor>娱乐火车站<go method="post" href='hcz.asp?SessionID=<%=SessionID%>'><postfield name="num" value="5"/><postfield name="select" value="1"/></go></anchor>
<br/>3.<anchor>百利达商场<go method="post" href='sc.asp?SessionID=<%=SessionID%>'><postfield name="num" value="5"/><postfield name="select" value="1"/></go></anchor>
<br/>4.<anchor>情人酒吧屋<go method="post" href='jb.asp?SessionID=<%=SessionID%>'><postfield name="num" value="5"/><postfield name="select" value="1"/></go></anchor>
<br/>5.<anchor>娱乐服装城<go method="post" href='fzc.asp?SessionID=<%=SessionID%>'><postfield name="num" value="5"/><postfield name="select" value="1"/></go></anchor>
<br/>6.<anchor>春色游泳池<go method="post" href='yc.asp?SessionID=<%=SessionID%>'><postfield name="num" value="5"/><postfield name="select" value="1"/></go></anchor>
<br/>7.<anchor>长安太平街<go method="post" href='dj.asp?SessionID=<%=SessionID%>'><postfield name="num" value="5"/><postfield name="select" value="1"/></go></anchor>
<br/>--------<br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a><br/>
</p></card></wml>



