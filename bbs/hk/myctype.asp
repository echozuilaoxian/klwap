<!--#include file="wmlhead.asp"--><%
SessionID=request.querystring("SessionID")
if request.querystring("wap")="" then
SessionID=request.cookies("SessionID")
if request.cookies("wap")="" then
wap=""
end if
end if
yifei=request.querystring("yifei")
if session("useid")="" then
	call showinfo("没有权限","对不起，该功能只对会员开放。")
	response.end
end if
public id,info
action=request("action")
select case action
case "add"
	call add()
case "saveadd"
	call saveadd()
case "edit"
	call edit()
case "saveedit"
	call saveedit()
case "del"
	call del()
case else
	call default()
end select
closeconn

sub showinfo(title,content)
%><wml>
<card id="main" title="<%response.write title%>">
<p><b><%response.write title%></b><br/>
--------<br/>
<%response.write content%><br/>
--------<br/>
<a href="myctype.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">目录管理</a><br/>
<a href="myalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">我的博客</a><br/>
<% if yifei<>"" then%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<a href="index0.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<%end if%>
</p></card>
</wml><%
end sub

sub default()
%><wml>
<card id="main" title="目录管理">
<p><a href="myctype.asp?action=add&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">添加目录</a><br/>
<%call ctlist()%>
--------<br/>
<a href="myalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">我的博客</a><br/>
<% if yifei<>"" then%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<%end if%>
</p></card>
</wml><%
end sub

sub ctlist()
set rs=conn.execute("select * from wap_album_ctype where useid='"&session("useid")&"' order by orders desc")
if rs.eof then
	liststr=""
else
	do until rs.eof
		liststr=liststr&"·<a href=""myalbum.asp?cid="&rs("id")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>"&rs("ctname")&"</a><br/><a href=""myctype.asp?action=edit&amp;id="&rs("id")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>修改</a> &nbsp; <a href=""myctype.asp?action=del&amp;id="&rs("id")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>删除</a>"
		liststr=liststr&"<br/>"&vbnewline
		rs.movenext
	loop
	'liststr="--------<br/>"&liststr
end if
rs.close
set rs=nothing
response.write liststr
end sub

sub add()
%><wml>
<card id="main" title="添加目录">
<p>
名称：<input type="text" name="ctname" maxlength="25" /><br/>
排序： <input type="text" name="orders" maxlength="5" format="*N" /><br/>
注意：排序数字越大将越靠前<br/>
<anchor>确认添加
<go href="myctype.asp?action=saveadd&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>" method="post" accept-charset="utf-8">
<postfield name="ctname" value="$(ctname)"/>
<postfield name="orders" value="$(orders)"/>
</go>
</anchor><br/>
－－－－－<br/>
<a href="myalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">我的博客</a><br/>
<% if yifei<>"" then%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<%end if%>
</p></card>
</wml><%
end sub

sub edit()
id=request("id")
if id="" or not isnumeric(id) then
	info="错误的版面参数"
	call showinfo("操作出错",info)
	exit sub
else
	set rs=conn.execute("select * from wap_album_ctype where useid='"&session("useid")&"' and id="&id)
	if not rs.eof then
		ctname=rs("ctname")
		orders=rs("orders")
	else
		info="错误的版面参数，请确认是从有效路径进入"
		call showinfo("操作出错",info)
		rs.close
		set rs=nothing
		exit sub
	end if
	rs.close
	set rs=nothing
end if
%><wml>
<card id="main" title="修改目录" newcontext="true">
<p>名称：<input type="text" name="ctname" maxlength="25" value="<%response.write ctname%>" /><br/>
排序： <input type="text" name="orders" maxlength="5" format="*N" value="<%response.write orders%>" /><br/>
<anchor>确认修改
<go href="myctype.asp?action=saveedit&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>" method="post" accept-charset="utf-8">
<postfield name="ctname" value="$(ctname)"/>
<postfield name="orders" value="$(orders)"/>
<postfield name="id" value="<%response.write id%>"/>
</go>
</anchor><br/>
－－－－－<br/>
<a href="myalbum.asp">我的博客</a><br/>
<% if yifei<>"" then%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<%end if%>
</p></card>
</wml><%
end sub

sub saveadd()
ctname=checkstr(request("ctname"))
orders=checkstr(request("orders"))
if orders="" or not isnumeric(orders) then orders=0
if ctname="" then
	info="名称为空，请重试"
else
	set rs=server.createobject("adodb.recordset")
	sql="select * from wap_album_ctype where useid='"&session("useid")&"'"
	rs.open sql,conn,1,3
		rs.addnew
		rs("useid")=session("useid")
		rs("ctname")=ctname
		rs("orders")=orders
		rs.update
		info="恭喜!您的目录已添加成功!<br/>"
	rs.close
	set rs=nothing
end if
%><wml>
<card id="main" ontimer="myctype.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>" title="添加结果">
<timer value="30"/>
<p><%
response.write info
%><br/>
--------<br/>
<a href="myctype.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">目录管理</a><br/>
<a href="myalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">我的博客</a><br/>
<% if yifei<>"" then%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<%end if%>
</p></card>
</wml><%
end sub

sub saveedit()
id=request("id")
ctname=checkstr(request("ctname"))
orders=checkstr(request("orders"))
if orders="" or not isnumeric(orders) then orders=0
if ctname="" or id="" or not isnumeric(id) then
	info="名称为空或参数错误，请重试"
else
	set rs=server.createobject("adodb.recordset")
	sql="select * from wap_album_ctype where useid='"&session("useid")&"' and id="&id
	rs.open sql,conn,1,3
		rs("ctname")=ctname
		rs("orders")=orders
		rs.update
		info="恭喜!您的目录已修改成功!<br/>"
	rs.close
	set rs=nothing
end if
%><wml>
<card id="main" ontimer="myctype.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>" title="修改结果">
<timer value="30"/>
<p><%
response.write info
%><br/>
--------<br/>
<a href="myctype.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">目录管理</a><br/>
<a href="myalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">我的博客</a><br/>
<% if yifei<>"" then%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<%end if%>
</p></card>
</wml><%
end sub

sub del()
id=request("id")
if not isnumeric(id) or session("useid")="" then
	call showinfo("操作出错","错误的版面参数或非法访问！")
	exit sub
end if
sql="select * from wap_album_ctype where useid='"&session("useid")&"' and id="&id
set rs=conn.execute(sql)
if rs.eof then
	call showinfo("删除失败","对不起，您要删除的数据不存在或您没有删除的权限！")
	rs.close
	set rs=nothing
	exit sub
end if
rs.close
set rs=nothing
set rs=conn.execute("select * from wap_album_content where ctypeid="&id)
if not rs.eof then
	call showinfo("删除失败","对不起，目录非空，请先删除目录下相关文件！")
	rs.close
	set rs=nothing
	exit sub
else
	conn.execute("delete from wap_album_ctype where id="&id)
end if
%><wml>
<card id="main" ontimer="myctype.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>" title="删除成功">
<timer value="30"/>
<p>您的目录删除成功。<br/>
--------<br/>
<a href="myctype.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">目录管理</a><br/>
<a href="myalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">我的博客</a><br/>
<% if yifei<>"" then%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<%end if%>
</p></card>
</wml><%
end sub
%>