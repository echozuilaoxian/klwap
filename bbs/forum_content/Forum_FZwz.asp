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
if Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
  Response.write "<card id='card1' title='复制帖子'><p>您的发表权已被锁，请与管理员联系!</p></card></wml>"
    response.end
End if
iduse=Session("useid")
lasttlls="149"
lasttls
dim ForumID,id,page,i
i=request("i")
id=request("id")
page=request("page")
ForumID=request("ForumID")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from wuza Where CStr(id)='" & id &"'"
  objgbrs.open ssql,conn,1,3
  if objgbrs.eof then
      response.write "<card id='card1' title='复制帖子'><p>ID错误</p></card></wml>"
      objgbrs.close
      set objgbrs=nothing
      response.end
  end if
iduse=Session("useid")

if objgbrs("lzdname")="f" or objgbrs("lzdname")="y" then 
Response.write "<card id='card1' title='复制帖子'><p>功能贴不允许被复制</p></card></wml>"
      objgbrs.close
      set objgbrs=nothing
      response.end
  end if
response.write "<card id='card1' title='复制帖子-"&converttowidebaiti(objgbrs("biaoti"))&"'>"
Content=objgbrs("naiyo")
pageWordNum=60000
StartWord = 1
Length=len(Content)
PageAll=(Length+PageWordNum-1)\PageWordNum
i=request("i")
if isnull(i) or i="" then
i=0
end if
Content = mid(Content,StartWord+i*PageWordNum,PageWordNum)
%>
<onevent type="onenterforward">
<refresh>
<setvar name="name" value="<% =converttowidebaiti(objgbrs("biaoti")) %>"/>
<setvar name="memo" value="<% =converttowidebaiti(Content) %>"/>
</refresh>
</onevent>
<p align="left">
文章标题:<input type="text" name="name" value="<% =converttowidebaiti(objgbrs("biaoti")) %>" maxlength="25"/>
<br/>
文章内容:<input type="text" name="memo" value="<% =converttowidebaiti(Content) %>"/>
<br/>
选择版块:<select name="forumIDs"><option>版块列表</option>
<%
set rsez=server.createobject("ADODB.Recordset")
aqlz="select id,name from sclt order by id desc"
rsez.open aqlz,conn,1,2
z=1
do while not rsez.eof
dim nam
nam=rsez("name")
Response.write "<option value='" & rsez("id") & "'>" & converttowidebaiti(nam) & "</option>"
z=z+1
rsez.movenext
loop
rsez.close
set rsez=nothing
%></select><br/>
<anchor>[-提交-]
<go method="post" href='/BBS/Forum_content/Forum_AddcontentCl.Asp?SessionID=<%=SessionID%>'>
<postfield name="name" value="$(name)"/>
<postfield name="memo" value="$(memo)"/>
<postfield name="forumID" value="$(forumIDs)"/>
<postfield name="lzdname" value="d"/>
</go>
</anchor>
<%
set objgbrsyd=Server.CreateObject("ADODB.Recordset")
rspld="select * from sclt where id="&ForumID
objgbrsyd.open rspld,conn,1,2
if objgbrsyd.eof then
dlnames="无此论坛"
Else
dlnames=objgbrsyd("name")
end if
objgbrsyd.close
Set objgbrsyd= Nothing
Response.write "<br/>-----------<br/><a href='/BBS/Forum_Content/Contentlist.Asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回" & dlnames & "</a>"
Response.write "<br/><a href='/BBS/index.Asp?SessionID=" & SessionID & "'>返回社区首页</a>"
      objgbrs.close
      set objgbrs=nothing
conn.close
set conn=nothing
%>
</p></card></wml>