<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<!--#include FILE="md5.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
dim sjhm,pass
sjhm=request("sjhm")
pass=request("pass")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where useklsj=" & sqlstr(sjhm) & " and useklmm=" & sqlstr(pass)
  objgbrs.open ssql,conn
if objgbrs.eof then
%>
<%
  Response.write "<card id='card1' title='手功登陆'><p>手机号或密码不对,或您未注册。<br/><anchor>[返回上页]<prev/></anchor></p></card></wml>"
 response.end
else
  objgbrs.movefirst
 do until objgbrs.eof
 if sjhm=objgbrs("useklsj") and pass=objgbrs("useklmm") then
  Session.Timeout=120
  Session("ltname")=objgbrs("usename")
  Session("useid")=objgbrs("id")
  Session("showjd")=objgbrs("jdshow")
  Session("showwz")=objgbrs("cwxq")
if CStr(objgbrs("yxxegg"))<>"0" then
      Session("Counter")="pass_numbers_55556666"
    End if
    if CStr(objgbrs("yxxezb"))<>"0" then
        Session("yxxezb")=objgbrs("yxxezb")
      else
        Session("yxxezb")=""
    End if

    if CStr(objgbrs("yxxexc"))<>"0" then
        Session("yxxexc")=objgbrs("yxxexc")
      else
        Session("yxxexc")=""
    End if

    if CStr(objgbrs("bzbz"))<>"0" then
        Session("bzbz")=objgbrs("bzbz")
      else
        Session("bzbz")=""
    End if

    if CStr(objgbrs("gly"))<>"0" then
        Session("gly")=objgbrs("gly")
      else
        Session("gly")=""
    End if

	if CStr(objgbrs("ftsdbz"))="t" and Session("Counter")<>"pass_numbers_55556666" then
	    Session("ltfsbz")="sdfghdfg_dfg45fg45_6554"
	  else
	    Session("ltfsbz")=""
	End if

	if CStr(objgbrs("lysdbz"))="t" and Session("Counter")<>"pass_numbers_55556666" then
	    Session("ltlybz")="dfg34fdf_dfg554ghy_3452"
	  else
	    Session("ltlybz")=""
	End if

	if CStr(objgbrs("ftsdbz"))="x" and Session("Counter")<>"pass_numbers_55556666" then
	    Session("ltfsid")="ksjrh_jae56_hge654dgdd"
        response.redirect "http://xh6666.cn"
      else
        Session("ltfsid")=""
    End if

dim sid,SessionID
sid=Session.sessionid
useklsj=objgbrs("useklsj")
SessionID=md5(trim(useklsj)*sid,32)
sql="update usereg set wap='" & SessionID & "' where id="& Session("useid")
	conn.execute(sql)
sql="select wap from usereg where id="& Session("useid")
set objgbrs=conn.execute(sql)
 if Not objgbrs.eof then
SessionID=objgbrs("wap")
end if
  exit do
 End if
loop
response.Cookies("SessionID")=SessionID
Response.Cookies("SessionID").Expires=#January 01, 2010#
Session("SessionID")=SessionID
Response.write "<card id='card1' title='成功设置识别码' ontimer='/BBS/reg/reedit.asp?SessionID="&SessionID&"'><timer value='300'/><p>成功设置识别码!<br/>当前识别码:"&SessionID&"<br/>手机号码:" & sjhm & ""
Response.write "<br/><a href='/BBS/reg/reedit.asp?SessionID=" & SessionID & "'>返回修改资料</a>"
Response.write "<br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
End if
set objgbrs=nothing
conn.close
set conn=nothing
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>