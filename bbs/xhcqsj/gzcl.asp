<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>

<%
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=9999
iduse=Session("useid")
lasttlls=540
lasttls
jb=request.querystring("jb")
hotid=request.querystring("hotid")
if jb<0 or jb="" or jb>30 or jb=0 then jb=1
if Session("zh")="wap" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?hotid=" &hotid & ""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<card id="hotpk" title="唇枪舌剑-咬好友" ontimer='index1.asp?SessionID=<%=SessionID%>&amp;hotid=<%=hotid %>'><timer value='30'/><p>
<%
set rs9=Server.CreateObject("ADODB.Recordset")
       ssql="select * from scsj where CStr(ids)='" & iduse & "'"
       rs9.open ssql,conn,1,1
if rs9.eof then
  Call Error("你还没有加入游戏！")
end if
if  rs9("hue")<1 then
  Call Error("你的活力已经是0了！正在沉睡当中,不能再攻击别人<br/>你可以叫你的朋友帮你叫醒你!")
end if
  set objgbrsd=Server.CreateObject("ADODB.Recordset")
       ssql="select id,usename,usesex from usereg where CStr(id)='" &hotid & "'"
       objgbrsd.open ssql,conn
if objgbrsd.eof then
  Call Error("错误,该号不存在！")
end if
if objgbrsd("usesex")=1 then
usesex="女"
else
usesex="男"
end if
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from scsj where CStr(ids)='" &hotid& "'"
       rs8.open ssql,conn,1,2
if rs8.recordcount<1 then
rs8.addnew
rs8("ids")=hotid
rs8("name")=objgbrsd("usename")
rs8("sex")=usesex
rs8("zhong")="y"
rs8.update
end if
if  rs8("hue")<1 then
  Call Error("TA的活力已经是0了！正在沉睡当中,不能再攻击别人<br/>你可以帮你的朋友叫醒TA!价格为5000<br/><a href='ckly.asp?SessionID="&SessionID&"&amp;hotid=" &hotid & "'>我要叫醒TA</a>")
 end if
if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?hotid=" &hotid & ""
End if
zuj=rs8("zuj")
lianj=rs8("lianj")
songj=rs8("songj")
fuj=rs8("fuj")
tuj=rs8("tuj")
tuanj=rs8("tuanj")
if rs9("zhong")="y" then huee=4 
if rs9("zhong")="l" then huee=4
if rs9("zhong")="x" then huee=5
if rs8("zhong")="y" then hueee=5
if rs8("zhong")="l" then hueee=6
if rs8("zhong")="x" then hueee=7
if rs9("zhong")="y" then dong="咬一口" 
if rs9("zhong")="l" then dong="抓一抓" 
if rs9("zhong")="x" then dong="捏一把" 
  set objgbrs2=Server.CreateObject("ADODB.Recordset")
       ssql="select id,usejf,usename from usereg where CStr(id)='" & iduse & "'"
       objgbrs2.open ssql,conn
if objgbrs2.eof then
 Call Error("你不是合法用户")
End if
if jb=1 then
if objgbrs2("usejf")<rs8("zuj") then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int(zuj*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &zuj& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",zuj=zuj+100,zu=zu+1,zutime=now  where ids="& hotid)
dong="温柔的"&dong&""
bu="嘴唇"
  end if

if jb=2 then
if objgbrs2("usejf")<rs8("zuj")+100 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((zuj+100)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &zuj+1000& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",zuj=zuj+100,zu=zu+1,zutime=now  where ids="& hotid)
dong="狂热的"&dong&""
bu="嘴唇"
 end if

if jb=3 then
if objgbrs2("usejf")<rs8("zuj")+200 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((zuj+200)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &zuj+2000& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",zuj=zuj+100,zu=zu+1,zutime=now  where ids="& hotid)
dong="凶狠的"&dong&""
bu="嘴唇"
  end if

if jb=4 then
if objgbrs2("usejf")<rs8("zuj")+300 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((zuj+300)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &zuj+300& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",zuj=zuj+100,zu=zu+1,zutime=now  where ids="& hotid)
dong="贪恋的"&dong&""
bu="嘴唇"
  end if

if jb=5 then
if objgbrs2("usejf")<rs8("zuj")+400 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((zuj+4000)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &zuj+400& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",zuj=zuj+100,zu=zu+1,zutime=now  where ids="& hotid)
dong="深情的"&dong&""
bu="嘴唇"
  end if

if jb=6 then
if objgbrs2("usejf")<rs8("lianj") then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int(lianj*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &lianj& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",lianj=lianj+100,lian=lian+1,liantime=now  where ids="& hotid)
dong="温柔的"&dong&""
bu="脸庞"
  end if

if jb=7 then
if objgbrs2("usejf")<rs8("lianj")+100 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((lianj+100)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &lianj+100& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",lianj=lianj+100,lian=lian+1,liantime=now  where ids="& hotid)
dong="狂热的"&dong&""
bu="脸庞"
  end if

if jb=8 then
if objgbrs2("usejf")<rs8("lianj")+200 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((lianj+200)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &lianj+200& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",lianj=lianj+100,lian=lian+1,liantime=now  where ids="& hotid)
dong="凶狠的"&dong&""
bu="脸庞"
  end if

if jb=9 then
if objgbrs2("usejf")<rs8("lianj")+300 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((lianj+3000)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &lianj+300& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",lianj=lianj+100,lian=lian+1,liantime=now  where ids="& hotid)
dong="贪恋的"&dong&""
bu="脸庞"
  end if

if jb=10 then
if objgbrs2("usejf")<rs8("lianj")+400 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((lianj+400)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &lianj+400& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",lianj=lianj+100,lian=lian+1,liantime=now  where ids="& hotid)
dong="深情的"&dong&""
bu="脸庞"
  end if
if jb=11 then
if objgbrs2("usejf")<rs8("songj") then
 Call Error("呵呵！你的金币不够啊！")
end if
jia=int(songj*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &songj& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",songj=songj+100,song=song+1,songtime=now  where ids="& hotid)
dong="温柔的"&dong&""
bu="胸部"
  end if
if jb=12 then
if objgbrs2("usejf")<rs8("songj")+100 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((songj+100)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &songj+100& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",songj=songj+100,song=song+1,songtime=now  where ids="& hotid)
dong="狂热的"&dong&""
bu="胸部"
  end if

if jb=13 then
if objgbrs2("usejf")<rs8("songj")+200 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((songj+200)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &songj+200& " where ids="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",songj=songj+100,song=song+1,songtime=now  where id="& hotid)
dong="凶狠的"&dong&""
bu="胸部"
  end if

if jb=14 then
if objgbrs2("usejf")<rs8("songj")+300 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((songj+300)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &songj+300& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",songj=songj+100,song=song+1,songtime=now  where ids="& hotid)
dong="贪恋的"&dong&""
bu="胸部"
  end if

if jb=15 then
if objgbrs2("usejf")<rs8("songj")+400 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((songj+400)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &songj+400& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",songj=songj+100,song=song+1,songtime=now  where ids="& hotid)
dong="深情的"&dong&""
bu="胸部"
  end if

if jb=16 then
if objgbrs2("usejf")<rs8("fuj") then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int(fuj*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &fuj& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",fuj=fuj+100,fu=fu+1,futime=now  where ids="& hotid)
dong="温柔的"&dong&""
bu="小腹"
  end if

if jb=17 then
if objgbrs2("usejf")<rs8("fuj")+100 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((fuj+100)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &fuj+100& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",fuj=fuj+100,fu=fu+1,futime=now  where ids="& hotid)
dong="狂热的"&dong&""
bu="小腹"
  end if

if jb=18 then
if objgbrs2("usejf")<rs8("fuj")+200 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((fuj+200)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &fuj+200& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",fuj=fuj+100,fu=fu+1,futime=now  where ids="& hotid)
dong="凶狠的"&dong&""
bu="小腹"
  end if


if jb=19 then
if objgbrs2("usejf")<rs8("fuj")+300 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((fuj+300)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &fuj+300& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",fuj=fuj+100,fu=fu+1,futime=now  where ids="& hotid)
dong="贪恋的"&dong&""
bu="小腹"
  end if
if jb=20 then
if objgbrs2("usejf")<rs8("fuj")+400 then
 Call Error("呵呵！你的金币不够啊！")
end if
jia=int((fuj+400)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &fuj+400& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",fuj=fuj+100,fu=fu+1,futime=now  where ids="& hotid)
dong="深情的"&dong&""
bu="小腹"
  end if
if jb=21 then
if objgbrs2("usejf")<rs8("tuj") then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int(tuj*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &tuj& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",tuj=tuj+100,tu=tu+1,tutime=now  where ids="& hotid)
dong="温柔的"&dong&""
bu="大腿"
 end if

if jb=22 then
if objgbrs2("usejf")<rs8("tuj")+100 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((tuj+100)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &tuj+100& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",tuj=tuj+100,tu=tu+1,tutime=now  where ids="& hotid)
dong="狂热的"&dong&""
bu="大腿"
  end if

if jb=23 then
if objgbrs2("usejf")<rs8("tuj")+200 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((tuj+200)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &tuj+200& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",tuj=tuj+100,tu=tu+1,tutime=now  where ids="& hotid)
dong="凶狠的"&dong&""
bu="大腿"
  end if

if jb=24 then
if objgbrs2("usejf")<rs8("tuj")+300 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((tuj+300)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &tuj+300& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",tuj=tuj+100,tu=tu+1,tutime=now  where ids="& hotid)
dong="贪恋的"&dong&""
bu="大腿"
  end if

if jb=25 then
if objgbrs2("usejf")<rs8("tuj")+400 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((tuj+400)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &tuj+400& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",tuj=tuj+100,tu=tu+1,tutime=now  where ids="& hotid)
dong="深情的"&dong&""
bu="大腿"
 end if

if jb=26 then
if objgbrs2("usejf")<rs8("tuanj") then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int(tuanj*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &tuanj& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",tuanj=tuanj+100,tuan=tuan+1,tuantime=now  where ids="& hotid)
dong="温柔的"&dong&""
bu="臀部"
 end if

if jb=27 then
if objgbrs2("usejf")<rs8("tuanj")+100 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((tuanj+100)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &tuanj+100& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",tuanj=tuanj+100,tuan=tuan+1,tuantime=now  where ids="& hotid)
dong="狂热的"&dong&""
bu="臀部"
  end if
if jb=28 then
if objgbrs2("usejf")<rs8("tuanj")+200 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((tuanj+200)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &tuanj+200& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",tuanj=tuanj+100,tuan=tuan+1,tuantime=now  where ids="& hotid)
dong="凶狠的"&dong&""
bu="臀部"
  end if

if jb=29 then
if objgbrs2("usejf")<rs8("tuanj")+300 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((tuanj+300)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &tuanj+300& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",tuanj=tuanj+100,tuan=tuan+1,tuantime=now  where ids="& hotid)
dong="贪恋的"&dong&""
bu="臀部"
  end if

if jb=30 then
if objgbrs2("usejf")<rs8("tuanj")+400 then
 Call Error("呵呵！你的金币不够啊！")
End if
jia=int((tuanj+400)*0.5)
jia=CLng(jia)
conn.Execute("update usereg set usejf=usejf-" &tuanj+400& " where id="& iduse)
conn.Execute("update usereg set usejf=usejf+" &jia& " where id="&hotid)
conn.Execute("update scsj set hue=hue-" &hueee& ",tuanj=tuanj+100,tuan=tuan+1,tuantime=now  where ids="& hotid)
dong="深情的"&dong&""
bu="臀部"
 end if
 
  zname=objgbrs2("usename")
bname=objgbrsd("usename")
conn.Execute("update scsj set hue=hue+" &huee& " where ids="& iduse)
 SQL="insert into sjzk(ids,idss,zname,bname,dong,bu,lasttlls)values("
            SQL=SQL & sqlstr(iduse) & ","
          SQL=SQL & sqlstr(hotid) & ","
          SQL=SQL & sqlstr(zname) & ","
          SQL=SQL & sqlstr(bname) & ","
          SQL=SQL & sqlstr(dong) & ","
          SQL=SQL & sqlstr(bu) & ","
          SQL=SQL & sqlstr(540) & ")"
          Application.Lock
          conn.execute SQL

Response.write "你:"&dong&bname&bu&"<br/>"

objgbrsd.close
set objgbrsd=nothing
objgbrs2.close
Set objgbrs2= Nothing
rs8.close
Set rs8= Nothing
rs9.close
Set rs9= Nothing
set rs10=Server.CreateObject("ADODB.Recordset")
       ssql="select * from scsj where CStr(ids)='" &hotid& "'"
       rs10.open ssql,conn,1,1
if rs10("hue")<1 then
conn.Execute("update scsj set huetime='"&DateAdd("d",1,now)&"',huee='t' where ids="&hotid)
 end if
rs10.close
Set rs10= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/klwll.asp"-->
</p></card></wml>


