<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<%
id=request("id")
page=request.QueryString("page")
Action=request("Action")
if Action="" then Action="main"
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>

<card id="main" title="动态日志管理" >
<p>
<%
page=Request("page")
id=Request("id")

useid=Request("useid")
pid=Request("pid")
kyzcc=Request("kyzcc")
if cpage = "" or cpage < 1 then
cpage = 1
end if

if kyzcc="delok" then
if pid<>""  then
sql="delete from sjzk Where CStr(id)='" & pid & "'"
  conn.Execute(sql)
response.write "成功删除动态日志！ <br/>---------<br/>"
else
response.write "*删除动态日志ID错误！ <br/>---------<br/>"
end if
end if


if id<>"" then
		sscql="select * from sjzk where id="& id &" order by id DESC" 
		set rs=server.createobject("adodb.recordset")
		rs.open sscql,conn,1,1
else
		if useid<>"" then 
		useids="where cstr(ids)="&useid&""
		end if
	sql="select * from sjzk "&useids&" order by id desc"
	set rs=server.createobject("adodb.recordset")
	rs.open sql,conn,1,1
end if


if rs.eof and rs.bof then
	response.write "暂无动态日志 <br/>-----------<br/>"
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
管理动态日志<small>当前共有</small><b><%=Rs.recordcount%></b><small>条记录</small>
<br/>-------------<br/>
<%do while not rs.eof and j<=listnum%>
<%
set okrss=Server.CreateObject("ADODB.Recordset")
rsplg="select * from usereg where id="&rs("ids")
okrss.open rsplg,conn,1,2
if okrss.eof then 
usename="没有该会员"
else
usename=okrss("usename")
end if
okrss.close
Set okrss= Nothing%>

<%=(j+(page-1)*listnum)%>.<a href="kyzc_Usegl.asp?Action=View&amp;id=<%=rs("ids")%>&amp;adminmid=<%=request("adminmid")%>"><%=ubb(usename)%></a>[<%=ubb(rs("dong"))%>]<%=ubb(rs("bu"))%><a href="wapBBS.asp?PID=<%=rs("id")%>&amp;ID=<%=ID%>&amp;Page=<%=Page%>&amp;Action=BBSLog&amp;useid=<%=useid%>&amp;adminmid=<%=request("adminmid")%>&amp;kyzcc=delok">删除</a><br/><%
Response.write"(" & String(2-Len(Month(rs("tm"))),"0") & Month(rs("tm")) & "-" & String(2-len(Day(rs("tm"))),"0") & Day(rs("tm")) & " &nbsp;" & String(2-Len(hour(rs("tm"))),"0") & hour(rs("tm"))  & ":" & String(2-Len(minute(rs("tm"))),"0") & minute(rs("tm")) & ")<br/>"
%>
<%rs.movenext 
j=j+1 
loop%>

<small><%=Rs.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rs.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="wapBBS.asp?Action=BBSLog&amp;adminmid=<%=request("adminmid")%>&amp;ID=<%=ID%>&amp;useid=<%=useid%>">首页</a>
      <a href="wapBBS.asp?Action=BBSLog&amp;Page=<%=page-1%>&amp;adminmid=<%=request("adminmid")%>&amp;ID=<%=ID%>&amp;useid=<%=useid%>"><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
<% if rs.pagecount-page <> 0 then %>
      <a href="wapBBS.asp?Action=BBSLog&amp;Page=<%=page+1%>&amp;adminmid=<%=request("adminmid")%>&amp;ID=<%=ID%>&amp;useid=<%=useid%>"><b>[<%=page+1%>]</b></a>
      <a href="wapBBS.asp?Action=BBSLog&amp;page=<%=rs.pagecount%>&amp;adminmid=<%=request("adminmid")%>&amp;ID=<%=ID%>&amp;useid=<%=useid%>">尾页</a>
	  <%end if%>
<% if rs.pagecount-page <> 0 or page>1 then %>
      <br/>
	  <%end if%>
------------<br/>
搜ＩＤ:<input name="useid" title="筛选" size="12" value=""/><br/>
<anchor>筛选
    <go href="wapBBS.asp?Action=BBSLog&amp;adminmid=<%=request("adminmid")%>&amp;ID=<%=ID%>" method="post" accept-charset="utf-8">
        <postfield name="useid" value="$(useid)"/>
	</go>
</anchor>
<%end if%>
<br/>
<a href="wapAdmin_bbs.asp?adminmid=<%=request("adminmid")%>">返回社区管理</a><br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
</p></card></wml>

<%
Conn.close
set Conn=nothing

Function outstr(str,page)	
	if len(str)>pagesize then
		PageCount=len(str)\pagesize+1
		str=mid(str,(page-1)*pagesize+1,pagesize)
	else
		PageCount=1
	end if

	outstr=str
end Function%>