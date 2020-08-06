<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ids=Session("useid")
dim xcname,xclink,id
  id=request("id")
  xcname=request("xcname")
  xclink=request("xclink")
 if xcname="" or xclink="" then
     Response.write "<card id='card1' title='修改图片'><p>"
     Response.Write "地址或标题不能为空！"
     Response.Write "<br/><a href='reedtp.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>返回重写</a>"
     response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
    Response.end
 end if
  xcname=untowides(xcname)
  xclink=untowides(xclink)
  ssql="update myalbum set niayo='" & xcname & "',xclink='" & xclink & "' Where CStr(id)='" & id & "' and Cstr(ids)='" & ids & "'"
  conn.execute ssql
  Application.Unlock
  conn.close
  set objgbrs=nothing
  set conn=nothing
Function untowides(str)
	str=replace(str,"<","")
	str=replace(str,">","")
	str=replace(str,"&","&amp;")
	str=replace(str,"$","")
	str=replace(str,"","")
untowides=str
end function
%>
<card id="card1" title="修改图片" ontimer='view.asp?id="<% =id %>"&amp;pages=1&amp;SessionID=<%=SessionID%>'>
<timer value="5"/>
<p>
修改成功，正在返回...
<br/>------<br/><a href='mybook.asp?SessionID=<%=SessionID%>'>返回我的书包</a>
<br/><a href='/bbs/index.asp.asp?SessionID=<%=SessionID%>'>返回社区首页</a></p></card></wml>



