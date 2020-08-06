<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="使用物品" ontimer="index.asp?SessionID=<%=request("SessionID")%>">
<timer value="10"/>
<p>
<%
wpid=request("wpid")
ids=session("useid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<%
if wpid="y1" then
tstl="100"
yname="百草丹"

elseif wpid="y2" then
tstl="200"
yname="大力神丹"

elseif wpid="y3" then
tstl="300"
yname="九转还魂丹"

elseif wpid="y4" then
tstl="600"
yname="九转还魂丹"
else
tstl="60000"
yname="江湖强力魔水"
end if
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select "&wpid&" from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,1
if rs(""&wpid&"")<1 then
msg="您没有该药品！快去<a href='yao.asp?SessionID="&SessionID&"'>王五药铺</a>买一点吧"
else
set rs8=Server.CreateObject("ADODB.Recordset")
strsQL="select jy,tl from sx where cstr(ids)='"&ids& "'"
rs8.open strsQL,Conn,1,1
myjy=rs8("jy")
mytl=rs8("tl")
 rs8.Close
	Set rs8=Nothing
if mytl=myjy then
msg="您的身体已经够棒了，不能再用任何药品！"
elseif clng(tstl+mytl)>=clng(myjy) then
sql="update sx set tl="&myjy&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set "&wpid&"="&wpid&"-1 where cstr(ids)="&ids
  conn.Execute(sql)
msg="您服用了"&yname&"后,身体感觉好多了,体力提升"&tstl&".<br/>现在您的体力为"&tstl+mytl&"<br/>"
else
sql="update sx set tl=tl+"&tstl&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set "&wpid&"="&wpid&"-1 where cstr(ids)="&ids
  conn.Execute(sql)
msg="您服用了"&yname&"后,身体感觉好多了,体力提升"&tstl&".<br/>现在您的体力为"&tstl+mytl&"<br/>"
END IF
end if
Response.Write ""&msg&"正在返回......<br/>=========<br/>"
 rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href="index.asp?SessionID=<%=SessionID%>">[我的江湖]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>