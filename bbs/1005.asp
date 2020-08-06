<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
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
dlname=untowide(rse("biaoti"))
yxxes=rse("tjhm")
end if
rse.close
Set rse= Nothing
if Session("useid")=yxxes then

SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
dim id,ltlyuan,ltlyuans
iduse=Session("useid")
zbs=request("zbs")
zbs=Clng(zbs)
ForumID=request("ForumID")
gfdsa=Session("ltname")
id=request("id")

 if zbs="" then
     response.write "<card id='card1' title='基金操作'><p><br/>金币不能为空！<br/>-----------<br/><a href='1004.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回重写</a><br/><a href='1000.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回帮派基金</a><br/></p></card></wml>"
     response.end
  End if

if ForumID="" or gfdsa="" then
     response.write "<card id='card1' title='基金操作'><p><br/>系统不能识别你的身份，请返回重填。<br/><br/>-----------<br/><a href='1004.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回重写</a><br/><a href='1000.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回帮派基金</a><br/></p></card></wml>"
     response.end
  End if
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select num from sn_datb where CStr(des)='" & ForumID & "'"
    objgbrs.open sql,conn
if objgbrs("num")<zbs then
     response.write "<card id='card1' title='基金操作'><p>帮派基金没有这么多。。。<br/>-----------<br/><a href='1004.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回重写</a><br/><a href='1000.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回帮派基金</a><br/></p></card></wml>"
     response.end
    End if

sql="update jzbl set hfcontd=hfcontd-" & zbs & " Where CStr(id)='" & ForumID & "'"
  conn.Execute(sql)
            sql="update usereg set usejf=usejf+" & zbs & " Where CStr(id)='" & id & "'"
            Application.Lock
            conn.execute(sql)
            sql="update sn_datb set num=num-" & zbs & " Where CStr(des)='" & ForumID & "'"
  conn.execute sql
  Application.Unlock

  ltlyuan="恭喜！" & dlname & "帮主[b][u]" & gfdsa & "ID:" & iduse & "[/u][/b]从" & dlname & "奖励你" & zbs & "金币,这是系统信息,请勿回复以及转发!"
            gftz()
  conn.close
  set objgbrs=nothing
  set conn=nothing
 response.write "<card id='card1' title='基金操作' ontimer='1000.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'><timer value='10'/><p align='left'>操作成功，已经发信息通知该用户...<br/>----------<br/><a href='1000.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回帮派基金</a></p></card></wml>"
end if
%>



