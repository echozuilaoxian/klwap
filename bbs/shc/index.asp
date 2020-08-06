<%@ Language=VBScript %>
<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0"  encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<wml>
<card id="jiudianfl" title="交易市场">
<p align="left">
<img src='logo.gif' awapzmya='LOGO'/><br/>-------------<br/>谨防欺诈慎重交易<br/><% 
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
set rss=server.createobject("adodb.recordset")
ssql="select top 3 * from jiudian1 order by id desc"
rss.open ssql,conn,1,1
%>
<a href="useradd1.asp?SessionID=<%=SessionID%>">发表待购信息</a><br/>
待购信息>><br/>

<%
 if rss.eof and rss.bof then str="没有任何待购信息"
 if str="" then
   rss.pagesize=10
   pages=rss.pagecount
   records=rss.recordcount
   currentpage=request("currentpage")
if currentpage="" or currentpage<1 then              currentpage=1
   currentpage=cint(currentpage)
if currentpage>pages then currentpage=pages
   rss.absolutepage=currentpage
else
   currentpage=1
   records=0
   pages=1
 end if
 %>
 
  <%linenumber=rss.pagesize%> <%do while (not rss.eof) and (line<linenumber)%>
   <a href="index11.asp?id=<%=rss("id")%>&amp;SessionID=<%=SessionID%>"><%=rss("level")%>信息</a><br/>
      [待购者:<a href='/bbs/reg/useinfo.asp?id=<%=rss("address")%>&amp;SessionID=<%=SessionID%>'><%=rss("name")%>ID:<%=rss("address")%></a>]<br/>
     
 <%rss.movenext%> <%line=line+1%> <%loop%> 
<a href="index2.asp?SessionID=<%=SessionID%>">所有待购信息>></a><br/>
<%rss.close
set rss=nothing%>
<a href="dai.asp?d=1&amp;SessionID=<%=SessionID%>">地产</a> <a href="dai.asp?d=2&amp;SessionID=<%=SessionID%>">车子</a> <a href="dai.asp?d=3&amp;SessionID=<%=SessionID%>">手机</a><br/><a href="dai.asp?d=4&amp;SessionID=<%=SessionID%>">配件</a> <a href="dai.asp?d=5&amp;SessionID=<%=SessionID%>">SIM卡</a> <a href="dai.asp?d=6&amp;SessionID=<%=SessionID%>">相机</a><br/><a href="dai.asp?d=7&amp;SessionID=<%=SessionID%>">电器</a> <a href="dai.asp?d=8&amp;SessionID=<%=SessionID%>">软件</a> <a href="dai.asp?d=9&amp;SessionID=<%=SessionID%>">账号</a><br/><a href="dai.asp?d=10&amp;SessionID=<%=SessionID%>">书籍</a> <a href="dai.asp?d=11&amp;SessionID=<%=SessionID%>">配饰</a> <a href="dai.asp?d=12&amp;SessionID=<%=SessionID%>">装备</a><br/>
求购信息>><br/>
<%
set rs=server.createobject("adodb.recordset")
sql="select top 3 * from buys order by id desc"
rs.open sql,conn,1,1
%>
<a href="useradd2.asp?SessionID=<%=SessionID%>">发表求购信息</a><br/>
<%
 if rs.eof and rs.bof then str="没有任何求购信息"
 if str="" then
   rs.pagesize=10
   pages=rs.pagecount
   records=rs.recordcount
   currentpage=request("currentpage")
if currentpage="" or currentpage<1 then              currentpage=1
   currentpage=cint(currentpage)
if currentpage>pages then currentpage=pages
   rs.absolutepage=currentpage
else
   currentpage=1
   records=0
   pages=1
 end if
 %>
 
  <%linenumber=rs.pagesize%> <%do while (not rs.eof) and (line<linenumber)%>
   <a href="index12.asp?id=<%=rs("id")%>&amp;SessionID=<%=SessionID%>"><%=rs("level")%>信息</a><br/>
      [求购者:<a href='/bbs/reg/useinfo.asp?id=<%=rs("address")%>&amp;SessionID=<%=SessionID%>'><%=rs("name")%>ID:<%=rs("address")%></a>]<br/>
     
 <%rs.movenext%> <%line=line+1%> <%loop%> 
<a href="index0.asp?SessionID=<%=SessionID%>">所有求购信息>></a><br/>
<a href="qiu.asp?d=1&amp;SessionID=<%=SessionID%>">地产</a> <a href="qiu.asp?d=2&amp;SessionID=<%=SessionID%>">车子</a> <a href="qiu.asp?d=3&amp;SessionID=<%=SessionID%>">手机</a><br/><a href="qiu.asp?d=4&amp;SessionID=<%=SessionID%>">配件</a> <a href="qiu.asp?d=5&amp;SessionID=<%=SessionID%>">SIM卡</a> <a href="qiu.asp?d=6&amp;SessionID=<%=SessionID%>">相机</a><br/><a href="qiu.asp?d=7&amp;SessionID=<%=SessionID%>">电器</a> <a href="qiu.asp?d=8&amp;SessionID=<%=SessionID%>">软件</a> <a href="qiu.asp?d=9&amp;SessionID=<%=SessionID%>">账号</a><br/><a href="qiu.asp?d=10&amp;SessionID=<%=SessionID%>">书籍</a> <a href="qiu.asp?d=11&amp;SessionID=<%=SessionID%>">配饰</a> <a href="qiu.asp?d=12&amp;SessionID=<%=SessionID%>">装备</a><br/>
<%
if Session("useid")="1" then 
Response.write "◆<a href='/bbs/shc/shcadmin/ltsc1.asp?SessionID=" & SessionID & "'>管理员操作</a>◆<br/>"
End if
Response.write "<a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/><a href='/index.asp?SessionID=" & SessionID & "'>返回网站首页</a></p></card></wml>"
rs.close
set rs=nothing
conn.close
set conn=nothing
%>