<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/BBS/yxxe/conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="我的武器">
<p>
<%
SessionID=request.querystring("SessionID")
ids=session("useid")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid=wpid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<%
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select wq,w1,w2,w3,w4,w5,w6,w7,w8,w9 from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
if rs("wq")<>0 then
Response.Write "木剑：(" & rs("wq") &"把)<br/><a href='/BBS/yxxe/syzb.asp?wpid=wq&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=wq&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=wq&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("w1")<>0 then
Response.Write "光芒剑:(" & rs("w1") &"把)<br/><a href='/BBS/yxxe/syzb.asp?wpid=w1&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=w1&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=w1&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("w2")<>0 then
Response.Write "战神剑:(" & rs("w2") &"把)<br/><a href='/BBS/yxxe/syzb.asp?wpid=w2&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=w2&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=w2&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("w3")<>0 then
Response.Write "天使剑:(" & rs("w3") &"把)<br/><a href='/BBS/yxxe/syzb.asp?wpid=w3&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=w3&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=w3&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("w4")<>0 then
Response.Write "黄金剑:(" & rs("w4") &"把)<br/><a href='/BBS/yxxe/syzb.asp?wpid=w4&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=w4&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=w4&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("w5")<>0 then
Response.Write "毁灭剑:(" & rs("w5") &"把)<br/><a href='/BBS/yxxe/syzb.asp?wpid=w5&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=w5&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=w5&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("w6")<>0 then
Response.Write "蝴蝶剑:(" & rs("w6") &"把)<br/><a href='/BBS/yxxe/syzb.asp?wpid=w6&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=w6&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=w6&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("w7")<>0 then
Response.Write "龙王剑:(" & rs("w7") &"把)<br/><a href='/BBS/yxxe/syzb.asp?wpid=w7&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=w7&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=w7&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("w8")<>0 then
Response.Write "轩辕煞魂斩:(" & rs("w8") &"把)<br/><a href='/BBS/yxxe/syzb.asp?wpid=w8&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=w8&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=w8&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("w9")<>0 then
Response.Write "神魔玄兵:(" & rs("w9") &"把)<br/><a href='/BBS/yxxe/syzb.asp?wpid=w9&amp;SessionID="&SessionID&"'>装备</a>|<a href='/BBS/yxxe/song.asp?wpid=w9&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=w9&amp;SessionID="&SessionID&"'>存放</a><br/>"
end if
if rs("wq")+rs("w1")+rs("w2")+rs("w3")+rs("w4")+rs("w5")+rs("w6")+rs("w7")+rs("w8")+rs("w9")<=0 then
Response.Write "真晕~~你一把武器都没有！"
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