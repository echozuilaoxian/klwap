<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#include file="conn.asp"-->
<card id="id" title="接受挑战">
<p>
<%
dim id
id=Request("id")
if id="" or Isnumeric(id)=false then
call error("ID无效")
end if
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select id from usereg where id=" & id &" order by id desc",conn,1,1
  if rs.eof then
  rs.close
  set rs=nothing
  call error("请输入正确的会员ID！")
  end if
  rs.close
  set rs=nothing
  
set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from YD_jd where reuseid=" & myid & " and about='J' order by id desc"
  objgbrs.open ssql,ydzqconn,1,1
if objgbrs.eof then
response.write "出错了，本次挑战已经结束！<br/>"
Elseif myjb<objgbrs("num") then
response.write "对不起!您的"&getcent&"不足!<br/><a href=""outjd.asp?id="&id&"&amp;SessionID="&SessionID&""">放弃本次挑战</a>!<br/>"
Else

dim objgrss,sqls
  Set objgbrss=Server.CreateObject("ADODB.Recordset")
    sqls="select * from YD_jd where useid=" & id & " and about='J' and reuseid=" & myid
    objgbrss.open sqls,ydzqconn,1,2 
if objgbrss("about1")="B" then 
objgbrss("op")=1
objgbrss("about")="A"
objgbrss("about2")="B"
objgbrss.update 
num=clng(Request("num"))
payjdcent=abs(int(objgbrss("num")*paylulu))
  addlist2(id)

  sql="update usereg set usejf=usejf+ " & payjdcent & "  Where id=" & myid
  conn.Execute(sql)  
    addlist(myid)
 response.write "恭喜你，你选择:悟空，对方选择妖怪，本次挑战，你赢了" & objgbrss("num") & getcent&"<br/>" 
            ltlyuan="你向会员:[" & myni & "ID:" & myid & "]发出的『斗西游』挑战,你选择:妖怪，对方选择悟空，很不幸，本次挑战你输了" & objgbrss("num") & getcent&"!"
gftz

id1=objgbrss("useid")
dim rs1,ssql1
  set rs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usename from [usereg] where [id]=" & id1 & " order by id desc"
  rs1.open ssql1,conn,1,1
dim talk
talk="" & myni & "赢了与" & rs1("usename") & "『斗西游』的挑战!"
sql="insert into sjzk(ids,dong,lasttlls)values('"&myid&"','"&talk&"','523')"
  Application.Lock
  conn.execute sql
  Application.Unlock
else
'--------------------------------------------------------------------------------------'
if objgbrss("about1")="C" then
objgbrss("op")=1
objgbrss("about")="A"
objgbrss("about2")="C"
objgbrss.update 
num=clng(Request("num"))  
 response.write "你选择悟空，对方也选择了悟空，本次挑战以平局结束！<br/>" 
            ltlyuan="你向会员:[" & myni & "ID:" & myid & "]发出的『斗西游』挑战,你选择:悟空，对方也选择悟空，本次挑战以平局结束！"
            
  sql="update usereg set usejf=usejf+ " & objgbrss("num") & "  Where id=" & id
  conn.Execute(sql)

            
gftz

id1=objgbrss("useid")
  set rs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usename from [usereg] where [id]=" & id1 & " order by id desc"
  rs1.open ssql1,conn,1,1
talk="[" & myni & "]与[" & rs1("usename") & "]『斗西游』的挑战不分秋色!"
sql="insert into sjzk(ids,dong,lasttlls)values('"&myid&"','"&talk&"','523')"
  Application.Lock
  conn.execute sql
  Application.Unlock
else
'---------------------------------------------------------------------------------------'
if objgbrss("about1")="D" then
objgbrss("op")=1
objgbrss("about")="A"
objgbrss("about2")="A"
objgbrss.update 
num=clng(Request("num"))
payjdcent=abs(int(objgbrss("num")*paylulu))

  sql="update usereg set usejf=usejf- " & objgbrss("num") & "  Where id=" & myid
  conn.Execute(sql)
  addlist2(myid)
  
  sql="update usereg set usejf=usejf+ " & objgbrss("num")+payjdcent & " Where id=" & id
  conn.Execute(sql)  
    addlist(id)
 response.write "很不幸，你选择悟空，对方选择了唐僧，本次挑战你输了" & objgbrss("num") & getcent&"<br/>" 
            ltlyuan="你向会员:[" & myni & "ID:" & myid & "]发出的『斗西游』挑战,你选择:唐僧，对方选择悟空，恭喜你，本次挑战你赢了" & objgbrss("num") & getcent&"!"
gftz

id1=objgbrss("useid")
  set rs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usename from [usereg] where [id]=" & id1 & " order by id desc"
  rs1.open ssql1,conn,1,1
talk="" & rs1("usename") & "]赢了与[" & myni & "]『斗西游』的挑战!"
sql="insert into sjzk(ids,dong,lasttlls)values('"&myid&"','"&talk&"','523')"
  Application.Lock
  conn.execute sql
  Application.Unlock
'--------------------------------------------------------------------------------------------'
       rs1.close
     set rs1=nothing
    end if
  objgbrss.close
set objgbrss=nothing
 end if
      end if
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