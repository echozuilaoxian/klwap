<!--#include file="wmlhead.asp"--><!--#include file="wmlubb.asp"--><%
SessionID=request.querystring("SessionID")
iduse=Session("useid")
public id,page
page=request("page")
id=request("id")
select case request("action")
case "post"
	call post()
case "add"
	call add()
case else
	call defauwapzmya()
end select

sub defauwapzmya()
sql="select * from myalbum_res where albumid="&id&" order by id desc"
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
		If absPageNum <> TotalPages Then pageinfo=pageinfo&"<a href=""res.asp?id="&id&"&amp;page="&absPageNum+1&"&amp;SessionID="&SessionID&""">下一页</a><br/>"
		If absPageNum > 1 Then pageinfo=pageinfo&"<a href=""res.asp?id="&id&"&amp;page="&absPageNum-1&"&amp;SessionID="&SessionID&""">上一页</a><br/>"
		if TotalPages > 1 then pageinfo=pageinfo&"<input title=""页码"" name=""page"" format=""*N"" size=""2"" maxlength=""3""/><anchor><go href=""res.asp?id="&id&"&amp;SessionID="&SessionID&""" method=""post"" accept-charset=""utf-8""><postfield name=""page"" value=""$(page)""/></go>转到该页</anchor><br/>"
		for i=1 to pagesz
linklist=linklist&"<a href='/bbs/reg/useinfo.asp?id="& rs("adidd") &"&amp;SessionID=" & SessionID & "'>"
			linklist=linklist&towml(rs("nickname"))
linklist=linklist&"ID:"& rs("adidd") &"</a>:"
			if rs("img")<>"" then linklist=linklist&"<img src=""img/"&rs("img")&""" awapzmya="""&rs("img")&""" />"
			linklist=linklist&towml(rs("content"))&"<br/>"&vbnewline
linklist=linklist&"时间: "&rs("retime")&"<br/>"
			rs.movenext
			if rs.eof then exit for
		next
	end if
rs.close
set rs=nothing
%><wml>
<card id="main" title="查看回复">
<p>查看回复<br/>
--------<br/>
<%response.write linklist%>--------<br/>
<%response.write pageinfo%>
<a href="res.asp?action=post&amp;id=<%response.write id%>&amp;SessionID=<%=SessionID%>">发表回复</a><br/>
<a href="index12.asp?id=<%response.write id%>&amp;SessionID=<%=SessionID%>">回看消息</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">回交易市场</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>-<a href='/index.asp?SessionID=<%=SessionID%>'>首页</a><br/>
</p>
</card>
</wml><%
end sub

sub post()%><wml>
<card title="发表回复">
<p>发表回复<br/>
--------<br/>

<%
if session("useid")="4268" then 
%>对不起,该功能只对注册会员开放,请先注册或登录<br/>
<%
else
%>
输入内容:<br/>
<input type="text" title="content" name="content" value="" maxlength="50"/><br/>
<anchor><go href="res.asp?SessionID=<%=SessionID%>" method="post" accept-charset="utf-8">
<postfield name="action" value="add"/>
<postfield name="id" value="<%response.write id%>"/>
<postfield name="adidd" value="<%response.write iduse%>"/>
<postfield name="img" value="<%response.write request("img")%>"/>
<postfield name="content" value="$(content)"/>
</go>发表</anchor><br/>
<%
end if
%>--------<br/>
<a href="res.asp?id=<%response.write id%>&amp;SessionID=<%=SessionID%>">查看回复</a><br/>
<a href="index12.asp?id=<%response.write id%>&amp;SessionID=<%=SessionID%>">回看消息</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">回交易市场</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>-<a href='/index.asp?SessionID=<%=SessionID%>'>首页</a>
</p>
</card>
</wml><%
end sub

sub add()
content=replace(request("content"),"'","''")
img=request("img")
adidd=request("adidd")
if content="" then
	showstr="回复内容不能为空！<br/>"
else
	set rs=server.createobject("adodb.recordset")
	sql="select * from myalbum_res where albumid="&id
	rs.open sql,conn,1,3
	rs.addnew
	rs("devid")=devid
	rs("nickname")=session("wapzmyaname")
	rs("albumid")=id
        rs("adidd")=adidd
	rs("img")=img
	rs("content")=content
	rs("retime")=now()
	rs.update
	rs.close
	set rs=nothing
	conn.execute("update buys set hf=hf+1 where id="&id)
	showstr="成功发表回复！<br/>"
	url="res.asp?id="&id&"&amp;SessionID="&SessionID
end if
%><wml>
<%
if url="" then
%><card id="main" title="发表回复">
<%else
%><card id="main" ontimer="<%response.write url%>" title="发表回复">
<timer value="5"/><%
end if
%><p>
<%response.write showstr%>--------<br/>
<a href="res.asp?id=<%response.write id%>&amp;SessionID=<%=SessionID%>">查看回复</a><br/>
<a href="index12.asp?id=<%response.write id%>&amp;SessionID=<%=SessionID%>">回看消息</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">回交易市场</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>社区首页</a>-<a href='/index.asp?SessionID=<%=SessionID%>'>首页</a>
</p>
</card>
</wml><%
end sub
%>