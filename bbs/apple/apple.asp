<!--#include file="../../md5/Inc.asp"-->
<!--#include file="conn.asp"-->
<%
dim id,title,topprice,price,totime,paytype,payName,paycents

dim paynum,pcent
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select paynum,pcent from appleadmin where id=1",ydzqconn,1,1
if not rs.eof then
paynum=rs(0)
pcent=rs(1)
end if
rs.close
set rs=nothing

ID=request("ID")
pn=request("pn")
paytype=request("paytype")
paycent=request("paycent")


if ID="" or Isnumeric(ID)=False then
  Call Error("<card title=""出错""><p>ID无效！")
  end if

if paytype="" or Isnumeric(paytype)=False then
  Call Error("<card title=""出错""><p>选择无效！")
  end if
  
paytype=abs(int(paytype))


if pn="" or IsNumeric(pn)=False then pn=1
pn=abs(int(pn))
  
if paytype<1 or paytype>8 then
  Call Error("<card title=""出错""><p>选择无效！")
  end if

dim typeName
if paytype=1 then
typeName="苹果"
elseif paytype=2 then
typeName="桔子"
elseif paytype=3 then
typeName="芒果"
elseif paytype=4 then
typeName="铃铛"
elseif paytype=5 then
typeName="西瓜"
elseif paytype=6 then
typeName="双星"
elseif paytype=7 then
typeName="双七"
elseif paytype=8 then
typeName="老王"
end if

dim appletime,comeover
set rs=Server.CreateObject("ADODB.Recordset")
rs.open"select comeover,appletime from apple where ID="&ID,ydzqconn,1,1
if rs.eof then
Call Error("<card title=""出错""><p>不存在的记录！")
end if
appletime=rs("appletime")
comeover=rs("comeover")
rs.close
set rs=nothing

if DateDiff("s", Now(), appletime)<=10 then
  Call Error("<card title=""出错""><p>水果机正在转动...不能再下注了！")
end if

if comeover= 1 then
  Call Error("<card title=""出错""><p>本次游戏已经结束！")
end if


response.write "<card title=""我要下注""><p>"


response.write"<a href=""index.asp?SessionID="&SessionID&""">返回投注</a><br/>"





 if myjb<abs(int(pcent*pn)) then
 Call Error("您的"&getcent&"不足！每注需"&pcent&""&getcent&"")
 end if
 
set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select  ID from applelist where appleid="&ID&" and payusid="&myid,ydzqconn,1,1
  if not rs.eof then
  if (rs.recordcount+pn) > paynum  then
  Call Error("每个会员每局可以下注的次数为"&paynum&"注！")
  end if
  end if
rs.close
set rs=nothing
 
 for i=1 to pn
set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select  payname,payusid,paycent,paytime,appleid,paytype from applelist",ydzqconn,1,2
rs.addnew
rs("payname")=myni
rs("payusid")=myid
rs("paycent")=pcent
rs("paytype")=typeName
rs("paytime")=now()
rs("appleid")=ID
rs.update
rs.close
set rs=nothing
next

if paytype=1 then
ydzqconn.execute("update apple Set pg = pg  + "&pn&" where ID = " & ID)
elseif paytype=2 then
ydzqconn.execute("update apple Set mg = mg  + "&pn&" where ID = " & ID)

elseif paytype=3 then
ydzqconn.execute("update apple Set xg= xg  + "&pn&" where ID = " & ID)

elseif paytype=4 then
ydzqconn.execute("update apple Set mag = mag  + "&pn&" where ID = " & ID)

elseif paytype=5 then
ydzqconn.execute("update apple Set sx = sx  + "&pn&" where ID = " & ID)
elseif paytype=6 then
ydzqconn.execute("update apple Set jz = jz  + "&pn&" where ID = " & ID)

elseif paytype=7 then
ydzqconn.execute("update apple Set sq = sq  + "&pn&" where ID = " & ID)

elseif paytype=8 then
ydzqconn.execute("update apple Set yb = yb  + "&pn&" where ID = " & ID)

end if



set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select  * from myapple where appleid="&ID&" and payusid="&myid,ydzqconn,1,2
  if rs.eof then
  rs.addnew
if paytype=1 then
rs("pg")=pn
elseif paytype=2 then
rs("mg")=pn
elseif paytype=3 then
rs("xg")=pn
elseif paytype=4 then
rs("mag")=pn
elseif paytype=5 then
rs("sx")=pn
elseif paytype=6 then
rs("jz")=pn
elseif paytype=7 then
rs("sq")=pn
elseif paytype=8 then
rs("yb")=pn
end if
else
if paytype=1 then
rs("pg")=rs("pg")+pn
elseif paytype=2 then
rs("mg")=rs("mg")+pn
elseif paytype=3 then
rs("xg")=rs("xg")+pn
elseif paytype=4 then
rs("mag")=rs("mag")+pn
elseif paytype=5 then
rs("sx")=rs("sx")+pn
elseif paytype=6 then
rs("jz")=rs("jz")+pn
elseif paytype=7 then
rs("sq")=rs("sq")+pn
elseif paytype=8 then
rs("yb")=rs("yb")+pn
end if
end if
rs("appleid")=ID
rs("payusid")=myid
rs.update
rs.close
set rs=nothing


conn.execute("update usereg Set usejf = usejf  - "&abs(int(pcent*pn))&" where ID = " & myID)
Response.write "恭喜，压"&typeName&"成功！花费了"&abs(int(pcent*pn))&getcent&"！"
set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select pg,mg,xg,mag,sx,jz,sq,yb from myapple where appleid="&ID&" and payusid="&myid,ydzqconn,1,1
pg=rs("pg")
mg=rs("mg")
xg=rs("xg")
mag=rs("mag")
sx=rs("sx")
jz=rs("jz")
sq=rs("sq")
yb=rs("yb")
  if rs.recordcount	> 0 then
  response.write"<br/>本局您已下注"
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
  end if
rs.close
set  rs=nothing

'response.write"<br/><a href=""apple.asp?ID="&ID&"&amp;paytype="&paytype&"&amp;SessionID="&SessionID&"&amp;num="&int(timer())&""">再压此注&gt;&gt;</a>"

Response.write "<br/>你还可以再压<b>"&typeName&"</b>多注:<br/>"
response.write "<anchor>5注"
response.write "<go href=""apple.asp?ID="&ID&"&amp;paytype="&paytype&"&amp;SessionID="&SessionID&"&amp;num="&int(timer())&""" method=""post"" accept-charset=""utf-8"">"
response.write "<postfield name=""pn"" value=""5""/>"
response.write "</go></anchor>,"

response.write "<anchor>10注"
response.write "<go href=""apple.asp?ID="&ID&"&amp;paytype="&paytype&"&amp;SessionID="&SessionID&"&amp;num="&int(timer())&""" method=""post"" accept-charset=""utf-8"">"
response.write "<postfield name=""pn"" value=""10""/>"
response.write "</go></anchor>,"

response.write "<anchor>20注"
response.write "<go href=""apple.asp?ID="&ID&"&amp;paytype="&paytype&"&amp;SessionID="&SessionID&"&amp;num="&int(timer())&""" method=""post"" accept-charset=""utf-8"">"
response.write "<postfield name=""pn"" value=""20""/>"
response.write "</go></anchor>,"

response.write "<anchor>30注"
response.write "<go href=""apple.asp?ID="&ID&"&amp;paytype="&paytype&"&amp;SessionID="&SessionID&"&amp;num="&int(timer())&""" method=""post"" accept-charset=""utf-8"">"
response.write "<postfield name=""pn"" value=""30""/>"
response.write "</go></anchor>"

conn.close
set conn=nothing
ydzqconn.close
set ydzqconn=nothing
%>
<!--#include file="fanhui.asp"-->
</p></card></wml>