<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
pid=request("pid")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid="&wpid&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
Select Case pid
   Case "1"
      itidtit="原始森林"
   Case "2"
      itidtit="魔鬼山洞"
   Case "3"
      itidtit="丰富矿山"
   Case "4"
      itidtit="浩瀚北海"
 End Select
%>
<card title="<%=itidtit%>">
<p>
<!--#include file="conn.asp"-->
<%
set rs=Server.CreateObject("ADODB.Recordset")
strSQL="select * from sx where cstr(ids)="&ids
rs.open strSQL,Conn,1,1
if rs.recordcount<=1 then
if rs("tl")<1 then
sql="delete from pk Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
sql="delete from kywap Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
sql="delete from wupin Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
Response.Write "GAME-OVER!<br/>您被怪物杀害了<br/>包袱物品全部消失！<br/><a href='index.asp?SessionID="&SessionID&"'>继续江湖</a><br/>"
   rs.close
set rs=Nothing
else
dengji=clng(rs("dj"))
mygj=rs("gj")
myfs=rs("fs")
myjy=rs("jy")
mytl=rs("tl")
   rs.close
set rs=Nothing
set rs1=Server.CreateObject("ADODB.Recordset")
strSQL="select * from pk where pid="&pid&" and cstr(ids)="&ids
rs1.open strSQL,Conn,1,2
gwsx=clng(rs1("gj")-myfs)
if gwsx>clng(mysx) then
mysx1=clng(gwsx*0.15)
sql="update sx set tl=tl-"&mysx1&" where cstr(ids)="&ids
  conn.Execute(sql)
Response.Write "逃跑失败了！凶猛的怪物扑了过来<br/>我的生命值-"&mysx1&"<br/>("&mytl&"/"&myjy&")<br/><a href='gong.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID=" & SessionID & "'>攻击</a>|<a href='shou.asp?pid="&pid&"&amp;t=" & time() & "&amp;SessionID=" & SessionID & "'>防守</a>|<a href='tao.asp?pid="&pid&"&amp;SessionID="&SessionID&"'>逃跑</a><br/>"
else
sql="delete from pk Where CStr(ids)='" & ids & "'"
  conn.Execute(sql)
Response.Write "逃跑成功！<br/>"
end if
   rs1.close
set rs1=Nothing
end if
end if
Conn.close
set Conn=nothing
%>
=========<br/>
<a href="/BBS/yxxe/index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>