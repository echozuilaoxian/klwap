<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<% if Session("Counter")="pass_numbers_55556666" then %>
<% SessionID=request.querystring("SessionID") %>
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
Server.ScriptTimeout=999
dim id,keyword,selects
selects=Cstr(request("select"))
keyword=request("keyword")
id=Cstr(request("id"))
if keyword="" or id="" then
     response.write "<card id='card1' title='管理用户'>"
     response.write "<p align='center'>"
     response.write "ID和来源地址不能为空!"
     response.write "<br/><a href='wap.asp?SessionID=" & SessionID & "'>返回重写</a></p></card></wml>"
     response.end
  End if
 if selects="01" then
  sql="update usereg set form='" & keyword & "' Where CStr(id)='" & id & "'"
 end if
 if selects="02" then
   keyword=Clng(keyword)
   sql="update usereg set usejf='" & keyword & "' Where CStr(id)='" & id & "'"
 end if
 if selects="03" then
   sql="update usereg set usename='" & keyword & "' Where CStr(id)='" & id & "'"
 end if
 if selects="04" then
   sql="update usereg set usejj='" & keyword & "' Where CStr(id)='" & id & "'"
 end if
 if selects="05" then
   sql="update usereg set useklsj='" & keyword & "' Where CStr(id)='" & id & "'"
 end if
if selects="06" then
   sql="update usereg set fying='" & keyword & "' Where CStr(id)='" & id & "'"
 end if  
if selects="08" then
   sql="update usereg set entcont='" & keyword & "' Where CStr(id)='" & id & "'"
 end if 
if selects="09" then
   sql="update usereg set useklmm='" & keyword & "' Where CStr(id)='" & id & "'"
 end if 
if selects="010" then
   sql="update usereg set ticont='" & keyword & "' Where CStr(id)='" & id & "'"
 end if 
if selects="011" then
   sql="update usereg set ml='" & keyword & "' Where CStr(id)='" & id & "'"
 end if 
if selects="012" then
   sql="update usereg set tili='" & keyword & "' Where CStr(id)='" & id & "'"
 end if 
if selects="013" then
   sql="update usereg set regtimes='" & keyword & "' Where CStr(id)='" & id & "'"
 end if 
if selects="014" then
   sql="update usereg set myhz='" & keyword & "' Where CStr(id)='" & id & "'"
 end if 
if selects="015" then
   sql="update usereg set myjy='" & keyword & "' Where CStr(id)='" & id & "'"
 end if 
if selects="016" then
   sql="update usereg set myfq='" & keyword & "' Where CStr(id)='" & id & "'"
 end if 
if selects="017" then
   sql="update usereg set n='" & keyword & "' Where CStr(id)='" & id & "'"
 end if 
if selects="018" then
   sql="update usereg set y='" & keyword & "' Where CStr(id)='" & id & "'"
 end if 
if selects="019" then
   sql="update usereg set r='" & keyword & "' Where CStr(id)='" & id & "'"
 end if 
if selects="020" then
   sql="update usereg set city='" & keyword & "' Where CStr(id)='" & id & "'"
 end if 
if selects="021" then
   sql="update usereg set roomjfjf='" & keyword & "' Where CStr(id)='" & id & "'"
 end if 
if selects="0100" then
   sql="update usereg set mybbwj='" & keyword & "' Where CStr(id)='" & id & "'"
 end if 
if selects="0101" then
   sql="update gpmr set jysl='" & keyword & "' Where CStr(idd)='" & id & "'"
 end if
if selects="0102" then
   sql="update usereg set zamw='" & keyword & "' Where CStr(id)='" & id & "'"
 end if 
  Application.Lock
  conn.Execute(sql)
  Application.Unlock
conn.close
set conn=nothing
  response.write "<card id='card1' title='管理用户' ontimer='/bbs/reg/useinfo.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>"
  response.write "<timer value='10'/><p>"
  response.write"修改成功！！"
  response.write "<br/>"
  response.write "<a href='/bbs/reg/useinfo.asp?SessionID=" & SessionID & "'>用户资料</a></p></card></wml>"
End if
%>



