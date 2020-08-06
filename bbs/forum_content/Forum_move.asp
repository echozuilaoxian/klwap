<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
dim itid
ForumID=request("ForumID")
if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("cw1")<>"" or Session("cg")<>"" or Session("bzbz")=ForumID or Session("Counter")="pass_numbers_55556666" then
dim id
id=request("id")
page=request("page")

set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing
%>
<card id="card1" title="将帖子移出-<%=dlname%>">
<p>
当前版块:<%=dlname%>
<br/>
移至版块:<%
response.write "<select name='setbzcz'><option>版块列表</option>"
set rsez=server.createobject("ADODB.Recordset")
aqlz="select id,name from sclt order by id desc"
rsez.open aqlz,conn,1,2
z=1
do while not rsez.eof
 dim nini
nam=rsez("name")
if len(nam)>8 then nam=left(nam,8)
Response.write "<option value='" & rsez("id") & "'>" & nam & "</option>"
z=z+1
rsez.movenext
loop
rsez.close
set rsez=nothing
Response.write "</select>"%><br/>
<anchor>确定转移
<go method="post" href='Forum_movecl.asp?SessionID=<%=SessionID%>'>
<postfield name="setbzcz" value="$(setbzcz)"/>
<%
Response.write "<postfield name='id' value='" & id & "'/>"
Response.write "<postfield name='ForumID' value='" & ForumID & "'/>"
%>
</go>
</anchor>
<% end if %>
<%Response.write "<br/>----------<br/><a href='/BBS/Forum_ContenT/BBs_receipt_ByContent.Asp?ForumID=" & ForumID & "&amp;id=" & id & "&amp;page=1&amp;SessionID=" & SessionID & "'>返回查看文章</a>"%>
<br/><a href='/BBS/Forum_Content/Forum_AdminTopic.Asp?SessionID=<%=SessionID%>&amp;ForumID=<%=ForumID%>&amp;id=<%=id%>&amp;ids=<%=ids%>&amp;page=<%=page%>'>返回管理主帖</a>
<%
Response.write "<br/><a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/>"
Response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>" %>