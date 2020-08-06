<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
dim id,ids,page,debz,forumID,idss
  idss=request("idss")
  forumID=request("forumID")
  page=request("page")
  pages=request("pages")
if pages="" or pages<=0 then pages=1
  ids=request("ids")
  id=request("id")
  debz=CStr(request("debz"))
if Cstr(Session("yxxezb"))<>"" or id=Cstr(Session("useid")) or Session("yxxexc")<>"" or id=Cstr(Session("useid")) or Session("vip")<>"" or Session("bzbz")=forumID or Session("gly")=forumID or Session("Counter")="pass_numbers_55556666" then
  acc=request("acc")
if acc="" then
%>
<card id='card1' title='删除成功'><p>确定删除?<br/><a href='redelww.asp?ids=<% =ids %>&amp;idss=<% =idss %>&amp;id=<% =id %>&amp;forumID=<% =forumID %>&amp;debz=<% =debz %>&amp;page=<% =page %>&amp;acc=1&amp;SessionID=<%=SessionID%>'>是</a>
<br/><a href='rezcwwcl.asp?forumID=<% =forumID %>&amp;ids=<% =ids %>&amp;id=<% =idss %>&amp;page=<% =page %>&amp;pages=<%=pages%>&amp;SessionID=<%=SessionID%>'>否</a></p></card></wml>
<%
 conn.close
 set objgbrs=Nothing
 set conn=nothing
 response.end
end if
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  sql="select * from lthf Where CStr(ids)='" & ids &"' and tjhm='" & id & "'"
  objgbrs.open sql,conn
if not objgbrs.eof then
 if debz="t" or id=Cstr(Session("useid")) then
     sql="update usereg set usejf=usejf-10,tili=tili-5,ml=ml-5  where CStr(id)=" & id
     conn.Execute(sql)
 End if
  sql="delete from lthf Where CStr(ids)='" & ids & "'"
  Application.Lock
  conn.Execute(sql)
  sql="update wuza set hfcont=hfcont-1 Where CStr(id)='" & idss & "'"
  conn.Execute(sql)
  Application.Unlock
end if
  response.write "<card id='card1' title='删除成功' ontimer='receiptlist.asp?forumID=" & forumID & "&amp;id=" & idss & "&amp;page=" & page & "&amp;pages=" & pages & "&amp;SessionID=" & SessionID & "'><timer value='10'/><p align='left'>"
  response.write "删除成功，正在返回..."
  response.write "<br/><a href='/bbs/forum_content/BBs_receipt_ByContent.Asp?forumID=" & forumID & "&amp;id=" & id & "&amp;page=" & page & "&amp;SessionID=" & SessionID & "'>返回上一级</a>"
  response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
end if
conn.close
set objgbrs=nothing
set conn=nothing
%>