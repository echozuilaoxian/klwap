<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
Server.ScriptTimeout=999
wap=request.querystring("wap")
dim ltlyuans
  iduse=Session("useid")
  itid=request.QueryString("itid")
%>
<!--#include file="1fh.asp"--><%
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [marry] where CStr(about)=" & itid
rs.open rsstr,conn

rs.delete
rs.update
rs.close
ltlyuans="清空" & itidtit & "的所以捐款记录"  
  sql="insert into jfpost2(ids,reids,niayo) values ("
  sql=sql & sqlstr(iduse) & ","
  sql=sql & sqlstr(itid) & ","
  sql=sql & sqlstr(ltlyuans) & ")"
  Application.Lock
  conn.execute(sql)
%>
<card id='card1' title='清空捐款记录' ontimer='1.asp?itid=<%=itid%>&amp;wap=<%=wap%>'><timer value='10'/>
<p>
成功清空所有记录，正在返回...<br/>
----------<br/>
<a href='1.asp?itid=<%=itid%>&amp;wap=<%=wap%>'>回论坛基金</a>
</p>
</card>
</wml> 
<%
conn.close
set conn=nothing
%>
