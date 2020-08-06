<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%
Server.ScriptTimeout=999
dim ltlyuan,reids,objgbrs,jf,ys
reids=Session("useid")
 idd=request("idd")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=id"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if 
 set rs=Server.CreateObject("ADODB.Recordset")
  ssql1="select * from jzbl where Cstr(id)=" & idd &" and Cstr(tjhm)=" & reids
rs.open ssql1,conn
if rs.eof then
   Response.write "<card id='card1' title='帮派群发'><p>ID错误<br/></p></card></wml>"
response.end
 Else
ycccc=rs("biaoti")
thank=rs("tjhm")
   rs.close
	set rs=nothing

 ltlyuan=request("ltlyuan")
 ltlyuan=trim(ltlyuan)
 ltlyuan=untowide(ltlyuan)
  if ltlyuan="" then
     response.write "<card id='card1' title='"&converttowidebaiti(ycccc)&"-群发信息'><p align=''><br/>内容不能为空！"
     response.write "<br/><a href='/bbs/public/q_fsly101.asp?bz="& idd &"&amp;?SessionID=" & SessionID & "'>重写</a></p></card></wml>"
     response.end
  End if

  set objgbr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & reids & "'"
  objgbr.open ssql,conn
  jf=Clng(objgbr("usejf"))
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(bzbzz)='" & idd & "'"
  objgbrs.open ssql,conn,1,3
  rens=Clng(objgbrs.RecordCount)
  ys=rens*200
if ys<jf then
 Do While Not objgbrs.EOF
      ids=objgbrs("id")
    if conn.execute("select * from usereg where Cstr(id)='" & id & "' and bzbzz='"& idd &"' order by id").eof then
      qfmsg
    end if
     objgbrs.MoveNext
  Loop
  Application.Lock
  sql="update usereg set usejf=usejf-" & ys & " where CStr(id)='" & reids & "'"
  conn.execute sql
  Application.Unlock
  msg=""&converttowidebaiti(ycccc)&"-群发信息成功!扣除金币" & ys & "枚" 
else
  msg=""&converttowidebaiti(ycccc)&"-群发信息不成功! 原因您的金币不足," &rens& "个成员x 200金币=" & ys & "枚 你的金币没这么多啊！" 
end if

	conn.close
	set conn=nothing
  response.write "<card id='card1' title='"&converttowidebaiti(ycccc)&"-群发信息'><p>"
  response.write msg & "<br/><a href='/bbs/djcs.asp?id="&idd&"&amp;SessionID=" & SessionID & "'>返回"&converttowidebaiti(ycccc)&"</a>"
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
end if
%>