<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<card id="hotpk" title="购买种子"><p>
<%
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?m=m"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
hotid=request("hotid")
Server.ScriptTimeout=9999
iduse=Session("useid")
kd=request("kd")
wapgywz="我的果园"
wapgydz=Request.ServerVariables("PATH_INFO")&"?"
lasttlls=525
lasttls
set rs9=Server.CreateObject("ADODB.Recordset")
       ssql="select * from longdate where CStr(id)='" & kd & "'"
       rs9.open ssql,conn,1,1
if rs9.eof then
msg="请尊守社区规章制度,不要乱来"
else
if rs9("so")=0 then
msg="商店暂时没有种子!"
else
  set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id,usejf from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误,该号不存在<br/>"
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
if objgbrs("usejf")<rs9("jia") then
msg="你的金币不够购买,"
else
sql="Delete FROM huaxkl WHERE  CStr(topao)='" & kd & "' and DATEDIFF('s', time, now()) > 60*360"
conn.Execute sql
Set rec=Server.CreateObject("ADODB.Recordset")
SQL="SELECT * FROM huaxkl where CStr(topao)='" & kd & "' and  Cstr(useid)='" &  iduse& "'"
rec.Open SQL,conn
    if not rec.eof then
       msg="六小时内每个人只可以购买一次!!"
else
          SQL="insert into huaxkl(useid,topao)values("
            SQL=SQL & sqlstr(iduse) & ","
          SQL=SQL & sqlstr(kd) & ")"
          Application.Lock
          conn.execute SQL
name1=rs9("name1")
sql="update huakl set " &name1 & "=" & name1 & "+1  where CStr(ids)='" &iduse & "'"
conn.execute sql
Application.Unlock
sql="update usereg set usejf=usejf-" &rs9("jia")& "  where CStr(id)='" &iduse & "'"
conn.execute sql
Application.Unlock
sql="update huadate set so=so-1  where CStr(id)='" & kd & "'"
conn.execute sql
dim talk
talk="" & Session("ltname") & "在(url=/bbs/long/zhong_m.Asp)果园商店(/url)购买了一粒" &rs9("name")& "种子，花费"&rs9("jia")&"金币"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','525','0')"
  Application.Lock
  conn.execute sql
  Application.Unlock
msg="恭喜你成功购买了一个" &rs9("name")& "种子!"
end if
end if
end if
end if
response.write msg
objgbrs.close
Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
rec.close
Set rec= Nothing
rs9.close
Set rs9= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/long/klwll.asp"-->
</p></card></wml>


