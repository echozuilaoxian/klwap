<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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
dim page,debzs,ForumID,ids
  idd=request("ids")
   ForumID=request("ForumID")
ltname=untowide(Session("ltname"))
   iduse=Session("useid")
  debzs=CStr(request("debz"))
  page=request("page")
  id=request("id")
if Cstr(Session("bzbz"))=ForumID or idd=Cstr(Session("useid")) or Session("Counter")="pass_numbers_55556666" or Session("gly")=ForumID or Session("yxxezb")<>"" or Session("yxxexc")<>"" or Session("cg")<>"" or Session("cw1")<>"" or Session("cw")<>"" then
  acc=request("acc")
if acc="" then
%>
<card id='card1' title='删除文章'><p>确定删除?<br/><a href='/BBS/forum_content/Forum_DelWw.asp?ids=<% =idd %>&amp;id=<% =id %>&amp;ForumID=<% =ForumID %>&amp;debzs=<% =debzs %>&amp;page=<% =page %>&amp;acc=1&amp;SessionID=<%=SessionID%>'>确定</a>
<br/><a href='/BBS/forum_content/BBs_receipt_ByContent.Asp?ForumID=<% =ForumID %>&amp;id=<% =id %>&amp;page=<% =page %>&amp;SessionID=<%=SessionID%>'>取消</a></p></card></wml>
<%
 response.end
end if
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from wuza Where CStr(id)='" & id &"' and Cstr(itid)='" & ForumID & "' and CStr(tjhm)=" & idd
  objgbrs.open ssql,conn
if not objgbrs.eof then
  idss=objgbrs("tjhm")
  baoti=untowide(objgbrs("biaoti"))
if Cstr(Session("bzbz"))=ForumID or idss=Cstr(Session("useid")) or Session("Counter")="pass_numbers_55556666" or Session("gly")=ForumID or Session("yxxezb")<>"" or Session("yxxexc")<>"" or Session("cg")<>"" or Session("cw1")<>"" or Session("cw")<>"" then
  delzlcl()
  sql="delete from wuza Where CStr(id)='" & id & "' and jh='f'"
  conn.Execute(sql)
  sql="delete from lthf Where CStr(id)='" & id & "'"
  conn.Execute(sql)
  sql="delete from fgr_5fd_ffg Where CStr(id)='" & id & "'"
  conn.Execute(sql)
  if debzs="t" or idss=Cstr(Session("useid")) then
    sql="update usereg set usejf=usejf-100,ticont=ticont-1,ml=ml-5,tili=tili-5 where CStr(id)='" & idd & "'"
	conn.execute(sql)
  End if
  Application.Unlock
end if

if Cstr(Session("useid"))<>idss then
set rsll=Server.CreateObject("ADODB.Recordset")
rsplll="select * from guestbook order by id desc"
rsll.open rsplll,conn,1,2
rsll.addnew
rsll("niayo")="您的帖子["&baoti&"]被版主["&ltname&"(ID:"&iduse&")]删除，系统扣除您100金币，希望您以后多注意发贴内容！"
rsll("ids")=idss
rsll("reids")="0"
rsll.update
rsll.close
set rsll=nothing
End if

set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from [czrj] order by id desc"
rs.open rspl,conn,1,2
rs.addnew
rs("ltid")=ForumID
rs("ids")=iduse
rs("bzmc")=ltname
rs("wzid")=id
rs("tzmc")=""&baoti&""
rs("czxx")="永久删除"
rs.update
'---关闭数据----
rs.close
set rs=nothing

function delzlcl()
dim reids
reids=Session("useid")
  sql="insert into delzl(idss,reids,baoti) values ("
  sql=sql & sqlstr(idss) & ","
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(baoti) & ")"
  Application.Lock
  conn.execute(sql)
  Application.Unlock
end function

response.write "<card id='card1' title='删除成功' ontimer='/BBS/forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'><timer value='10'/><p align='center'>"
response.write "删除成功，正在返回...<br/>"
response.write "<a href='/BBS/forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>回上一级</a></p></card></wml>"

 conn.close
 set objgbrs=Nothing
 set conn=nothing
else
  response.write "<card id='card1' title='删除文章'><p>越权操作！</p></card></wml>"
End if
else
  response.write "<card id='card1' title='删除文章'><p>越权操作！</p></card></wml>"
End if
%>