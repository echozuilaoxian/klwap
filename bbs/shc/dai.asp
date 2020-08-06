<%@ Language=VBScript %>
<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0"  encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<wml>
<%SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999%>
<card id="jiudianfl" title="分类消息">
<p align="left">
<a href="useradd1.asp?SessionID=<%=SessionID%>">发布待购消息</a><br/>
-----------<br/>
<%
dim d
d=request("d") 
if d="" then d="地产"
if d="1" then d="地产"
if d="2" then d="车子"
if d="3" then d="手机"
if d="4" then d="配件"
if d="5" then d="SIM卡"
if d="6" then d="相机"
if d="7" then d="电器"
if d="8" then d="软件"
if d="9" then d="账号"
if d="10" then d="书籍"
if d="11" then d="配饰"
if d="12" then d="装备"
set rs=Server.CreateObject("ADODB.Recordset")
sql="SELECT * FROM jiudian1 WHERE ((jiudian1.level)='"&d&"') order by id desc;"
rs.open sql,conn,1,1
 if rs.eof and rs.bof then str="该类没有任何消息"
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
   
     <a href="index11.asp?id=<%=rs("id")%>&amp;SessionID=<%=SessionID%>"><%=rs("level")%>信息</a>[<a href='/bbs/reg/useinfo.asp?id=<%=rs("address")%>&amp;SessionID=<%=SessionID%>'><%=rs("name")%>ID:<%=rs("address")%></a>]<br/>
    
 <%rs.movenext%> <%line=line+1%> <%loop%>
  -----------<br/>
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
  %><a href="dai.asp?currentpage=1&amp;d=<%=d%>&amp;SessionID=<%=SessionID%>">1</a>&nbsp;...<%
 end if
 for i=ii to iii
   If i<>currentpage then
  %><a href="dai.asp?currentpage=<%=i%>&amp;d=<%=d%>&amp;SessionID=<%=SessionID%>"><%=i%></a><%
   else
 %>&nbsp;<%=i%>&nbsp;<%
   end if
 next
 if pages > currentpage+5 then
 %>...&nbsp;<a href="dai.asp?currentpage=<%=pages%>&amp;d=<%=d%>&amp;SessionID=<%=SessionID%>"><%=pages%></a><%
  end if
 %><br/>
<a href="index.asp?SessionID=<%=SessionID%>">回交易市场</a>
<br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a>
</p>
</card>
</wml>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>