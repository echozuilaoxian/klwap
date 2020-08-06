<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#include file="conn.asp"-->
<card id="id" title="接受挑战">
<p>
<%
dim objgbrs,ssql,ids
ids=request("ids")
if ids="" or Isnumeric(ids)=false then
call error("ID无效！")
end if
set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from YD_jd where id=" & ids & " and about='J' order by id desc"
  objgbrs.open ssql,ydzqconn,1,1
if objgbrs.eof then
response.write "您好,这个挑战已经被结束了,赶快再去<a href=""index.asp?SessionID="&SessionID&""">抢一个</a>来玩吧!<br/>"
Elseif myjb<objgbrs("num") then
response.write "您的"&getcent&"不足,再去<a href=""index.asp?SessionID="&SessionID&""">抢一个小注额挑战</a>来玩吧!<br/>"
else

dim id,objgrss,sqls
id=Request("id")
  Set objgbrss=Server.CreateObject("ADODB.Recordset")
  sqls="select * from YD_jd where id="&ids&" and useid=" & id & " and about='J'"
    objgbrss.open sqls,ydzqconn,1,2 
if objgbrss("about1")="B" then 
objgbrss("op")=1
objgbrss("about")="A"
objgbrss("about2")="B"
objgbrss("reuseid")=myid
objgbrss.update 
num=clng(Request("num"))
payjdcent=(int(objgbrss("num")*paylulu))


  
  sql="update usereg set usejf=usejf+ " & payjdcent & " Where id=" & myid
  conn.Execute(sql)  
    
 response.write "恭喜你，你选择:悟空，对方选择妖怪，本次挑战，你赢了" & objgbrss("num") &getcent&"<br/>" 
            ltlyuan="你向会员:[" & myni & "ID:" & myid & "]发出的『斗西游』公开挑战,你选择:妖怪，对方选择悟空，很不幸，本次挑战你输了" & objgbrss("num") &getcent&"!"

id1=objgbrss("useid")
dim rs1,ssql1
  set rs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usename from [usereg] where [id]=" & id1 & " order by id desc"
  rs1.open ssql1,conn,1,1
dim talk
talk="" & myni & "赢了与" & rs1("usename") & "发出的『斗西游』公开挑战!"
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
objgbrss("reuseid")=myid
objgbrss.update 
num=clng(Request("num"))  
 response.write "你选择悟空，对方也选择了悟空，本次挑战以平局结束！<br/>" 
            ltlyuan="你向会员:[" & myni & "ID:" & myid & "]发出的『斗西游』挑战,你选择:悟空，对方也选择悟空，本次挑战以平局结束！"
  sql="update usereg set usejf=usejf+ " & objgbrss("num") & "  Where id=" & id
  conn.Execute(sql)

id1=objgbrss("useid")
  set rs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usename from [usereg] where [id]=" & id1 & " order by id desc"
  rs1.open ssql1,conn,1,1
talk="[" & myni & "]与[" & rs1("usename") & "]发出的『斗西游』挑战不分秋色!"
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
objgbrss("reuseid")=myid
objgbrss.update 
num=clng(Request("num"))
payjdcent=(int(objgbrss("num")*paylulu))
  sql="update usereg set usejf=usejf+ " & objgbrss("num")+payjdcent & " Where id=" & id
  conn.Execute(sql)

  sql="update usereg set usejf=usejf- " & objgbrss("num") & "  Where id=" & myid
  conn.Execute(sql)  
  
 response.write "很不幸，你选择悟空，对方选择了唐僧，本次挑战你输了" & objgbrss("num") &getcent&"<br/>" 
            ltlyuan="你向会员:[" & myni & "ID:" & myid & "]发出的『斗西游』公开挑战,你选择:唐僧，对方选择悟空，恭喜你，本次挑战你赢了" & objgbrss("num") &getcent&"!"

id1=objgbrss("useid")
  set rs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usename from [usereg] where [id]=" & id1 & " order by id desc"
  rs1.open ssql1,conn,1,1
talk="" & rs1("usename") & "]赢了与[" & myni & "]发出的『斗西游』公开挑战!"
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
gftz
ydzqconn.close
set ydzqconn=nothing
conn.close
set conn=nothing
%>
<br/>-------------
<!--#include file="fanhui.asp"-->
</p></card>
</wml>