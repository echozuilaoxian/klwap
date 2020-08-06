<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
dim n,y,r

 n=request("n")
 y=request("y")
 r=request("r")
if n="" or y="" or r="" then
     response.write "<card id='card1' title='修改生日'><p align='left'>"
     response.write "个人资料中的所有项都必须填写！<br/><a href='reedit.asp?SessionID=" & SessionID & "'>返回重写</a></p></card></wml>"
     response.end
  End if
 n=sqlstr(n)
 y=sqlstr(y)
 r=sqlstr(r)
id=Session("useid")
  sql="update usereg set n=" & n & ",y=" & y & ",r=" & r & " Where CStr(id)='" & id & "'"
  Application.Lock
  conn.Execute(sql)
  Application.Unlock
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  sql="select * from usereg where CStr(id)='" & id & "'"
  objgbrs.open sql,conn
	set objgbrs=conn.execute(sql)
		Session("ltname")=objgbrs("usename")
		Session("useid")=objgbrs("id")
		Session("showjd")=objgbrs("jdshow")
        Session.Timeout=180
set objgbrs=nothing
conn.close
set conn=nothing
  response.write "<card id='card1' title='修改生日' ontimer='/bbs/reg/useinfo.asp?id=" & Session("useid") & "&amp;SessionID=" & SessionID & "'><timer value='10'/><p>"
  response.write"修改成功！<br/><a href='/bbs/reg/useinfo.asp?id=" & Session("useid") & "&amp;SessionID=" & SessionID & "'>个人资料</a></p></card></wml>"

function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function

Function untowide(str)
	str=replace(str,"<","")
	str=replace(str,">","")
	str=replace(str,"$","")
	str=replace(str,"&","")
	str=replace(str,"","")
str=replace(str,"ω","")
str=replace(str,"〣","")
str=replace(str,"≡","")
str=replace(str,"£","")
str=replace(str,"の","")
str=replace(str,"¤","")
str=replace(str,"ゞ","")
str=replace(str,"￡","")
str=replace(str,"§","")
str=replace(str,"℡","")
str=replace(str,"","")
str=replace(str,"〆","")
str=replace(str,"ㄣ","")
str=replace(str,"乆","")
str=replace(str,"ぷ","")
str=replace(str,"ش","")
str=replace(str,"%","")
str=replace(str,"ø","")
str=replace(str,"＿","")
untoWide=str
end function
%>



