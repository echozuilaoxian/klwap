<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<card id="hotpk" title="唇枪舌剑"><p>
<img src='img/logo.gif' alt='..'/><br/>
<%
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?m=m"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=9999
iduse=Session("useid")
lasttlls=540
lasttls
 set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id,usename,usejf,usesex from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误,该号不存在"
else
if objgbrs("usesex")=1 then
usesex="女"
else
usesex="男"
end if
if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?kd= &amp;"
End if
if objgbrs("usejf")<1000  then 
                 %>
您的金币低于1000，不能进入游戏<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<%
Response.Write "</p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
response.end
end if
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from scsj where CStr(ids)='" & iduse & "'"
       rs8.open ssql,conn,1,2
if rs8.recordcount<1 then
rs8.addnew
rs8("ids")=iduse
rs8("name")=objgbrs("usename")
rs8("sex")=usesex
rs8.update
end if
end if
if Clng(int(DateDiff("h",rs8("zutime"),now)))>6 then
jia=Clng(int(DateDiff("h",rs8("zutime"),now)/6))
conn.Execute("update scsj set zuj=zuj-"&jia&"000,zutime=now  where ids="& iduse)
if  rs8("zuj")<1000 then
conn.Execute("update scsj set zuj=1000  where ids="& iduse)
end if
end if
if Clng(int(DateDiff("h",rs8("liantime"),now)))>6 then
jia=Clng(int(DateDiff("h",rs8("liantime"),now)/6))
conn.Execute("update scsj set lianj=lianj-"&jia&"000,liantime=now  where ids="& iduse)
if  rs8("lianj")<1000 then
conn.Execute("update scsj set lianj=1000  where ids="& iduse)
end if
end if
if Clng(int(DateDiff("h",rs8("songtime"),now)))>6 then
jia=Clng(int(DateDiff("h",rs8("songtime"),now)/6))
conn.Execute("update scsj set songj=songj-"&jia&"000,songtime=now  where ids="& iduse)
if  rs8("songj")<1000 then
conn.Execute("update scsj set songj=1000  where ids="& iduse)
end if
end if
if Clng(int(DateDiff("h",rs8("futime"),now)))>6 then
jia=Clng(int(DateDiff("h",rs8("futime"),now)/6))
conn.Execute("update scsj set fuj=fuj-"&jia&"000,futime=now  where ids="& iduse)
if  rs8("fuj")<1000 then
conn.Execute("update scsj set fuj=1000  where ids="& iduse)
end if
end if
if Clng(int(DateDiff("h",rs8("tutime"),now)))>6 then
jia=Clng(int(DateDiff("h",rs8("tutime"),now)/6))
conn.Execute("update scsj set tuj=tuj-"&jia&"000,tutime=now  where ids="& iduse)
if  rs8("tuj")<1000 then
conn.Execute("update scsj set tuj=1000  where ids="& iduse)
end if
end if
if Clng(int(DateDiff("h",rs8("tuantime"),now)))>6 then
jia=Clng(int(DateDiff("h",rs8("tuantime"),now)/6))
conn.Execute("update scsj set tuanj=tuanj-"&jia&"000,tuantime=now  where ids="& iduse)
if  rs8("tuanj")<1000 then
conn.Execute("update scsj set tuanj=1000  where ids="& iduse)
end if
end if
if  rs8("huee")="t" then
if rs8("huetime")<now then
conn.Execute("update scsj set hue=360,huee='n'  where ids="& iduse)
end if
end if
if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?M="
End if
Response.write "<a href='help.asp?SessionID="&SessionID&"'>游戏简介说明</a><br/>"
if rs8("zhong")="n" then
Response.write "<a href='zhong.asp?SessionID="&SessionID&"'>请先设置你的种族</a><br/>"
else
Response.write "<a href='zd.asp?SessionID="&SessionID&"'>去咬我的好友</a><br/>"
%>
昵称:<%=objgbrs("usename")%><br/>
身份:<!--#include file="1cw.asp"-->
<%
if rs8("sex")="男"  and rs8("zhong")="y" then mgs="<img src='img/y01.gif' alt='..'/><br/>"
if rs8("sex")="男"  and rs8("zhong")="l" then mgs="<img src='img/l01.gif' alt='..'/><br/>"
if rs8("sex")="男"  and rs8("zhong")="x" then mgs="<img src='img/x01.gif' alt='..'/><br/>"
if rs8("sex")="女"  and rs8("zhong")="y" then mgs="<img src='img/y02.gif' alt='..'/><br/>"
if rs8("sex")="女"  and rs8("zhong")="l" then mgs="<img src='img/l02.gif' alt='..'/><br/>"
if rs8("sex")="女"  and rs8("zhong")="x" then mgs="<img src='img/x02.gif' alt='..'/><br/>"
Response.write mgs
 Response.write "活力:"&rs8("hue")&""
Response.write "<br/>被攻击:<br/>嘴唇:("&rs8("zu")&")脸庞:("&rs8("lian")&")胸部:("&rs8("song")&")<br/>小腹("&rs8("fu")&")大腿:("&rs8("tu")&")臀部:("&rs8("tuan")&")"
response.write "<br/>--------------------<br/>留言信息<br/>"
response.write "<br/><input name='mmwt' title='留言'  type='text' format='*M'  emptyok='true'  maxlength='50'  value=''/><br/><anchor title='确定'>我要留言<go method='post' href='lycl.asp?SessionID="&SessionID&"'><postfield name='mmwt' value='$(mmwt)'/><postfield name='hotid' value='"& iduse&"'/></go></anchor><br/>"
  set objgbrsd=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select top 3 * from sjly where idid="& iduse &" order by id desc"
  objgbrsd.open ssql,conn,1,1
if objgbrsd.eof then
   Response.write "最近还没有留言.......<br/>"
Else
   do while not objgbrsd.eof
Response.write ""&converttowidebaiti (objgbrsd("lname"))&":"&converttowidebaiti (objgbrsd("lytxt"))&"<br/>"
	objgbrsd.movenext
	loop
	end if
	objgbrsd.close
	set objgbrsd=nothing

response.write "<a href='scsjly.Asp?hotid=" & iduse& "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("更多")&"</a><br/>========<br/>"
 dim ky,desc
  ky=request.querystring("ky")
if ky="" or ky>2 then ky=1
select case ky
  case 1
  wheretmp="where idss="&  iduse &"  and lasttlls=540 order by id desc "
 case 2
 wheretmp="where ids="&  iduse &" and lasttlls=540 order by id desc "
  end select

 set objgbrsd=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select top 3 * from sjzk "& wheretmp &" "
  objgbrsd.open ssql,conn,1,1
if ky=2 then
Response.write "〓我的战绩〓<a href='index.Asp?SessionID=" & SessionID & "'>"&converttowidebaiti ("伤痕")&"</a>"
if objgbrsd.eof then
   Response.write "<br/>目前还没有战况..."
Else
   do while not objgbrsd.eof
tjhm=objgbrsd("idss")
dim newyear,ttime
newyear=DateDiff("s",objgbrsd("timed"),now)
newyearr=newyear
ttime="秒钟"
if newyearr>59 then
newyear=Clng(int(newyearr/60))
ttime="分钟"
end if
if newyearr>3599 then
newyear=Clng(int(newyearr/3600))
ttime="小时"
end if
if newyearr>86399 then
newyear=Clng(int(newyearr/86400))
ttime="天"
end if
Response.write "<br/>" & newyear &ttime & "前我" & objgbrsd("dong") & "<a href='index1.Asp?hotid=" & objgbrsd("idss") & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(objgbrsd("bname"))&"</a>" & objgbrsd("bu") & "."
	objgbrsd.movenext
	loop
	end if
response.write "<a href='sjzj.Asp?hotid=" & iduse& "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("更多....")&"</a><br/>"
else
Response.write "〓我的伤痕〓<a href='index.Asp?SessionID=" & SessionID & "&amp;ky=2'>"&converttowidebaiti ("战绩")&"</a>"
if objgbrsd.eof then
   Response.write "<br/>目前还没有战况..."
Else
   do while not objgbrsd.eof
tjhm=objgbrsd("idss")
newyear,ttime
newyear=DateDiff("s",objgbrsd("timed"),now)
newyearr=newyear
ttime="秒钟"
if newyearr>59 then
newyear=Clng(int(newyearr/60))
ttime="分钟"
end if
if newyearr>3599 then
newyear=Clng(int(newyearr/3600))
ttime="小时"
end if
if newyearr>86399 then
newyear=Clng(int(newyearr/86400))
ttime="天"
end if
Response.write "<br/>" & newyear &ttime & "前你被<a href='index1.Asp?hotid=" & objgbrsd("ids") & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(objgbrsd("zname"))&"</a>" & objgbrsd("dong") & "" & objgbrsd("bu") & "."
	objgbrsd.movenext
	loop
	end if
response.write "<a href='sjzjs.Asp?hotid=" & iduse& "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("更多....")&"</a><br/>"
	end if
objgbrsd.close
set objgbrsd=nothing
end if
response.write "〓社区战报〓"
 set objgbrsd=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
     ssql="select top 3 * from sjzk where  lasttlls=540 order by id desc "
  objgbrsd.open ssql,conn,1,1
if objgbrsd.eof then
   Response.write "<br/>目前还没有战况..."
Else
   do while not objgbrsd.eof
tjhm=objgbrsd("idss")
newyear=DateDiff("s",objgbrsd("timed"),now)
newyearr=newyear
ttime="秒钟"
if newyearr>59 then
newyear=Clng(int(newyearr/60))
ttime="分钟"
end if
if newyearr>3599 then
newyear=Clng(int(newyearr/3600))
ttime="小时"
end if
if newyearr>86399 then
newyear=Clng(int(newyearr/86400))
ttime="天"
end if
Response.write "<br/>" & newyear & ttime & "前<a href='index1.Asp?hotid=" & objgbrsd("ids") & "&amp;SessionID=" & SessionID & "'>" &converttowidebaiti( objgbrsd("zname") )& "</a>" & objgbrsd("dong") & "<a href='index1.Asp?hotid=" & objgbrsd("idss") & "&amp;SessionID=" & SessionID & "'>" &converttowidebaiti( objgbrsd("bname") )& "</a>" & objgbrsd("bu") & "."
	objgbrsd.movenext
	loop
	end if
response.write "<a href='sjzjc.Asp?hoid=" & iduse& "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti("更多....")&"</a>"
objgbrsd.close
set objgbrsd=nothing
objgbrs.close
Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/klwll.asp"-->
</p></card></wml>
   


