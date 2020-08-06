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
  ForumID=Cstr(request("ForumID"))
set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from jzbl where id="&ForumID
rse.open rspple,conn,1,2
if rse.eof then
dlname="无此帮派"
else
dlname=converttowidebaiti(rse("biaoti"))
yxxes=rse("tjhm")
end if
rse.close
Set rse= Nothing
if Session("useid")=yxxes then

SessionID=request.querystring("SessionID")
  dim name
  ForumID=Cstr(request("ForumID"))
   if Clng(ForumID)<1 then
       response.end
   End if
  name=request("name")
des=request("ForumID")
  name=left(name,5)
  name=trim(name)
  name=untowide(name)
  if name="" then
     response.write "<card id='card1' title='论坛基金'><p><br/>数量不能为空<br/><a href='1.asp?itid=" & itid & "&amp;wap=" & wap & "'>返回重写</a></p></card></wml>"
     response.end
  End if
  sql="insert into sn_datb(des,num)values("
  sql=sql & sqlstr(ForumID) & ","
  sql=sql & sqlstr(name) & ")"
  Application.Lock
  conn.execute sql
sql="update jzbl set hfcontd=0 Where CStr(id)='" & des & "'"
  Application.Lock
  conn.Execute(sql)
          sql="update sn_datb set num=0 where CStr(des)='" & ForumID & "'"
  conn.Execute(sql)
  Application.Unlock

  conn.close
  set conn=nothing
 response.write "<card id='card1' title='帮主操作' ontimer='1000.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'><timer value='500'/><p align='left'>操作成功！成功开通"&dlname&"基金<br/><a href='1000.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回"&dlname&"基金</a><br/></p></card></wml>"
end if
 %>
