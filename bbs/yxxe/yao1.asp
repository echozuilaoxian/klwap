<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="王五药铺">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ids=session("useid")
wpid=request("wid")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if

if wpid="1" then
yname="百草丹"
xyyz="100"
tname="y1"

elseif wpid="2" then
yname="大力神丹"
xyyz="200"
tname="y2"

elseif wpid="3" then
yname="九转还魂丹"
xyyz="500"
tname="y3"

elseif wpid="4" then
xyyz="1000"
yname="少林大还丹"
tname="y4"
else
xyyz="100000"
yname="江湖强力魔水"
tname="y5"
end if
if request("caozuo")<>"ok" then
Response.Write "王五："&yname&"每颗"&xyyz&"两，您要多少<br/>"
%>
我说：拿<input name="num" size="3" format="*N"/>
<anchor>颗给我吧！
<go method="post" href="yao1.asp?SessionID=<%=SessionID%>">
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
msg="您的银两不够购买"&num&"颗"&yname&"！快去赚一点吧！"
else
sql="update wupin set "&tname&"="&tname&"+"&num&" where cstr(ids)="&ids
  conn.Execute(sql)
sql="update wupin set yz=yz-"&xycp&" where cstr(ids)="&ids
  conn.Execute(sql)
msg="您花"&xycp&"两银两购买了"&num&"颗"&yname&".<br/><a href='yao.asp?SessionID="&SessionID&"'>继续交易</a>"
end if
Response.Write ""&msg&"<br/>=========<br/>"
 rs.Close
	Set rs=Nothing
end if
     Conn.Close
      Set Conn=Nothing
%>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>