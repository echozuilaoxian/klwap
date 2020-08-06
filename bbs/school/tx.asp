<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<card id="card" title="退学成功">
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select qs,love,tili,ml,caihua,zhili,xf,xl,id,usejf,nianji from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
sql="Delete DATEDIFF FROM gxx WHERE Cstr(useid)='" & iduse & "'"
conn.Execute sql
if objgbrs("nianji")=1 then
    sql="update usereg set xf=-1 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=2 then
    sql="update usereg set xf=-2 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=3 then
    sql="update usereg set xf=-3 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=4 then
    sql="update usereg set xf=-4 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=5 then
    sql="update usereg set xf=-5 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=6 then
    sql="update usereg set xf=-6 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=7 then
    sql="update usereg set xf=-7 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=8 then
    sql="update usereg set xf=-8 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=9 then
    sql="update usereg set xf=-9 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=10 then
    sql="update usereg set xf=-10 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=11 then
    sql="update usereg set xf=-11 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=12 then
    sql="update usereg set xf=-12 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=13 then
    sql="update usereg set xf=-13 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=14 then
    sql="update usereg set xf=-14 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=15 then
    sql="update usereg set xf=-15 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=16 then
    sql="update usereg set xf=-16 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=17 then
    sql="update usereg set xf=-17 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
if objgbrs("nianji")=18 then
    sql="update usereg set xf=-18 where CStr(id)='" & iduse & "'"
    conn.execute(sql)
end if
Response.write "<p>你已经成功退学了,希望你能有更好的发展！<br/>"
Response.write "------------<br/>"
Response.write "<a href='/bbs/school/school.asp?SessionID="&SessionID&"'>返回社区学校</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
conn.close
set conn=nothing
%>
