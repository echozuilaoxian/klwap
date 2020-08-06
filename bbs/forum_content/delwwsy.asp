<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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
<%
if Session("Counter")="pass_numbers_55556666" then
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
dim pages,ids
  ids=request("ids")
  pages=request("pages")
 debzs=CStr(request("debz"))
  acc=request("acc")
if acc="" then
%>
<card id='card1' title='删除文章'><p>确定删除ID:<% =ids %>所有的文章?<br/><a href='delwwsy.asp?ids=<% =ids %>&amp;debzs=<% =debzs %>&amp;acc=1&amp;SessionID=<%=SessionID%>'>是</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>否</a></p></card></wml>
<%
else

  Application.lock
  sql="delete from wuza Where CStr(tjhm)='" & ids & "'"
  conn.Execute(sql)
  Application.Unlock
  sql="delete from lthf Where CStr(tjhm)='" & ids & "'"
  conn.Execute(sql)
  if debzs="t" or ids=Cstr(Session("useid")) then
    sql="update usereg set usejf=usejf-100000,ml=ml-4000,tili=tili-4000 where CStr(id)='" & ids & "'"
	conn.execute(sql)
  End if
  
  response.write "<card id='card1' title='删除成功' ontimer='/bbs/index.asp?SessionID=" & SessionID & "'><timer value='5'/><p align='left'>"
  response.write"该用户所有文章已删除，正在返回...<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
end if
end if
  conn.close
  set conn=nothing

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
%>



