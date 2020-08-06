<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="UTF-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% 
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
  dim show,objgbrs,itid
itid=request("itid")
if itid="" then itid=1
lasttlss=itid
lasttlls=itid
lasttls

set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from jzbl where id="&itid
rse.open rspple,conn,1,2
if rse.eof then
bkmc="无此帮派"
else
bkmc=converttowidebaiti(rse("biaoti"))
end if
rse.close
Set rse= Nothing

  show=request("show")
  if show="" then
     show=0
  end if

  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select top 13 * from room Where CStr(baoch)='" & itid &"' order by id desc"
  objgbrs.open ssql,conn,1,3
Response.write "<card id='card1' title='" & bkmc & "聊室' ontimer='chatroom.asp?itid="&itid&"&amp;t=" & time() & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "'><timer value='380'/><p>"
%>
<do type="accept" label="发言">
   <go href='talk.asp?itid=<% =itid %>&amp;show=<% =show %>&amp;SessionID=<%=SessionID%>'>
   </go>
</do>
<%
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息！</a><br/>"
    Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?show=" & show & ""
End if
    Response.write "<a href='talk.asp?itid=" & itid & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "'>发言</a>"
    Response.write "|<a href='chatroom.asp?itid=" & itid & "&amp;t=" & time() & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "'>刷新</a>"
    RecordCounts=RecordCount
    response.write "|<a href='/bbs/reg/ckzxhyany.asp?lasttlss=" & lasttlss & "&amp;itid=" & itid & "&amp;show=" & show & "&amp;page=" & Request.ServerVariables("PATH_INFO") & "&amp;SessionID=" & SessionID & "'>在线(" & RecordCounts & ")</a>"
    Response.write "<br/>--------<br/>"
if objgbrs.eof then
   Response.write "欢迎进入" & bkmc & "聊室！<br/>"
else
 Do while not objgbrs.eof
   if objgbrs("forname")="大家" then
     Response.write "<a href='/bbs/chatroom/talk1.asp?itid=" &itid& "&amp;show=0&amp;ids=" & converttowide(objgbrs("useid")) & "&amp;SessionID=" & SessionID & "'>" & converttowide(objgbrs("usename")) & "</a>:"
    else
     Response.write "<a href='/bbs/chatroom/talk1.asp?itid=" &itid& "&amp;show=0&amp;ids=" & converttowide(objgbrs("useid")) & "&amp;SessionID=" & SessionID & "'>" & converttowide(objgbrs("usename")) & "</a>对>" & converttowide(objgbrs("forname")) & "说:"
   end if
Response.write converttowide(chUBBCodes(objgbrs("talk"))) & "(" & objgbrs("times") & ")<br/>"
objgbrs.Movenext
Loop
end if
set objgbrs=nothing
sql="Delete FROM room WHERE DATEDIFF('s', date, now()) > 300*60"
conn.Execute sql
	conn.close
	set objgbrs=nothing
	Set conn = Nothing
Response.write "----------<br/>"
    Response.write "<a href='talk.asp?itid=" & itid & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "'>发言</a>"
    Response.write "|<a href='chatroom.asp?itid=" & itid & "&amp;t=" & time() & "&amp;show=" & show & "&amp;SessionID=" & SessionID & "'>刷新</a>"
    response.write "|<a href='/bbs/reg/ckzxhyany.asp?itid=" & itid & "&amp;show=" & show & "&amp;lasttlss=" & lasttlss & "&amp;page=" & Request.ServerVariables("PATH_INFO") & "&amp;SessionID=" & SessionID & "'>在线</a>"
if show=1 then
response.write "<br/><a href='chatroom.asp?itid=" & itid & "&amp;show=0&amp;SessionID=" & SessionID & "'>没有图片版本</a>"
else
if show=0 then
response.write "<br/><a href='chatroom.asp?itid=" & itid & "&amp;show=1&amp;SessionID=" & SessionID & "'>显示图片版本</a>"
end if
end if
response.write "<br/><a href='/bbs/djcs.asp?id=" & itid & "&amp;SessionID=" & SessionID & "'>返回" & bkmc & "</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/></p></card></wml>"

function chUBBCodes(memo)
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
    re.Pattern="(^.*)(图=([0-9]*))(.*)"
 if show=1 then
        memo=re.Replace(memo,"$1<img src=""img/$3.gif"" alt=""load...""/>$4")
    else
        memo=re.Replace(memo,"$1[表情]$4")
end if 
	chUBBCodes=memo
end function
%>



