<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<link rel="Shortcut Icon" href='/favicon.ico'/>

<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ForumID=request.querystring("ForumID")
page=request.querystring("page")
id=request.querystring("id")
dim id,cc,ForumID,tj,ltname,iduse
ltname=Session("ltname")
iduse=Session("useid")
id=request("id")
page=request("page")
ids=request("ids")
ForumID=request("ForumID")
   cc=request("zd")
   id=request("id")
if cc="o" then cczz="帖子入专"
if cc="f" then cczz="撤消入专"
 if cc="o" then
   zdtime=id
 else
   zdtime=0
 End if
if ids="" then

%>
<card title="<%=cczz%>">
<p>
<%if cc="o" then

sql="select * from ltzt where ForumID="&ForumID&"  order by id desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	'response.write "暂无专题记录<br/>"
else
response.write "<select name='setbzcz'><option>专题列表</option>"
z=1
do while not rs.eof
 dim nini
nam=ubb(rs("tjname"))
if len(nam)>12 then nam=left(nam,12)
Response.write "<option value='" & rs("id") & "'>" & nam & "</option>"
z=z+1
rs.movenext
loop
rs.close
set rs=nothing
Response.write "</select>"
%><br/>
<anchor>确定加入专题
<go method="post" href='Forum_ltzt.asp?SessionID=<%=SessionID%>&amp;ids=2&amp;zd=o'>
<postfield name="setbzcz" value="$(setbzcz)"/>
<%
Response.write "<postfield name='id' value='" & id & "'/>"
Response.write "<postfield name='ForumID' value='" & ForumID & "'/>"
%>
</go>
</anchor>
<% end if
end if
else
setbzcz=request("setbzcz")

if Cstr(Session("yxxezb"))<>"" or Session("bzbz")=forumID or Session("gly")=forumID or Session("Counter")="pass_numbers_55556666" then
if cc="o" then
if setbzcz="" or id="" or ForumID="" then
 Call Error("<card id='card1' title='数据错误'><p>数据错误!错误2！")
  end if
sql="select * from ltzt where ForumID="&ForumID&" and id="&setbzcz&" order by id desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if rs.eof and rs.bof then
 Call Error("<card id='card1' title='数据错误'><p>数据错误!错误！")
  end if
rs.close
set rs=nothing
'---读取数据----
Response.write("<card id='card1' title='帖子入专'><p>")
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from wuza where id="&id
rs.open rspl,conn,1,1
if rs.recordcount=0 then%> 
错误了，帖子不存在或以被删除！<br/>
<%
else
tzname=rs("biaoti")
ffid=rs("tjhm")
end if
rs.close
set rs=nothing
sql="update wuza set juanti="&setbzcz&"  Where id="&id
  conn.Execute(sql)
%>
<%
set rsll=Server.CreateObject("ADODB.Recordset")
rsplll="select * from guestbook order by id desc"
rsll.open rsplll,conn,1,2
rsll.addnew
rsll("niayo")="您的帖子["&tzname&"]被版主["&ltname&"(ID:"&iduse&")]加入专题，谢谢您对论坛的支持"
rsll("ids")=ffid
rsll("reids")="0"
rsll.update
rsll.close
set rsll=nothing%>
帖子入专成功，
<%end if%>
<%if cc="f" then%>
<card id='card1' title='撤消入专'><p>
<%sql="update wuza set juanti=0 Where id="&id
  conn.Execute(sql)%>
撤消专题成功，
<%end if

set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from [czrj] order by id desc"
rs.open rspl,conn,1,2
rs.addnew
rs("ltid")=ForumID
rs("ids")=iduse
rs("bzmc")=ltname
rs("wzid")=id
rs("tzmc")=""&tzname&""
rs("czxx")=""&cczz&""
rs.update
'---关闭数据----
rs.close
set rs=nothing%>
<br/>正在返回..
<%
end if
end if
Response.write "<br/><a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>回当前版块</a>"
response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>回论坛首页</a></p></card></wml>"
%>