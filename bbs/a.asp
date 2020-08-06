<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/ggip.inc"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
browsers=Lcase(Left(Request.ServerVariables("HTTP_USER_AGENT"),4))
if browsers="oper"  or  browsers="winw"  or  browsers="wapi" or browsers="mc21" or browsers="up.b" or browsers="upg1" or browsers="upsi" or browsers="qwap" or browsers="jigs" or browsers="java" or browsers="alca" or browsers="wapj" or browsers="cdr/" or browsers="nec-" or browsers="fetc" or browsers="r380" or browsers="winw" or browsers="mozi" or browsers="mozi" or browsers="m3ga" then
response.redirect "/bbs/index.asp"
response.end
end if 
%>
<card id="card1" title="社区推荐" ontimer='/bbs/index.asp?SessionID=<%=SessionID%>'>
<timer value='100'/>
<p>
<%
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="600"
lasttls
id=request("id")
 
set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where CStr(id)='" & id & "'"
  objgbrs.open ssql,conn

if int(id)=int(iduse) then 
  Response.write "你自己点击是不会有奖得喔！"
else  
  Response.write "欢迎来本站高级社区。" & objgbrs("usename") & "ID:" & id
  Response.write "推荐你来到这里，他/她因此获得1000的金币的奖励。" 
  Response.write "<br/>您是这里的新人，我们建议您阅读<a href='/bbs/sqbz/index.asp?SessionID=" & SessionID & "'>新手帮助</a>文档"
   sql="update usereg set usejf=usejf+1000,rcj=rcj+1000 Where CStr(id)='" & id & "'"
  conn.Execute(sql)
end if 
  Response.write"<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a>"
conn.close
set conn=nothing
%>
</p></card></wml>
