<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
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
  Response.write "<card id='card1' title='社区登陆状态'><p>当前状态:登陆错误!<br/>手机号码或密码不对,或您未注册。如果多次出现这个面页请修改你的密码为 数字或英文字母 请不要使用符号做为登陆密码。<br/><a href='/BBS/UseLogin.asp'>返回登陆界面</a></p></card></wml>"
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

%>		<card id='login' title='登陆成功'>
		<p>
登陆成功,登陆后访问任何页面，将此页面存为书签，您以后再从此书签进入，将不会再要求登陆<br/>
<%
if Session("returnuppath")<>"" then
   Response.write "<a href='" & Session("returnuppath") & "&amp;SessionID=" & SessionID & "'>返回来源面页</a><br/>"
      else
   Response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"
end if   
%>
ＩＤ:<%=Session("useid")%><br/>
昵称:<%=converttowidebaiti(Session("ltname"))%><br/>
手机:<%=useklsj%><br/>
<a href="/bbs/reg/useinfo.asp?id=<%=Session("useid")%>&amp;SessionID=<%=Session("SessionID")%>">更多资料</a><br/>
----------<br/>
温馨提醒:<br/>
书签地址中SessionID=<%=SessionID%>为您的身份标识码, 在做提取地址时要去掉标识,不要泄露给他人.请妥善保管!<br/>
<a href="/BBS/index.asp?SessionID=<%=Session("SessionID")%>">社区首页</a><br/>
<a href="/index.asp?SessionID=<%=Session("SessionID")%>">网站首页</a><br/>

		</p>
</card>
</wml>
<%
End if
set objgbrs=nothing
conn.close
set conn=nothing
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
%>
