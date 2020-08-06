<!--#include file="../../md5/Inc.asp"-->
<!--#include file="conn.asp"-->
<%
On Error Resume Next
dim applename,hello,paynum,appletimes,paylu
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select applename,hello,paynum,appletimes,paylu,pcent from appleadmin where id=1",ydzqconn,1,1
if not rs.eof then
applename=rs("applename")
hello=rs("hello")
paynum=rs("paynum")
appletimes=rs("appletimes")
paylu=rs("paylu")
pcent=rs("pcent")
end if
rs.close
set rs=nothing%>
<%
response.write "<card title="""&applename&""">"
response.write "<p>"
dim chat
chat=request("chat")
if chat="2"  then
Session("chat")=""
end if

dim appleID
  appleID=0
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select ID,pg,mg,xg,mag,sx,jz,sq,yb,appletime from apple order by id desc",ydzqconn,1,1
if not rs.eof then
appleID=rs(0)
pg=rs(1)
mg=rs(2)
xg=rs(3)
mag=rs(4)
sx=rs(5)
jz=rs(6)
sq=rs(7)
yb=rs(8)
appletime=rs(9)
end if
rs.close
set rs=nothing
response.write"<img src='logo.gif' alt=''/><br/>欢迎您：<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>"&myni&"</a>您有"&myjb&getcent&"!<br/>"&chr(13)
response.write ubb(hello)&"<br/>"
'-----------------------

'取上期记录
 dim appleid2,V_appletext
 appleid2=abs(appleid-1)

 Set rs = Server.CreateObject("ADODB.Recordset")
 rs.open"Select appletext from apple Where  id = "&appleid2&" ORDER BY ID",ydzqconn,1,1

  if not rs.eof then
 V_appletext=rs(0)
 end if
 rs.close
 set rs=nothing

dim m_appletext:m_appletext=left(V_appletext,2)
set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select pg,mg,xg,mag,sx,jz,sq,yb,payusid from myapple where appleid="&appleid2&" order by "&TApple(m_appletext)&" desc",ydzqconn,1,1
payusid=rs("payusid")
pg=rs("pg")
mg=rs("mg")
xg=rs("xg")
mag=rs("mag")
sx=rs("sx")
jz=rs("jz")
sq=rs("sq")
yb=rs("yb")
if not rs.eof then
if TApple(m_appletext)="pg" and rs("pg")>0 then
response.write uname(rs("payusid"))&"压"&m_appletext&rs("pg")&"注,获得"&LuApple(V_appletext)*pcent*rs("pg")&getcent&"<br/>"
elseif TApple(m_appletext)="mg"  and rs("mg")>0 then
response.write uname(rs("payusid"))&"压"&m_appletext&rs("mg")&"注,获得"&LuApple(V_appletext)*pcent*rs("mg")&getcent&"<br/>"
elseif TApple(m_appletext)="xg"  and rs("xg")>0 then
response.write uname(rs("payusid"))&"压"&m_appletext&rs("xg")&"注,获得"&LuApple(V_appletext)*pcent*rs("xg")&getcent&"<br/>"
elseif TApple(m_appletext)="mag"  and rs("mag")>0 then
response.write uname(rs("payusid"))&"压"&m_appletext&rs("mag")&"注,获得"&LuApple(V_appletext)*pcent*rs("mag")&getcent&"<br/>"
elseif TApple(m_appletext)="sx" and rs("sx")>0 then
response.write uname(rs("payusid"))&"压"&m_appletext&rs("sx")&"注,获得"&LuApple(V_appletext)*pcent*rs("sx")&getcent&"<br/>"
elseif TApple(m_appletext)="jz"  and rs("jz")>0 then
response.write uname(rs("payusid"))&"压"&m_appletext&rs("jz")&"注,获得"&LuApple(V_appletext)*pcent*rs("jz")&getcent&"<br/>"
elseif TApple(m_appletext)="sq" and rs("sq")>0 then
response.write uname(rs("payusid"))&"压"&m_appletext&rs("sq")&"注,获得"&LuApple(V_appletext)*pcent*rs("sq")&getcent&"<br/>"
elseif TApple(m_appletext)="yb"  and rs("yb")>0 then
response.write uname(rs("payusid"))&"压"&m_appletext&rs("yb")&"注,获得"&LuApple(V_appletext)*pcent*rs("yb")&getcent&"<br/>"
end if
end if
rs.close
set rs=nothing

response.write "第"&appleID&"期开始下注啦<br/>"


if appletime<=Now() then
  Application.Lock
dim newTimee,appletext
appletext=winApple()
newTimee = DateAdd("n", appletimes, Now())
ydzqconn.execute("update apple set appletext='"&appletext&"',comeover=1 where ID="&appleID)

dim lutype
 lutype=LuApple(appletext)

  call jjapple(appletext,lutype,appleID,paylu) 
  ydzqconn.execute("update applelist set comeover=1 where appleID="&appleID)
ydzqconn.execute("insert into apple(appletime)  values('"&newTimee&"')")
 Application.Unlock
end if
'-----------------------
if DateDiff("s", Now(), appletime)<=10 then
response.write"<img src='zd.gif' alt=''/>水果机正在转动,请稍后...<br/><a href=""index.asp?SessionID="&SessionID&"&amp;num="&int(timer())&"&amp;chat="&chat&""">刷新</a><br/>"
else
response.write date_apple(appletime)&"开奖,各位赶快下注啦!<a href=""index.asp?SessionID="&SessionID&"&amp;num="&int(timer())&"&amp;chat="&chat&""">刷新</a><br/>"
end if
if DateDiff("s", Now(), appletime)>10 then
response.write"<a href=""apple.asp?ID="&appleID&"&amp;paytype=1&amp;SessionID="&SessionID&"&amp;num="&int(timer())&"""><img src='pg.gif' alt=''/></a>"
end if
response.write"苹果×5 ("&pg&"注)<br/>"
if DateDiff("s", Now(), appletime)>10 then
response.write"<a href=""apple.asp?ID="&appleID&"&amp;paytype=2&amp;SessionID="&SessionID&"&amp;num="&int(timer())&"""><img src='jz.gif' alt=''/></a>"
end if
response.write"桔子×10 ("&mg&"注)<br/>"
if DateDiff("s", Now(), appletime)>10 then
response.write"<a href=""apple.asp?ID="&appleID&"&amp;paytype=3&amp;SessionID="&SessionID&"&amp;num="&int(timer())&"""><img src='mg.gif' alt=''/></a>"
end if
response.write"芒果×15 ("&xg&"注)<br/>"
if DateDiff("s", Now(), appletime)>10 then
response.write"<a href=""apple.asp?ID="&appleID&"&amp;paytype=4&amp;SessionID="&SessionID&"&amp;num="&int(timer())&"""><img src='ld.gif' alt=''/></a>"
end if
response.write"铃铛×20 ("&mag&"注)<br/>"
if DateDiff("s", Now(), appletime)>10 then
response.write"<a href=""apple.asp?ID="&appleID&"&amp;paytype=5&amp;SessionID="&SessionID&"&amp;num="&int(timer())&"""><img src='xg.gif' alt=''/></a>"
end if
response.write"西瓜×20 ("&sx&"注)<br/>"
if DateDiff("s", Now(), appletime)>10 then
response.write"<a href=""apple.asp?ID="&appleID&"&amp;paytype=6&amp;SessionID="&SessionID&"&amp;num="&int(timer())&"""><img src='sx.gif' alt=''/></a>"
end if
response.write"双星×30 ("&jz&"注)<br/>"
if DateDiff("s", Now(), appletime)>10 then
response.write"<a href=""apple.asp?ID="&appleID&"&amp;paytype=7&amp;SessionID="&SessionID&"&amp;num="&int(timer())&"""><img src='sq.gif' alt=''/></a>"
end if
response.write"双七×40 ("&sq&"注)<br/>"
if DateDiff("s", Now(), appletime)>10 then
response.write"<a href=""apple.asp?ID="&appleID&"&amp;paytype=8&amp;SessionID="&SessionID&"&amp;num="&int(timer())&"""><img src='lw.gif' alt=''/></a>"
end if
response.write"老王×100 ("&yb&"注)<br/>"
dim Isvote
Isvote=0
set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select pg,mg,xg,mag,sx,jz,sq,yb from myapple where appleid="&appleID&" and payusid="&myid,ydzqconn,1,1
pg=rs("pg")
mg=rs("mg")
xg=rs("xg")
mag=rs("mag")
sx=rs("sx")
jz=rs("jz")
sq=rs("sq")
yb=rs("yb")
  if rs.recordcount	> 0 then
  Isvote=1
  response.write"本局您已下注"
  if rs("pg")>0 then
  response.write",苹果"&rs("pg")&"注"
  end if
  if rs("mg")>0 then
  response.write",桔子"&rs("mg")&"注"
  end if
  if rs("xg")>0 then
  response.write",芒果"&rs("xg")&"注"
  end if
  if rs("mag")>0 then
  response.write",铃铛"&rs("mag")&"注"
  end if
  if rs("sx")>0 then
  response.write",西瓜"&rs("sx")&"注"
  end if
  if rs("jz")>0 then
  response.write",双星"&rs("jz")&"注"
  end if
  if rs("sq")>0 then
  response.write",双七"&rs("sq")&"注"
  end if
  if rs("yb")>0 then
  response.write",老王"&rs("yb")&"注"
  end if
  else
  response.write"本局您还没有下注哦！"
  end if
rs.close
set  rs=nothing
if Isvote=0 then
set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select id from myapple where appleid="&appleID-1&" and payusid="&myid,ydzqconn,1,1
if not rs.eof then
response.write"<br/><a href='appleput.asp?ID="&appleID&"&amp;SessionID="&SessionID&"'>重压上局投注</a>"
end if
rs.close
set rs=nothing
end if
response.write"<br/>--------------<br/>"

 dim rCount:rCount=0
set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select payusid from applelist where appleid="&appleID2&" and winer=1  group by payusid",ydzqconn,1,1
  if not rs.eof then
  rCount=rs.recordcount
  end if 
  rs.close
  set rs=nothing
  dim doapplecount
  doapplecount="0"
  set rs=ydzqconn.execute("Select sum(paycent) as applecount from applelist where winer=1 and appleid="&appleid2)
  if not rs.eof then
  doapplecount=rs("applecount")
  end if
  rs.close
  set rs=nothing
dim lutype2,doapplecounts
 lutype2=LuApple(V_appletext)
 if IsNumeric(doapplecount)=False then doapplecount=0
 doapplecounts=abs(int(doapplecount*lutype2))
response.write"<b>第"&appleid2&"期开"&V_appletext&"</b>"
Response.write "<br/>--------------<br/>"
%>
<!--#INCLUDE VIRTUAL="/bbs/game/dongtai.asp"-->
<%
response.write"<br/><a href=""applemylist.asp?SessionID="&SessionID&""">我的投注</a>."
response.write"<a href=""applelist.asp?SessionID="&SessionID&""">历史查询</a>"
ydzqconn.close
set ydzqconn=nothing
conn.close
set conn=nothing
if Session("useid")="1" then
response.write"<br/><a href=""appleset.asp?SessionID="&SessionID&""">管理员操作</a>"
end if
Response.write "<br/><a href=""applehelp.asp?SessionID="&SessionID&""">规则</a>&gt;<a href=""/bbs/public/gygl.asp?SessionID="&SessionID&""">地盘</a>&gt;<a href=""/bbs/index.asp?SessionID="&SessionID&""">社区首页</a><br/>(c)"&Request.ServerVariables("SERVER_NAME")&"["&String(2-Len(hour(now)),"0") & hour(now) &":"&String(2-len(minute(now)),"0") & minute(now)&"]"
Response.write "</p></card></wml>"
%>