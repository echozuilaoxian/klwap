<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjnames.asp"-->
<wml>
<card id="card1" title="购买商品">
<p align="left">购买商品<br/>------------<br/>
<%
if Session("zh")="wap" then
        response.redirect"/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=999
iduse=Session("useid")
wapgywz="购买物品"
wapgydz=Request.ServerVariables("PATH_INFO")
lasttls
did=request("did")
shopid=request("shopid")
if did>=50000 and did<100000 then
fls=5
else
if did>=20000 and did<50000 then
fls=4
else
if did>5000 and did<20000 then
fls=3
else
fls=request("fls")
end if
end if
end if
hk=request("hk")
if hk="" then
dim ars
  set ars=Server.CreateObject("ADODB.Recordset")
  sql="select wpname from shop_bay where wpid=" & did &" and bay_id="&shopid
  ars.open sql,conn
if ars.eof then
response.write "错误,没有该物品<br/>"
else
response.write "购买["&ars("wpname")&"]<br/>数量:<input type='text' name='bbid' title='购买数量' format='*N' maxlength='3' size='6'/><br/><anchor>购 买<go method='post' href='Shop_wpIng.asp?hk=cj&amp;shopid=" & shopid & "&amp;SessionID="&SessionID&"'><postfield name='bbid' value='$(bbid)'/><postfield name='did' value='" & did & "'/><postfield name='fls' value='" & fls & "'/></go></anchor>"
ars.close
set ars=nothing
end if
end if
if hk="cj" then
bbid=trim(request("bbid"))
bbid=clng(request("bbid"))
 if bbid="" or bbid=0 or bbid<1 or left(bbid,1)="-" or len(bbid)>3 then
     response.write "数量必填<br/><a href='Shop_wpIng.asp?shopid=" & shopid & "&amp;fls=" & fls & "&amp;did=" & did & "&amp;SessionID="&SessionID&"'>返回重写</a>"
else
if did="" or shopid="" or fls="" then
  response.write "出错了,遗失重要数据<br/><a href='/bbs/xhjy/shop_hy.asp?SessionID="&SessionID&"'>返回种子公司</a>"
else
if bbid>1 then
     response.write "一次请购买一粒，等播种好了再来吧<br/><a href='Shop_wpIng.asp?shopid=" & shopid & "&amp;fls=" & fls & "&amp;did=" & did & "&amp;SessionID="&SessionID&"'>返回重写</a>"
else
dim drs,wpnames,wpjgs,wpzys,shops,usej,jy,dj,hots,zbdj
  set drs=Server.CreateObject("ADODB.Recordset")
  sql1="select wpname,wpjg,wpid,wpzy,shop_id,jingyan,dengji,wpsl,hots,zbdj from shop_bay where bay_id=" & shopid &" and wpid="& did
  drs.open sql1,conn
if drs("wpsl")<1 then
response.write "错误<br/>"
else
wpnames=drs("wpname")
wpjgs=drs("wpjg")
wpids=drs("wpid")
wpzys=drs("wpzy")
shops=drs("shop_id")
if bbid<100 or shopid>9999 then
usej=int(wpjgs*Clng(bbid))
end if
if bbid>99 and bbid<200 and shopid<10000 then
usej=int(wpjgs*Clng(bbid))*0.8
end if
if bbid>199 and bbid<300 and shopid<10000 then
usej=int(wpjgs*Clng(bbid))*0.7
end if
if bbid>299 and bbid<400 and shopid<10000 then
usej=int(wpjgs*Clng(bbid))*0.6
end if
if bbid>399 and bbid<500 and shopid<10000 then
usej=int(wpjgs*Clng(bbid))*0.5
end if
if bbid>499 and shopid<10000 then
usej=int(wpjgs*Clng(bbid))*0.4
end if
jy=drs("jingyan")
dj=drs("dengji")
hots=drs("hots")
zbdj=drs("zbdj")
dim rs
  set rs=Server.CreateObject("ADODB.Recordset")
  ssql="select usejf,tili from usereg where id=" & iduse &""
  rs.open ssql,conn
if hots=1 and usej>rs("tili") then
response.write "你的金币不足以购买"&bbid&"个装备.<br/><a href='Shop_wpIng.asp?fls=" & fls & "&amp;shopid=" & shopid & "&amp;did=" & did & "&amp;SessionID="&SessionID&"'>返回重写</a>"
else
if usej>rs("usejf") then
response.write "你的金币不足以购买"&bbid&"个.<br/><a href='Shop_wpIng.asp?fls=" & fls & "&amp;shopid=" & shopid & "&amp;did=" & did & "&amp;SessionID="&SessionID&"'>返回重写</a>"
else
rs.close
set rs=nothing
dim objgbrs
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select wpid from my_show where wpid=" & did &" and ids="&iduse
  objgbrs.open ssql,conn
if objgbrs.eof then
 sql="insert into my_show(ids,wpmc,wpid,wpzy,wpjg,wpflid,wpsl,jingyan,dengji,hots,zbdj)values("
sql=sql & sqlstr(iduse) & ","
sql=sql & sqlstr(wpnames) & ","
  sql=sql & sqlstr(wpids) & ","
  sql=sql & sqlstr(wpzys) & ","
  sql=sql & sqlstr(wpjgs) & ","
  sql=sql & sqlstr(fls) & ","
sql=sql & sqlstr(bbid) & ","
sql=sql & sqlstr(jy) & ","
sql=sql & sqlstr(dj) & ","
sql=sql & sqlstr(hots) & ","
sql=sql & sqlstr(zbdj) & ")"
  Application.Lock
  conn.execute sql
if hots=1 then
sql="update usereg set tili=tili-"&usej&" Where id=" & iduse & ""
  conn.execute sql
else
sql="update usereg set usejf=usejf-"&usej&" Where id=" & iduse & ""
  conn.execute sql
end if
sql="update shop_bay set wpsl=wpsl-"&bbid&" Where shop_id=" & shops & " and wpid="&wpids
  conn.execute sql
  Application.Unlock
 response.write "购买物品成功,<a href='/bbs/xhjy/shop_hy.asp?SessionID="&SessionID&"'>点击这里</a>返回种子公司"
else
sql="update my_show set wpsl=wpsl+"&bbid&",hots='"& hots &"' Where ids=" & iduse & " and wpid="&wpids
  Application.Lock
   conn.execute(sql)
if hots=1 then
sql="update usereg set tili=tili-"&usej&" Where id=" & iduse & ""
  conn.execute sql
else
sql="update usereg set usejf=usejf-"&usej&" Where id=" & iduse & ""
  conn.execute sql
end if
sql="update shop_bay set wpsl=wpsl-"&bbid&" Where shop_id=" & shops & " and wpid="&wpids
  conn.execute sql
  Application.Unlock
  response.write "购买物品成功,<a href='/bbs/xhjy/shop_hy.asp?SessionID="&SessionID&"'>点击这里</a>返回种子公司"
drs.close
set drs=nothing
objgbrs.close
set objgbrs=nothing
end if
end if
end if
end if
end if
end if
end if
end if
response.write "<br/><a href='shop_hy.asp?SessionID="&SessionID&"'>返回种子公司</a><br/><a href='/bbs/xhjy/home.asp?SessionID=" & SessionID & "'>返回我的家园</a>"
%>
</p></card></wml>



