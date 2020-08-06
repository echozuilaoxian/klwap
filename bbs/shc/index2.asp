<%@ Language=VBScript %>
<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0"  encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sql="select * from jiudian1 order by id desc"
rs.open sql,conn,1,1
%>
<wml>
<card id="jiudianfl" title="待购消息">
<p align="left">待购消息<br/>-------------<br/><% 
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")%>
<a href="useradd1.asp?SessionID=<%=SessionID%>">发布待购消息</a><br/>
<%
 if rs.eof and rs.bof then str="没有任何待购消息"
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
   
     <a href="index11.asp?id=<%=rs("id")%>&amp;SessionID=<%=SessionID%>"><%=rs("name")%>ID:<%=rs("address")%>的<%=rs("level")%>分类</a><br/>
     
 <%rs.movenext%> <%line=line+1%> <%loop%> 
  
 第<%=currentpage%>页 共<%=Records%>条&nbsp;共<%=Pages%>页<br/>
<%
 ii=currentpage-5
 iii=currentpage+5
 if ii < 1 then
    ii=1
 end if
 if iii > pages then
    iii=pages
 end if
 if currentpage > 6 then
  %><a href="index2.asp?currentpage=1&amp;SessionID=<%=SessionID%>">1</a>&nbsp;...<%
 end if
 for i=ii to iii
   If i<>currentpage then
  %><a href="index2.asp?currentpage=<%=i%>&amp;SessionID=<%=SessionID%>"><%=i%></a><%
   else
 %>&nbsp;<%=i%>&nbsp;<%
   end if
 next
 if pages > currentpage+5 then
 %>...&nbsp;<a href="index2.asp?currentpage=<%=pages%>&amp;SessionID=<%=SessionID%>"><%=pages%></a><%
  end if
 %><br/>
<a href="index.asp?SessionID=<%=SessionID%>">回交易市场</a>
<%
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"%><%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>