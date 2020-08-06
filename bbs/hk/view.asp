<!--#include file="wmlhead.asp"--><!--#include file="inc/wmlubb.asp"--><%
SessionID=request.querystring("SessionID")
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
	conn.execute("update wap_album_content set click=click+1 where id="&id)
else
	errcode="对不起,您访问的资料不存在!"
end if
rs.close
set rs=nothing
if errcode="" then
	if isupload then imgpath=geturl()&"upload/"&imgpath
	titlestr=title&""
	if not (trim(right(""&imgpath&"",4))=".bmp" or trim(right(""&imgpath&"",4))=".png" or trim(right(""&imgpath&"",4))=".jpg" or trim(right(""&imgpath&"",4))=".gif" or trim(right(""&imgpath&"",4))="jpeg") then%>
<%
titlestr=titlestr&"<br/>--------<br/>内容:<br/>" & content & "<br/>"&year(posttime)&"年"&month(posttime)&"月"&day(posttime)&"日<br/>作者:"&ltname&"<br/>"
else
titlestr=titlestr&""
titlestr=titlestr&"<br/>--------<br/><a href=""viewpath.asp?id="&id&"&amp;SessionID=" & SessionID & """>作品地址</a><br/>"&year(posttime)&"年"&month(posttime)&"月"&day(posttime)&"日<br/>作者:"&ltname&"<br/>说明:"&content&"<br/><anchor>收藏<go method=""post"" href=""/public/addxccl.asp?SessionID=" & SessionID & """><postfield name=""xcname"" value="""&title&"""/><postfield name=""xclink"" value="""&imgpath&"""/></go></anchor><br/>"
end if

'	if isedit then titlestr=titlestr&"本信息修改于 "&edittime&"<br/>"
	titlestr=titlestr&"查看:"&click&"次<br/>"
	titlestr=titlestr&"－－－－－<br/>"
	if re>0 then
		restr="<a href=""re.asp?id="&id&"&amp;SessionID=" & SessionID & """>查看评论("&re&")</a><br/>"
	else
		restr="当前没有评论<br/>"
	end if
	restr=restr&"<a href=""re.asp?action=post&amp;id="&id&"&amp;SessionID=" & SessionID & """>发表评论</a><br/>－－－－－<br/>"
	restr=restr&"<a href=""mycol_do.asp?action=add&amp;id="&id&"&amp;SessionID=" & SessionID & """>加入收藏</a><br/>"
     	opstr="管理：<a href=""do.asp?action=edit&amp;id="&id&"&amp;SessionID=" & SessionID & """>修改</a>&nbsp;<a href=""do.asp?action=del&amp;id="&id&"&amp;SessionID=" & SessionID & """>删除</a><br/>－－－－－<br/>"
	viewstr=titlestr&restr
	if cstr(" "&useid)=cstr(" "&session("useid")) then viewstr=viewstr&opstr
end if

closeconn
%><wml>
<card id="main" title="查看作品">
<p><%response.write viewstr%>
<a href="search.asp?action=us&amp;uid=<%response.write useid%>&amp;SessionID=<%=SessionID%>">查看作品</a><br/>
<a href="index0.asp?SessionID=<%=SessionID%>">博客首页</a>

</p>
</card>
</wml>
