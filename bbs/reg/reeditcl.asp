<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
dim name,pass,usesex,usejj,useage,city
 pass=request("pass")
 qq=request("qq")
 usesex=request("usesex")
 useage=request("useage")
 usejj=request("usejj")
 city=request("city")
if pass="" or usejj="" or city="" or qq="" then
     response.write "<card id='card1' title='修改资料'><p align='left'>"
     response.write "个人资料中的所有项都必须填写！<br/><a href='reedit.asp?SessionID=" & SessionID & "'>返回重写</a></p></card></wml>"
     response.end
  End if
 useage=sqlstr(useage)
 usesex=sqlstr(usesex)
 city=trim(city)
 pass=left(pass,15)
 usejj=left(usejj,100)
 pass=sqlstr(untowide(pass))
 qq=sqlstr(untowide(qq))
 usejj=sqlstr(untowide(usejj))
 city=sqlstr(untowide(city))
id=Session("useid")
  sql="update usereg set useklmm=" & pass
  sql=sql & ",usesex=" & usesex & ",useage=" & useage
  sql=sql & ",usejj=" & usejj & ",city=" & city & ",qq=" & qq & "  Where CStr(id)='" & id & "'"
  Application.Lock
  conn.Execute(sql)
  Application.Unlock
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  sql="select * from usereg where CStr(id)='" & id & "'"
  objgbrs.open sql,conn
	set objgbrs=conn.execute(sql)
		Session("useid")=objgbrs("id")
		Session("showjd")=objgbrs("jdshow")
        Session.Timeout=180
set objgbrs=nothing
conn.close
set conn=nothing
  response.write "<card id='card1' title='修改资料' ontimer='/bbs/reg/useinfo.asp?id=" & Session("useid") & "&amp;SessionID=" & SessionID & "'><timer value='18'/><p>"
  response.write"修改成功！<br/><a href='/bbs/reg/useinfo.asp?id=" & Session("useid") & "&amp;SessionID=" & SessionID & "'>查看个人资料</a></p></card></wml>"

function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>



