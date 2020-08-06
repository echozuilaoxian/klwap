<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#include file="conn.asp"-->
<card id="id" title="发起挑战">
<timer value="2"/>
<p>
<%
dim num,reid,TP
num=Request("num")
TP=Request("TP")
if TP="" or Isnumeric(TP)=false then
call error("操作出错！")
end if
TP=abs(TP)
if TP<>1 and TP<>2 and TP<>3 then
call error("操作出错！")
end if
if num<>""  then
   num=Clng(num)
   end if
   if num>Clng(myjb) or Clng(myjb) < 0 then
   
   call error("你的"&getcent&"不够!")
	End if
        if num<100 or num>10000 then 
   call error("下注不能为空!或者下注不符合要求!!")
	End if

    if num="" then 
   call error("下注不能为空!或者下注不符合要求!")
	End if

  Set objgbrss=Server.CreateObject("ADODB.Recordset")
    sqls="select * from YD_jd"
    objgbrss.open sqls,ydzqconn,1,2
objgbrss.addnew
objgbrss("useid")=myid
objgbrss("reuseid")=0
objgbrss("active")=1
if TP=1 then
objgbrss("about")="J"
objgbrss("about1")="B"
elseif TP=2 then
objgbrss("about")="J"
objgbrss("about1")="C"
elseif TP=3 then
objgbrss("about")="J"
objgbrss("about1")="D"
end if

objgbrss("num")=num
objgbrss.update
response.write "公开挑战书已发送成功!<br/>"
id1=objgbrss("useid")
  set rs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usename from [usereg] where [id]=" & id1 & " order by id desc"
  rs1.open ssql1,conn,1,1
dim talk
talk="" & myni & "公开发起『斗西游』的挑战!"
sql="insert into sjzk(ids,dong,lasttlls)values('"&myid&"','"&talk&"','523')"
  Application.Lock
  conn.execute sql
  Application.Unlock
  objgbrss.close
  set objgbrss=nothing
conn.Execute"update usereg set usejf=usejf- " & (int(num)) & " Where id=" & myid
  
ydzqconn.close
set ydzqconn=nothing
conn.close
set conn=nothing%>
<br/>-------------
<!--#include file="fanhui.asp"-->
</p></card>
</wml>