<%@ Language=VBScript %>
<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0"  encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<%Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
id=request("id")
sql="update buys set dj=dj+1 Where CStr(id)='" & id & "'"
  conn.Execute(sql) 
set rs=server.createobject("adodb.recordset")
sql="select * from buys where id="&id
rs.open sql,conn,1,1
%>
<wml>
<card id="buys" title="查看消息">
<p align="left">求购消息<br/>----------<br/>
<%=rs("level")%>消息<br/>
消息内容:<%=rs("tel")%><br/>
点击:<%=rs("dj")%>次<br/>
求购人:<a href='/bbs/reg/useinfo.asp?id=<%=rs("address")%>&amp;SessionID=<%=SessionID%>'><%=rs("name")%>ID:<%=rs("address")%></a>
<%
response.write "<br/><img src='/bbs/logo/lyxx.gif' awapzmya='.'/>"
response.write "<a href=""res.asp?id=" & rs("id") & "&amp;SessionID=" & SessionID & """>回复("& rs("hf")&"条)</a><br/>"
	response.write "<a href=""res.asp?action=post&amp;id=" & rs("id") & "&amp;SessionID=" & SessionID & """>发表回复</a>"%>
<br/>
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