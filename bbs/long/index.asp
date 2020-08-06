<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<card id="hotpk" title="我的果园"><p>
<img src='img/logo.gif' alt=''/><br/>
<%
 if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
    End if

Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="132"
lasttls

if Session("ltlybz")="dfg34fdf_dfg554ghy_3452" then
  Response.write "对不起,您的发信权已被锁，请与管理员联系！</p></card></wml>" 
    response.end
End if
%>
<%

'--------------------
'宠物PK

'结束
'-------------------



  set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误,该号不存在"
else
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from huakl where CStr(ids)='" & iduse & "'"
       rs8.open ssql,conn,1,2
if rs8.recordcount<1 then
rs8.addnew
rs8("ids")=iduse
rs8.update
end if
end if

if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=" & objgbrs("id") & "&amp;"
End if
if rs8("nong")="m" then
Response.write "你的果园还没有认证,<br/>要想玩先要<a href='nong.asp?SessionID="&SessionID&"'>认证果园</a>哦.<br/>"
else
%>

<%
end if
newyear=DateDiff("n",now,rs8("timed"))
if rs8("huas")=0 then mgs="<a href='zhong_y.asp?SessionID="&SessionID&"'>你要给它浇水才会发芽哦</a><br/>"

if rs8("huas")=1 and rs8("timed")>now() then mgs="<img src='img/plantedseed.gif' alt='发芽'/><br/>"&newyear&"分钟后发芽<br/>"
if rs8("huas")=1 and rs8("timed")<(now) then mgs="<img src='img/seedling.gif' alt='成长'/><br/>要使它长成幼苗:<br/>你现在要给它<a href='zhong_y.asp?SessionID="&SessionID&"'><img src='img/water.gif' alt='.'/></a>.<a href='zhong_f.asp?SessionID="&SessionID&"'><img src='img/fertilize.gif' alt='.'/></a><br/>"
if rs8("huas")=2  and rs8("huax")=0 then mgs="<img src='img/seedling.gif' alt='成长'/><br/>要使它长成幼苗:<br/>你现在要给它<a href='zhong_f.asp?SessionID="&SessionID&"'><img src='img/fertilize.gif' alt='.'/></a><br/>"
if rs8("huas")=1  and rs8("huax")=1 then mgs="<img src='img/seedling.gif' alt='成长'/><br/>要使它长成幼苗:<br/>你现在要给它<a href='zhong_y.asp?SessionID="&SessionID&"'><img src='img/water.gif' alt='.'/></a><br/>"

if rs8("huas")=2 and rs8("timed")>now() and rs8("huax")=1  then mgs="<img src='img/seedling.gif' alt='成长'/><br/>"&newyear&"分钟后幼苗<br/>"
if rs8("huas")=2 and rs8("timed")<(now)  and rs8("huax")=1 then mgs="<img src='img/bud.gif' alt='成长'/><br/>成长开花还需给它<br/><a href='zhong_y.asp?SessionID="&SessionID&"'><img src='img/water.gif' alt='.'/></a>.<a href='zhong_f.asp?SessionID="&SessionID&"'><img src='img/fertilize.gif' alt='.'/></a>.<a href='zhong_e.asp?SessionID="&SessionID&"'><img src='img/b5.gif' alt='.'/></a><br/>"

if rs8("huas")=3  and rs8("huax")=1   and rs8("huaxx")=0 then mgs="<img src='img/bud.gif' alt='成长'/><br/>成长开花还需给它<br/><a href='zhong_f.asp?SessionID="&SessionID&"'><img src='img/fertilize.gif' alt='.'/></a>.<a href='zhong_e.asp?SessionID="&SessionID&"'><img src='img/b5.gif' alt='.'/></a><br/>"
if rs8("huas")=3  and rs8("huax")=2   and rs8("huaxx")=0 then mgs="<img src='img/bud.gif' alt='成长'/><br/>成长开花还需给它<br/><a href='zhong_e.asp?SessionID="&SessionID&"'><img src='img/b5.gif' alt='.'/></a><br/>"
if rs8("huas")=2  and rs8("huax")=2   and rs8("huaxx")=0 then mgs="<img src='img/bud.gif' alt='成长'/><br/>成长开花还需给它<br/><a href='zhong_y.asp?SessionID="&SessionID&"'><img src='img/water.gif' alt='.'/></a>.<a href='zhong_e.asp?SessionID="&SessionID&"'><img src='img/b5.gif' alt='.'/></a><br/>"
if rs8("huas")=2  and rs8("huax")=1   and rs8("huaxx")=1 then mgs="<img src='img/bud.gif' alt='成长'/><br/>成长开花还需给它<br/><a href='zhong_f.asp?SessionID="&SessionID&"'><img src='img/fertilize.gif' alt='.'/></a>.<a href='zhong_y.asp?SessionID="&SessionID&"'><img src='img/water.gif' alt='.'/></a><br/>"
if rs8("huas")=3  and rs8("huax")=1   and rs8("huaxx")=1 then mgs="<img src='img/bud.gif' alt='成长'/><br/>成长开花还需给它<br/><a href='zhong_f.asp?SessionID="&SessionID&"'><img src='img/fertilize.gif' alt='.'/></a><br/>"
if rs8("huas")=2  and rs8("huax")=2   and rs8("huaxx")=1 then mgs="<img src='img/bud.gif' alt='成长'/><br/>成长开花还需给它<br/><a href='zhong_y.asp?SessionID="&SessionID&"'><img src='img/water.gif' alt='.'/></a>"


if rs8("huas")=3 and rs8("timed")>now()  and rs8("huax")=2   and rs8("huaxx")=1  then mgs="<img src='img/bud.gif' alt='成长'/><br/>"&newyear&"分钟后开花<br/>"
if rs8("huas")=3 and rs8("timed")<(now) and rs8("huax")=2   and rs8("huaxx")=1 then mgs="<img src='img/a3.gif' alt='花蕾'/><br/>结果成熟还需给它<br/><a href='zhong_y.asp?SessionID="&SessionID&"'><img src='img/water.gif' alt='.'/></a>.<a href='zhong_f.asp?SessionID="&SessionID&"'><img src='img/fertilize.gif' alt='.'/></a>.<a href='zhong_e.asp?SessionID="&SessionID&"'><img src='img/b5.gif' alt='.'/></a><br/>"

if rs8("huas")=4  and rs8("huax")=2   and rs8("huaxx")=1 then mgs="<img src='img/a3.gif' alt='花蕾'/><br/>结果成熟还需给它<br/><a href='zhong_f.asp?SessionID="&SessionID&"'><img src='img/fertilize.gif' alt='.'/></a>.<a href='zhong_e.asp?SessionID="&SessionID&"'><img src='img/b5.gif' alt='.'/></a><br/>"
if rs8("huas")=4  and rs8("huax")=3   and rs8("huaxx")=1 then mgs="<img src='img/a3.gif' alt='花蕾'/><br/>结果成熟还需给它<br/><a href='zhong_e.asp?SessionID="&SessionID&"'><img src='img/b5.gif' alt='.'/></a><br/>"
if rs8("huas")=3  and rs8("huax")=3   and rs8("huaxx")=1 then mgs="<img src='img/a3.gif' alt='花蕾'/><br/>结果成熟还需给它<br/><a href='zhong_y.asp?SessionID="&SessionID&"'><img src='img/water.gif' alt='.'/></a>.<a href='zhong_e.asp?SessionID="&SessionID&"'><img src='img/b5.gif' alt='.'/></a><br/>"
if rs8("huas")=3  and rs8("huax")=2   and rs8("huaxx")=2 then mgs="<img src='img/a3.gif' alt='花蕾'/><br/>结果成熟还需给它<br/><a href='zhong_f.asp?SessionID="&SessionID&"'><img src='img/fertilize.gif' alt='.'/></a>.<a href='zhong_y.asp?SessionID="&SessionID&"'><img src='img/water.gif' alt='.'/></a><br/>"
if rs8("huas")=4  and rs8("huax")=2   and rs8("huaxx")=2 then mgs="<img src='img/a3.gif' alt='花蕾'/><br/>结果成熟还需给它<br/><a href='zhong_f.asp?SessionID="&SessionID&"'><img src='img/fertilize.gif' alt='.'/></a><br/>"
if rs8("huas")=3  and rs8("huax")=3   and rs8("huaxx")=2 then mgs="<img src='img/a3.gif' alt='花蕾'/><br/>结果成熟还需给它<br/><a href='zhong_y.asp?SessionID="&SessionID&"'><img src='img/water.gif' alt='.'/></a>"

if rs8("huas")=4 and rs8("timed")>now()  and rs8("huax")=3   and rs8("huaxx")=2  then mgs="<img src='img/a3.gif' alt='成熟'/><br/>"&newyear&"分钟后结果成熟收获<br/>"
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=12 then mgs="<img src='img/12.gif' alt='成熟'/><br/>经过你的精心照料后,终于成熟了!<br/><a href='zhong_ok.asp?SessionID="&SessionID&"'>我要收获</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=11 then mgs="<img src='img/11.gif' alt='成熟'/><br/>经过你的精心照料后,终于成熟了!<br/><a href='zhong_ok.asp?SessionID="&SessionID&"'>我要收获</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=10 then mgs="<img src='img/10.gif' alt='成熟'/><br/>经过你的精心照料后,终于成熟了!<br/><a href='zhong_ok.asp?SessionID="&SessionID&"'>我要收获</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=9 then mgs="<img src='img/9.gif' alt='成熟'/><br/>经过你的精心照料后,终于成熟了!<br/><a href='zhong_ok.asp?SessionID="&SessionID&"'>我要收获</a><br/>"
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=8 then mgs="<img src='img/8.gif' alt='成熟'/><br/>经过你的精心照料后,终于成熟了!<br/><a href='zhong_ok.asp?SessionID="&SessionID&"'>我要收获</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=7 then mgs="<img src='img/7.gif' alt='成熟'/><br/>经过你的精心照料后,终于成熟了!<br/><a href='zhong_ok.asp?SessionID="&SessionID&"'>我要收获</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=6 then mgs="<img src='img/6.gif' alt='成熟'/><br/>经过你的精心照料后,终于成熟了!<br/><a href='zhong_ok.asp?SessionID="&SessionID&"'>我要收获</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=5 then mgs="<img src='img/5.gif' alt='成熟'/><br/>经过你的精心照料后,终于成熟了!<br/><a href='zhong_ok.asp?SessionID="&SessionID&"'>我要收获</a><br/>"
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=4 then mgs="<img src='img/4.gif' alt='成熟'/><br/>经过你的精心照料后,终于成熟了!<br/><a href='zhong_ok.asp?SessionID="&SessionID&"'>我要收获</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=3 then mgs="<img src='img/3.gif' alt='成熟'/><br/>经过你的精心照料后,终于成熟了!<br/><a href='zhong_ok.asp?SessionID="&SessionID&"'>我要收获</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=2 then mgs="<img src='img/2.gif' alt='成熟'/><br/>经过你的精心照料后,终于成熟了!<br/><a href='zhong_ok.asp?SessionID="&SessionID&"'>我要收获</a><br/>"

if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=1 then mgs="<img src='img/1.gif' alt='成熟'/><br/>经过你的精心照料后,终于成熟了!<br/><a href='zhong_ok.asp?SessionID="&SessionID&"'>我要收获</a><br/>"
if rs8("hongdj")=0 and rs8("hongz")=0 then
Response.write "<img src='img/td.gif' alt='荒地'/><img src='img/seed.gif' alt=''/><br/>空地还没有播种<br/>"
end if
if rs8("hongdj")=0 and rs8("hongz")>0 then
Response.write "<img src='img/seed.gif' alt='.'/><br/>"
Response.write mgs
end if
if rs8("hongdj")=1then
Response.write mgs
end if
if rs8("hongdj")=2 then
Response.write mgs
end if
if rs8("hongdj")=3 then
Response.write mgs
end if
if rs8("hongdj")=4 then
Response.write mgs
end if
Response.write "<a href='xtsd.asp?SessionID="&SessionID&"'>商店</a>|<a href='zhong_m.asp?SessionID="&SessionID&"'>种子</a>|<a href='zhong.asp?SessionID="&SessionID&"'>播种</a><br/>果园等级:"
%>
<!--#include file="denj.asp"-->
<%
Response.write "积分:" &rs8("nongdj") & "<br/>------------<br/>你共有<a href='zhong.asp?SessionID="&SessionID&"'>("&rs8("hong")+rs8("huang")+rs8("zi")+rs8("yi")+rs8("hmu")+rs8("kang")+rs8("man")+rs8("tian")+rs8("zmu")+rs8("qang")+rs8("qian")+rs8("pu")&")</a>粒种子"
Response.write "<br/>------------<br/>你共收获("&rs8("hongs")+rs8("huangs")+rs8("zis")+rs8("yis")+rs8("hmus")+rs8("kangs")+rs8("mans")+rs8("tians")+rs8("zmus")+rs8("qangs")+rs8("qians")+rs8("pus")&")瓜果<br/>------------<br/>"
response.write "<img src='img/1.gif' alt='.'/>桃子:"&rs8("hongs")&""
response.write "<img src='img/2.gif' alt='.'/>雪梨:"&rs8("hmus")&""
response.write "<img src='img/3.gif' alt='.'/>樱桃:"&rs8("huangs")&"<br/>"
response.write "<img src='img/4.gif' alt='.'/>杨梅:"&rs8("kangs")&"<img src='img/5.gif' alt='.'/>芒果:"&rs8("mans")&""
response.write "<img src='img/6.gif' alt='.'/>草莓:"&rs8("zis")&"<br/>"
response.write "<img src='img/7.gif' alt='.'/>香蕉:"&rs8("tians")&""
response.write "<img src='img/8.gif' alt='.'/>菠萝:"&rs8("zmus")&"<img src='img/9.gif' alt='.'/>西瓜:"&rs8("yis")&"<br/>"
response.write "<img src='img/10.gif' alt='.'/>橙子:"&rs8("qangs")&""
response.write "<img src='img/11.gif' alt='.'/>苹果:"&rs8("qians")&""
response.write "<img src='img/12.gif' alt='.'/>葡萄:"&rs8("pus")&"<br/>"
response.write "<br/>留言:"
  set objgbrsd=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select top 3 * from hualy where idid="& iduse &" and kkys<1 order by id desc"
  objgbrsd.open ssql,conn,1,1
if objgbrsd.eof then
   Response.write "最近还没有留言...<br/>"
Else
   do while not objgbrsd.eof
Response.write ""&converttowidebaiti (objgbrsd("lname"))&":"&converttowidebaiti (objgbrsd("lytxt"))&"<br/>"
	objgbrsd.movenext
	loop
	end if
	objgbrsd.close
	set objgbrsd=nothing

Response.write "<a href='hualy.Asp?hoid=" & iduse& "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("更多......")&"</a>"

response.write "<br/>访客:"
dim hd,objgbrsd
hd="t"
  set objgbrsd=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select top 3 fname,useid,id from huaf where topao="&  iduse &" order by id desc"
  objgbrsd.open ssql,conn,1,1
if objgbrsd.eof then
   Response.write "最近还没有访客......<br/>"
Else
   do while not objgbrsd.eof
Response.write "<a href='index1.Asp?hoid=" & objgbrsd("useid") & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti (objgbrsd("fname"))&"</a>."
	objgbrsd.movenext
	loop
	end if
	objgbrsd.close
	set objgbrsd=nothing




objgbrs.close
Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
response.write "<a href='huafk.Asp?hoid=" & iduse& "&amp;SessionID=" & SessionID&"'>"&converttowidebaiti("更多....")&"</a><br/>输入ID:<input name='mmwt' title=''  type='text' format='*M'  emptyok='true'  maxlength='50'  value=''/><br/><anchor title=''>去他(她)的果园看看<go method='post' href='index1.asp?SessionID="&SessionID&"'><postfield name='hoid' value='$(mmwt)'/></go></anchor><br/>------------"
%>
<!--#INCLUDE VIRTUAL="/bbs/long/klwll.asp"-->
</p></card></wml>

   


