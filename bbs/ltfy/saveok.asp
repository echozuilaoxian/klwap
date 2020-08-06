<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="ccnn.inc"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
dim rename,retext
rename=usb(request("rename"))
retext=request("retext")
if len(retext)>150 then retext=usb(left(retext,150))
id=request("id")
p=request("p")
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [urls] where [id]=" & id
rs.open rsstr,conn,1,2

if rs.eof then 
response.write("无此案件！<br/>")
	else

if retext="" or rename="" then
response.write "<card title='发表评论'><p>选项不能为空!</p></card></wml>"
response.end
end if

set rss=Server.CreateObject("ADODB.Recordset")
rsstrs="select * from [hf] where name='" & rename & "' and text='" & retext & "'"
rss.open rsstrs,conn,1,2

if not rss.eof then 
eer="请不要刷屏！<br/>"
else
rss.addnew
if rename<>"" then rss("name")=rename
if retext<>"" then rss("text")=retext
rss("idd")=id
rss("class")=ids
rss.update

	dim rst
	set rst=Server.CreateObject("ADODB.Recordset")
	dim rsstrst
	rsstrst="select hits from urls where id=" & id
	rst.open rsstrst,conn,1,2

	rst("hits")=rst("hits")+1
	rst.update

	rst.close
	set rst=nothing

end if
rss.close
set rss=nothing

if request.cookies("myname0521")="" then
 Response.Cookies("myname0521")=rename
 Response.Cookies("myname0521").Expires=#January 01, 2010#
end if
end if
%>
<card title="发表评论" ontimer="relist.asp?SessionID=<%=SessionID%>&amp;ids=<%=ids%>&amp;id=<%=id%>&amp;p=<%=p%>">
<timer value="10"/>
<p>
<%if eer="" then%>
发表成功，正在返回...<br/>
<%else%>
<%=eer%>
<%end if%>
----------<br/>
<a href="relist.asp?SessionID=<%=SessionID%>&amp;ids=<%=ids%>&amp;id=<%=id%>&amp;p=<%=p%>">评论列表</a><br/>
<a href="view.asp?SessionID=<%=SessionID%>&amp;ids=<%=ids%>&amp;id=<%=id%>">返回案件</a><br/>
<a href="list.asp?SessionID=<%=SessionID%>&amp;ids=<%=ids%>">案件分类</a><br/>
<!--#include file="aa.asp"-->
</p>
</card>
</wml>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>