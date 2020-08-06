<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<card id="main" title="道具商店">
<!--#INCLUDE VIRTUAL="/bbs/bbsdl.asp"-->
<p>道具商店<br />-----------<br />
<%
SessionID=request.querystring("SessionID")
dim rs,id
id=Cstr(request("id"))
Set rs = Server.CreateObject("ADODB.Recordset")
	sql = "select * from dj where bh='1' order by id asc"
rs.open sql,conn,1,1

Page=Int(Abs(Request("page")))
IF not IsNumeric(Request("page")) Or IsEmpty(Request("page")) Then page=1
rs.pagesize = 10 '每页显示记录数
total = rs.RecordCount
mp = rs.pagesize
rs.absolutepage = page
i=0:k=0
do while not rs.eof and mp>0:k=k+1
%>
<%
if Request("page")="" then %>
<%=i+1%>.道具名称：<%=rs("title")%><br/>功能：<%=rs("js")%><br/>道具价格：<%=rs("jg")%>金币<br/>道具库存数量：
 <% if rs("sun")=<"0" then 
  response.write "0件<br/>"
   else
  response.write ""&rs("sun")&"件<br/>"
 End if 
 if rs("sun")=<"0" then 
  response.write "现该道具库存数量不足"
   else
%>
请输入件数(一次最多只能买10件)：<br/><input name='wordjs' type='text' size='10' value=''/><anchor>[购买]
<go href='jlscl.asp?id=<%=rs("id")%>&amp;SessionID=<%=SessionID%>' method='post' accept-charset='utf-8'>
<postfield name='word2' value='$(wordjs)'/>
</go>
</anchor>
 <% End if %>
<br/>
<% else %>
<%=i+1+10*(Request("page")-1)%>.道具名称：<%=rs("title")%><br/>功能：<%=rs("js")%><br/>道具价格：<%=rs("jg")%>金币<br/>道具库存数量：
 <% if rs("sun")=<"0" then 
  response.write "0件<br/>"
   else
  response.write ""&rs("sun")&"件<br/>"
 End if 
 if rs("sun")=<"0" then 
  response.write "现该道具库存数量不足"
   else
%>
请输入件数(一次最多只能买10件)：<br/><input name='wordjs' type='text' size='10' value=''/><br/>
<anchor>[马上购买]
<go href='jlscl.asp?id=<%=rs("id")%>&amp;SessionID=<%=SessionID%>' method='post' accept-charset='utf-8'>
<postfield name='word2' value='$(wordjs)'/>
</go>
</anchor>
 <% End if %>
<br/>


<%
end if
i=i+1
mp=mp-1
rs.movenext
loop

if page>rs.pagecount then Response.redirect("adminhy.asp?page="&rs.pagecount)
if page>1 then
response.Write(" <a href='index1.asp?page="&page-1&"&amp;idss="&idss&"'>&#x4E0A;&#x4E00;&#x9875;</a> ")
end if


if page<rs.pagecount then
response.Write("<a href='index1.asp?page="&page+1&"&amp;SessionID="&SessionID&"'>&#x4E0B;&#x4E00;&#x9875;</a>")
end if
response.Write("<br/> &#x5171;"&total&"个道具")
response.write "&#40;" & page & "&#47;" & rs.PageCount & "&#41;<br/>"
if rs.PageCount>1 then
response.write "到<input  name='page' value='4' size='5' format='*N'/>页<anchor>确定<go method='post' href='index1.asp?SessionID="&SessionID&"'><postfield name='page' value='$(page)'/></go></anchor>>><br/>"
End if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
<a href="index.asp?SessionID=<%=SessionID%>">返回我的道具</a><br/><a href="/bbs/index.asp?=<%=SessionID%>">返回社区首页</a>
</p></card></wml>