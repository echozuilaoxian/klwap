<!--#include file="wmlhead.asp"--><!--#include file="inc/wmlubb.asp"--><%
SessionID=request.querystring("SessionID")
if request.querystring("wap")="" then
SessionID=request.cookies("SessionID")
if request.cookies("wap")="" then
wap=""
end if
end if
yifei=request.querystring("yifei")
id=request("id")
if not isnumeric(id) or id<1 then response.redirect(geturl()&"index.asp")
set rs=conn.execute("select * from wap_album_content where (isshare=true or useid='"&session("useid")&"') and id="&id)
if not rs.eof then
	useid=rs("useid")
	ltname=rs("ltname")
	title=towml(rs("title"))
	content=towml(rs("content"))
	imgpath=towml(rs("imgpath"))
	isupload=rs("isupload")
	posttime=rs("posttime")
	isedit=rs("isedit")
	edittime=rs("edittime")
	click=rs("click")+1
	re=rs("re")
	isshare=rs("isshare")
	'conn.execute("update wap_album_content set click=click+1 where id="&id)
else
	errcode="对不起,您访问的资料不存在!"
end if
rs.close
set rs=nothing
if errcode="" then
	if isupload then imgpath=geturl()&"upload/"&imgpath
	viewstr="地址:"&imgpath&"<br/>"
	viewstr=viewstr&"－－－－－<br/>"
end if

closeconn
%><wml>
<card id="main" title="查看地址">
<p><%response.write viewstr%>
<a href="view.asp?id=<%response.write id%>&amp;SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">返回上级</a><br/>
<% if yifei<>"" then%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">博客首页</a><br/>
<%else%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<%end if%>
</p>
</card>
</wml>