<!--#include file="wmlhead.asp"--><%
SessionID=request.querystring("SessionID")
if request.querystring("wap")="" then
SessionID=request.cookies("SessionID")
if request.cookies("wap")="" then
wap=""
end if
end if
yifei=request.querystring("yifei")
public id,info
action=request("action")
id=request("id")
if not isnumeric(id) or session("useid")="" then
	call showinfo("操作出错","错误的版面参数或非法访问！")
else
	select case action
	case "edit"
		call edit()
	case "saveedit"
		call saveedit()
	case "del"
		call del()
	case else
		call showinfo("操作出错","错误的版面参数或非法访问！")
	end select
end if
closeconn

sub showinfo(title,content)
%><wml>
<card id="main" title="<%response.write title%>">
<p><b><%response.write title%></b><br/>
--------<br/>
<%response.write content%><br/>
--------<br/>
<a href="myalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">我的博客</a><br/>
<% if yifei<>"" then%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%end if%>
</p></card>
</wml><%
end sub

sub edit()
id=request("id")
if id="" or not isnumeric(id) then
	info="错误的版面参数"
else
	set rs=conn.execute("select * from wap_album_content where useid='"&session("useid")&"' and id="&id)
	if not rs.eof then
		url=rs("imgpath")
		title=rs("title")
		content=rs("content")
		typeid=rs("typeid")
		ctypeid=rs("ctypeid")
		isupload=rs("isupload")
		isshare=rs("isshare")
	else
		info="错误的版面参数，请确认是从有效路径进入"
	end if
	rs.close
	set rs=nothing
end if

%><wml>
<card id="main" title="修改文章" newcontext="true">
<p><%
if info<>"" then
	response.write info&"<br/>"
else
%>URL：<%response.write url%><br/> 
标题：<input type="text" name="title" maxlength="100" value="<%response.write replace(title,"""","")%>" /><br/>
分类： <select name="typeid">
<%call printtype(typeid)%>
</select><br/> 
存储： <select name="ctypeid">
<%call printctype(ctypeid)%></select><br/> 
共享： <select name="isshare">
<%if isshare then%><option value="1">共享</option>
<option value="0">私藏</option><%
else%>
<option value="0">私藏</option>
<option value="1">共享</option>
<%end if%>
</select><br/> 
描述：<input type="text" name="content" maxlength="1000" value="<%response.write replace(content,"""","")%>" /><br/>
<anchor>确认修改
<go href="do.asp?action=saveedit&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>" method="post" accept-charset="utf-8">
<postfield name="title" value="$(title)"/>
<postfield name="content" value="$(content)"/>
<postfield name="typeid" value="$(typeid)"/>
<postfield name="ctypeid" value="$(ctypeid)"/>
<postfield name="isshare" value="$(isshare)"/>
<postfield name="id" value="<%response.write id%>"/>
</go>
</anchor><br/>
－－－－－<br/>
<a href="myalbum.asp?cid=<%response.write ctypeid%>&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">返回上级</a><br/>
<%
end if
%><a href="myalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">我的博客</a><br/>
<% if yifei<>"" then%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%end if%>
</p></card>
</wml><%
end sub

sub saveedit()
id=request("id")
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
if title="" or content="" or id="" or not isnumeric(id) then
	info="标题，内容不能为空！请重试"
else
	set rs=server.createobject("adodb.recordset")
	sql="select * from wap_album_content where useid='"&session("useid")&"' and id="&id
	rs.open sql,conn,1,3
		rs("title")=title
		rs("content")=content
		rs("edittime")=now()
		rs("isedit")=true
		rs("ltname")=session("ltname")
		rs("typeid")=typeid
		rs("ctypeid")=ctypeid
		rs("isshare")=isshare
		rs.update
		info="恭喜!修改成功!<br/><a href=""view.asp?id="&id&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>点击这里查看您刚修改的信息</a>"
		url="view.asp?id="&id&"&amp;SessionID=" & SessionID
	rs.close
	set rs=nothing
end if
%><wml>
<%
if url="" then
%><card id="main" title="修改结果">
<%else
%><card id="main" ontimer="<%response.write url%>" title="修改结果">
<timer value="30"/><%
end if
%>
<p><%
response.write info
%><br/>
--------<br/>
<% if yifei<>"" then%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%end if%>
</p></card>
</wml><%
end sub

sub printtype(typeid)
	if typeid="" then typeid="0"
	set rs=conn.execute("select * from wap_album_type where id="&typeid)
	if not rs.eof then response.write "<option value="""&rs("id")&""">"&rs("tname")&"</option>"&vbnewline
	rs.close
	set rs=nothing
	set rs=conn.execute("select * from wap_album_type where id<>"&typeid&" order by orders desc")
	do until rs.eof
		response.write "<option value="""&rs("id")&""">"&rs("tname")&"</option>"&vbnewline
		rs.movenext
	loop
	rs.close
	set rs=nothing
end sub

sub printctype(ctypeid)
	if ctypeid="" then ctypeid="0"
	set rs=conn.execute("select * from wap_album_ctype where useid='"&session("useid")&"' and id="&ctypeid)
	if not rs.eof then response.write "<option value="""&rs("id")&""">"&rs("ctname")&"</option>"&vbnewline
	rs.close
	set rs=nothing
	response.write "<option value=""0"">根目录</option>"&vbnewline
	set rs=conn.execute("select * from wap_album_ctype where useid='"&session("useid")&"' and id<>"&ctypeid&" order by orders desc")
	do until rs.eof
		response.write "<option value="""&rs("id")&""">"&rs("ctname")&"</option>"&vbnewline
		rs.movenext
	loop
	rs.close
	set rs=nothing
end sub

sub del()
if not isnumeric(id) or session("useid")="" then
	call showinfo("操作出错","错误的版面参数或非法访问！")
	exit sub
end if
sql="select * from wap_album_content where useid='"&session("useid")&"' and id="&id
set rs=conn.execute(sql)
if rs.eof then
	call showinfo("操作出错","对不起，您要删除的数据不存在或您没有删除的权限！")
	rs.close
	set rs=nothing
	exit sub
end if
isupload=rs("isupload")
imgpath=rs("imgpath")
ctypeid=rs("ctypeid")
rs.close
set rs=nothing
if isupload then
	on error resume next
	uploadpath=server.mappath("upload")&"\"
	file2=uploadpath&imgpath
	Set fs = CreateObject("Scripting.FileSystemObject")
	fs.deletefile file2,True
end if
conn.execute("delete from wap_album_re where albumid="&id)
conn.execute("delete from wap_album_content where id="&id)
%><wml>
<card id="main" ontimer="myalbum.asp?cid=<%response.write ctypeid%>&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>" title="删除成功">
<timer value="30"/>
<p>删除成功。<br/>
--------<br/>
<a href="myalbum.asp?cid=<%response.write ctypeid%>&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">返回上级</a><br/>
<a href="myalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">我的博客</a><br/>
<% if yifei<>"" then%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x793E;&#x533A;&#x9996;&#x9875;</a><br/>
<%end if%>
</p></card>
</wml><%
end sub
%>