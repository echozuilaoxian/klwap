<!--#INCLUDE VIRTUAL="/md5/inc.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/game/yyl/conn.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/game/yyl/bqzj.asp"-->
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
Response.write "下注<br/>"
  dim memo,hm
id=Session("useid")
Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn
  if objgbrs("usejf")<1000 then
 Error("购买错误！！！<br/>购买要1000金币,您的金币不够,正在返回...<br/><br/><a href='/bbs/game/yyl/index.asp?SessionID=" &SessionID & "'>[摇摇乐]</a><br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>[社区首页]</a>")
  end if
dim objgbr,zjhm
set objgbr=Server.CreateObject("ADODB.Recordset")
ssql="select * from ds where hm='nno'"
  objgbr.open ssql,jjconn,1,1

talk1=RndNumber(1000,2000)
if clng(talk1)=clng(objgbr("ids")) then
 sql="update fuuse set xz=xz+1,zongj=zongj+1 where CStr(ids)='" & id & "'"
jjconn.execute sql
application.unlock
mgs="你在本注摇出的号码是"&talk1&"<br/>恭喜你中奖了本期奖池的奖金是"&objgbr("lzjb")&"<br/>你获得了80%的奖金:"&objgbr("lzjb")*0.8&"金币"
lzjb=objgbr("lzjb")*0.2+80000
usejff=objgbr("lzjb")*0.8-1000
  sql="update usereg set usejf=usejf-" & usejff & " where CStr(id)='" & id & "'"
conn.execute sql
application.unlock
jjconn.Execute("update ds set hm='ok' where id="& objgbr("id") )

idd=objgbr("id")
sqll="insert into dx(ids,hm,ks)values('"&id&"','" &talk1 & "','"&idd&"')"
Application.Lock
  jjconn.execute sqll
  Application.Unlock
talkk="" &Session("ltname") & "]在(url=/bbs/game/yyl/index.asp)『摇摇乐』(/url)"&objgbr("id")&"期中了:"&objgbr("lzjb")*0.8&"金币"
sql="insert into sjzk(ids,dong,lasttlls)values('"&id&"','"&talkk&"','524')"
  Application.Lock
  conn.execute sql
  Application.Unlock
talk=RndNumber(1000,2000)
sql="insert into ds(ids,hm,lzjb,idd,usname)values('"&talk&"','nno','"&lzjb&"','"&id&"','"&Session("ltname")&"')"
  Application.Lock
  jjconn.execute sql
  Application.Unlock
else
mgs="你在本注摇出的号码是"&talk1&"<br/>很遗憾这次你没有中奖，扣除1000金币<br/>"

idd=objgbr("id")
sqll="insert into dx(ids,hm,ks)values('"&id&"','" &talk1 & "','"&idd&"')"
Application.Lock
  jjconn.execute sqll
  Application.Unlock
 sql="update fuuse set xz=xz+1 where CStr(ids)='" & id & "'"
jjconn.execute sql
application.unlock
   sql="update usereg set usejf=usejf-1000 where CStr(id)='" & id & "'"
conn.execute sql
application.unlock
sql="update ds set lzjb=lzjb+1000,ks=ks+1 where CStr(id)='" & idd & "'"
jjconn.execute sql
application.unlock
end if
  objgbr.close
Set objgbr= Nothing
jjconn.close
  set jjconn=nothing
conn.close
  set conn=nothing
 response.write mgs
%>
<!--#INCLUDE VIRTUAL="/bbs/game/game.inc"-->
</p></card></wml>

