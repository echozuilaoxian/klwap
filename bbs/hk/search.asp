<!--#include file="wmlhead.asp"--><%
SessionID=request.querystring("SessionID")
if request.querystring("wap")="" then
SessionID=request.cookies("SessionID")
if request.cookies("wap")="" then
wap=""
end if
end if
yifei=request.querystring("yifei")
action=request("action")
select case action
case "search"
	call search()
case "us"
	call us()
case else
	call default()
end select

closeconn()

sub default()%><wml>
<card title="搜索">
<p>关键字:<input type="text" name="key" /><br/>
<anchor>搜索
<go href="search.asp?action=search&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>" method="post" accept-charset="utf-8">
<postfield name="key" value="$(key)"/>
</go>
</anchor></p>
<p>--------<br/>
<% if yifei<>"" then%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">博客首页</a><br/>
<%else%>
<a href="index0.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<%end if%>
</p>
</card>
</wml><%
end sub

sub search()
%><wml>
<card title="搜索结果">
<p><%
SessionID=request.querystring("SessionID")
if request.querystring("wap")="" then
SessionID=request.cookies("SessionID")
if request.cookies("wap")="" then
wap=""
end if
end if
yifei=request.querystring("yifei")
key=checkstr(request("key"))
sql="select * from wap_album_content where isshare=true and ((title like '%"&key&"%') or (content like '%"&key&"%') or (imgpath like '%"&key&"%')) order by id desc"
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
		pageinfo="共 "&totalrecord&" 个,第 "&absPageNum&"/"&TotalPages&" 页<br/>"
		If absPageNum <> TotalPages Then pageinfo=pageinfo&"<a href=""search.asp?action=search&amp;page="&absPageNum+1&"&amp;key="&server.urlencode(key)&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>下一页</a><br/>"
		If absPageNum > 1 Then pageinfo=pageinfo&"<a href=""search.asp?action=search&amp;page="&absPageNum-1&"&amp;key="&server.urlencode(key)&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>上一页</a><br/>"
		if TotalPages > 1 then pageinfo=pageinfo&"<input title=""页码"" name=""page"" format=""*N"" size=""2"" maxlength=""3""/><anchor><go href=""search.asp?action=search&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """ method=""post"" accept-charset=""utf-8""><postfield name=""page"" value=""$(page)""/><postfield name=""key"" value="""&key&"""/></go>转到该页</anchor><br/>"
		if absPageNum>1 then
		k=(absPageNum-1)*10
		end if
		for i=1 to pagesz
			k=k+1
			linklist=linklist&"" & k &".<a href=""view.asp?id="&rs("id")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>"&rs("title")&"</a><br/>("&rs("ltname")&"/"&rs("re")&"回)<br/>"&vbnewline
			rs.movenext
			if rs.eof then exit for
		next
	end if
rs.close
set rs=nothing
response.write linklist
response.write pageinfo
%></p>
<p>--------<br/>
<% if yifei<>"" then%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">博客首页</a><br/>
<%else%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">博客首页</a><br/>
<%end if%>
</p>
</card>
</wml><%
end sub

sub us()
%><wml>
<card title="搜索结果">
<p><%
uid=checkstr(request("uid"))
sql="select * from wap_album_content where isshare=true and useid='"&uid&"' order by id desc"
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
		pageinfo="共 "&totalrecord&" 个,第 "&absPageNum&"/"&TotalPages&" 页<br/>"
		If absPageNum <> TotalPages Then pageinfo=pageinfo&"<a href=""search.asp?action=us&amp;page="&absPageNum+1&"&amp;uid="&uid&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>下一页</a><br/>"
		If absPageNum > 1 Then pageinfo=pageinfo&"<a href=""search.asp?action=us&amp;page="&absPageNum-1&"&amp;uid="&uid&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>上一页</a><br/>"
		if TotalPages > 1 then pageinfo=pageinfo&"<input title=""页码"" name=""page"" format=""*N"" size=""2"" maxlength=""3""/><anchor><go href=""search.asp?action=us&amp;uid="&request("uid")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """ method=""post"" accept-charset=""utf-8""><postfield name=""page"" value=""$(page)""/></go>转到该页</anchor><br/>"
		for i=1 to pagesz
			linklist=linklist&"<a href=""view.asp?id="&rs("id")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>"&rs("title")&"</a><br/>("&rs("re")&"评/"&rs("click")&"阅)<br/>"&vbnewline
			rs.movenext
			if rs.eof then exit for
		next
	end if
rs.close
set rs=nothing
response.write linklist
response.write pageinfo
%></p>
<p>--------<br/>
<% if yifei<>"" then%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">博客首页</a><br/>
<%else%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">博客首页</a><br/>
<%end if%>
</p>
</card>
</wml><%
end sub
%>