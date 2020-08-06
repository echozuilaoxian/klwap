<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<card id="card1" title="社区学校-每天课程"><p>
<% SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID") %>
<%
dim rd,ids
rd=Cstr(request("rd"))
ids=Session("useid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select qs,love,tili,ml,caihua,zhili,xf,xl,id,usejf,nianji from usereg where Cstr(id)='" & ids & "'"
  objgbrs.open ssql,conn
  if objgbrs("xf")<0 then
  Response.write "已经退学了，不用学习了~哈哈！"
  end if
if objgbrs("nianji")=0 then
Response.write "你没有读书,不用上学了!"
end if
if objgbrs("nianji")>0 and objgbrs("xf")>=0 then
sql="Delete FROM gxx WHERE  DATEDIFF('s', time, now()) > 60*60"
conn.Execute sql
Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM gxx where Cstr(useid)='" & ids & "'"
rec.Open SQL,conn
    if not rec.eof then
       msg="看来你很喜欢学习!不过不用这么辛苦,还没有到时候学习!!"
else
          SQL="insert into gxx(useid,topao)values("
          SQL=SQL & sqlstr(ids) & ","
          SQL=SQL & sqlstr(rd) & ")"
          Application.Lock
          conn.execute SQL

'第一级
if objgbrs("nianji")=1 then
sql="update usereg set zhili=zhili+20,caihua=caihua+20,xf=xf+10,qs=qs+20,love=love+20 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加20,才华加20!情商加20,爱心+20,加你10个学分!继续努力!"
end if
if objgbrs("nianji")=2 then
sql="update usereg set zhili=zhili+40,caihua=caihua+40,xf=xf+20,qs=qs+40,love=love+40 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加40,才华加40!情商加40,爱心加40,今天加你学分20!继续努力!"
end if
if objgbrs("nianji")=3 then
sql="update usereg set zhili=zhili+60,caihua=caihua+60,xf=xf+30,qs=qs+60,love=love+60 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加60,才华加60!情商加60,爱心加60,今天加你学分30!继续努力!"
end if
if objgbrs("nianji")=4 then
sql="update usereg set zhili=zhili+80,caihua=caihua+80,xf=xf+40,qs=qs+80,love=love+80 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加80,才华加80!情商加80,爱心加80,今天加你学分40!继续努力!"
end if
if objgbrs("nianji")=5 then
sql="update usereg set zhili=zhili+100,caihua=caihua+100,xf=xf+50,qs=qs+100,love=love+100 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加100,才华加100!情商加100,爱心加100,今天加你学分50!继续努力!"
end if
if objgbrs("nianji")=6 then
sql="update usereg set zhili=zhili+120,caihua=caihua+120,xf=xf+60,qs=qs+120,love=love+120 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加120,才华加120!情商加120,爱心加120,今天加你学分60!继续努力!"
end if
if objgbrs("nianji")=7 then
sql="update usereg set zhili=zhili+140,caihua=caihua+140,xf=xf+70,qs=qs+140,love=love+140 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加140,才华加140!情商加140,爱心加140,今天加你学分70!继续努力!"
end if
if objgbrs("nianji")=8 then
sql="update usereg set zhili=zhili+160,caihua=caihua+160,xf=xf+80,qs=qs+160,love=love+160 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加160,才华加160!情商加160,爱心加160,今天加你学分80!继续努力!"
end if
if objgbrs("nianji")=9 then
sql="update usereg set zhili=zhili+180,caihua=caihua+180,xf=xf+90,qs=qs+180,love=love+180 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加180,才华加180!情商加180,爱心加180,今天加你学分90!继续努力!"
end if
if objgbrs("nianji")=10 then
sql="update usereg set zhili=zhili+200,caihua=caihua+200,xf=xf+100,qs=qs+200,love=love+200 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加200,才华加200!情商加200,爱心加200,今天加你学分100!继续努力!"
end if
if objgbrs("nianji")=11 then
sql="update usereg set zhili=zhili+220,caihua=caihua+220,xf=xf+110,qs=qs+220,love=love+220 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加220,才华加220!情商加220,爱心加220,今天加你学分110!继续努力!"
end if
if objgbrs("nianji")=12 then
sql="update usereg set zhili=zhili+240,caihua=caihua+240,xf=xf+120,qs=qs+240,love=love+240 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加240,才华加240!情商加240,爱心加240,今天加你学分120!继续努力!"
end if
if objgbrs("nianji")=13 then
sql="update usereg set zhili=zhili+260,caihua=caihua+260,xf=xf+130,qs=qs+260,love=love+260 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加260,才华加260!情商加260,爱心加260,今天加你学分130!继续努力!"
end if
if objgbrs("nianji")=14 then
sql="update usereg set zhili=zhili+280,caihua=caihua+280,xf=xf+140,qs=qs+280,love=love+280 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加280,才华加280!情商加280,爱心加280,今天加你学分140!继续努力!"
end if
if objgbrs("nianji")=15 then
sql="update usereg set zhili=zhili+300,caihua=caihua+300,xf=xf+150,qs=qs+300,love=love+300 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加300,才华加300!情商加300,爱心加300,今天加你学分150!继续努力!"
end if
if objgbrs("nianji")=16 then
sql="update usereg set zhili=zhili+320,caihua=caihua+320,xf=xf+160,qs=qs+320,love=love+320 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加320,才华加320!情商加320,爱心加320,今天加你学分160!继续努力!"
end if
if objgbrs("nianji")=17 then
sql="update usereg set zhili=zhili+340,caihua=caihua+340,xf=xf+170,qs=qs+340,love=love+340 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加340,才华加340!情商加340,爱心加340,今天加你学分170!继续努力!"
end if
if objgbrs("nianji")=18 then
sql="update usereg set zhili=zhili+360,caihua=caihua+360,xf=xf+180,qs=qs+360,love=love+360 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天学习完!智力加360,才华加360!情商加360,爱心加360,今天加你学分180!继续努力!"
end if
end if
response.write msg
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function
end if

Response.write "<br/>------------<br/>"
Response.write "<a href='/bbs/school/school.asp?SessionID="&SessionID&"'>返回社区学校</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
conn.close
set rec=nothing
set conn=nothing
%>
