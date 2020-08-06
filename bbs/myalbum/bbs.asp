<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="我的书包">
<% 
Server.ScriptTimeout=999
  dim pages,objgbrs,ids,id
  id=request("id")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
  ids=Session("useid")
  pages=request("pages")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select * from myalbum where Cstr(ids)=" & ids & " and id=" & id & ""
  objgbrs.open ssql,conn
 response.write "<p>"
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & lycount & "条新信息</a><br/>----------<br/>"
End if
Response.write "<img src='" & objgbrs("xclink") & "' alt='相片'/><br/><a href='" & objgbrs("xclink") & "'>免费下载</a>"
Response.write "<br/>介绍:" & converttowide(objgbrs("niayo"))
%>
<br/>相片已经复制<br/>
文章标题:
<input type='text' name='name' maxlength='25'/><br/>
文章内容:
<input type='text' name='memo' /><br/>
选择版块:
<%
response.write "<select name='ForumID'><option>版块列表</option>"
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
Response.write "</select>"
%><br/>
<anchor>发 表<go method='post' href='/BBS/xh6666/Forum_AddcontentCl.Asp?SessionID=<%=SessionID%>'>
<postfield name='name' value='$(name)'/>
<postfield name='memo' value='$(memo)\系统提示:此图片来自收藏夹\(img)<% = objgbrs("xclink") %>(/img)'/>
<postfield name='ForumID' value='$(ForumID)'/>
<postfield name="lzdname" value="d"/>
</go>
</anchor>
<%
Response.write "<br/>----------<br/>"
response.write "<a href='mybook.asp?SessionID=" & SessionID & "'>[我的书包]</a><br/>"
response.write "<a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>[我的地盘]</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>[社区首页]</a></p></card></wml>"
	objgbrs.close
	set objgbrs=nothing
	conn.close
	Set conn = Nothing
%>
