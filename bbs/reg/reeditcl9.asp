<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/t22t.cn.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
dim name,pass,usesex,useage,usejj,city
 name=request("name")
 name=trim(name)
 pass=request("pass")
 usesex=request("usesex")
 useage=request("useage")
 usejj=request("usejj")
 city=request("city")
if name="" or pass="" or usejj="" or useage="" then
     response.write "<card id='card1' title='修改资料'><p align='left'>"
     response.write "个人资料中的所有项都必须填写！<br/><a href='reedit9.asp?SessionID=" & SessionID & "'>返回重写</a></p></card></wml>"
     response.end
  End if
set rs=Server.CreateObject("ADODB.Recordset")
  sql="select * from usereg where usename=" & sqlstr(name)
  rs.open sql,conn
if not rs.eof then
if name=rs("usename") then
     response.write "<card id='card1' title='修改资料'>"
     response.write "<p align='left'>"
     response.write "该昵称已经被其他用户使用！<br/>"
     response.write "<br/><a href='reedit9.asp?SessionID=" & SessionID & "'>返回重写</a></p></card></wml>"
     response.end
end if
end if
 name=trim(name)
 useage=sqlstr(useage)
 city=trim(city)
 mmbh=trim(mmbh)
 name=left(name,10)
 pass=left(pass,15)
 usejj=left(usejj,100)
 name=sqlstr(untowide(name))
 pass=sqlstr(untowide(pass))
 usejj=sqlstr(untowide(usejj))
 city=sqlstr(untowide(city))
idss=Session("useid")
  sql="update usereg set useklmm=" & pass & ",usename=" & name
  sql=sql & ",usesex=" & usesex & ",useage=" & useage
  sql=sql & ",usejj=" & usejj & ",city=" & city & " Where CStr(id)='" & idss & "'"
  Application.Lock
  conn.Execute(sql)
  Application.Unlock
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  sql="select * from usereg where CStr(id)='" & idss & "'"
  objgbrs.open sql,conn
	set objgbrs=conn.execute(sql)
		Session("ltname")=objgbrs("usename")
		Session("useid")=objgbrs("id")
		Session("showjd")=objgbrs("jdshow")
        Session.Timeout=180
set objgbrs=nothing
conn.close
set conn=nothing
  response.write "<card id='card1' title='修改资料' ontimer='/bbs/reg/useinfo.asp?id=" & Session("useid") & "&amp;SessionID=" & SessionID & "'><timer value='10'/><p>"
  response.write"修改成功！<br/><a href='/bbs/reg/useinfo.asp?id=" & Session("useid") & "&amp;SessionID=" & SessionID & "'>我的资料</a></p></card></wml>"

function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>



