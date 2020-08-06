<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<card id="card1" title="领取日薪"><p>
<%if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
      else
        Session("ltlybz")=""
    End if
Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM gao2"
rec.Open SQL,conn,1,1
   countall=countalls
   response.write "<small>今日共有" & countall & "人领取了日薪<br/></small>"
conn.close
set rec=nothing
set conn=nothing

Function countalls()
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from gao2"
  objgbrr.open ssql,conn,1,1
countalls=objgbrr.RecordCount
set objgbrr=nothing
End Function
%>
<a href="gaozcl.asp?rd=8&amp;SessionID=<%=SessionID%>">确定领取</a>

<br/><small>每天登陆社区一次就能领到200<a href='/bbs/public/zfbz.asp?SessionID=<%=SessionID%>'>金币</a>,5点魅力,5点体力<br/>成为vip会员，享有更多特权，<br/>每天可以另外领取vip日薪500<a href='/bbs/public/zfbz.asp?SessionID=<%=SessionID%>'>金币</a>,15点魅力,15点体力</small>
<%
if Cstr(Session("vip1"))<>"" or Session("vip")<>"" or Session("Counter")="pass_numbers_55556666" then
Response.write "<br/>------------<br/>=vip特权=<br/><a href='gaozclvip.asp?rd=8&amp;SessionID=" & SessionID & "'>领vip日薪</a><br/>"
End if
%>
<%
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"%>
<small><% 
dim kkwap,distime
kkwap=""
if Month(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Month(date)&"月"
if Day(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Day(date)
response.write kkwap
Response.write"日("
Response.write right(""&WeekDayName(DatePart("w",Now)),1)
Response.write")"
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%></small>
</p></card></wml>