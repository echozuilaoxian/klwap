<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
Server.ScriptTimeout=999
 idd=request("idd")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?idd="&idd&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
dim ltlyuan,reids,objgbrs,jf,ys
reids=Session("useid")

 set rs=Server.CreateObject("ADODB.Recordset")
  ssql1="select * from wry where Cstr(id)=" & idd &" and Cstr(idd)=" & reids
rs.open ssql1,conn
if rs.eof then
   Response.write "<card id='card1' title='好友分组'><p>ID错误<br/></p></card></wml>"
response.end
 Else
ycccc=rs("country")
thank=rs("thank")
   rs.close
	set rs=nothing

 ltlyuan=request("ltlyuan")
 ltlyuan=trim(ltlyuan)
 ltlyuan=untowide(ltlyuan)
  if ltlyuan="" then
     response.write "<card id='card1' title='"&converttowidebaiti(ycccc)&"-群发信息'><p align=''><br/>内容不能为空！"
     response.write "<br/><a href='/bbs/public/q_fsly100.asp?idd="& idd &"&amp;?SessionID=" & SessionID & "'>重写</a></p></card></wml>"
     response.end
  End if

  set objgbr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & reids & "'"
  objgbr.open ssql,conn
  jf=Clng(objgbr("usejf"))
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from myfriend where Cstr(ids)='" & reids & "' and useid='"&idd&"'"
  objgbrs.open ssql,conn,1,3
  ys=Clng(objgbrs.RecordCount)
if ys<jf or Session("ltglzdl")<>"" then
 Do While Not objgbrs.EOF
      ids=objgbrs("friid")
    if conn.execute("select * from myfriend where ids='"& reids &"' and friid='*" & ids & "' and useid='"&idd&"'").eof then
      qfmsg
    end if
     objgbrs.MoveNext
  Loop
if Cstr(Session("yxxezb"))="" or Session("yxxexc")="" or Session("Counter")<>"pass_numbers_55556666" then
  Application.Lock
  sql="update usereg set usejf=usejf-" & ys*200 & " where CStr(id)='" & reids & "'"
  conn.execute sql
  Application.Unlock
  msg=""&converttowidebaiti(ycccc)&"-群发信息成功!扣除金币" & ys*200 & "枚" 
else
  msg=""&converttowidebaiti(ycccc)&"-群发信息成功!" 
end if
end if
	conn.close
	set conn=nothing
  response.write "<card id='card1' title='"&converttowidebaiti(ycccc)&"-群发信息'><p>"
  response.write msg & "<br/><a href='/bbs/friandbook/hyfz/myfzhy.asp?SessionID=" & SessionID & "&amp;idd=" & idd & "'>返回"&converttowidebaiti(ycccc)&"</a>"
if Session("returnuppath")<>"" then
   Response.write "<br/><a href='" & Session("returnuppath") & "&amp;SessionID=" & SessionID & "'>返回来源面页</a>"
End if
response.write "<br/><a href='/bbs/friandbook/myfriend.asp?SessionID=" & SessionID & "'>返回默认分组</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"

function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function

Function qfmsg()
  sql="insert into guestbook(ids,reids,niayo) values ("
  sql=sql & sqlstr(ids) & ","
  sql=sql & sqlstr(reids) & ","
  sql=sql & sqlstr(ltlyuan) & ")"
  Application.Lock
  conn.execute(sql)
  Application.Unlock
End function
end if
%>