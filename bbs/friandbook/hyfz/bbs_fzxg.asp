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
<% 
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if

Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlls="42"
lasttls
 idd=request("idd")
 set rs=Server.CreateObject("ADODB.Recordset")
  ssql1="select * from wry where Cstr(id)=" & idd &" and Cstr(idd)=" & iduse
rs.open ssql1,conn
if rs.eof then
   Response.write "<card id='card1' title='好友分组'><p>ID错误<br/></p></card></wml>"
response.end
 Else
ycccc=rs("country")
thank=rs("thank")
End if

Response.write "<card id='card1' title='修改分组-"&converttowidebaiti(ycccc)&"'><p>"
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有(" & lycount & ")条新信息</a><br/>"
	Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?idd="&idd&""
End if
%>
原分组名称:<%=converttowidebaiti(ycccc)%><br/>
原分组排序:<%=converttowidebaiti(thank)%><br/>
新分组名称:<input name='country<%=minute(now)%><%=second(now)%>' title='分组名称' value='<%=converttowidebaiti(ycccc)%>'/><br/>
新分组排序:<input name='thank<%=minute(now)%><%=second(now)%>' title='分组排序' value='<%=converttowidebaiti(thank)%>'/><br/>
<anchor>[-修改-]<go href='bbs_fzxgcl.asp?SessionID=<%=request("SessionID")%>' method='post' accept-charset='utf-8'>
<postfield name='country' value='$(country<%=minute(now)%><%=second(now)%>)'/>
<postfield name='thank' value='$(thank<%=minute(now)%><%=second(now)%>)'/>
<postfield name='id' value='<%=rs("id")%>'/>
<postfield name='idd' value='<%=idd%>'/>
</go></anchor>

<%
Response.write "<br/>-----------<br/><a href='/bbs/friandbook/hyfz/myfzhy.asp?idd="&idd&"&amp;SessionID=" & SessionID & "'>返回" & converttowidebaiti(ycccc) & "</a><br/>"
Response.write "<a href='/bbs/friandbook/hyfz/add8.asp?SessionID=" & SessionID & "'>返回分组管理</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID=" &SessionID& "'>返回社区首页</a></p></card></wml>"
   rs.close
	conn.close
	set rs=nothing
	Set conn = Nothing
%>