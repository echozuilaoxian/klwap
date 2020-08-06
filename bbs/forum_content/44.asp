<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
if Session("bzbz")<>"" or Session("yxxezb")<>"" or Session("yxxexc")<>"" or Session("Counter")="pass_numbers_55556666" then
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
dim id,ltlyuan,ltlyuans
iduse=Session("useid")
zbs=request("zbs")
jjyt=request("jjyt")
 zbs=Clng(zbs)
ForumID=request("ForumID")
gfdsa=request("gfdsa")
id=request("id")

set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing

 if zbs="" then
     response.write "<card id='card1' title='基金操作'><p><br/>金币不能为空！<br/>-----------<br/><a href='4.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回重写</a><br/><a href='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回论坛基金</a><br/><a href='/BBS/Forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回"&dlname&"</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
if jjyt="" then
     response.write "<card id='card1' title='基金操作'><p><br/>用途不能为空！<br/>-----------<br/><a href='4.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回重写</a><br/><a href='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回论坛基金</a><br/><a href='/BBS/Forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回"&dlname&"</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
if ForumID="" or gfdsa="" then
     response.write "<card id='card1' title='基金操作'><p><br/>系统不能识别你的身份，请返回重填。<br/><br/>-----------<br/><a href='4.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回重写</a><br/><a href='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回论坛基金</a><br/><a href='/BBS/Forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回"&dlname&"</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  End if
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select num from sn_dat where CStr(des)='" & ForumID & "'"
    objgbrs.open sql,conn
if objgbrs("num")<zbs then
     response.write "<card id='card1' title='基金操作'><p>论坛基金没有这么多。<br/>-----------<br/><a href='4.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回重写</a><br/><a href='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回论坛基金</a><br/><a href='/BBS/Forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回"&dlname&"</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if
ltlyuans="从" & dlname & "取款"&Cstr(zbs)&"金币,用于:"&jjyt&",接款方ID:"&id
 sql="insert into jfpost2(ids,reids,naiyo)values("
  sql=sql & sqlstr(iduse) & ","
  sql=sql & sqlstr(ForumID) & ","
  sql=sql & sqlstr(ltlyuans) & ")"
  Application.Lock
  conn.execute sql
sql="update jzbl set hfcontd=hfcontd-" & zbs & " Where CStr(itid)='" & ForumID & "'"
  conn.Execute(sql)
            sql="update usereg set usejf=usejf+" & zbs & " Where CStr(id)='" & id & "'"
            Application.Lock
            conn.execute(sql)
            sql="update sn_dat set num=num-" & zbs & " Where CStr(des)='" & ForumID & "'"
  conn.execute sql
  Application.Unlock
  ltlyuan="恭喜！" & dlname & "版主[b][u]" & gfdsa & "ID:" & iduse & "[/u][/b]从" & dlname & "奖励你" & zbs & "金币,这是系统信息,请勿回复以及转发!"
            gftz()
  conn.close
  set objgbrs=nothing
  set conn=nothing
 response.write "<card id='card1' title='基金操作' ontimer='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'><timer value='10'/><p align='left'>操作成功，已经发信息通知该用户...<br/>----------<br/><a href='1.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回论坛基金</a><br/><a href='/BBS/Forum_content/Contentlist.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回"&dlname&"</a><br/><a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
end if
%>



