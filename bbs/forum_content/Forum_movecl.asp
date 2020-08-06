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
ForumID=request("ForumID")
page=request.querystring("page")
id=request.querystring("id")
dim id,setbzcz,ltname,iduse
ltname=Session("ltname")
iduse=Session("useid")
page=request("page")
ids=request("ids")
id=request("id")

setbzcz=request("setbzcz")
   if setbzcz<1 then
       response.end
   End if
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&setbzcz
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing
   id=request("id")
if setbzcz<>"" then cczz="转移至"&dlname&""
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  sql="select * from wuza Where CStr(id)='" & id &"' and itid<>'" & setbzcz & "'"
  objgbrs.open sql,conn
if objgbrs.eof then
      response.write "<head>"
      response.write "<meta http-equiv='Cache-Control' content='no-cache'/>"
      response.write "</head>"
      response.write "<card id='card1' title='"&cczz&"'><p>"
      Response.write "<a href='/BBS/forum_content/contentlist.asp?ForumID=" & setbzcz & "&amp;SessionID=" & SessionID & "'>回当前版块</a>"
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
<card title="<%=cczz%>" ontimer="/BBS/forum_content/contentlist.asp?SessionID=<%=SessionID%>&amp;ForumID=<%=setbzcz%>">
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
if Cstr(Session("yxxezb"))<>"" or Session("yxxexc")<>"" or Session("cw1")<>"" or Session("cg")<>"" or Session("bzbz")=ForumID or Session("gly")=ForumID or Session("Counter")="pass_numbers_55556666" then
tzname=rs("biaoti")
ffid=rs("tjhm")
'---开始置顶----
rs("itid")=setbzcz
'---结束增加----
rs.update
'---关闭数据----
end if
rs.close
set rs=nothing
%>
<%
set rsll=Server.CreateObject("ADODB.Recordset")
rsplll="select * from guestbook order by id desc"
rsll.open rsplll,conn,1,2
rsll.addnew
rsll("niayo")="您的帖子["&tzname&"]被版主["&ltname&"(ID:"&iduse&")]"&cczz&"，请注意社区发贴规范。"
rsll("ids")=ffid
rsll("reids")="0"
rsll.update
rsll.close
set rsll=nothing%>
<%=cczz%>成功，
<%sql="update usereg set usejf=usejf-0 Where CStr(id)="&ffid
  conn.Execute(sql)%>
<%
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
<br/>正在进入<%=dlname%>..
<%
end if
Response.write "<br/><a href='/BBS/forum_content/contentlist.asp?ForumID=" & setbzcz & "&amp;SessionID=" & SessionID & "'>回"&dlname&"</a>"
Response.write "<br/><a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>回原来版块</a>"
response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>回论坛首页</a></p></card></wml>"
%>