<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.inc"-->
<!--#include file="ubb.inc"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
dim rs,sql
set rs=server.createobject("ADODB.Recordset")
sql="select * from room where idd=" & idlt & " order by id desc"
   rs.open sql,myc
if not rs.eof then
   response.write "<card title='开设聊室' ontimer='rooms.asp?id=" & idlt & "&amp;SessionID=" & SessionID & "'><timer value='20'/><p align='left'>你已经开了一个啦,不能再开了,正在进入你的聊室...<br/><br/>"
   response.write "<a href='index.asp?SessionID=" & SessionID & "'>聊室列表</a><br/>"
%>
<!--#include file="aa.asp"-->
<%
   response.write "</p></card></wml>"
   response.end
end if
rs.close
set rs=nothing

Dim objgbrss,ssql
 Set objgbrss=Server.CreateObject("ADODB.Recordset")
    ssql="select * from usereg where id=" & idlt & ""
    objgbrss.open ssql,conn,1,1
djj=dj-1
if objgbrss("dengji")<djj then
   response.write "<card title='开设聊室'><p align='left'>你的等级不够" & dj & "级,不能开设!<br/><br/>"
   response.write "<a href='index.asp?SessionID=" & SessionID & "'>聊室列表</a><br/>"
%>
<!--#include file="aa.asp"-->
<%
   response.write "</p></card></wml>"
   response.end

elseif objgbrss("subbank")>0 then
   response.write "<card title='开设聊室'><p align='left'>嘿嘿，你的贷款都还没还清呢，请还了再来开设吧。<br/><br/>"
   response.write "<a href='index.asp?SessionID=" & SessionID & "'>聊室列表</a><br/>"
%>
<!--#include file="aa.asp"-->
<%
   response.write "</p></card></wml>"
   response.end

elseif objgbrss("usejf")<jf then
   response.write "<card title='开设聊室'><p align='left'>你的积分不够" & jf & ",不能开设!<br/><br/>"
   response.write "<a href='index.asp?SessionID=" & SessionID & "'>聊室列表</a><br/>"
%>
<!--#include file="aa.asp"-->
<%
   response.write "</p></card></wml>"
   response.end

Else
 Dim nam
nam=usb(request("name"))
  name=left(name,10)
 sqll="update usereg set usejf=usejf-" & jf & " where id=" & idlt
conn.execute sqll

dim rrss,sqlls
set rrss=server.createobject("ADODB.Recordset")
sqlls="select * from room order by id desc"
rrss.open sqlls,myc,1,2
rrss.addnew
rrss("idd")=idlt
rrss("roomname")=nam
rrss.update
rrss.close
set rrss=nothing

   response.write "<card title='开设聊室' ontimer='rooms.asp?id=" & idlt & "&amp;SessionID=" & SessionID & "'><timer value='20'/><p align='left'>开设成功,正在进入...<br/><br/>"

end if
%>
<a href="index.asp?SessionID=<%=SessionID%>">聊室列表</a><br/>
<!--#include file="aa.asp"-->
<%
objgbrss.close
set objgbrss=nothing
conn.close
set conn=nothing
myc.close
set myc=nothing
%>
</p>
</card>
</wml>