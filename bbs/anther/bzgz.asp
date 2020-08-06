<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<card id="card1" title="管理员领薪"><p>
<% SessionID=request.querystring("SessionID") %>
<%
Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM gao1"
rec.Open SQL,conn,1,1
   countall=countalls
conn.close
set rec=nothing
set conn=nothing

Function countalls()
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from gao1"
  objgbrr.open ssql,conn,1,1
countalls=objgbrr.RecordCount
set objgbrr=nothing
End Function
%><%if Session("ltglzdl")<>"" then %>
<br/><a href='gaozcl11.asp?rd=8&amp;SessionID=<%=SessionID%>'>领取今日工资</a>
<%end if%>
<br/>----------
<br/><a href='/bbs/ztlb.asp?SessionID=<%=SessionID%>'>论坛首页</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>-<a href='/index.asp?SessionID=<%=SessionID%>'>首页</a>
</p>
</card>
</wml>