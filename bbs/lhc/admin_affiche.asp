<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="cnscucsb.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
if Cstr(Session("yxxecp"))<>"" or Session("cg")<>"" or Session("Counter")="pass_numbers_55556666" then

page=Request("page")

Action=Request("Action")

	If Action="" or Action="mian" Then
%>
<card id="main" title="管理公告" >
<p>
<a href="admin_affiche.asp?Action=add&amp;SessionID=<%=request("SessionID")%>">添加公告</a><br/>
<%
sql="select * from affiche order by AfficheId desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,myc,1,1
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
<b><u>管理公告</u></b><br/><small>当前共有</small><b><%=Rs.recordcount%></b><small>条记录</small>

<br/>-------------<br/>
<%do while not rs.eof and j<=listnum%>
<%
'========================================================================================
name=request.servervariables("script_name") 'name为当前文件名
'========================================================================================
%>
<b><u><a href="admin_affiche.asp?Action=view&amp;id=<%=rs("AfficheId")%>&amp;SessionID=<%=request("SessionID")%>&amp;page=<%=page%>">[管理]</a></u></b><%=(j+(page-1)*listnum)%>:<%=ubb(rs("AfficheName"))%>[<%=ubb(rs("AfficheTime"))%>]<br/>
<%rs.movenext 
j=j+1 
loop%>
<small><%=Rs.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rs.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="admin_affiche.asp?Action=mian&amp;SessionID=<%=request("SessionID")%>">&lt;&lt;</a>
      <a href="admin_affiche.asp?Action=mian&amp;SessionID=<%=request("SessionID")%>&amp;page=<%=page-1%>"><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
<% if rs.pagecount-page <> 0 then %>
      <a href="admin_affiche.asp?Action=mian&amp;SessionID=<%=request("SessionID")%>&amp;page=<%=page+1%>"><b>[<%=page+1%>]</b></a>
      <a href="admin_affiche.asp?Action=mian&amp;SessionID=<%=request("SessionID")%>&amp;page=<%=rs.pagecount%>">>></a>
	  <%end if%>
<%end if%>
<% if rs.pagecount-page <> 0 or page>1 then %>
      <br/>
	  <%end if%>
-----------<br/>
<%
elseIf Action="view" Then%>

<card id="main" title="管理公告" >
<p>

<%id=usb(request("id"))
page=usb(request("page"))
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from affiche where AfficheId="&id
rs.open rspl,myc,1,2
if rs.eof then 
response.write("ID错误!<br/>")
else
%>
公告编号:<%=ubb(rs("AfficheId"))%><br/>
添加时间:<%=ubb(rs("AfficheTime"))%><br/>
公告标题:<%=ubb(rs("AfficheName"))%><br/>
查看次数:<%=ubb(rs("AfficheHots"))%><br/>
公告内容:<%=ubb2(rs("AfficheContent"))%><br/>
----------<br/>
<a href="admin_affiche.asp?SessionID=<%=request("SessionID")%>&amp;id=<%=id%>&amp;Action=kyaa">编辑公告</a><br/>
<a href="admin_affiche.asp?SessionID=<%=request("SessionID")%>&amp;id=<%=id%>&amp;Action=del">删除公告</a><br/>

-----------<br/><a href="admin_affiche.asp?SessionID=<%=request("SessionID")%>">返回公告管理</a><br/>

<%end if

elseIf Action="del" Then
id=usb(request("id"))
page=usb(request("page"))
%>
<card id="main" title="管理公告" >
<p>
删除后不可恢复，确定删除?<br/>
<a href="admin_affiche.asp?SessionID=<%=request("SessionID")%>&amp;id=<%=id%>&amp;page=<%=page%>&amp;Action=delok">确定</a><br/>
<a href="admin_affiche.asp?SessionID=<%=request("SessionID")%>&amp;id=<%=id%>&amp;page=<%=page%>&amp;Action=view">取消</a><br/>
-----------<br/><a href="admin_affiche.asp?SessionID=<%=request("SessionID")%>">返回公告管理</a><br/>

<%
elseIf Action="delok" Then
%>
<card id="main" title="删除公告" >
<p>
<%
page=usb(request("page"))
dim id 
id = clng(request("id"))
myc.execute("delete from affiche where AfficheId="&id)
%>
删除成功！<br/>
-----------<br/><a href="admin_affiche.asp?SessionID=<%=request("SessionID")%>">返回公告管理</a><br/>
<%
elseIf Action="kyaa" Then
%>
<card id="main" title="编辑公告" >
<p>
<%

id=usb(request("id"))
page=usb(request("page"))
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from affiche where AfficheId="&id
rs.open rspl,myc,1,2
if rs.eof then 
response.write("没有该公告!<br/>")
else
%>
修改公告:<%=ubb(rs("AfficheName"))%><br/>
公告标题:<input name='nam<%=minute(now)%><%=second(now)%>' title='标题' value='<%=ubb(rs("AfficheName"))%>'/><br/>
公告内容:<input name='txt<%=minute(now)%><%=second(now)%>' title='内容' value='<%=ubb(rs("AfficheContent"))%>'/><br/>
<anchor>确定<go href='admin_affiche.asp?SessionID=<%=request("SessionID")%>&amp;id=<%=id%>&amp;Action=kyaa_ok' method='post' accept-charset='utf-8'>
<postfield name='nam' value='$(nam<%=minute(now)%><%=second(now)%>)'/>
<postfield name='txt' value='$(txt<%=minute(now)%><%=second(now)%>)'/>
</go>
</anchor><br/>
-----------<br/><a href="admin_affiche.asp?SessionID=<%=request("SessionID")%>">返回公告管理</a><br/>
<%end if


elseif Action="kyaa_ok" then%>
<card id="main" title="编辑公告" >
<p>
<%

id=usb(request("id"))
page=usb(request("page"))
nam=usb(request("nam"))
txt=usb(request("txt"))

set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from affiche where AfficheId="&id
rs.open rspl,myc,1,2
if rs.eof then 
response.write("没有该公告!<br/>")
else
if nam<>"" then rs("AfficheName")=nam
if txt<>"" then rs("AfficheContent")=txt
rs.update
%>
修改成功！<br/>
-----------<br/><a href="admin_affiche.asp?SessionID=<%=request("SessionID")%>">返回公告管理</a><br/>

<%end if%>

<%
elseif Action="add" then%>

<card id="main" title="添加公告" >
<p>
标题:
<input name='nam' title='公告标题'/><br/>
内容:
<input name='txt<%=minute(now)%><%=second(now)%>' title='公告内容'/><br/>
<anchor>确定<go href='admin_affiche.asp?SessionID=<%=request("SessionID")%>&amp;Action=addcl' method='post' accept-charset='utf-8'>
<postfield name='nam' value='$(nam)'/>
<postfield name='txt' value='$(txt<%=minute(now)%><%=second(now)%>)'/>
</go></anchor><br/>
-----------<br/><a href="admin_affiche.asp?SessionID=<%=request("SessionID")%>">返回公告管理</a><br/>
<%
elseif Action="addcl" then%>
<card id="main" title="添加公告">
<p>
<%
nam=request("nam")
txt=request("txt")
if nam="" or txt="" then 

response.write("请正确添加!<br/>")

else
'---开始增加----
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from affiche order by AfficheTime asc"
rs.open rspl,myc,1,2
rs.addnew

rs("AfficheName")=nam
rs("AfficheContent")=txt
rs("AfficheTime")=Now()
rs.update
'---关闭数据----
rs.close
set rs=nothing
%>
成功增加名为<u>[<%=nam%>]</u>的公告<br/>
<%end if%>
-----------<br/><a href="admin_affiche.asp?SessionID=<%=request("SessionID")%>">返回公告管理</a><br/>

<%end if%>

<%end if%>
<a href="/BBS/LHC/Admin.Asp?SessionID=<%=request("SessionID")%>">返回彩票管理</a><br/>
<a href="/BBS/index.asp?SessionID=<%=request("SessionID")%>">返回社区首页</a><br/>
<br/>
</p>
</card>
</wml>