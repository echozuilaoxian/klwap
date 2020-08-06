<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include file="check.asp" -->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
if ltmybz1<>"0" or mycjbz="1" then

page=Request("page")

Action=Request("Action")
	If Action=""  Then Action="mian"

If Action="mian" Then
%>
<card id="main" title="送花管理" >
<p>
<%
sql="select * from affich order by AfficheId desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "暂无送花记录<br/>"
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
<b><u>送花管理</u></b><small>当前共有</small><b><%=Rs.recordcount%></b><small>条记录</small>

<br/>-------------<br/>
<%do while not rs.eof and j<=listnum%>
<%
'========================================================================================
name=request.servervariables("script_name") 'name为当前文件名
'========================================================================================
%>
<b><u><a href="adminbbsgb.asp?Action=view&amp;id=<%=rs("AfficheId")%>&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page%>">[管理]</a></u></b><%=(j+(page-1)*listnum)%>:<%=ubb(rs("AfficheName"))%>[<%=ubb(rs("AfficheTime"))%>]<br/>
<%rs.movenext 
j=j+1 
loop%>
<small><%=Rs.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rs.pagecount%> 页 <br/></small>
      <% if page=1 then %>
      <%else%>
      <a href="adminbbsgb.asp?Action=mian&amp;adminmid=<%=request("adminmid")%>">&lt;&lt;</a>
      <a href="adminbbsgb.asp?Action=mian&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page-1%>"><b>[<%=page-1%>]</b></a>
      <%end if%><% if rs.pagecount=1 then%><%else%><b>[<%=page%>]</b><%end if%>
<% if rs.pagecount-page <> 0 then %>
      <a href="adminbbsgb.asp?Action=mian&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=page+1%>"><b>[<%=page+1%>]</b></a>
      <a href="adminbbsgb.asp?Action=mian&amp;adminmid=<%=request("adminmid")%>&amp;page=<%=rs.pagecount%>">>></a>
	  <%end if%>
<%end if%>
<% if rs.pagecount-page <> 0 or page>1 then %>
      <br/>
	  <%end if%>
-----------<br/>
<%
elseIf Action="view" Then%>

<card id="main" title="送花管理" >
<p>

<%id=usb(request("id"))
page=usb(request("page"))
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from affich where AfficheId="&id
rs.open rspl,conn,1,2
if rs.eof then 
response.write("ID错误!<br/>")
else
%>
送花编号:<%=ubb(rs("AfficheId"))%><br/>
添加时间:<%=ubb(rs("AfficheTime"))%><br/>
送花内容:<%=ubb(rs("AfficheName"))%><br/>
----------<br/>
<a href="adminbbsgb.asp?adminmid=<%=request("adminmid")%>&amp;id=<%=id%>&amp;Action=kyaa">编辑送花</a><br/>
<a href="adminbbsgb.asp?adminmid=<%=request("adminmid")%>&amp;id=<%=id%>&amp;Action=del">删除送花</a><br/>

-----------<br/><a href="adminbbsgb.asp?adminmid=<%=request("adminmid")%>">返回送花管理</a><br/>

<%end if

elseIf Action="del" Then
id=usb(request("id"))
page=usb(request("page"))
%>
<card id="main" title="送花管理" >
<p>
删除后不可恢复，确定删除?<br/>
<a href="adminbbsgb.asp?adminmid=<%=request("adminmid")%>&amp;id=<%=id%>&amp;page=<%=page%>&amp;Action=delok">确定</a><br/>
<a href="adminbbsgb.asp?adminmid=<%=request("adminmid")%>&amp;id=<%=id%>&amp;page=<%=page%>&amp;Action=view">取消</a><br/>
-----------<br/><a href="adminbbsgb.asp?adminmid=<%=request("adminmid")%>">返回送花管理</a><br/>

<%
elseIf Action="delok" Then
%>
<card id="main" title="删除送花" >
<p>
<%
page=usb(request("page"))
dim id 
id = clng(request("id"))
conn.execute("delete from affich where AfficheId="&id)
%>
删除成功！<br/>
-----------<br/><a href="adminbbsgb.asp?adminmid=<%=request("adminmid")%>">返回送花管理</a><br/>
<%
elseIf Action="kyaa" Then
%>
<card id="main" title="编辑送花" >
<p>
<%

id=usb(request("id"))
page=usb(request("page"))
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from affich where AfficheId="&id
rs.open rspl,conn,1,2
if rs.eof then 
response.write("没有该广播!<br/>")
else
%>
修改送花:<%=ubb(rs("AfficheName"))%><br/>
送花内容:<input name='nam<%=minute(now)%><%=second(now)%>' title='内容' value='<%=ubb(rs("AfficheName"))%>'/><br/>
<anchor>确定<go href='adminbbsgb.asp?adminmid=<%=request("adminmid")%>&amp;id=<%=id%>&amp;Action=kyaa_ok' method='post' accept-charset='utf-8'>
<postfield name='nam' value='$(nam<%=minute(now)%><%=second(now)%>)'/>
</go>
</anchor><br/>
-----------<br/><a href="adminbbsgb.asp?adminmid=<%=request("adminmid")%>">返回送花管理</a><br/>
<%end if


elseif Action="kyaa_ok" then%>
<card id="main" title="编辑送花" >
<p>
<%

id=usb(request("id"))
page=usb(request("page"))
nam=usb(request("nam"))
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from affich where AfficheId="&id
rs.open rspl,conn,1,2
if rs.eof then 
response.write("没有该送花!<br/>")
else
if nam<>"" then rs("AfficheName")=nam
rs.update
%>
修改成功！<br/>
-----------<br/><a href="adminbbsgb.asp?adminmid=<%=request("adminmid")%>">返回送花管理</a><br/>

<%end if%>

<%
elseif Action="add" then%>

<card id="main" title="" >
<p>
内容:
<input name='nam' title=''/><br/>
<anchor><go href='adminbbsgb.asp?Action=addcl&amp;adminmid=<%=request("adminmid")%>' method='post' accept-charset='utf-8'>
<postfield name='nam' value='$(nam)'/>
</go></anchor><br/>
-----------<br/><a href="adminbbsgb.asp?adminmid=<%=request("adminmid")%>">返回送花管理</a><br/>
<%
elseif Action="addcl" then%>
<card id="main" title="">
<p>
<%
nam=request("nam")
if nam="" then 

response.write("请正确添加!<br/>")

else
'---开始增加----
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from affich order by AfficheTime asc"
rs.open rspl,conn,1,2
rs.addnew

rs("AfficheName")=nam
rs("AfficheTime")=Now()
rs.update
'---关闭数据----
rs.close
set rs=nothing
%>
<%end if%>
-----------<br/><a href="adminbbsgb.asp?adminmid=<%=request("adminmid")%>">返回送花管理</a><br/>

<%end if%>

<%end if
if Action="mian" then
%>
<%end if%>

<a href="wapadmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
<br/>
</p>
</card>
</wml>