<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="我的靴子">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ids=session("useid")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid=wpid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<%
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select kyaa,k1,k2,k3,k4,k5,k6,k7,k8,k9 from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
if rs("kyaa")<>0 then
Response.Write "布靴:(" & rs("kyaa") &"件)<br/><a href='syxue.asp?wpid=kyaa&amp;SessionID="&SessionID&"'>装备</a>|<a href='song.asp?wpid=kyaa&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=kyaa&amp;SessionID="&SessionID&"'>出售</a><br/>"
end if
if rs("k1")<>0 then
Response.Write "光芒靴:(" & rs("k1") &"件)<br/><a href='syxue.asp?wpid=k1&amp;SessionID="&SessionID&"'>装备</a>|<a href='song.asp?wpid=k1&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=k1&amp;SessionID="&SessionID&"'>出售</a><br/>"
end if
if rs("k2")<>0 then
Response.Write "战神靴:(" & rs("k2") &"件)<br/><a href='syxue.asp?wpid=k2&amp;SessionID="&SessionID&"'>装备</a>|<a href='song.asp?wpid=k2&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=k2&amp;SessionID="&SessionID&"'>出售</a><br/>"
end if
if rs("k3")<>0 then
Response.Write "天使靴:(" & rs("k3") &"件)<br/><a href='syxue.asp?wpid=k3&amp;SessionID="&SessionID&"'>装备</a>|<a href='song.asp?wpid=k3&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=k3&amp;SessionID="&SessionID&"'>出售</a><br/>"
end if
if rs("k4")<>0 then
Response.Write "黄金靴:(" & rs("k4") &"件)<br/><a href='syxue.asp?wpid=k4&amp;SessionID="&SessionID&"'>装备</a>|<a href='song.asp?wpid=k4&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=k4&amp;SessionID="&SessionID&"'>出售</a><br/>"
end if
if rs("k5")<>0 then
Response.Write "毁灭靴:(" & rs("k5") &"件)<br/><a href='syxue.asp?wpid=k5&amp;SessionID="&SessionID&"'>装备</a>|<a href='song.asp?wpid=k5&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=k5&amp;SessionID="&SessionID&"'>出售</a><br/>"
end if
if rs("k6")<>0 then
Response.Write "蝴蝶靴:(" & rs("k6") &"件)<br/><a href='syxue.asp?wpid=k6&amp;SessionID="&SessionID&"'>装备</a>|<a href='song.asp?wpid=k6&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=k6&amp;SessionID="&SessionID&"'>出售</a><br/>"
end if
if rs("k7")<>0 then
Response.Write "龙王靴:(" & rs("k7") &"件)<br/><a href='syxue.asp?wpid=k7&amp;SessionID="&SessionID&"'>装备</a>|<a href='song.asp?wpid=k7&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=k7&amp;SessionID="&SessionID&"'>出售</a><br/>"
end if
if rs("k8")<>0 then
Response.Write "轩辕圣靴:(" & rs("k8") &"件)<br/><a href='syxue.asp?wpid=k8&amp;SessionID="&SessionID&"'>装备</a>|<a href='song.asp?wpid=k8&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=k8&amp;SessionID="&SessionID&"'>出售</a><br/>"
end if
if rs("k9")<>0 then
Response.Write "神魔玄靴:(" & rs("k9") &"件)<br/><a href='syxue.asp?wpid=k9&amp;SessionID="&SessionID&"'>装备</a>|<a href='song.asp?wpid=k9&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=k9&amp;SessionID="&SessionID&"'>出售</a><br/>"
end if
if rs("kyaa")+rs("k1")+rs("k2")+rs("k3")+rs("k4")+rs("k5")+rs("k6")+rs("k7")+rs("k8")+rs("k9")<=0 then
Response.Write "真晕~~你一个头盔都没有！<br/>"
end if
Response.Write "=========<br/>"
        rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href="myzb.asp?SessionID=<%=SessionID%>">[查看装备]</a><br/>
<a href="mywp.asp?SessionID=<%=SessionID%>">[我的包袱]</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>