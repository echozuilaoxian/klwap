<!--#include file="wmlhead.asp"--><!--#include file="inc/wmlubb.asp"--><%
SessionID=request.querystring("SessionID")
if request.querystring("wap")="" then
SessionID=request.cookies("SessionID")
if request.cookies("wap")="" then
wap=""
end if
end if
yifei=request.querystring("yifei")
select case request("action")
case "new"
	call shownew()
case "hot"
	call showhot()
case else
	call list()
end select
closeconn

sub shownew()
sql="select * from wap_album_content where isshare=true or useid='"&session("useid")&"' order by id desc"
	dim pagesz,strsql,rs,abspagenum,absrecordnum,totalpages,totalrecord
	Const adUseClient = 3
	Const adOpenStatic = 3
	Const adCmdText = &H0001
	pagesz=10
	absPageNum = CInt(Request("Page")) '读取当前页是第几页
	set rs = server.CreateObject("adodb.recordset")
	rs.CursorLocation = adUseClient 
	rs.CursorType = adOpenStatic
	rs.CacheSize = pagesz
	rs.Open sql,Conn,,,adCmdText
	if rs.eof and rs.bof then
		linklist="当前没有记录！<br/>"
	else
		rs.PageSize = pagesz
		totalrecord = rs.Recordcount '共多少条记录
		TotalPages = rs.PageCount '共多少页记录
		if request("page")<>"" then
			absPageNum = abs(cint(request("page")))
		Else
			absPageNum = 1 
		End If
		If absPageNum > TotalPages Then
			absPageNum = TotalPages
			rs.AbsolutePage = absPageNum
		elseif absPageNum = 0 Then
			absPageNum = 1
			rs.AbsolutePage = absPageNum
		else
			rs.AbsolutePage = absPageNum
		End If
		pageinfo="共 "&totalrecord&" 条,第 "&absPageNum&"/<a href=""list.asp?action=new&amp;page="&TotalPages&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>"&TotalPages&"</a>页<br/>"
		If absPageNum <> TotalPages Then pageinfo=pageinfo&"<a href=""list.asp?action=new&amp;page="&absPageNum+1&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>下一页</a><br/>"
		If absPageNum > 1 Then pageinfo=pageinfo&"<a href=""list.asp?action=new&amp;page="&absPageNum-1&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>上一页</a><br/>"
		if TotalPages > 1 then pageinfo=pageinfo&"<input title=""页码"" name=""page"" format=""*N"" size=""2"" maxlength=""3""/><anchor><go href=""list.asp?action=new&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """ method=""post"" accept-charset=""utf-8""><postfield name=""page"" value=""$(page)""/></go>转到该页</anchor><br/>"
		if absPageNum>1 then
		k=(absPageNum-1)*10
		end if
		for i=1 to pagesz
			k=k+1
			linklist=linklist&"" & k &".<a href=""view.asp?id="&rs("id")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>"&towml(rs("title"))&"</a><br/>("&rs("ltname")&"/"&rs("re")&"评)<br/>"&vbnewline
			rs.movenext
			if rs.eof then exit for
		next
	end if
rs.close
set rs=nothing
%>
<wml>
<card id="main" title="最新博客">
<p>最新博客<br/>
--------<br/>
<%response.write linklist%>--------<br/>
<%response.write pageinfo%>
<% if yifei<>"" then%>
<a href="addalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">添加文章</a><br/>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<a href="addalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">添加文章</a><br/>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%end if%>
</p>
</card>
</wml><%
end sub

sub showhot()
sql="select * from wap_album_content where isshare=true or useid='"&session("useid")&"' order by click desc,id desc"
	dim pagesz,strsql,rs,abspagenum,absrecordnum,totalpages,totalrecord
	Const adUseClient = 3
	Const adOpenStatic = 3
	Const adCmdText = &H0001
	pagesz=10
	absPageNum = CInt(Request("Page")) '读取当前页是第几页
	set rs = server.CreateObject("adodb.recordset")
	rs.CursorLocation = adUseClient 
	rs.CursorType = adOpenStatic
	rs.CacheSize = pagesz
	rs.Open sql,Conn,,,adCmdText
	if rs.eof and rs.bof then
		linklist="当前没有记录！<br/>"
	else
		rs.PageSize = pagesz
		totalrecord = rs.Recordcount '共多少条记录
		TotalPages = rs.PageCount '共多少页记录
		if request("page")<>"" then
			absPageNum = abs(cint(request("page")))
		Else
			absPageNum = 1 
		End If
		If absPageNum > TotalPages Then
			absPageNum = TotalPages
			rs.AbsolutePage = absPageNum
		elseif absPageNum = 0 Then
			absPageNum = 1
			rs.AbsolutePage = absPageNum
		else
			rs.AbsolutePage = absPageNum
		End If
		pageinfo="共 "&totalrecord&" 条,第 "&absPageNum&"/<a href=""list.asp?action=hot&amp;page="&TotalPages&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>"&TotalPages&"</a>页<br/>"
		If absPageNum <> TotalPages Then pageinfo=pageinfo&"<a href=""list.asp?action=hot&amp;page="&absPageNum+1&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>下一页</a><br/>"
		If absPageNum > 1 Then pageinfo=pageinfo&"<a href=""list.asp?action=hot&amp;page="&absPageNum-1&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>上一页</a><br/>"
		if TotalPages > 1 then pageinfo=pageinfo&"<input title=""页码"" name=""page"" format=""*N"" size=""2"" maxlength=""3""/><anchor><go href=""list.asp?action=hot&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """ method=""post"" accept-charset=""utf-8""><postfield name=""page"" value=""$(page)""/></go>转到该页</anchor><br/>"
		if absPageNum>1 then
		k=(absPageNum-1)*10
		end if
		for i=1 to pagesz
			k=k+1
			linklist=linklist&"" & k &".<a href=""view.asp?id="&rs("id")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>"&towml(rs("title"))&"</a><br/>("&rs("re")&"评/"&rs("click")&"阅)<br/>"&vbnewline
			rs.movenext
			if rs.eof then exit for
		next
	end if
rs.close
set rs=nothing
%>
<wml>
<card id="main" title="热门博客">
<p>热门博客<br/>
--------<br/>
<%response.write linklist%>--------<br/>
<%response.write pageinfo%>
<% if yifei<>"" then%>
<a href="addalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">添加文章</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">返回社区首页</a><br/>
<a href="/index.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">返回娱乐天地</a><br/>
<%else%>
<a href="addalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">添加文章</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">返回社区首页</a><br/>
<a href="/index.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">返回娱乐天地</a><br/>
<%end if%>
</p>
</card>
</wml><%
end sub

sub list()
id=request("id")
if id="" or not isnumeric(id) then
	response.Redirect(geturl()&"index.asp")
	response.End
end if
tname=towml(gettname(id))
sql="select * from wap_album_content where (isshare=true or useid='"&session("useid")&"') and typeid="&id&" order by id desc"
	dim pagesz,strsql,rs,abspagenum,absrecordnum,totalpages,totalrecord
	Const adUseClient = 3
	Const adOpenStatic = 3
	Const adCmdText = &H0001
	pagesz=10
	absPageNum = CInt(Request("Page")) '读取当前页是第几页
	set rs = server.CreateObject("adodb.recordset")
	rs.CursorLocation = adUseClient 
	rs.CursorType = adOpenStatic
	rs.CacheSize = pagesz
	rs.Open sql,Conn,,,adCmdText
	if rs.eof and rs.bof then
		linklist="当前没有记录！<br/>"
	else
		rs.PageSize = pagesz
		totalrecord = rs.Recordcount '共多少条记录
		TotalPages = rs.PageCount '共多少页记录
		if request("page")<>"" then
			absPageNum = abs(cint(request("page")))
		Else
			absPageNum = 1 
		End If
		If absPageNum > TotalPages Then
			absPageNum = TotalPages
			rs.AbsolutePage = absPageNum
		elseif absPageNum = 0 Then
			absPageNum = 1
			rs.AbsolutePage = absPageNum
		else
			rs.AbsolutePage = absPageNum
		End If
		pageinfo="共 "&totalrecord&" 条,第 "&absPageNum&"/<a href=""list.asp?id="&request("id")&"&amp;page="&TotalPages&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>"&TotalPages&"</a>页<br/>"
		If absPageNum <> TotalPages Then pageinfo=pageinfo&"<a href=""list.asp?id="&request("id")&"&amp;page="&absPageNum+1&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>下一页</a><br/>"
		If absPageNum > 1 Then pageinfo=pageinfo&"<a href=""list.asp?id="&request("id")&"&amp;page="&absPageNum-1&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>上一页</a><br/>"
		if TotalPages > 1 then pageinfo=pageinfo&"<input title=""页码"" name=""page"" format=""*N"" size=""2"" maxlength=""3""/><anchor><go href=""list.asp?id="&request("id")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """ method=""post"" accept-charset=""utf-8""><postfield name=""page"" value=""$(page)""/></go>转到该页</anchor><br/>"
		if absPageNum>1 then
		k=(absPageNum-1)*10
		end if
		for i=1 to pagesz
			k=k+1
			linklist=linklist&"" & k &".<a href=""view.asp?id="&rs("id")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>"&towml(rs("title"))&"</a><br/>("&rs("re")&"评/"&rs("click")&"阅)<br/>"&vbnewline
			rs.movenext
			if rs.eof then exit for
		next
	end if
rs.close
set rs=nothing
%>
<wml>
<card id="main" title="<%response.write tname%>">
<p><%response.write tname%><br/>
--------<br/>
<%response.write linklist%>--------<br/>
<%response.write pageinfo%>
<% if yifei<>"" then%>
<a href="addalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">添加文章</a><br/>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">返回首页</a><br/>
<%else%>
<a href="addalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">添加文章</a><br/>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">返回首页</a><br/>
<%end if%>
</p>
</card>
</wml><%
end sub

function gettname(id)
	set rs=conn.execute("select tname from wap_album_type where id="&id)
	if rs.eof then
		gettname="未知"
	else
		gettname=rs(0)
	end if
	rs.close
	set rs=nothing
end function
%>