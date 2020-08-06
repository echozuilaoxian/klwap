<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="id" title="发起挑战">
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
dim num,reid
num=request("num")
id=Request("reid")
	if id="" then 
	Response.write "ID号不能为空!!"
        Response.write "<br/><a href='tz.asp?SessionID=" & SessionID & "'>返回上一级</a><br/></p></card></wml>"
	Response.end
	End if
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut =999
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
if num<>"" then
   num=Clng(num)
   if num>Clng(objgbrs("usejf")) or Clng(objgbrs("usejf")) < 0 then
	Response.write "对不起，你的币币不足!"
        Response.write "<br/><a href='tz.asp?SessionID=" & SessionID & "'>返回上一级</a><br/></p></card></wml>"
        objgbrs.close
        conn.close
	set objgbrs=nothing
	Set conn = Nothing
        response.end
	End if
         if num<1 or num>1000000 then 
	Response.write "下注不能为空!或者下注超额!<br/>"
        else
        if num="" then 
	Response.write "下注不能为空!或者下注超额!<br/>"
        else 
dim objgbrss1,ssql
  set objgbrss1=Server.CreateObject("ADODB.Recordset")
  ssql="select * from marry1 where [useid]=" & iduse &" and [reuseid]=" & id &" and [about]='J' order by id desc"
  objgbrss1.open ssql,conn,1,2

	if not objgbrss1.eof then
response.write "出错了，你的挑战书已发送，在对方未回应前，请不要重复操作！<br/>"
		Else
  set rss=Server.CreateObject("ADODB.Recordset")
  ssqll="select * from marry1 where [reuseid]=" & iduse &" and [useid]=" & id & " and [about]='J' and [open]=0 order by id desc"
  rss.open ssqll,conn,1,2
		if not rss.eof then
response.write "对方已先向你发起挑战，你必须先结束了本次挑战后才能再发送战书。<br/>"
		Else
 Set objgbrrs=Server.CreateObject("ADODB.Recordset")
    sqls="select * from usereg where id=" & iduse
    objgbrrs.open sqls,conn
  Set objgbrss=Server.CreateObject("ADODB.Recordset")
    sqls="select * from marry1 where useid=" & id & " and about='J' and reuseid=" & iduse
    objgbrss.open sqls,conn,1,2
objgbrss.addnew
objgbrss("useid")=iduse
objgbrss("reuseid")=id
objgbrss("about")="J"
objgbrss("about1")="D"
objgbrss("num")=num
objgbrss.update
response.write "挑战书已发送成功!<br/>"
id1=objgbrss("reuseid")
  set rs1=Server.CreateObject("ADODB.Recordset")
  ssql1="select usename from [usereg] where [id]=" & id1 & " order by id desc"
  rs1.open ssql1,conn,1,1
dim talk
talk="[" & objgbrrs("usename") & "]向[" & rs1("usename") & "]发起『剪刀石头布』的挑战。"
talk=untowide(talk)
sql="insert into room1(talk)values("
  sql=sql & sqlstr(talk) & ")"
  Application.Lock
  conn.execute sql
  Application.Unlock
   rs1.close
                      set rs1=nothing
                    objgbrss.close
                  set objgbrss=nothing
                objgbrrs.close
              set objgbrrs=nothing
	end if
   rss.close
   set rss=nothing
	end if
  
              objgbrss1.close
             set objgbrss1=nothing
        end if
       end if
     end if
%>
-----------<br/>
<a href='index.asp?SessionID=<%=SessionID%>'>[竞技中心]</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>[社区首页]</a><br/>
&#x73B0;&#x5728;&#x65F6;&#x95F4;:<%
dim distime
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%><br/>
<%
conn.close
set conn=nothing
%>
</p>
</card>
</wml>
