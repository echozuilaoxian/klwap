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
   cc=request("bntjyy1")
   id=request("id")
if cc="t" then cczz="锁定帖子"
if cc="f" then cczz="撤消锁定"
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  sql="select * from wuza Where CStr(id)='" & id &"' and bntjyy1<>'" & cc & "'"
  objgbrs.open sql,conn
if objgbrs.eof then
      response.write "<head>"
      response.write "<meta http-equiv='Cache-Control' content='no-cache'/>"
      response.write "</head>"
      response.write "<card id='card1' title='"&cczz&"'><p>"
      Response.write "<a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>回当前版块</a>"
      response.write "操作已成功,请不要刷新!</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
end if
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
if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("vip")<>"" or Session("bzbz")=ForumID or Session("gly")=ForumID or Session("Counter")="pass_numbers_55556666" then
tzname=rs("biaoti")
ffid=rs("tjhm")
'---开始置顶----
rs("bntjyy1")=cc
'---结束增加----
rs.update
'---关闭数据----
end if
rs.close
set rs=nothing
%>
<%if cc="t" then%>
<%sql="update usereg set usejf=usejf+0 Where CStr(id)="&ffid
conn.Execute(sql)%>
<%
set rsll=Server.CreateObject("ADODB.Recordset")
rsplll="select * from guestbook order by id desc"
rsll.open rsplll,conn,1,2
rsll.addnew
rsll("niayo")="您的帖子["&tzname&"]被版主["&ltname&"(ID:"&iduse&")]锁定，请注意社区发帖规范，谢谢！"
rsll("ids")=ffid
rsll("reids")="0"
rsll.update
rsll.close
set rsll=nothing%>
锁定帖子成功，
<%end if%>
<%if cc="f" then%>
<%sql="update usereg set usejf=usejf-0 Where CStr(id)="&ffid
  conn.Execute(sql)%>
撤消锁定成功，
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