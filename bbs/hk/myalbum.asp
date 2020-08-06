<!--#include file="wmlhead.asp"--><!--#include file="inc/wmlubb.asp"--><%
SessionID=request.querystring("SessionID")
if request.querystring("wap")="" then
SessionID=request.cookies("SessionID")
if request.cookies("wap")="" then
wap=""
end if
end if
yifei=request.querystring("yifei")
ctypeid=request("cid")
if ctypeid="" or not isnumeric(ctypeid) then ctypeid=0
page=request("page")
if page="" or not isnumeric(page) then page=1
if page<1 then page=1
%>
<wml>
<card id="main" title="我的博客">
<p>欢迎你<a href="/bbs/reg/useinfo.asp?id=<%=Session("useid")%>&amp;SessionID=<%=SessionID%>"><%=session("ltname")%></a>
<% 
if session("ltname")<>"" and Session("useid")<>"" then 
SessionID=request.querystring("SessionID")
if request.querystring("wap")="" then
SessionID=request.cookies("SessionID")
if request.cookies("wap")="" then
wap=""
end if
end if
if request.querystring("wap")="" then
SessionID=request.cookies("SessionID")
end if
%>
<%else%>
<%end if%>
<br/>
<%
if ctypeid<1 and page=1 then
	call ctlist()
end if
call fileshow(ctypeid)
if ctypeid then response.write "<a href=""myalbum.asp?SessionID=" & SessionID & "&amp;yifei=" & yifei & """>返回上级</a><br/>"
%>
--------<br/>
<a href="addalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">添加日志</a><br/>
<a href="myctype.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">目录管理</a><br/>
<a href="mycol.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">我的收藏</a><% if yifei<>"" then%>
<br/><a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<br/><a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%end if%>
</p>
</card>
</wml><%
closeconn

sub ctlist()
set rs=conn.execute("select * from wap_album_ctype where useid='"&session("useid")&"' order by orders desc")
if rs.eof then
	liststr=""
else
	n=0
	do until rs.eof
	liststr=liststr&"<img src='/hk/go.gif' alt='0'/><a href=""myalbum.asp?cid="&rs("id")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>"&rs("ctname")&"</a>"
	n=abs(n-1)
	if n=0 then
		liststr=liststr&"<br/>"&vbnewline
	else
		liststr=liststr&"<br/>"
	end if
	rs.movenext
	loop
	if n=1 then liststr=liststr&"<br/>"&vbnewline
	'liststr="--------<br/>"&liststr
end if
rs.close
set rs=nothing
response.write liststr
end sub

sub fileshow(ctypeid)
sql="select * from wap_album_content where ctypeid="&ctypeid&" and useid='"&session("useid")&"' order by id desc"
	dim pagesz,strsql,rs,abspagenum,absrecordnum,totalpages,totalrecord
	Const adUseClient = 3
	Const adOpenStatic = 3
	Const adCmdText = &H0001
	pagesz=5
	absPageNum = CInt(Request("Page")) '读取当前页是第几页
	set rs = server.CreateObject("adodb.recordset")
	rs.CursorLocation = adUseClient 
	rs.CursorType = adOpenStatic
	rs.CacheSize = pagesz
	rs.Open sql,Conn,,,adCmdText
	if not(rs.eof and rs.bof) then
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
		pageinfo="共 "&totalrecord&" 条,第 "&absPageNum&"/"&TotalPages&" 页<br/>"
		If absPageNum <> TotalPages Then pageinfo=pageinfo&"<a href=""myalbum.asp?cid="&request("cid")&"&amp;page="&absPageNum+1&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>下一页</a><br/>"
		If absPageNum > 1 Then pageinfo=pageinfo&"<a href=""myalbum.asp?cid="&request("cid")&"&amp;page="&absPageNum-1&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>上一页</a><br/>"
		if TotalPages > 1 then pageinfo=pageinfo&"<input title=""页码"" name=""page"" format=""*N"" size=""2"" maxlength=""3""/><anchor><go href=""myalbum.asp?cid="&request("cid")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """ method=""post"" accept-charset=""utf-8""><postfield name=""page"" value=""$(page)""/></go>转到该页</anchor><br/>"
		if absPageNum>1 then
		k=(absPageNum-1)*10
		end if
		for i=1 to pagesz
			k=k+1
			linklist=linklist&"<a href=""view.asp?id="&rs("id")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>"&towml(rs("title"))&"</a>("&rs("re")&"评/"&rs("click")&"阅)<br/>"&vbnewline
			linklist=linklist&year(rs("posttime"))&"-"&month(rs("posttime"))&"-"&day(rs("posttime"))&" &nbsp; <a href=""do.asp?action=del&amp;id="&rs("id")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>删除</a><br/>"&vbnewline
			rs.movenext
			if rs.eof then exit for
		next
	end if
rs.close
set rs=nothing
if linklist<>"" then
	response.write linklist & "--------<br/>"& vbnewline & pageinfo
else
	if ctypeid>0 then response.write "当前没有内容<br/>--------<br/>"& vbnewline
end if
end sub
%>