<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<wml>
<card id="card1" title="每天工作"><p>
<% SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if%>
<%
dim rd,ids
rd=Cstr(request("rd"))
ids=Session("useid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select gongzuo,zhiye,tianshu,tili,ml,caihua,zhili,xf,xl,id,usejf from usereg where Cstr(id)='" & ids & "'"
  objgbrs.open ssql,conn
 '设置<0的错误
'设置=0时候的错误
if objgbrs("gongzuo")=0 or objgbrs("zhiye")=0 then
msg="你还没有参与这份工作！"
end if

'设置>10错误
if objgbrs("gongzuo")<>2 then
msg="你怎么了,不是在这里工作,乱转什么,你今天不能工作!"
end if
if 10<objgbrs("zhiye")<21 then
sql="Delete FROM gao WHERE  DATEDIFF('s', time, now()) > 720*60"
conn.Execute sql
Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM gao where Cstr(useid)='" & ids & "'"
rec.Open SQL,conn
    if not rec.eof then
       msg="今天您已工作过了，不用太辛苦的!!"
else
          SQL="insert into gao(useid,topao)values("
          SQL=SQL & sqlstr(ids) & ","
          SQL=SQL & sqlstr(rd) & ")"
          Application.Lock
          conn.execute SQL

'第一级
if objgbrs("zhiye")=11 then
sql="update usereg set usejf=usejf+1000,ml=ml+10,zhili=zhili+10,caihua=caihua+10,tili=tili+10,tianshu=tianshu+1 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="你今天任务完成,成功完成任务!获得金币1000,体力加10,魅力加10,智力加10,才华加10!!努力工作吧!"
end if

'2
if objgbrs("zhiye")=12 then
 sql="update usereg set usejf=usejf+2000,ml=ml+20,zhili=zhili+20,caihua=caihua+20,tili=tili+20,tianshu=tianshu+1 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="辛苦你了,今天成功完成任务!获得金币2000,体力加20,魅力加20,智力加20,才华加20!!努力工作吧!"
end if

'3
if objgbrs("zhiye")=13 then
sql="update usereg set usejf=usejf+3000,ml=ml+30,zhili=zhili+30,tianshu=tianshu+1,caihua=caihua+30,tili=tili+30 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
 msg="今天任务完成,成功完成任务!获得金币3000,体力加30,魅力加30,智力加30,才华加30!!努力工作吧!"
end if

'4
if objgbrs("zhiye")=14 then
sql="update usereg set usejf=usejf+4000,ml=ml+40,zhili=zhili+40,tianshu=tianshu+1,caihua=caihua+40,tili=tili+40 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天任务完成,成功完成任务!获得金币4000,体力加40,魅力加40,智力加40,才华加40!!努力工作吧!"
end if

'5
if objgbrs("zhiye")=15 then
sql="update usereg set usejf=usejf+5000,ml=ml+50,zhili=zhili+50,tianshu=tianshu+1,caihua=caihua+50,tili=tili+50 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天任务完成,成功完成任务!获得金币5000,体力加50,魅力加50,智力加50,才华加50!!努力工作吧!"
end if

'6
if objgbrs("zhiye")=16 then
sql="update usereg set usejf=usejf+6000,ml=ml+60,zhili=zhili+60,tianshu=tianshu+1,caihua=caihua+60,tili=tili+60 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天任务完成,成功完成任务!获得金币6000,体力加60,魅力加60,智力加60,才华加60!!努力工作吧!"
end if

'7
if objgbrs("zhiye")=17 then
sql="update usereg set usejf=usejf+7000,ml=ml+70,zhili=zhili+70,caihua=caihua+70,tili=tili+70,tianshu=tianshu+1 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天任务完成,成功完成任务!获得金币7000,体力加40,魅力加40,智力加40,才华加70!!努力工作吧!"
end if

'8
if objgbrs("zhiye")=18 then
sql="update usereg set usejf=usejf+8000,ml=ml+80,zhili=zhili+80,caihua=caihua+80,tili=tili+80,tianshu=tianshu+1 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天任务完成,成功完成任务!获得金币8000,体力加80,魅力加80,智力加80,才华加80!!努力工作吧!"
end if

'9
if objgbrs("zhiye")=19 then
sql="update usereg set usejf=usejf+9000,ml=ml+90,zhili=zhili+90,caihua=caihua+90,tili=tili+90,tianshu=tianshu+1 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天任务完成,成功完成任务!获得金币9000,体力加90,魅力加90,智力加90,才华加90!!努力工作吧!"
end if

'10
if objgbrs("zhiye")=20 then
sql="update usereg set usejf=usejf+10000,ml=ml+100,zhili=zhili+100,caihua=caihua+100,tili=tili+100 where CStr(id)='" & ids & "'"
conn.execute sql
Application.Unlock
msg="今天任务完成,成功完成任务!获得金币10000,体力加100,魅力加100,智力加100,才华加100!!努力工作吧!"
end if
end if
end if
response.write msg
function sqlstr(data)
   sqlstr="'" & Replace(data,"'","'") & "'"
  End function


%>
<br/>-------------<br/>
<%
Response.write "<a href='/bbs/job/ent.asp?SessionID="&SessionID&"'>返回娱乐圈</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
conn.close
set rec=nothing
set conn=nothing
%>