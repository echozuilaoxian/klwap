<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/BBS/yxxe/conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="我的衣服">
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select dp,d1,d2,d3,d4,d5,d6,d7,d8,d9 from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if

if rs("dp")<>0 then
Response.Write "布衣：(" & rs("dp") &"件)<br/><a href='/BBS/yxxe/sydp.asp?wpid=dp&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=dp&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=dp&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if

if rs("d1")<>0 then
Response.Write "光芒甲:(" & rs("d1") &"件)<br/><a href='/BBS/yxxe/sydp.asp?wpid=d1&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=d1&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=d1&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if

if rs("d2")<>0 then
Response.Write "战神甲:(" & rs("d2") &"件)<br/><a href='/BBS/yxxe/sydp.asp?wpid=d2&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=d2&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=d2&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if

if rs("d3")<>0 then
Response.Write "天使甲:(" & rs("d3") &"件)<br/><a href='/BBS/yxxe/sydp.asp?wpid=d3&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=d3&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=d3&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if

if rs("d4")<>0 then
Response.Write "黄金甲:(" & rs("d4") &"件)<br/><a href='/BBS/yxxe/sydp.asp?wpid=d4&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=d4&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=d4&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if

if rs("d5")<>0 then
Response.Write "毁灭甲:(" & rs("d5") &"件)<br/><a href='/BBS/yxxe/sydp.asp?wpid=d5&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=d5&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=d5&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if

if rs("d6")<>0 then
Response.Write "蝴蝶甲:(" & rs("d6") &"件)<br/><a href='/BBS/yxxe/sydp.asp?wpid=d6&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=d6&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=d6&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if

if rs("d7")<>0 then
Response.Write "龙王甲:(" & rs("d7") &"件)<br/><a href='/BBS/yxxe/sydp.asp?wpid=d7&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=d7&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=d7&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if

if rs("d8")<>0 then
Response.Write "轩辕圣甲:(" & rs("d8") &"件)<br/><a href='/BBS/yxxe/sydp.asp?wpid=d8&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=d8&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=d8&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if

if rs("d9")<>0 then
Response.Write "神魔玄翼:(" & rs("d9") &"件)<br/><a href='/BBS/yxxe/sydp.asp?wpid=d9&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=d9&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=d9&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if

if rs("dp")+rs("d1")+rs("d2")+rs("d3")+rs("d4")+rs("d5")+rs("d6")+rs("d7")+rs("d8")+rs("d9")<=0 then
Response.Write "真晕~~你一件衣服都没有！<br/>"
end if

Response.Write "=========<br/>"
        rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href="/BBS/yxxe/myzb.asp?SessionID=<%=SessionID%>">[查看装备]</a><br/>

<a href="/BBS/yxxe/index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>