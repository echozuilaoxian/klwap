<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<link rel="Shortcut Icon" href='/favicon.ico'/>
<%
SessionID=request.querystring("SessionID")
if  SessionID="" then  SID=Session("SessionID")
ForumID=request("ForumID")
if  ForumID="" then
 Call Error("<card id='card1' title='专题管理'><p>系统提示:非法数据")
end if
if Cstr(Session("yxxezb"))<>"" or Session("bzbz")=forumID or Session("gly")=forumID or Session("Counter")="pass_numbers_55556666" then

page=Request("page")

Action=Request("Action")
	If Action=""  Then Action="mian"

If Action="mian" Then
%>
<card id="main" title="专题管理" >
<p>
<%
sql="select * from ltzt where ForumID="&ForumID&"  order by id desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "暂无专题记录<br/>"
else
%>
<b><u>管理专题</u></b><small>当前共有</small><b><%=Rs.recordcount%></b><small>条记录</small>

<br/>-------------<br/>
<%for i=1 to rs.RecordCount
j=j+1%>

<%=j%>:<a href="wap_admin_gg.asp?Action=view&amp;id=<%=rs("id")%>&amp;SessionID=<%=request("SessionID")%>&amp;ForumID=<%=ForumID%>">[管理]</a>[<%=ubb(rs("tjname"))%>]<br/>
<%
rs.movenext 

if rs.EOF then Exit for
 Next
end if
%>
<small><%=Rs.recordcount%>条记录|<%=listnum%> 条记录/页|共 <%=rs.pagecount%> 页 <br/></small>
-----------<br/>
<%elseIf Action="view" Then%>

<card id="main" title="管理专题" >
<p>

<%id=request("id")
page=untowide(request("page"))
set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from ltzt where id="&id&" and ForumID="&ForumID&" "
rs.open sql,conn,1,2
if rs.eof then 
response.write("ID错误!<br/>")
else
%>
专题编号:<%=ubb(rs("id"))%><br/>
专题标题:<%=ubb(rs("tjname"))%><br/>
----------<br/>
<a href="wap_admin_gg.asp?SessionID=<%=request("SessionID")%>&amp;id=<%=id%>&amp;Action=kyaa&amp;ForumID=<%=ForumID%>">编辑专题</a><br/>
<a href="wap_admin_gg.asp?SessionID=<%=request("SessionID")%>&amp;id=<%=id%>&amp;Action=del&amp;ForumID=<%=ForumID%>">删除专题</a><br/>

-----------<br/><a href="wap_admin_gg.asp?SID=<%=request("SID")%>&amp;ForumID=<%=ForumID%>">返回专题管理</a><br/>

<%end if
elseIf Action="del" Then
id=request("id")
%>
<card id="main" title="管理专题" >
<p>
删除后不可恢复，确定删除?<br/>
<a href="wap_admin_gg.asp?SessionID=<%=request("SessionID")%>&amp;id=<%=id%>&amp;ForumID=<%=ForumID%>&amp;Action=delok">确定</a><br/>
<a href="wap_admin_gg.asp?SessionID=<%=request("SessionID")%>&amp;id=<%=id%>&amp;ForumID=<%=ForumID%>&amp;Action=view">取消</a><br/>
-----------<br/><a href="wap_admin_gg.asp?SessionID=<%=request("SessionID")%>&amp;ForumID=<%=ForumID%>">返回专题管理</a><br/>

<%elseIf Action="delok" Then%>
<card id="main" title="删除专题" >
<p>
<%
dim id 
id = clng(request("id"))
conn.execute("delete from ltzt where id="&id&" and ForumID="&ForumID&" ")
%>
删除成功！<br/>
-----------<br/><a href="wap_admin_gg.asp?SessionID=<%=request("SessionID")%>&amp;ForumID=<%=ForumID%>">返回专题管理</a><br/>
<%elseIf Action="kyaa" Then%>
<card id="main" title="编辑专题" >
<p>
<%
id=clng(request("id"))
page=untowide(request("page"))
set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from ltzt   where id="&id&" and ForumID="&ForumID&" "
rs.open sql,conn,1,2
if rs.eof then 
response.write("没有该专题!<br/>")
else
%>
修改专题:<%=ubb(rs("tjname"))%><br/>
专题标题:<input name='nam<%=minute(now)%><%=second(now)%>' title='标题' value='<%=ubb(rs("tjname"))%>'/><br/>
<anchor>确定<go href='wap_admin_gg.asp?SessionID=<%=request("SessionID")%>&amp;id=<%=id%>&amp;Action=kyaa_ok&amp;ForumID=<%=ForumID%>' method='post' accept-charset='utf-8'>
<postfield name='nam' value='$(nam<%=minute(now)%><%=second(now)%>)'/>
</go>
</anchor><br/>
-----------<br/><a href="wap_admin_gg.asp?SessionID=<%=request("SessionID")%>&amp;ForumID=<%=ForumID%>">返回专题管理</a><br/>
<%end if
elseif Action="kyaa_ok" then%>
<card id="main" title="编辑专题" >
<p>
<%id=clng(request("id"))
nam=untowide(request("nam"))
set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from  ltzt   where id="&id&" and ForumID="&ForumID&" "
rs.open sql,conn,1,2
if rs.eof then 
response.write("没有该专题!<br/>")
else
if nam<>"" then rs("tjname")=nam
rs.update
%>
修改成功！<br/>
-----------<br/><a href="wap_admin_gg.asp?SessionID=<%=request("SessionID")%>&amp;ForumID=<%=ForumID%>">返回专题管理</a><br/>

<%end if%>

<%elseif Action="add" then%>
<card id="main" title="添加专题" >
<p>
标题:
<input name='nam' title='专题标题'/><br/>
<anchor>确定<go href='wap_admin_gg.asp?Action=addcl&amp;SessionID=<%=request("SessionID")%>&amp;ForumID=<%=ForumID%>' method='post' accept-charset='utf-8'>
<postfield name='nam' value='$(nam)'/>
</go></anchor><br/>
-----------<br/><a href="wap_admin_gg.asp?SessionID=<%=request("SessionID")%>&amp;ForumID=<%=ForumID%>">返回专题管理</a><br/>
<%elseif Action="addcl" then%>
<card id="main" title="添加专题">
<p>
<%
nam=untowide(request("nam"))
if nam=""  then 
response.write("请正确添加!<br/>")
else
'---开始增加----
set rs=Server.CreateObject("ADODB.Recordset")
sql="select * from ltzt  where  ForumID="&ForumID&""
RS.CursorLocation = 3
rs.open sql,conn,1,2
if rs.recordcount>9 then
%>
每个论坛只能增加10个专题<br/>
<%else
rs.addnew
rs("tjname")=nam
rs("ForumID")=ForumID
rs.update
%>
成功增加名为<u>[<%=nam%>]</u>的专题<br/>
<%end if
end if%>
-----------<br/><a href="wap_admin_gg.asp?SessionID=<%=request("SessionID")%>&amp;ForumID=<%=ForumID%>">返回专题管理</a><br/>

<%end if%>

<%if Action="mian" then%>
<a href="wap_admin_gg.asp?Action=add&amp;SessionID=<%=request("SessionID")%>&amp;ForumID=<%=ForumID%>">添加新的专题</a><br/>
<%end if
else%>
<card id="main" title="专题管理" ><p>
你无此权限<br/>
<%end if
set objgbrsyd=Server.CreateObject("ADODB.Recordset")
sql="select * from sclt where id="&ForumID
objgbrsyd.open sql,conn,1,2
if objgbrsyd.eof then
dlnames="无此论坛"
Else
dlnames=objgbrsyd("name")
end if
objgbrsyd.close
Set objgbrsyd= Nothing
'---关闭数据----
conn.close
set conn=nothing
Response.write "-----------<br/><a href='/BBS/forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnames & "</a>"
%>
<br/><a href="/index.asp?SessionID=<%=request("SessionID")%>">返回社区</a><br/>
<a href="/index.asp?SessionID=<%=request("SessionID")%>">返回首页</a><br/>
<br/>
</p>
</card>
</wml>