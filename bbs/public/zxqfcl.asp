<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/t22t.cn.asp"-->
<wml>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
dim ltlyuan,reids,objgbrs,jf,ys
reids=Session("useid")
 ltlyuan=request("ltlyuan")
 ltlyuan=trim(ltlyuan)
 ltlyuan=untowide(ltlyuan)
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ltlyuan="&ltlyuan&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if 
if Cstr(Session("vip1"))<>"" or Session("vip")<>"" or Session("Counter")="pass_numbers_55556666" then
  if ltlyuan="" then
     response.write "<card id='card1' title='在线群发信息'><p align=''>群发信息_内容不能为空！"
     response.write "<br/>-----------<br/><a href='/bbs/public/zxqf.asp?SessionID=" & SessionID & "'>返回继续操作</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
  set objgbr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & reids & "'"
  objgbr.open ssql,conn
  jf=Clng(objgbr("usejf"))
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from SoftDown_online order by id"
  objgbrs.open ssql,conn,1,3
  ys=Clng(objgbrs.RecordCount)
if ys*50<jf then
 Do While Not objgbrs.EOF
      ids=objgbrs("id")
    if conn.execute("select * from SoftDown_online where Cstr(ids)='" & id & "' order by id").eof then
      qfmsg
    end if
     objgbrs.MoveNext
  Loop
if Session("ltglzdl")="" then
  Application.Lock
  sql="update usereg set usejf=usejf-" & ys*50 & " where CStr(id)='" & reids & "'"
  conn.execute sql
  Application.Unlock
  msg="发送成功!并扣除金币" & ys*50 & "元" 
else
  msg="发送成功!" 
end if
else
  msg="你的金币不够发群信息!"
end if
	conn.close
	set conn=nothing
  response.write "<card id='card1' title='在线群发信息'><p>"
  response.write msg & "<br/>--------------<br/><a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>返回信息列表</a>"
response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"

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
End if
%>