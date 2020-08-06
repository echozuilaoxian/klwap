<!--#include file="wmlhead.asp"--><%
SessionID=request.querystring("SessionID")
if request.querystring("wap")="" then
SessionID=request.cookies("SessionID")
if request.cookies("wap")="" then
wap=""
end if
end if
yifei=request.querystring("yifei")
'添加收藏col_do.asp?action=add&id=4&page=2
id=cint(request("id"))
page=cint(request("page"))
select case request("action")
case "add"
	call add
case "del"
	call del
end select

sub add
if session("useid")<>"" then
	set rs=conn.execute("select * from wap_album_col where useid='" & session("useid") & "' and albumid=" & id)
	if rs.eof then
		conn.execute("insert into wap_album_col(useid,albumid) values('" & session("useid") & "'," & id & ")")
	end if
	rs.close
	set rs=nothing
	info="收藏成功！"
else
	info="对不起，该功能仅对会员开放!"
end if
closeconn
%>
<wml>
<card title="我的收藏">
<p align="center">加入收藏<br/>
-------</p>
<p><%response.write info%><br/>
-------<br/>
<a href="mycol.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">我的收藏</a><br/>
<% if yifei<>"" then%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">&#x535A;&#x5BA2;&#x9996;&#x9875;</a><br/>
<%else%>
<a href="/bbs/hk/index0.asp?SessionID=<%=SessionID%>">博客首页</a><br/>
<%end if%>
</p>
</card>
</wml><%
end sub

sub del
conn.execute("delete * from wap_album_col where useid='" & session("useid") & "' and albumid=" & id)
closeconn
%>
<wml>
<card title="我的收藏">
<p align="center">删除收藏<br/>
-------</p>
<p>成功删除<br/>
-------<br/>
<a href="mycol.asp?SessionID=<%=SessionID%>&amp;yifei=<%=yifei%>">我的收藏</a><br/>
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