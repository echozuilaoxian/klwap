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
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
zb=request("zb")
 zb=Clng(zb)
ForumID=request("ForumID")
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
%>
<%
 if zb="" then
     response.write "<card id='card1' title='帮派捐款'><p><br/>金币不能为空！<br/><a href='1002.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回重写</a><br/><a href='/BBS/djcs.asp?ID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/></p></card></wml>"
     response.end
  End if
if zb<100 then
     response.write "<card id='card1' title='帮派捐款'><p><br/>金币不能少与100<br/><a href='1002.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回重写</a><br/><a href='/BBS/djcs.asp?ID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/></p></card></wml>"
     response.end
  End if
if ForumID="" then
     response.write "<card id='card1' title='帮派捐款'><p><br/>系统不能识别你的身份，请返回重填<br/><a href='1002.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回重写</a><br/><a href='/BBS/djcs.asp?ID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/></p></card></wml>"
     response.end
  End if
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select usejf from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
if objgbrs("usejf")<zb then
     response.write "<card id='card1' title='帮派捐款'><p>你的金币不足。<br/><a href='1002.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回重写</a><br/><a href='/BBS/djcs.asp?ID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/></p></card></wml>"
     response.end
    End if
            sql="update usereg set usejf=usejf-" & zb & " Where CStr(id)='" & iduse & "'"
            Application.Lock
            conn.execute(sql)
sql="update jzbl set hfcontd=hfcontd+" & zb & " Where CStr(id)='" & ForumID & "'"
            Application.Lock
            conn.execute(sql)
            sql="update sn_datb set num=num+" & zb & " Where CStr(des)='" & ForumID & "'"
  conn.execute sql
  Application.Unlock
  conn.close
  set objgbrs=nothing
  set conn=nothing
 response.write "<card id='card1' title='帮派捐款' ontimer='1000.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'><timer value='10'/><p align='left'>捐款成功，帮主感谢你的付出！<br/><a href='/BBS/djcs.asp?ID=" & ForumID & "&amp;SessionID=" & SessionID & "'>点击这里</a>回" & dlname & "...<br/>-------------<br/><a href='bank.asp?SessionID=" & SessionID & "'>社区银行</a><br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>我的地盘</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"%>



