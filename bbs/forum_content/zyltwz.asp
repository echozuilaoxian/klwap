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
 if Session("Counter")="pass_numbers_55556666" then 
dim forumID
  forumID=request("forumID")
set objgbrssy=Server.CreateObject("ADODB.Recordset")
rspls="select * from sclt where id="&forumID
objgbrssy.open rspls,conn,1,2
if objgbrssy.eof then
dlnamse="无此论坛"
Else
dlnamse=objgbrssy("name")
end if
objgbrssy.close
Set objgbrssy= Nothing
%>
<card id="card1" title="将所有帖子移出-<% =dlnamse%>">
<p>
当前版块:<% =dlnamse%><br/>
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
<go method="post" href='zyltwzcl.asp?SessionID=<%=SessionID%>'>
<postfield name="setbzcz" value="$(setbzcz)"/>
<%
Response.write "<postfield name='forumID' value='" & forumID & "'/>"
%>
</go>
</anchor><%
Response.write "<br/>-----------<br/><a href='/bbs/forum_content/contentlist.asp?forumID=" & forumID & "&amp;page=1&amp;SessionID=" & SessionID & "'>" & converttowidebaiti("返回")& "" & converttowidebaiti(dlnamse) & "</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>" & converttowidebaiti("返回社区首页")& "</a><br/>"%></p></card></wml>
<% end if %>