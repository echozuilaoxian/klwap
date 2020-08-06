<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ForumID=request.querystring("ForumID")
page=request.querystring("page")
id=request.querystring("id")
dim id,cc,ForumID,tj,ltname,iduse
ltname=Session("ltname")
iduse=Session("useid")
page=request("page")
ids=request("ids")
   ForumID=request("ForumID")
   cc=request("zd")
   id=request("id")
if cc="o" then cczz="固底帖子"
if cc="f" then cczz="撤消固底"
 if cc="o" then
   zdtime="2000-10-10 12:12:12"
 else
   zdtime=now()
 End if
%>
<head>
<meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="<%=cczz%>" ontimer="/BBS/Forum_Content/Forum_AdminTopic.Asp?SessionID=<%=SessionID%>&amp;ForumID=<%=ForumID%>&amp;id=<%=id%>&amp;ids=<%=ids%>&amp;page=<%=page%>">
<timer value="10"/>
<p>
<%
'---读取数据----
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from wuza where id="&id
rs.open rspl,conn,1,2
if rs.recordcount=0 then%> 
错误了，帖子不存在或以被删除！<br/>
<%
else
if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("cw1")<>"" or Session("cg")<>"" or Session("vip")<>"" or Session("bzbz")=ForumID or Session("gly")=ForumID or Session("Counter")="pass_numbers_55556666" then
tzname=rs("biaoti")
ffid=rs("tjhm")
'---开始置顶----
rs("times")=zdtime
'---结束增加----
rs.update
'---关闭数据----
end if
rs.close
set rs=nothing
%>
<%if cc="o" then%>
<%sql="update usereg set usejf=usejf+0 Where CStr(id)="&ffid
conn.Execute(sql)%>
<%
set rsll=Server.CreateObject("ADODB.Recordset")
rsplll="select * from guestbook order by id desc"
rsll.open rsplll,conn,1,2
rsll.addnew
rsll("niayo")="您的帖子["&tzname&"]被版主["&ltname&"(ID:"&iduse&")]固底，请注意社区发帖规范！"
rsll("ids")=ffid
rsll("reids")="0"
rsll.update
rsll.close
set rsll=nothing%>
帖子固底成功，
<%end if%>
<%if cc="f" then%>
<%sql="update usereg set usejf=usejf-0 Where CStr(id)="&ffid
  conn.Execute(sql)%>
撤消固底成功，
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
Response.write "<br/><a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>回当前版块</a>"
response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>回论坛首页</a></p></card></wml>"
%>