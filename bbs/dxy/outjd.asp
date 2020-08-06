<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#include file="conn.asp"-->
<card id="id" title="放弃挑战成功">
<p>
<%
set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from YD_jd where reuseid=" & myid & " and about='J' order by id desc"
  objgbrs.open ssql,ydzqconn,1,1
if objgbrs.eof then
response.write "出错了，本次挑战已经结束！<br/>"
Else

id=Request("id")
if id="" or Isnumeric(id)=False then
call error("ID无效！")
end if
  dim tausename
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select id,usename from usereg where id=" & id &" order by id desc",conn,1,1
  if rs.eof then
  rs.close
  set rs=nothing
  call error("不存在的会员ID！")
  end if
  tausename=rs("usename")
  rs.close
  set rs=nothing

  Set objgbrss=Server.CreateObject("ADODB.Recordset")
    sqls="select * from YD_jd where useid=" & id & " and about='J' and reuseid=" & myid
    objgbrss.open sqls,ydzqconn,1,2 
objgbrss("op")=1
objgbrss("about")="A"
objgbrss.update 
 response.write "本次挑战弃权成功，系统已自动发送信息通知对方了!<br/>" 
 
   sql="update usereg set usejf=usejf+ " & objgbrss("num") & "  Where id=" & id
  conn.Execute(sql)


            ltlyuan="你向会员:[" & myni & "ID:" & myid & "]发出的『斗西游』挑战,对方以弃权结束！"
gftz
talk="" & tausename & "发出的『斗西游』挑战," & myni & "弃权!"

sql="insert into sjzk(ids,dong,lasttlls)values('"&myid&"','"&talk&"','523')"
  Application.Lock
  conn.execute sql
  Application.Unlock

objgbrss.close
set objgbrss=nothing
objgbrs.close
set objgbrs=nothing
end if
ydzqconn.close
set ydzqconn=nothing
conn.close
set conn=nothing
%>
<br/>-------------
<!--#include file="fanhui.asp"-->
</p></card>
</wml>