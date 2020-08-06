<!--#include file="wmlhead.asp"--><!--#include file="inc/wmlubb.asp"-->



<%
public site_name,site_logoshow,site_logo,site_copyright
set rs=conn.execute("select * from wap_setup where site_part='album'")
site_name=rs("site_name")
site_logoshow=rs("site_logoshow")
site_logo=rs("site_logo")
site_copyright=rs("site_copyright")
site_notloginnotice=rs("site_notloginnotice")
site_loginnotice=rs("site_loginnotice")
if session("diary_visit")="" then
	session("diary_visit")=rs("site_visit")+1
	conn.execute("update wap_setup set site_visit=site_visit+1 where site_part='album'")
end if
rs.close
set rs=nothing
%><wml>
<card title="博客日志">
<p align="left">
<%=time%><%=WeekDayName(DatePart("w",Now))%><br/>
<img src='/bbs/hk/book1.gif' alt='load...'/><br/>
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
%><a href="/bbs/reg/useinfo.asp?id=<%=Session("useid")%>&amp;SessionID=<%=SessionID%>"><%=session("ltname")%></a>
<%else%>
<br/><a href="/bbs/UseLogin.asp">登陆/注册</a>.
<%end if%>
<a href="myalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">我的博客</a>
<br/>
<%
sql="select * from wap_album_content where isshare=true or useid='"&session("useid")&"' order by id desc"
	dim pagesz,strsql,rs,abspagenum,absrecordnum,totalpages,totalrecord
	Const adUseClient = 3
	Const adOpenStatic = 3
	Const adCmdText = &H0001
	pagesz=4
	absPageNum = CInt(Request("Page")) '读取当前页是第几页
	set rs = server.CreateObject("adodb.recordset")
	rs.CursorLocation = adUseClient 
	rs.CursorType = adOpenStatic
	rs.CacheSize = pagesz
	rs.Open sql,Conn,,,adCmdText
	if rs.eof and rs.bof then
		linklist="当前没有记录！<br/>"
	else
		for i=1 to pagesz
			linklist=linklist&"[最新]<a href=""view.asp?id="&rs("id")&"&amp;SessionID=" & SessionID & """>"&towml(rs("title"))&"</a><br/>"&vbnewline
			rs.movenext
			if rs.eof then exit for
		next
	end if
rs.close
set rs=nothing
%>
<%response.write linklist%>
<%response.write pageinfo%>
-------------<br/>
<a href="addalbum.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">添加日志</a>.
<a href="list.asp?SessionID=<%=SessionID%>&amp;action=new">最新日志</a><br/>
<a href="list.asp?SessionID=<%=SessionID%>&amp;action=hot">热门日志</a>.
<a href="search.asp?SessionID=<%=SessionID%>">搜索日志</a><br/>
〓分类主题〓<br/>
<a href="list.asp?SessionID=<%=SessionID%>&amp;id=44">情感</a>.
<a href="list.asp?SessionID=<%=SessionID%>&amp;id=46">时尚</a>.
<a href="list.asp?SessionID=<%=SessionID%>&amp;id=42">娱乐</a><br/>
<a href="list.asp?SessionID=<%=SessionID%>&amp;id=49">成人</a>.
<a href="list.asp?SessionID=<%=SessionID%>&amp;id=48">两性</a>.
<a href="list.asp?SessionID=<%=SessionID%>&amp;id=45">游记</a><br/>
<a href="list.asp?SessionID=<%=SessionID%>&amp;id=43">文学</a>.
<a href="list.asp?SessionID=<%=SessionID%>&amp;id=40">资讯</a>.
<a href="list.asp?SessionID=<%=SessionID%>&amp;id=39">生活</a><br/>
<a href="list.asp?SessionID=<%=SessionID%>&amp;id=38">女性</a>.
<a href="list.asp?SessionID=<%=SessionID%>&amp;id=41">文化</a>.
<a href="list.asp?SessionID=<%=SessionID%>&amp;id=50">冒险</a><br/>
<a href="list.asp?SessionID=<%=SessionID%>&amp;id=51">独白</a>.
<a href="list.asp?SessionID=<%=SessionID%>&amp;id=52">成长</a>.
<a href="list.asp?SessionID=<%=SessionID%>&amp;id=53">工作</a><br/>
<a href="list.asp?SessionID=<%=SessionID%>&amp;id=47">其它经典分类</a><br/>
-------------<br/><%
if Session("useid")="1" then 
Response.write "<a href='/bbs/hk/hkadmin/adminbo.asp?SessionID=" & SessionID & "'>管理员操作</a><br/>"
end if
%>
-------------<br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a>-
<a href="/bbs/Myalbum/Index.asp?SessionID=<%=SessionID%>">相册</a><br/>
<a href="/index.asp?SessionID=<%=SessionID%>">返回网站首页</a>
<%
if site_copyright<>"" then response.write "<br/>"
response.write outinfo(site_copyright)
%>
<%
sub list()
set rs=conn.execute("select * from wap_album_type order by orders desc")
if rs.eof then
	liststr=""
else
	n=0
	do until rs.eof
	liststr=liststr&"<a href=""list.asp?id="&rs("id")&""">"&rs("tname")&"</a>"&vbnewline
	n=abs(n-1)
	if n=0 then
		liststr=liststr&"<br/>"&vbnewline
	else
		liststr=liststr&"<img src=""xin.gif"" alt=""*"" />"
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

function outinfo(str)
outinfo=replace(str,vbnewline,"<br/>")
outinfo=replace(outinfo,"[visit]",session("album_visit"))
outinfo=replace(outinfo,"[userid]",session("useid"))
outinfo=replace(outinfo,"[username]",session("ltname"))
outinfo=replace(outinfo,"[userinfolink]","<a href=""/bbs/reg/useinfo.asp?id="&session("useid")&""">"&session("ltname")&"!</a>")
outinfo=replace(outinfo,"[userinfolin]","<a href=""/bbs/UseLogin.asp"">游客！[免费注册]</a>")
outinfo=replace(outinfo,"[date]",cstr(date()))
outinfo=replace(outinfo,"[time]",cstr(time()))
outinfo=replace(outinfo,"[week]",WeekDayName(weekday(date())))
h=hour(now())
if h<4 then
	wenhao="凌晨好"
elseif h<11 then
	wenhao="上午好"
elseif h<14 then
	wenhao="中午好"
elseif h<18 then
	wenhao="下午好"
elseif h<23 then
	wenhao="晚上好"
else
	wenhao="凌晨好"
end if
outinfo=replace(outinfo,"[wenhao]",wenhao)
end function
%></p></card></wml>