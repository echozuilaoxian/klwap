<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>

<%
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?hotid="&request("hotid")&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
hotid=request("hotid")
Server.ScriptTimeout=9999
iduse=Session("useid")
lasttlls=540
lasttls
if Clng(iduse)=Clng(hotid) then
taa="我"
else
taa="TA"
end if
%>
<card id="hotpk" title="唇枪舌剑-<%=taa%>的伤痕"><p>
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id,usename from usereg where CStr(id)='" &hotid&"'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误,该号不存在1"
else

if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?hotid=" &hotid&""
End if
Response.write "<a href='index.asp?SessionID="&SessionID&"'>返回我的游戏</a>>>>><a href='index1.Asp?hotid=" &hotid & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(objgbrs("usename"))&"</a><br/>"


Response.write ""&objgbrs("usename")&"的伤痕<br/>"
dim hd,objgbrsd
  set objgbrsd=Server.CreateObject("ADODB.Recordset")
  conn.CommandTimeOut = 999
   ssql="select  * from sjzk where idss="&  hotid &" and lasttlls=540 order by id desc "
  objgbrsd.open ssql,conn,1,1
if objgbrsd.eof then
   Response.write ""&  taa &"最近还没有伤痕......."
Else
objgbrsd.PageSize=10
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrc.PageCount then pages=objgbrc.PageCount
objgbrsd.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*10-10
End if
For k=1 to objgbrsd.PageSize 
 bihaocont=bihaocont+1
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
newyear=Clng(int(newyear/86400))
ttime="天"
end if
Response.write ""&bihao+bihaocont&":" & newyear &ttime & "前"&taa&"被<a href='index1.Asp?hotid=" & objgbrsd("idss") & "&amp;SessionID=" & SessionID & "'>"&converttowidebaiti(objgbrsd("zname"))&"</a>" & objgbrsd("dong") & "" & objgbrsd("bu") & "<br/>"
objgbrsd.Movenext
if objgbrsd.EOF then Exit for
 Next
End if
If pages<objgbrsd.PageCount then
Response.Write "<a href='sjzjs.asp?hotid=" &hotid & "&amp;pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "|" & "<a href='sjzjs.asp?hotid=" &hotid & "&amp;pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrsd.PageCount>1 then
response.write "(" & pages & "/" & objgbrsd.PageCount & ")<br/>"
End if

	objgbrsd.close
	set objgbrsd=nothing
end if

Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/klwll.asp"-->
</p></card></wml>


