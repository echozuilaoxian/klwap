<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID") 
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
id=Session("useid")
dim xcname
dim xclink
  xcname=request("xcname")
  xclink=trim(request("xclink"))
  xcname=untowides(xcname)
  xclink=untowides(xclink)
  if xclink="" then
     xclink = Session("returnuppath")
  end if
 if xcname="" or xclink="" then
     Response.write "<card id='card1' title='我的书包'><p>"
     Response.Write "名称或地址不能为空"
     Response.Write "<br/><a href='tjtp.asp?SessionID=" & SessionID& "'>返回重写</a>"
     response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID& "'>我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID& "'>社区首页</a></p></card></wml>"
    Response.end
 end if

iduse=Session("useid")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from myalbum where CStr(ids)='" & iduse & "'"
  objgbrr.open ssql,conn,1,1
if objgbrr.RecordCount>60 then
 Response.write "<card id='card1' title='我的书包'><p>"
   Response.write "您的图片数量已达到最高上限60个,请删除一些再添加." 
   Response.write "<br/><a href='mybook.asp?SessionID=" & SessionID& "'>我的书包</a><br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID& "'>我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID& "'>社区首页</a></p></card></wml>"
    Response.end
 end if

  ssql="insert into myalbum(ids,niayo,xclink)values("
  ssql=ssql & sqlstr(id) & ","
  ssql=ssql & sqlstr(xcname) & ","
  ssql=ssql & sqlstr(xclink) & ")"
  conn.execute ssql
  Application.Unlock
  conn.close
  set conn=nothing
Response.write "<card id='card1' title='添加资源' ontimer='mybook.asp?SessionID=" & SessionID& "'><timer value='5'/><p>"
Response.Write "添加成功，正在返回..."
Response.Write "<br/>------------<br/><a href='mybook.asp?SessionID=" & SessionID& "'>我的书包</a>"
response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID& "'>我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID& "'>社区首页</a></p></card></wml>"
Function untowides(str)
	str=replace(str,"<","")
	str=replace(str,">","")
	str=replace(str,"&","&amp;")
	str=replace(str,"$","")
	str=replace(str,"","")
untowides=str
end function
%>




