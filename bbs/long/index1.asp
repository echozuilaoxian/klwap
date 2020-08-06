<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<card id="hotpk" title="果园空间"><p>
<img src='img/logo.gif' alt=''/><br/>
<%
 if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
    End if
hoid=request("hoid")
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="525"
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



  set objgbrs1=Server.CreateObject("ADODB.Recordset")
       ssql="select id from usereg where CStr(id)='" & iduse & "'"
       objgbrs1.open ssql,conn
name2=objgbrs1("usename")
objgbrs1.close
Set objgbrs1= Nothing
  set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id,usename from usereg where CStr(id)='" &hoid & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误,该号不存在1"
else
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from huakl where CStr(ids)='" & hoid & "'"
      rs8.open ssql,conn,1,1
if rs8.eof then
Response.write "该会员还没有果园"
else

if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=" & objgbrs("id") & "&amp;"
End if
aa=rs8("huafdj")
if aa=0 then aa=1

if  rs8("huaf")/aa=100 then
sql="update huakl set  nongdj=nongdj+1,huafdj=huafdj+1  where CStr(ids)='" & hoid & "'" 				
                conn.execute sql
sql="update usereg set ml=ml+5  where CStr(id)='" & hoid & "'" 				
                conn.execute sql

end if
if rs8("nong")="m" then
Response.write "该会员果园还没有认证<br/>"
else
%>
<%
end if
newyear=DateDiff("n",now,rs8("timed"))
if rs8("huas")=0 then
Response.write "等待浇水<img src='img/seedling.gif' alt=''/>"
end if
if rs8("huas")=1 and rs8("timed")>now() then 
Response.write "<img src='img/plantedseed.gif' alt='发芽'/><br/>"&newyear&"分钟后发芽<br/>"
end if
if rs8("huas")=1 and rs8("timed")<(now) then 
Response.write "<img src='img/seedling.gif' alt='成长'/><br/>发芽:<br/>等待<img src='img/water.gif' alt='.'/>.<img src='img/fertilize.gif' alt='.'/><br/>"
end if
if rs8("huas")=2  and rs8("huax")=0 then 
Response.write "<img src='img/seedling.gif' alt='成长'/><br/>发芽:<br/>等待<img src='img/fertilize.gif' alt='.'/><br/>"
end if
if rs8("huas")=1  and rs8("huax")=1 then 
Response.write "<img src='img/seedling.gif' alt='成长'/><br/>发芽:<br/>等待<img src='img/water.gif' alt='.'/></a><br/>"
end if
if rs8("huas")=2 and rs8("timed")>now() and rs8("huax")=1  then 
Response.write "<img src='img/seedling.gif' alt='成长'/><br/>"&newyear&"分钟后幼苗<br/>"
end if
if rs8("huas")=2 and rs8("timed")<(now)  and rs8("huax")=1 then 
Response.write "<img src='img/bud.gif' alt='成长'/><br/>幼苗:<br/>等待<img src='img/water.gif' alt='.'/>.<img src='img/fertilize.gif' alt='.'/>.<img src='img/b5.gif' alt='.'/><br/>"
end if
if rs8("huas")=3  and rs8("huax")=1   and rs8("huaxx")=0 then 
Response.write "<img src='img/bud.gif' alt='成长'/><br/>幼苗:<br/>等待<img src='img/fertilize.gif' alt='.'/>.<img src='img/b5.gif' alt='.'/><br/>"
end if
if rs8("huas")=3  and rs8("huax")=2   and rs8("huaxx")=0 then 
Response.write "<img src='img/bud.gif' alt='成长'/><br/>幼苗:<br/>等待<img src='img/b5.gif' alt='.'/><br/>"
end if
if rs8("huas")=2  and rs8("huax")=2   and rs8("huaxx")=0 then 
Response.write "<img src='img/bud.gif' alt='成长'/><br/>幼苗:<br/><img src='img/water.gif' alt='.'/>.<img src='img/b5.gif' alt='.'/><br/>"
end if
if rs8("huas")=2  and rs8("huax")=1   and rs8("huaxx")=1 then 
Response.write "<img src='img/bud.gif' alt='成长'/><br/>幼苗:<br/>等待<img src='img/fertilize.gif' alt='.'/>.<img src='img/water.gif' alt='.'/><br/>"
end if
if rs8("huas")=3  and rs8("huax")=1   and rs8("huaxx")=1 then 
Response.write "<img src='img/bud.gif' alt='成长'/><br/>幼苗:<br/><img src='img/fertilize.gif' alt='.'/><br/>"
end if
if rs8("huas")=2  and rs8("huax")=2   and rs8("huaxx")=1 then 
Response.write "<img src='img/bud.gif' alt='成长'/><br/>幼苗:<br/><img src='img/water.gif' alt='.'/>"
end if
if rs8("huas")=3 and rs8("timed")>now()  and rs8("huax")=2   and rs8("huaxx")=1  then 
Response.write "<img src='img/bud.gif' alt='成长'/><br/>"&newyear&"分钟后开花<br/>"
end if
if rs8("huas")=3 and rs8("timed")<(now) and rs8("huax")=2   and rs8("huaxx")=1 then 
Response.write "<img src='img/a3.gif' alt='花蕾'/><br/>开花:<br/>等待<img src='img/water.gif' alt='.'/>.<img src='img/fertilize.gif' alt='.'/>.<img src='img/b5.gif' alt='.'/><br/>"
end if
if rs8("huas")=4  and rs8("huax")=2   and rs8("huaxx")=1 then 
Response.write "<img src='img/a3.gif' alt='花蕾'/><br/>开花:<br/>等待<img src='img/fertilize.gif' alt='.'/>.<img src='img/b5.gif' alt='.'/><br/>"
end if
if rs8("huas")=4  and rs8("huax")=3   and rs8("huaxx")=1 then 
Response.write "<img src='img/a3.gif' alt='花蕾'/><br/>开花:<br/>等待<img src='img/b5.gif' alt='.'/><br/>"
end if
if rs8("huas")=3  and rs8("huax")=3   and rs8("huaxx")=1 then 
Response.write "<img src='img/a3.gif' alt='花蕾'/><br/>开花:<br/>等待<img src='img/water.gif' alt='.'/>.<img src='img/b5.gif' alt='.'/><br/>"
end if
if rs8("huas")=3  and rs8("huax")=2   and rs8("huaxx")=2 then 
Response.write "<img src='img/a3.gif' alt='花蕾'/><br/>开花:<br/>等待<img src='img/fertilize.gif' alt='.'/>.<img src='img/water.gif' alt='.'/><br/>"
end if
if rs8("huas")=4  and rs8("huax")=2   and rs8("huaxx")=2 then 
Response.write "<img src='img/a3.gif' alt='花蕾'/><br/>开花:<br/>等待<img src='img/fertilize.gif' alt='.'/><br/>"
end if
if rs8("huas")=3  and rs8("huax")=3   and rs8("huaxx")=2 then 
Response.write "<img src='img/a3.gif' alt='花蕾'/><br/>开花:<br/>等待<img src='img/water.gif' alt='.'/></a>"
end if
if rs8("huas")=4 and rs8("timed")>now()  and rs8("huax")=3   and rs8("huaxx")=2  then 
Response.write "<img src='img/a3.gif' alt='成熟'/><br/>"&newyear&"分钟后结果成熟收获<br/>"
end if
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=12 then 
Response.write "成熟，等待收获<br/><img src='img/12.gif' alt='成熟'/><br/>"
end if
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=11 then 
Response.write "成熟，等待收获<br/><img src='img/11.gif' alt='成熟'/><br/>"
end if
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=10 then 
Response.write "成熟，等待收获<br/><img src='img/10.gif' alt='成熟'/><br/>"
end if
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=9 then 
Response.write "成熟，等待收获<br/><img src='img/9.gif' alt='成熟'/><br/>"
end if
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=8 then 
Response.write "成熟，等待收获<br/><img src='img/8.gif' alt='成熟'/><br/>"
end if
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=7 then 
Response.write "成熟，等待收获<br/><img src='img/7.gif' alt='成熟'/><br/>"
end if
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=6 then 
Response.write "成熟，等待收获<br/><img src='img/6.gif' alt='成熟'/><br/>"
end if
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=5 then 
Response.write "成熟，等待收获<br/><img src='img/5.gif' alt='成熟'/><br/>"
end if
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=4 then 
Response.write "成熟，等待收获<br/><img src='img/4.gif' alt='成熟'/><br/>"
end if
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=3 then 
Response.write "成熟，等待收获<br/><img src='img/3.gif' alt='成熟'/><br/>"
end if
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=2 then 
Response.write "成熟，等待收获<br/><img src='img/2.gif' alt='成熟'/><br/>"
end if
if rs8("huas")=4 and rs8("timed")<(now) and rs8("huax")=3   and rs8("huaxx")=2  and rs8("hongz")=1 then 
Response.write "成熟，等待收获<br/><img src='img/1.gif' alt='成熟'/><br/>"
end if
if rs8("hongdj")=0 and rs8("hongz")=0 then
Response.write "<img src='img/td.gif' alt='荒地'/><br/>空地还没有播种<br/>"
end if
Response.write "<a href='index.asp?SessionID="&SessionID&"'>开心果园</a>|<a href='xtsd.asp?SessionID="&SessionID&"'>果园商店</a><br/><a href='/bbs/reg/useinfo.asp?id="&objgbrs("id")&"&amp;SessionID="&SessionID&"'>"&objgbrs("usename")&"</a>的果园<br/>果园等级:"
%>
<!--#include file="denj.asp"-->
<%
Response.write "积分:" &rs8("nongdj") & "<br/>"
Response.write "<br/>------------<br/>果园主人共有("&rs8("hong")+rs8("huang")+rs8("zi")+rs8("yi")+rs8("hmu")+rs8("kang")+rs8("man")+rs8("tian")+rs8("zmu")+rs8("qang")+rs8("qian")+rs8("pu")&")粒种子"
Response.write "<br/>------------<br/>果园主人共收获("&rs8("hongs")+rs8("huangs")+rs8("zis")+rs8("yis")+rs8("hmus")+rs8("kangs")+rs8("mans")+rs8("tians")+rs8("zmus")+rs8("qangs")+rs8("qians")+rs8("pus")&")瓜果<br/>------------<br/>"
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
response.write "留言:"
  set objgbrsd=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select top 3 * from hualy where idid="& hoid &"  and kkys<1 order by id desc"
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
response.write "<a href='hualy.Asp?hoid=" & hoid& "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("更多......")&"</a><br/><input name='mmwt' title='留言'  type='text' format='*M'  emptyok='true'  maxlength='50'  value=''/><br/><anchor title='确定'>我要留言<go method='post' href='zhong_lcl.asp?SessionID="&SessionID&"'><postfield name='mmwt' value='$(mmwt)'/><postfield name='hoid' value='"&hoid&"'/></go></anchor>"
response.write "<br/>访客:"
if CStr(hoid)<>CStr(Session("useid")) then
Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM huaf where topao=" &hoid& " and  useid='" &  myid& "' and fname='k'  "
rec.Open SQL,conn
    if not rec.eof then
     sql="update huaf set  times=now()  where topao=" &hoid& " and  useid='" &  myid& "' and fname='k'  "				
                conn.execute sql
else
f="k"
sql="update huakl set huaf=huaf+1  where CStr(ids)='" & hoid & "'" 				
                conn.execute sql
          SQL="insert into huaf(fname,useid,topao)values("
            SQL=SQL & sqlstr(f) & ","
          SQL=SQL & sqlstr(iduse) & ","
              SQL=SQL & sqlstr(hoid) & ")"
          Application.Lock
          conn.execute SQL
end if
end if
dim hd,objgbrsd
  set objgbrsd=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select top 3 fname,useid,id from huaf where topao=" &hoid& "  and fname='k'   order by times desc"
  objgbrsd.open ssql,conn,1,1
if objgbrsd.eof then
   Response.write "最近还没有访客...<br/>"
Else
   do while not objgbrsd.eof
tjhm=objgbrsd("useid")
Response.write "<a href='index1.Asp?hoid=" & objgbrsd("useid") & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti  (redtjname)&"</a>."
	objgbrsd.movenext
	loop
	end if
	objgbrsd.close
	set objgbrsd=nothing
Response.write "<a href='huafk.Asp?hoid=" & hoid& "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("更多")&"</a>"
end if
end if
objgbrs.close
Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/long/klwll.asp"-->
</p></card></wml>