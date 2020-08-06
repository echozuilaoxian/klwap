<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<%Session.CodePage=65001%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/ wml_1.1.xml">
<!--#include file="ccnn.inc"-->
<!--#include file="ubb.inc"-->
<wml>
<%
SessionID=request.querystring("SessionID")
iduse=Session("useid")
Server.ScriptTimeout=999
dim about1,check1,id1
 about1=usb(request("about1"))
 check1=request("check1")
 id1=request("id")
 p=request("p")
sql="update urls set sscs=sscs+1 Where CStr(id)='" & id1 & "'"
  conn.Execute(sql) 
Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select usejf from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
if objgbrs("usejf")<500 then
     response.write "<card id='card1' title='错误!'><p>你的金币不足!"
     response.write "<br/><a href='index.asp'>法院</a>-<a href='/bbs/index.asp'>返回社区首页</a></p></card></wml>"
     response.end
objgbrrs.close
set objgbrrs=nothing
    End if
if about1="" then
     response.write "<card id='card1' title='被告上诉'><p align='left'>"
     response.write "内容必须填写！<br/><br/>----------<br/><a href='bgss.asp?SessionID=" & SessionID & "&amp;idss=" & idss & "&amp;ids=" & ids & "&amp;id=" & id1 & "&amp;p=" & p & "'>返回重写</a>"
%>
<br/><!--#include file="aa.asp"-->
<%
  response.write "</p></card></wml>"
     response.end

  else

set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from urls where id=" & id1
rs.open rsstr,conn,1,2
rs("about")=about1
rs("check")=check1
rs.Update
 sql="update usereg set usejf=usejf-300 where CStr(id)='" & iduse & "'"
  conn.execute sql
  Application.Unlock
  response.write "<card id='card1' title='被告上诉' ontimer='index.asp?SessionID=" & SessionID & "'><timer value='15'/><p>"
  response.write "成功上诉，正在返回...<br/><br/>----------"
%>
<br/><!--#include file="aa.asp"-->
<%
  response.write "</p></card></wml>"

end if
rs.close
set rs=nothing
conn.close
set conn=nothing
%>