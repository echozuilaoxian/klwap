<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.inc"-->
<!--#include file="ubb.inc"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<% 
dim sql1
sql1="delete from room where DATEDIFF('s', times, now()) > cint("& overtime &")*3600"
myc.execute sql1

dim pp
pp=4
%>
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card title="聊吧大厅">
<p align="left">
<img src="/bbs/logo/LIAO8.gif" alt="聊吧大厅"/>
<br/>
<%
iduse=Session("useid")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>你有(" & lycount & ")条新信息</a><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?yxxe=1"
End if%>
<%
Response.write "<a href='lssz.asp?SessionID=" & SessionID & "'>聊天室守则</a><br/>"
%>
</p>
<p align='left'>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")

dim sqlls
sqlls="update ooo set iidd='0' where wap='" & SessionID & "'"
myc.execute sqlls
sqlls="update ooo set idd='0' where wap='" & SessionID & "'"
myc.execute sqlls

dim rs,sql
set rs=server.createobject("ADODB.Recordset")
sql="select * from rom order by id desc"
rs.open sql,myc,1,1

i=1
do while not rs.eof
  Response.write "<a href='room.asp?id=" & rs("idd") & "&amp;SessionID=" & SessionID & "'>" & rs("roomname") & "</a>"

dim rrs,sqqls
  set rrs=Server.CreateObject("ADODB.Recordset")
  sqqls="select id from ooo where iidd=" & rs("idd") & " and DATEDIFF('s', times, now()) < 15*60 order by times desc"
  rrs.open sqqls,myc,1,1

  Response.write "(<a href='zx.asp?id=" & rs("idd") & "&amp;SessionID=" & SessionID & "'>" & rrs.recordcount & "人</a>)<br/>"

rrs.close
set rrs=nothing

i=i+1
rs.movenext
loop
rs.close
set rs=nothing

dim rst,sqls
set rst=server.createobject("ADODB.Recordset")
sqls="select top "&pp&" * from room order by id desc"
rst.open sqls,myc,1,2

if not rst.eof then
dim j
j=1
do while not rst.eof
  Response.write "<br/>[自设]<a href='rooms.asp?id=" & rst("idd") & "&amp;SessionID=" & SessionID & "'>" & rst("roomname") & "</a>"
dim objgbrss,ssqls
  set objgbrss=Server.CreateObject("ADODB.Recordset")
  ssqls="select usename from usereg where id=" & rst("idd")
  objgbrss.open ssqls,conn,1,1
  if not objgbrss.eof then
dim rss,sqll
  set rss=Server.CreateObject("ADODB.Recordset")
  sqll="select id from ooo where idd=" & rst("idd") & " and DATEDIFF('s', times, now()) < 15*60 order by times desc"
  rss.open sqll,myc,1,1

  Response.write "<br/>(房主:" & ubb(objgbrss("usename")) & "/在线:<a href='zxs.asp?id=" & rst("idd") & "&amp;SessionID=" & SessionID & "'>" & rss.recordcount & "人</a>)"

rss.close
set rss=nothing
   end if
objgbrss.close
set objgbrss=nothing
%>
<!--#include file="admin.asp"-->
<%
  
	end if

j=j+1
rst.movenext
loop

  Response.write "<br/><a href='list.asp?SessionID=" & SessionID & "'>更多聊室>></a>"
end if

rst.close
set rst=nothing
%>
<br/>----------<br/>
<%Response.write "<a href='/bbs/reg/myroom.asp?SessionID=" & SessionID & "'>我的积分</a><br/><a href='/bbs/friandbook/myfriendroom.asp?SessionID=" & SessionID & "'>邀请好友</a><br/><a href='set.asp?SessionID=" & SessionID & "'>自建聊室</a><br/><a href='find.asp?SessionID=" & SessionID & "'>搜自建聊室</a><br/>"
if Session("useid")="1" then 
Response.write "<a href='gl.asp?SessionID=" & SessionID & "'>管理员操作</a><br/>"
End if
%>
<%
Response.write "----------<br/>"
Response.write "<a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a><br/>"
%>
<a href="/index.asp?SessionID=<%=SessionID%>">网站首页</a><br/>
<%=String(2-Len(Month(date)),"0") & Month(date) %>&#x6708;<%=String(2-len(Day(date)),"0") & Day(date)%>&#x65E5;<%=String(2-Len(hour(time)),"0") & hour(time) %>:<%=String(2-len(minute(time)),"0") & minute(time)%>
</p></card></wml>