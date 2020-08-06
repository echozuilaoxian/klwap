<!--#include file="wmlhead.asp"--><!--#include file="inc/wmlubb.asp"--><%
SessionID=request.querystring("SessionID")
if request.querystring("wap")="" then
SessionID=request.cookies("SessionID")
if request.cookies("wap")="" then
wap=""
end if
end if
yifei=request.querystring("yifei")
public id,page
page=request("page")
id=request("id")
select case request("action")
case "post"
	call post()
case "add"
	call add()
case else
	call default()
end select
closeconn

sub default()
sql="select * from wap_album_re where albumid="&id&" order by id desc"
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
		If absPageNum <> TotalPages Then pageinfo=pageinfo&"<a href=""re.asp?id="&id&"&amp;page="&absPageNum+1&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>下一页</a><br/>"
		If absPageNum > 1 Then pageinfo=pageinfo&"<a href=""re.asp?id="&id&"&amp;page="&absPageNum-1&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """>上一页</a><br/>"
		if TotalPages > 1 then pageinfo=pageinfo&"<input title=""页码"" name=""page"" format=""*N"" size=""2"" maxlength=""3""/><anchor><go href=""re.asp?id="&id&"&amp;SessionID=" & SessionID & "&amp;yifei=" & yifei & """ method=""post"" accept-charset=""utf-8""><postfield name=""page"" value=""$(page)""/></go>转到该页</anchor><br/>"
		for i=1 to pagesz
			linklist=linklist&towml(rs("nickname"))&" "&rs("retime")&"<br/>评论："
			if rs("img")<>"" then linklist=linklist&"<img src=""img/"&rs("img")&""" alt="""&rs("img")&""" />"
			linklist=linklist&towml(rs("content"))&"<br/><br/>"&vbnewline
			rs.movenext
			if rs.eof then exit for
		next
	end if
rs.close
set rs=nothing
%><wml>
<card id="main" title="查看评论">
<p>查看评论<br/>
--------<br/>
<%response.write linklist%>--------<br/>
<%response.write pageinfo%>
<a href="re.asp?action=post&amp;id=<%response.write id%>&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">发表评论</a><br/>
<a href="view.asp?id=<%response.write id%>&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">返回文章</a><br/>
<% if yifei<>"" then%>
<a href="index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<%end if%>
</p>
</card>
</wml><%
end sub

sub post()%><wml>
<card title="发表评论">
<p>发表评论<br/>
--------<br/><%
if session("useid")="" then 
%>对不起,评论功能只对本站注册会员开放,请先注册或登录后再发表评论<br/>
<%
else
%>表情：<a href="reselimg.asp?id=<%response.write id%>&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>"><%
if request("img")="" then
	response.write "无"
else
	response.write "<img src=""img/"&request("img")&""" alt="""&request("img")&""" />"
end if
%></a><br/>
评论内容<br/>
<input type="text" title="content" name="content" value="" maxlength="250"/><br/>
<anchor><go href="re.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>" method="post" accept-charset="utf-8">
<postfield name="action" value="add"/>
<postfield name="id" value="<%response.write id%>"/>
<postfield name="img" value="<%response.write request("img")%>"/>
<postfield name="content" value="$(content)"/>
</go>发表</anchor><br/>
<%
end if
%>--------<br/>
<a href="re.asp?id=<%response.write id%>&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">查看评论</a><br/>
<a href="view.asp?id=<%response.write id%>&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">返回文章</a><br/>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
</p>
</card>
</wml><%
end sub

sub add()
content=replace(request("content"),"'","''")
img=request("img")
if content="" then
	showstr="评论内容不能为空，请返回重试！<br/>"
else
	set rs=server.createobject("adodb.recordset")
	sql="select * from wap_album_re where albumid="&id
	rs.open sql,conn,1,3
	rs.addnew
	rs("devid")=devid
	rs("nickname")=session("ltname")
	rs("albumid")=id
	rs("img")=img
	rs("content")=content
	rs("retime")=now()
	rs.update
	rs.close
	set rs=nothing
	conn.execute("update wap_album_content set re=re+1 where id="&id)
	showstr="您的评论已成功发表！<br/>"
	url="re.asp?id="&id&"&amp;wap=" & wap
end if
%><wml>
<%
if url="" then
%><card id="main" title="发布结果">
<%else
%><card id="main" ontimer="<%response.write url%>" title="发布结果">
<timer value="30"/><%
end if
%><p>
<%response.write showstr%>--------<br/>
<a href="re.asp?id=<%response.write id%>&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">查看评论</a><br/>
<a href="view.asp?id=<%response.write id%>&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">返回文章</a><br/>
<% if yifei<>"" then%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<%end if%>
</p>
</card>
</wml><%
end sub
%>