
<!--#include file="../../md5/Inc.asp"-->
<!--#include file="conn.asp"-->
<%
dim paynum,pcent
  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select paynum,pcent from appleadmin where id=1",ydzqconn,1,1
if not rs.eof then
paynum=rs(0)
pcent=rs(1)
end if
rs.close
set rs=nothing
dim ID
ID=request("ID")
if ID="" or Isnumeric(ID)=False then
  Call Error("<card title=""出错""><p>ID无效！")
  end if
appleID=ID
set rs=Server.CreateObject("ADODB.Recordset")
rs.open"select comeover from apple where ID="&ID,ydzqconn,1,1
if rs.eof then
Call Error("<card title=""出错""><p>不存在的记录！")
end if
comeover=rs("comeover")
rs.close
set rs=nothing
if comeover= 1 then
  Call Error("<card title=""出错""><p>本次游戏已经结束！")
end if
set rs=Server.CreateObject("ADODB.Recordset")
  rs.open"select id,pg,mg,xg,mag,sx,jz,sq,yb from myapple where appleid="&appleID-1&" and payusid="&myid,ydzqconn,1,1
if rs.eof then
  Call Error("<card title=""出错""><p>无上局记录！")
end if
  dim Outpaynum,Outpaycent,typeName
   Outpaynum=abs(int((rs("pg")+rs("mg")+rs("xg")+rs("mag")+rs("sx")+rs("jz")+rs("sq")+rs("yb"))))
   Outpaycent=abs(int((rs("pg")+rs("mg")+rs("xg")+rs("mag")+rs("sx")+rs("jz")+rs("sq")+rs("yb"))*pcent))
   
 if myjb<Outpaycent then
 Call Error("您的"&getcent&"不足！")
 end if

set rsp=Server.CreateObject("ADODB.Recordset")
  rsp.open"select  ID from applelist where appleid="&ID&" and payusid="&myid,ydzqconn,1,1
  if not rsp.eof then
  if (rsp.recordcount+Outpaynum) > paynum  then
  Call Error("<card title=""出错""><p>每个会员每局可以下注的次数为"&paynum&"注！")
  end if
  end if
  rsp.close
  set rsp=nothing

  if rs("pg")>0 then
  ydzqconn.execute("update apple Set pg = pg  + "&rs("pg")&" where ID = " & ID)
  
typeName="苹果"
  Call addList(typeName,myni,myid,ID,rs("pg"))
  end if
  if rs("mg")>0 then
  ydzqconn.execute("update apple Set mg = mg  + "&rs("mg")&" where ID = " & ID)
typeName="桔子"
  Call addList(typeName,myni,myid,ID,rs("mg"))
  end if
  if rs("xg")>0 then
  ydzqconn.execute("update apple Set xg = xg  + "&rs("xg")&" where ID = " & ID)
typeName="芒果"
  Call addList(typeName,myni,myid,ID,rs("xg"))
  end if
  if rs("mag")>0 then
  ydzqconn.execute("update apple Set mag = mag  + "&rs("mag")&" where ID = " & ID)
typeName="铃铛"
  Call addList(typeName,myni,myid,ID,rs("mag"))
  end if
  if rs("sx")>0 then
  ydzqconn.execute("update apple Set sx = sx  + "&rs("sx")&" where ID = " & ID)
typeName="西瓜"
  Call addList(typeName,myni,myid,ID,rs("sx"))
  end if
  if rs("jz")>0 then
  ydzqconn.execute("update apple Set jz = jz  + "&rs("jz")&" where ID = " & ID)
typeName="双星"
  Call addList(typeName,myni,myid,ID,rs("jz"))
  end if
  if rs("sq")>0 then
  ydzqconn.execute("update apple Set sq = sq  + "&rs("sq")&" where ID = " & ID)
typeName="双七"
  Call addList(typeName,myni,myid,ID,rs("sq"))
  end if
  if rs("yb")>0 then
  ydzqconn.execute("update apple Set yb = yb  + "&rs("yb")&" where ID = " & ID)
typeName="老王"
  Call addList(typeName,myni,myid,ID,rs("yb"))
  end if

'''ydzqconn.execute("delete from myapple where payusid="&myid&" and appleid<>"&appleID-1&"")
dim rs1
set rs1=Server.CreateObject("ADODB.Recordset")
  rs1.open"select id,pg,mg,xg,mag,sx,jz,sq,yb,appleid,payusid from myapple where appleid="&appleid&" and payusid="&myid&"",ydzqconn,1,2
if rs1.eof then
rs1.addnew
rs1("pg")=rs("pg")
rs1("mg")=rs("mg")
rs1("xg")=rs("xg")
rs1("mag")=rs("mag")
rs1("sx")=rs("sx")
rs1("jz")=rs("jz")
rs1("sq")=rs("sq")
rs1("yb")=rs("yb")
rs1("appleid")=ID
rs1("payusid")=myid
else
rs1("pg")=rs1("pg")+rs("pg")
rs1("mg")=rs1("mg")+rs("mg")
rs1("xg")=rs1("xg")+rs("xg")
rs1("mag")=rs1("mag")+rs("mag")
rs1("sx")=rs1("sx")+rs("sx")
rs1("jz")=rs1("jz")+rs("jz")
rs1("sq")=rs1("sq")+rs("sq")
rs1("yb")=rs1("yb")+rs("yb")
rs1("appleid")=ID
rs1("payusid")=myid
end if 
rs1.update
rs1.close
set rs1=nothing
rs.close
set rs=nothing
response.write "<card title=""我要下注""><p>"
response.write"<a href=""index.asp?SessionID="&SessionID&""">返回投注</a><br/>"
conn.execute("update usereg Set usejf = usejf  - "&Outpaycent&" where ID = " & myID)
Response.write "恭喜，重压上局投注成功！花费了"&Outpaycent&getcent&"！"
conn.close
set conn=nothing
ydzqconn.close
set ydzqconn=nothing
%>
<!--#include file="fanhui.asp"-->
</p></card></wml>