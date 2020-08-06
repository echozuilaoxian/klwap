<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/CODEUN.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="id" title="接受挑战">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if 
Server.ScriptTimeout=999
iduse=Session("useid")
lasttlls="93"
lasttls
set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from marry1 where reuseid=" & iduse & " and about='J' order by id desc"
  objgbrs.open ssql,conn,1,1
if objgbrs.eof then
response.write "出错了，本次挑战已经结束！<br/>"
Else
'-------------------------------------------------------------------------------------'
    Set objgbrs1=Server.CreateObject("ADODB.Recordset")
    sql="select fying,usename,id from usereg where id=" & iduse
    objgbrs1.open sql,conn,1,1
dim id,num,objgbrss,sqls
id=Request("id")
  Set objgbrss=Server.CreateObject("ADODB.Recordset")
    sqls="select * from marry1 where useid=" & id & " and about='J' and reuseid=" & iduse
    objgbrss.open sqls,conn,1,2 
if objgbrss("about1")="B" then 
objgbrss("open")=1
objgbrss("about")="A"
objgbrss("about2")="B"
objgbrss.update 
num=clng(Request("num"))
  sql="update usereg set usejf=usejf- " & objgbrss("num") & " ,tz=tz-1 Where id=" & id
  conn.Execute(sql)
  sql="update usereg set usejf=usejf+ " & objgbrss("num") & " ,tz=tz+1 Where id=" & iduse
  conn.Execute(sql) 
 response.write "恭喜你，你选择:石头，对方选择剪刀，本次挑战，你赢了" & objgbrss("num") & "枚金币！<br/>" 
            ltlyuan="你向会员:[" & objgbrs1("usename") & "ID:" & objgbrs1("id") & "]发出的『剪刀石头布』挑战,你选择:剪刀，对方选择石头，很不幸，本次挑战你输了" & objgbrss("num") & "枚金币!"
            gftz()
id1=objgbrss("useid")
dim rs1,ssql1
  set rs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usename from [usereg] where [id]=" & id1 & " order by id desc"
  rs1.open ssql1,conn,1,1
dim talk
talk="[" & objgbrs1("usename") & "]赢了与[" & rs1("usename") & "]『剪刀石头布』的挑战!"
talk=untowide(talk)
sql="insert into room1(talk)values("
  sql=sql & sqlstr(talk) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
else
'--------------------------------------------------------------------------------------'
if objgbrss("about1")="C" then
objgbrss("open")=1
objgbrss("about")="A"
objgbrss("about2")="C"
objgbrss.update 
num=clng(Request("num"))  
 response.write "你选择石头，对方也选择了石头，本次挑战以平局结束！<br/>" 
            ltlyuan="你向会员:[" & objgbrs1("usename") & "ID:" & objgbrs1("id") & "]发出的『剪刀石头布』挑战,你选择:石头，对方也选择石头，本次挑战以平局结束！"
            gftz()
id1=objgbrss("useid")
  set rs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usename from [usereg] where [id]=" & id1 & " order by id desc"
  rs1.open ssql1,conn,1,1
talk="[" & objgbrs1("usename") & "]与[" & rs1("usename") & "]『剪刀石头布』的挑战不分秋色!"
talk=untowide(talk)
sql="insert into room1(talk)values("
  sql=sql & sqlstr(talk) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
else
'---------------------------------------------------------------------------------------'
if objgbrss("about1")="D" then
objgbrss("open")=1
objgbrss("about")="A"
objgbrss("about2")="A"
objgbrss.update 
num=clng(Request("num"))
  sql="update usereg set usejf=usejf+ " & objgbrss("num") & " ,tz=tz+1 Where id=" & id
  conn.Execute(sql)
  sql="update usereg set usejf=usejf- " & objgbrss("num") & " ,tz=tz-1 Where id=" & iduse
  conn.Execute(sql)  
 response.write "很不幸，你选择石头，对方选择了布，本次挑战你输了" & objgbrss("num") & "枚金币<br/>" 
            ltlyuan="你向会员:[" & objgbrs1("usename") & "ID:" & objgbrs1("id") & "]发出的『剪刀石头布』挑战,你选择:布，对方选择石头，恭喜你，本次挑战你赢了" & objgbrss("num") & "枚金币!"
            gftz()
id1=objgbrss("useid")
  set rs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usename from [usereg] where [id]=" & id1 & " order by id desc"
  rs1.open ssql1,conn,1,1
talk="[" & rs1("usename") & "]赢了与[" & objgbrs1("usename") & "]『剪刀石头布』的挑战!"
talk=untowide(talk)
sql="insert into room1(talk)values("
  sql=sql & sqlstr(talk) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
'--------------------------------------------------------------------------------------------'
       rs1.close
     set rs1=nothing
    end if
  objgbrss.close
set objgbrss=nothing
 end if
   objgbrs1.close
     set objgbrs1=nothing
      end if
      objgbrs.close
         set objgbrs=nothing
           end if  
%>
-----------<br/>
<a href='index.asp?SessionID=<%=SessionID%>'>[竞技中心]</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>[&#x793E;&#x533A;&#x9996;&#x9875;]</a><br/>
&#x73B0;&#x5728;&#x65F6;&#x95F4;:<%
dim distime
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%><br/>

</p>
</card>
</wml>