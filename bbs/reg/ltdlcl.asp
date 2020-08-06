<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/410616.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/t22t.cn.asp"-->
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
  Response.write "<card id='card1' title='手功登陆'><p>手机号或密码不对,或您未注册。<br/><a href='/bbs/yksm.asp'>注册登陆</a></p></card></wml>"
 response.end
else
  objgbrs.movefirst
 do until objgbrs.eof
 if sjhm=objgbrs("useklsj") and pass=objgbrs("useklmm") then
  Session.Timeout=120
  Session("ltname")=objgbrs("usename")
  Session("useid")=objgbrs("id")
  Session("showjd")=objgbrs("jdshow")
  if Session("useid")=xx or Session("useid")=xx or Session("useid")=xx then  
  Session("Counter")="pass_numbers_55556666"
  end if
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
	if CStr(objgbrs("ftsdbz"))="x" and Session("Counter")<>"pass_numbers_56431290" then
	    Session("ltfsid")="ksjrh_jae56_hge654dgdd"
        response.redirect "htt://xh6666.cn"
      else
        Session("ltfsid")=""
    End if
    if CStr(objgbrs("bzbz"))<>"0" then
        Session("ltglzdl")=objgbrs("bzbz")
      else
        Session("ltglzdl")=""
    End if
 if CStr(objgbrs("gzry"))<>"0" then
        Session("ltglzdll")=objgbrs("gzry")
      else
        Session("ltglzdll")=""
    End if
dim sid,wap
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
Response.write "<card id='card1' title='登陆状态' ontimer='/bbs/index.asp?SessionID="&SessionID&"'><timer value='18'/><p>当前状态:登陆成功<br/>您的识别码:" & objgbrs("wap") & "<br/>进入社区后把首页加入书签,以后可自动登陆!<br/>"
Response.write "<a href='/bbs/index.asp?SessionID=" & objgbrs("wap") & "'>返回社区</a><br/><a href='/bbs/index.asp?SessionID=" & objgbrs("wap") & "'>进入我的地盘</a><br/><a href='/index.asp?SessionID=" & objgbrs("wap") & "'>返回首页</a></p></card></wml>"
End if
set objgbrs=nothing
conn.close
set conn=nothing
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>

