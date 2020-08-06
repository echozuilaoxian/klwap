<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include file="ubbcode1.asp" -->
<!--#include FILE="check.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="帖子回收" >
<p>
<%
page=Request("page")
Action=Request("Action")
%>
<%
	If Action="del" Then
		Call Delip()
	End If
%>
<%
Sub Delip()
dim id 
id = clng(request("id"))
conn.execute("delete from delzl where id="&id)
End sub
%>
<%
sql="select * from delzl order by id desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "-------------<br/>暂无内容<br/>"
else

'分页的实现 
listnum=10
Rs.pagesize=listnum
page=Request("page")
if (page-Rs.pagecount) > 0 then
page=rs.pagecount
elseif page = "" or page < 1 then
page = 1
end if
rs.absolutepage=page
'编号的实现
j=rs.recordcount
j=j-(page-1)*listnum
j=1
nn=request("page")
if nn="" then
n=0
else
nn=nn-1
n=listnum*nn
end if%>
<b><u>帖子回收</u></b><br/><small>当前共有</small><b><%=Rs.recordcount%></b><small>条记录</small>
<br/>-------------<br/>
<%do while not rs.eof and j<=listnum%>
<u><%=(j+(page-1)*listnum)%></u>.<%
'========================================================================================
name=request.servervariables("script_name") 'name为当前文件名
'========================================================================================
%><a href="wap_Admin_delzl_xx.asp?id=<%=rs("id")%>&amp;page=<%=page%>&amp;adminmid=<%=request("adminmid")%>">[管理]</a><%=outHTM(rs("baoti"))%> <a href="wap_Admin_delzl.asp?id=<%=rs("id")%>&amp;page=<%=page%>&amp;Action=del&amp;adminmid=<%=request("adminmid")%>"><small>删除</small></a><br/>
<%
reids=rs("idss")
if reids<>"0" then 
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from usereg where id="&reids
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then 
dlname="无此会员"
Else
dlname=objgbrsy("usename")
end if
Else
dlname="系统消息"
end if
objgbrsy.close
Set objgbrsy= Nothing%>
作者:<a href="yxxe_bbs_hy_gl.asp?id=<%=rs("reids")%>&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>"><%=ubb(dlname)%></a>

<%
set objgbrsys=Server.CreateObject("ADODB.Recordset")
rspls="select * from usereg where id="&rs("reids")
objgbrsys.open rspls,conn,1,2
if objgbrsys.eof then 
dlme="无此会员"
Else
dlme=objgbrsys("usename")
end if
objgbrsys.close
Set objgbrsys= Nothing%><br/>
操作:<a href="yxxe_bbs_hy_gl.asp?id=<%=rs("reids")%>&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>"><%=ubb(dlme)%></a><br/>
时间:<%=rs("times")%><br/>
<%rs.movenext 
j=j+1 
loop%>
<small><%=Rs.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rs.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="<%=name%>?adminmid=<%=request("adminmid")%>">&lt;&lt;</a>
      <a href="<%=name%>?adminmid=<%=request("adminmid")%>&amp;page=<%=page-1%>"><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
<% if rs.pagecount-page <> 0 then %>
      <a href="<%=name%>?adminmid=<%=request("adminmid")%>&amp;page=<%=page+1%>"><b>[<%=page+1%>]</b></a>
      <a href="<%=name%>?adminmid=<%=request("adminmid")%>&amp;page=<%=rs.pagecount%>">>></a>
	  <%end if%>
<%end if%>
<% if rs.pagecount-page <> 0 or page>1 then %>
      <br/>
	  <%end if%>

------------<br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
<small><% 
dim kkwap,distime
kkwap=""
if Month(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Month(date)&"月"
if Day(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Day(date)
response.write kkwap
Response.write"日("
Response.write right(""&WeekDayName(DatePart("w",Now)),1)
Response.write")"
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%></small><br/>
</p></card>
</wml>