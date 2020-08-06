<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#include file="conn.asp"-->
<card id="id" title="发起挑战">
<timer value="2"/>
<p>
<%
dim num,reid
num=request("num")
id=Request("reid")
	if id="" or Isnumeric(id)=False then 
	call error("ID无效！")
  end if
    if abs(id)=myid then
	call error("自己和自己挑战？免了吧!")
end if
  dim tamyjb
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select id,usejf from usereg where id=" & id &" order by id desc",conn,1,1
  if rs.eof then
  rs.close
  set rs=nothing
  call error("请输入正确的会员ID！")
  end if
  tamyjb=rs("usejf")
  rs.close
  set rs=nothing
  
if num<>"" then
   num=Clng(num)
   if num>Clng(myjb) or Clng(myjb) < 0 then
	call error("你的"&getcent&"不够！")
  end if
     if num>Clng(tamyjb) or Clng(tamyjb) < 0 then
	call error("对方的"&getcent&"不足本次挑战哦！")
  end if
         if num<100 or num>10000 then 
	Response.write "下注不能为空!或者下注不符合要求!<br/>"
        else
        if num="" then 
	Response.write "下注不能为空!或者下注不符合要求!<br/>"
        else 
dim objgbrss1,ssql
  set objgbrss1=Server.CreateObject("ADODB.Recordset")
  ssql="select * from YD_jd where [useid]=" & myid &" and [reuseid]=" & id &" and [about]='J' order by id desc"
  objgbrss1.open ssql,ydzqconn,1,2

	if not objgbrss1.eof then
response.write "出错了，你的挑战书已发送，在对方未回应前，请不要重复操作！<br/>"
		Else
  set rss=Server.CreateObject("ADODB.Recordset")
  ssqll="select * from YD_jd where [reuseid]=" & myid &" and [useid]=" & id & " and [about]='J' and [op]=0 order by id desc"
  rss.open ssqll,ydzqconn,1,2
		if not rss.eof then
response.write "对方已先向你发起挑战，你必须先结束了本次挑战后才能再发送战书。<br/>"
		Else
  Set objgbrss=Server.CreateObject("ADODB.Recordset")
    sqls="select * from YD_jd where useid=" & id & " and about='J' and reuseid=" & myid
    objgbrss.open sqls,ydzqconn,1,2
objgbrss.addnew
objgbrss("useid")=myid
objgbrss("reuseid")=id
objgbrss("about")="J"
objgbrss("about1")="C"
objgbrss("num")=num
objgbrss.update
response.write "挑战书已发送成功!<br/>"
id1=objgbrss("reuseid")
conn.Execute"update usereg set usejf=usejf- " & abs(int(num)) & " Where id=" & myid
  set rs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usename from [usereg] where [id]=" & id1 & " order by id desc"
  rs1.open ssql1,conn,1,1
dim talk
talk="" & myni & "向" & rs1("usename") & "发起『斗西游』的挑战!"
sql="insert into sjzk(ids,dong,lasttlls)values('"&myid&"','"&talk&"','523')"
  Application.Lock
  conn.execute sql
  Application.Unlock
   rs1.close
                      set rs1=nothing
dim newmsgs
newmsgs="会员:[" & myni & "ID:" & myid & "]向您发起『斗西游』挑战,赶快去(url=/bbs/dxy/index.asp?SessionID=)斗西游游戏中心(/url)看看吧!"
'发信
set rs=Server.CreateObject("ADODB.Recordset")
rs.open"select * from guest",conn,1,2
rs.addnew
rs("fnr")=newmsgs
rs("SessionID")=id1
rs("fid")=0
rs.update
rs.close
set rs=nothing
                    objgbrss.close
                  set objgbrss=nothing
	end if
   rss.close
   set rss=nothing
	end if
  
        end if
       end if
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