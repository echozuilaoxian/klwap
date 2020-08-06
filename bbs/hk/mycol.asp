<!--#include file="wmlhead.asp"--><%
SessionID=request.querystring("SessionID")
if request.querystring("wap")="" then
SessionID=request.cookies("SessionID")
if request.cookies("wap")="" then
wap=""
end if
end if
yifei=request.querystring("yifei")
if session("useid")<>"" then
	sql="select * from wap_album_content,wap_album_col where wap_album_col.useid='"&session("useid")&"' and id=albumid order by colid desc"
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
		pageinfo="共 "&totalrecord&" 条,第 "&absPageNum&"/"&TotalPages&" 页<br/>"
		If absPageNum <> TotalPages Then pageinfo=pageinfo&"<a href=""mycol.asp?page="&absPageNum+1&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>下一页</a><br/>"
		If absPageNum > 1 Then pageinfo=pageinfo&"<a href=""mycol.asp?page="&absPageNum-1&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>上一页</a><br/>"
		if TotalPages > 1 then pageinfo=pageinfo&"<input title=""页码"" name=""page"" format=""*N"" size=""2"" maxlength=""3""/><anchor><go href=""mycol.asp?SessionID=" & SessionID & "&amp;yifei=" & yifei & """ method=""post"" accept-charset=""utf-8""><postfield name=""page"" value=""$(page)""/></go>转到该页</anchor><br/>"
		for i=1 to pagesz
			linklist=linklist&"<a href=""view.asp?id="&rs("id")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>"&rs("title")&"</a><br/><a href=""mycol_do.asp?action=del&amp;id="&rs("id")&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>取消</a><br/>"&vbnewline
			rs.movenext
			if rs.eof then exit for
		next
	end if
rs.close
set rs=nothing
else
	info="对不起，该功能仅对会员开放<br/>"
end if
%><wml>
<card id="main" title="我的收藏">
<p><%response.write info
response.write linklist%>--------<br/>
<%response.write pageinfo%>
<% if yifei<>"" then%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">博客首页</a><br/>
<%else%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<%end if%>
</p>
</card>
</wml><%
closeconn
%>