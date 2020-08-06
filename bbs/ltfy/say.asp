<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="ccnn.inc"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<%
dim id,kk,p
SessionID=request.querystring("SessionID")
id=request.QueryString("id")
kk=request.QueryString("kk")
p=request.QueryString("p")

if kk="xh" then
response.write("<card title='献花成功' ontimer='view.asp?ids=" & ids & "&amp;p=" & p & "&amp;id=" & id & "&amp;SessionID=" & SessionID & "'><timer value='10'/><p>")
response.write("多谢支持,我一定会赢的！！<br/>")

  sql="update urls set xh=xh+1 Where id=" & id
  conn.Execute(sql)
    elseif kk="jd" then
response.write("<card title='丢蛋成功' ontimer='view.asp?ids=" & ids & "&amp;p=" & p & "&amp;id=" & id & "&amp;SessionID=" & SessionID & "'><timer value='10'/><p>")
response.write("扔蛋成功,还不快逃....<br/>")

  sql="update urls set jd=jd+1 Where id=" & id
  conn.Execute(sql)
end if
%>
----------<br/>
<!--#include file="aa.asp"-->
</p>
</card>
</wml>
<%
conn.close
set conn=nothing
%>