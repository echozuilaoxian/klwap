<!--#include file="wmlhead.asp"--><!--#include file="inc/wmlubb.asp"--><%
SessionID=request.querystring("SessionID")
if request.querystring("wap")="" then
SessionID=request.cookies("SessionID")
if request.cookies("wap")="" then
wap=""
end if
end if
yifei=request.querystring("yifei")
useid=request("uid")
page=request("page")
if page<1 then page=1
%>
<wml>
<card id="main" title="他的博客">
<p><%
call fileshow(useid)
%>--------<br/>
<% if yifei<>"" then%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%end if%>
</p>
</card>
</wml><%
closeconn

sub fileshow(useid)
sql="select * from wap_album_content where useid='"&useid&"' and isshare=true order by id desc"
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
	if not (rs.eof and rs.bof) then
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
		If absPageNum <> TotalPages Then pageinfo=pageinfo&"<a href=""album.asp?uid="&request("uid")&"&amp;page="&absPageNum+1&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>下一页</a><br/>"
		If absPageNum > 1 Then pageinfo=pageinfo&"<a href=""album.asp?uid="&request("uid")&"&amp;page="&absPageNum-1&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>上一页</a><br/>"
		if TotalPages > 1 then pageinfo=pageinfo&"<input title=""页码"" name=""page"" format=""*N"" size=""2"" maxlength=""3""/><anchor><go href=""album.asp?uid="&request("uid")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """ method=""post"" accept-charset=""utf-8""><postfield name=""page"" value=""$(page)""/></go>转到该页</anchor><br/>"
		for i=1 to pagesz
			linklist=linklist&"<a href=""view.asp?id="&rs("id")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>"&towml(rs("title"))&"</a><br/>("&rs("ltname")&"/"&rs("re")&"评)<br/>"&vbnewline
			rs.movenext
			if rs.eof then exit for
		next
	end if
rs.close
set rs=nothing
if linklist<>"" then
	response.write linklist & "--------<br/>" & vbnewline & pageinfo
else
	response.write "当前没有内容<br/>" & vbnewline
end if
end sub
%>