<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="魔法卷轴">
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
yname="圣盾术"
xyyz="100"
tname="mm1"
elseif wpid="2" then
yname="烈火术"
xyyz="200"
tname="mm2"
elseif wpid="3" then
yname="瞬移术"
xyyz="500"
tname="mm3"
elseif wpid="5" then
yname="回城卷"
xyyz="100"
tname="hcj"
else
xyyz="1000"
yname="刺杀术"
tname="mm4"
end if
if request("caozuo")<>"ok" then
Response.Write "魔导师：<br/>"&yname&"每张"&xyyz&"两，您要多少<br/>"
%>
我要<input name="num" size="3" format="*N"/>张
<anchor><br/>
确定购买
<go method="post" href="kk.asp?SessionID=<%=SessionID%>">
<postfield name="wid" value="<%=wpid%>"/>
<postfield name="num" value="$(num)"/>
<postfield name="caozuo" value="ok"/>
</go></anchor><br/>
<%
else
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select yz from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,1
num=clng(request("num"))
xycp=clng(xyyz)*num
if clng(xycp)>rs("yz") then
msg="您的银两不够购买"&num&"张"&yname&"！快去赚一点吧！"
else
sql="update wupin set "&tname&"="&tname&"+"&num&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set yz=yz-"&xycp&" where cstr(ids)="&ids
  conn.Execute(sql)
msg="您花"&xycp&"两银两购买了"&num&"张"&yname&".<br/><a href='bang.asp?SessionID="&SessionID&"'>继续交易</a>"
end if
Response.Write ""&msg&"<br/>=========<br/>"
 rs.Close
	Set rs=Nothing
end if
     Conn.Close
      Set Conn=Nothing
%>
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>