<!--#include file="wmlhead.asp"--><%
public info
select case request("action")
case "add"
	call add()
case else
	call default()
end select


sub default()
%><wml>
<card id="main" title="书写日志">
<p><%
response.write info
if session("useid")>0 then
call checkuser()
%>
标题：<input type="text" name="title" maxlength="100" /><br/>
分类： <select name="typeid">
<%call printtype()%>
</select><br/> 
目录： <select name="ctypeid">
<%call printctype()%></select><br/> 
属性： <select name="isshare">
<option value="1">共享</option>
<option value="0">私藏</option>
</select><br/> 
内容：<input type="text" name="content" maxlength="1000" /><br/>
<anchor>发表信息
<go href="addalbum.asp?action=add" method="post" accept-charset="utf-8">
<postfield name="title" value="$(title)"/>
<postfield name="content" value="$(content)"/>
<postfield name="typeid" value="$(typeid)"/>
<postfield name="ctypeid" value="$(ctypeid)"/>
<postfield name="isshare" value="$(isshare)"/>
<postfield name="useid" value="<%response.write session("useid")%>"/>
<postfield name="img" value="<%response.write request("img")%>"/>
</go>
</anchor><br/>
<%
else
%>只有本站会员才享有此项服务,请先<a href='/bbs/UseLogin.asp'>注册或登录</a>本站会员中心<br/>
<%end if
%>－－－－－<br/>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p></card>
</wml><%
end sub

sub add()
title=checkstr(request("title"))
content=checkstr(request("content"))
typeid=request("typeid")
ctypeid=request("ctypeid")
isshare=request("isshare")
if cstr(isshare)="1" then
	isshare=true
else
	isshare=false
end if
useid=checkstr(request("useid"))
if title="" or content=""  then
	info="标题，内容，不能为空！请重试"
else
	set rs=server.createobject("adodb.recordset")
	sql="select * from wap_album_content where useid='"&session("useid")&"'"
	rs.open sql,conn,1,3
		rs.addnew
		rs("title")=title
		rs("content")=content
		rs("isupload")=false
		rs("posttime")=now()
		rs("useid")=session("useid")
		rs("ltname")=session("ltname")
		rs("click")=0
		rs("typeid")=typeid
		rs("ctypeid")=ctypeid
		rs("isshare")=isshare
       rs.update
		temp = rs.bookmark
		rs.bookmark = temp
		id=rs.Fields("ID").value
		info="恭喜!您的日志已添加成功!<br/><a href=""view.asp?id="&id&""">点击这里查看您刚写的信息</a>"
		url="view.asp?id="&id
end if
rs.close
set rs=nothing
%><wml>
<%
if url="" then
%><card id="main" title="发布结果">
<%else
%><card id="main" ontimer="<%response.write url%>" title="发布结果">
<timer value="3000"/><%
end if
%>
<p><%
response.write info
%><br/>
--------<br/>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p></card>
</wml><%
end sub

sub printtype()
	set rs=conn.execute("select * from wap_album_type order by orders desc")
	do until rs.eof
		response.write "<option value="""&rs("id")&""">"&rs("tname")&"</option>"&vbnewline
		rs.movenext
	loop
	rs.close
	set rs=nothing
end sub

sub printctype()
	response.write "<option value=""0"">根目录</option>"&vbnewline
	set rs=conn.execute("select * from wap_album_ctype where useid='"&session("useid")&"' order by orders desc")
	do until rs.eof
		response.write "<option value="""&rs("id")&""">"&rs("ctname")&"</option>"&vbnewline
		rs.movenext
	loop
	rs.close
	set rs=nothing
end sub

sub checkuser()
	set rs=server.createobject("adodb.recordset")
	sql="select * from wap_album_user where useid='"&session("useid")&"'"
	rs.open sql,conn,1,3
	if rs.eof then
		rs.addnew
		rs("useid")=session("useid")
		rs("ltname")=session("ltname")
		rs.update
	else
		rs("ltname")=session("ltname")
		rs.update
	end if
	rs.close
	set rs=nothing
end sub
%>