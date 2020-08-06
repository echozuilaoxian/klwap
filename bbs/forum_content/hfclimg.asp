<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
wap=request.querystring("wap")
dim id,tjhm,page,itid
  itid=request("itid")
tjhm=Session("useid")
  page=request("page")
  id=request("id")
  name=request.form("name")
  name=trim(name)
  name=untowide(name)
  btzz=Session("ltname")
set objgbrs=Server.CreateObject("ADODB.Recordset")
conn.CommandTimeOut = 999
ssql="select * from wuza where Cstr(id)='" & id & "'"
objgbrs.open ssql,conn
if objgbrs("bntjyy1")="t" then
 response.write "<card id='card1' title='回复文章'><p>该文章锁定中,不能回复.<br/><a href='zcwwcl.asp?itid=" & itid & "&amp;id=" & id & "&amp;page=" & page & "&amp;wap=" & wap & "'>返回文章</a><br/><a href='zcww.asp?itid=" & itid & "&amp;wap=" & wap & "'>返回论坛首页</a></p></card></wml>"
 response.end
    End if
if objgbrs("times")="2000-10-10 12:12:12" then
 response.write "<card id='card1' title='回复文章'><p>该文章固底中,不能回复.<br/><a href='zcwwcl.asp?itid=" & itid & "&amp;id=" & id & "&amp;page=" & page & "&amp;wap=" & wap & "'>返回文章</a><br/><a href='zcww.asp?itid=" & itid & "&amp;wap=" & wap & "'>返回论坛首页</a></p></card></wml>"
 response.end
    End if
  if name="" then
     response.write "<card id='card1' title='回复文章'><p><br/>内容不能为空！"
     response.write "<br/><a href='lthf.asp?itid=" & itid & "&amp;id=" & id & "&amp;wap=" & wap & "'>返回重写</a>"
     response.write "<br/><a href='zcwwcl.asp?itid=" & itid & "&amp;id=" & id & "&amp;page=" & page & "&amp;wap=" & wap & "'>回看原文</a></p></card></wml>"
     response.end
  End if
 if not conn.execute("select * from wuza where Cstr(id)='"& id &"' and itid='" & itid & "'").eof then
  sql="insert into lthf(id,tjhm,btzz,name)values("
  sql=sql & sqlstr(id) & ","
  sql=sql & sqlstr(tjhm) & ","
  sql=sql & sqlstr(btzz) & ","
  sql=sql & sqlstr(name) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
  nowtime()
if Len(name)>3 then
  sql="update usereg set usejf=usejf+10,tili=tili+2,ml=ml+2 where CStr(id)=" & Session("useid")
  Application.Lock
  conn.execute sql
  Application.Unlock
end if
  msg="回复成功, 正在返回...<br/>金币+10魅力+2体力+2"
else
  msg="参数错误"
end if
  response.write "<card id='card1' title='回复文章' ontimer='/bbs/xcbgs/ckhf.asp?itid=" & itid & "&amp;id=" & id & "&amp;page=" & page & "&amp;wap=" & wap & "'><timer value='5'/><p align='left'>"
  response.write msg & "<br/><a href='ckhf.asp?itid=" & itid & "&amp;id=" & id & "&amp;page=" & page & "&amp;wap=" & wap & "'>回复列表</a></p></card></wml>"
  conn.close
  set objgbrs=nothing
  set conn=nothing
Function nowtime()
	sql="select * from wuza where CStr(id)='" & id & "'"
	set rs=conn.execute(sql)
if rs("times")="2100-10-10 12:12:12" then
  sql="update wuza set hfcont=hfcont+1 Where CStr(id)='" & id & "'"
  Application.Lock
  conn.execute sql
  Application.Unlock
else 
  sql="update wuza set times='" & now() & "',hfcont=hfcont+1 Where CStr(id)='" & id & "'"
  Application.Lock
  conn.execute sql
  Application.Unlock
 End if
 set rs=nothing
End Function
%>



