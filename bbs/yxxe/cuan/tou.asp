<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/BBS/yxxe/conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="我的头盔">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ids=session("useid")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=wpid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<%
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select tou,t1,t2,t3,t4,t5,t6,t7,t8,t9 from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
if rs("tou")<>0 then
Response.Write "布料头盔:(" & rs("tou") &"个)<br/><a href='/BBS/yxxe/sytou.asp?wpid=tou&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=tou&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=tou&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("t1")<>0 then
Response.Write "光芒头盔:(" & rs("t1") &"个)<br/><a href='/BBS/yxxe/sytou.asp?wpid=t1&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=t1&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=t1&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("t2")<>0 then
Response.Write "战神头盔:(" & rs("t2") &"个)<br/><a href='/BBS/yxxe/sytou.asp?wpid=t2&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=t2&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=t2&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("t3")<>0 then
Response.Write "天使头盔:(" & rs("t3") &"个)<br/><a href='/BBS/yxxe/sytou.asp?wpid=t3&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=t3&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=t3&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("t4")<>0 then
Response.Write "黄金头盔:(" & rs("t4") &"个)<br/><a href='/BBS/yxxe/sytou.asp?wpid=t4&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=t4&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=t4&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("t5")<>0 then
Response.Write "毁灭头盔:(" & rs("t5") &"个)<br/><a href='/BBS/yxxe/sytou.asp?wpid=t5&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=t5&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=t5&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("t6")<>0 then
Response.Write "蝴蝶头盔:(" & rs("t6") &"个)<br/><a href='/BBS/yxxe/sytou.asp?wpid=t6&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=t6&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=t6&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("t7")<>0 then
Response.Write "龙王头盔:(" & rs("t7") &"个)<br/><a href='/BBS/yxxe/sytou.asp?wpid=t7&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=t7&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=t7&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("t8")<>0 then
Response.Write "轩辕圣盔:(" & rs("t8") &"个)<br/><a href='/BBS/yxxe/sytou.asp?wpid=t8&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=t8&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=t8&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("t9")<>0 then
Response.Write "神魔玄盔:(" & rs("t9") &"个)<br/><a href='/BBS/yxxe/sytou.asp?wpid=t9&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=t9&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=t9&amp;SessionID="&SessionID&"'></a><br/>"
end if
if rs("tou")+rs("t1")+rs("t2")+rs("t3")+rs("t4")+rs("t5")+rs("t6")+rs("t7")+rs("t8")+rs("t9")<=0 then
Response.Write "真晕~~你一个头盔都没有！<br/>"
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