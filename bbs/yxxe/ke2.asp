<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="张三客栈">
<p>
<%
wpid=request("wid")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
%>
<%
if wpid="1" then
tstl="5"
msg1="喝酒"
yname="你喝了一碗酒"
xyyz="50"
else
xyyz="100"
tstl="10"
msg1="住客店"
yname="你在客店住了一晚"
end if
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select yz from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,1
if clng(xyyz)>rs("yz") then
msg="您不够银两"&msg1&"了！快去赚一点吧，坐食山空啊！"
else
set rs8=Server.CreateObject("ADODB.Recordset")
strsQL="select jy,tl from sx where cstr(ids)='"&ids& "'"
rs8.open strsQL,Conn,1,1
myjy=rs8("jy")
mytl=rs8("tl")
 rs8.Close
	Set rs8=Nothing
if mytl=myjy then
msg="您的身体已经够棒了，不能再"&msg1&"了，快去干点活吧！"
elseif clng(tstl+mytl)>=clng(myjy) then
sql="update sx set tl="&myjy&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set yz=yz-"&xyyz&" where cstr(ids)="&ids
  conn.Execute(sql)
msg=""&yname&"后,身体完全恢复了."
else
sql="update sx set tl=tl+"&tstl&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set yz=yz-"&xyyz&" where cstr(ids)="&ids
  conn.Execute(sql)
msg=""&yname&"后,身体感觉好多了,体力提升"&tstl&".<br/><a href='ke2.asp?wid="&wpid&"&amp;SessionID="&SessionID&"'>继续"&msg1&"</a>"
END IF
end if
Response.Write ""&msg&"<br/>=========<br/>"
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