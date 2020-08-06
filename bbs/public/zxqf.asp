<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="在线群发信息">
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if Cstr(Session("vip1"))<>"" or Session("vip")<>"" or Session("Counter")="pass_numbers_55556666" then
if Session("ltlybz")="dfg34fdf_dfg554ghy_3452" then
  Response.write "你的发信权已被锁，请与管理员联系!</p></card></wml>"
    response.end
End if
iduse=Session("useid")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from guestbook where CStr(ids)='" & iduse & "' and biaozi='f'"
  objgbrr.open ssql,conn,1,1
if objgbrr.RecordCount>500 then
   Response.write "你保留的旧信息超过了500条,暂时不能发信或回复,请删除一些没用的信息!"
   Response.write "<br/>--------------<br/><a href='ckly.asp?SessionID=" & SessionID & "'>返回信息列表</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
conn2.close
set objgbrr=nothing
set conn2=nothing
   response.end
End if
lasttlls="55"
lasttls
conn.close
set objgbrr=nothing
set conn=nothing

Response.write "收信人:在线所有用户<br/>内容:"
%>
<input name="ltlyuan" maxlength="200" size="20"/>
<br/><anchor>发 送<go method="post" href='/bbs/public/zxqfcl.asp?SessionID=<%=SessionID%>'>
<postfield name="ltlyuan" value="$(ltlyuan)\【此信息为在线群发消息】"/>
</go>
</anchor><br/>-------------<%
Response.write "<br/><a href='ckly.asp?SessionID=" & SessionID & "'>回收件箱</a>"
 Response.write "<br/><a href='srxx.asp?SessionID=" & SessionID & "'>返回我的信箱</a>"%>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<br/><b><u>注：非特殊用途，切勿乱用此功能，<br/>每群发一次按每个在线会员收取50金币。</u></b>
<%End if%>
</p>
</card>
</wml>



