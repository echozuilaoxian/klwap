<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %> 
<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="相片运用">
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
dim id
id=request("id")
SessionID=request.querystring("SessionID")
iduse=Session("useid")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from myalbum where CStr(ids)='" & iduse & "' and Cstr(id)=" & id
  objgbrr.open ssql,conn
%>
<onevent type="onenterforward">
<refresh>
<setvar name="xclink" value="<% =objgbrr("xclink") %>"/>
</refresh>
</onevent>
<p><img src='<% =objgbrr("xclink") %>' alt='图片'/><br/>
自定社区秀.
将此图设为社区秀?
<%
if Cstr(Session("vip1"))<>"" or Session("vip")<>"" or Session("Counter")="pass_numbers_55556666" then
  Response.write "<br/><a href='select.asp?id=$(xclink)&amp;SessionID="&SessionID&"'>确定</a>"
End if
%>
<br/>-------------
<br/>温馨提示：
<br/>您必须成为vip会员才可以自定义社区秀，<br/>而且必须魅力和体力288以上并收取888金币.<%
Response.write "<br/><a href='mybook.asp?SessionID=" & SessionID & "'>返回我的书包</a>"%>
<br/><a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a>
</p>
</card>
</wml>
<%
conn.close
set objgbrr=nothing
set conn=nothing
%>