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
<card title="我要发言">
<onevent type="onenterforward">
<refresh>
<setvar name="talk" value=""/>
</refresh>
</onevent>
<p align='left'>聊室发言<br/>

<%if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if%> 
<%
if SessionID="" then SessionID=Session("SessionID")
dim rrss,sqlls
set rrss=server.createobject("ADODB.Recordset")
sqlls="select * from rom where idd=" & id & " order by id desc"
rrss.open sqlls,myc,1,1
	if rrss.eof then
   response.write "该聊天室不存在!<br/><br/>"
	   else
dim rs,sql
set rs=server.createobject("ADODB.Recordset")
sql="select * from gd where idd=" & id & " and idlt=" & idlt & " and jz<>'0'"
rs.open sql,myc,1,1
if not rs.eof then
   response.write "你被禁言啦,请联系管理员<br/>"
    else
%>

内容:<input type="text" name="talk" maxlength="30" size='6'/>
<br/>对象:<select name="about<%=minute(now)%><%=second(now)%>" value="大家"><option value="大家">大家</option>
<%
dim rss,sqls
set rss=server.createobject("ADODB.Recordset")
sqls="select * from ooo where iidd=" & id & " and DATEDIFF('s', times, now()) < 15*60 order by id desc"
rss.open sqls,myc,1,1
 do while not rss.eof
  response.write "<option value='" & ubb(rss("name")) & "'>" & ubb(rss("name")) & "ID:" & ubb(rss("idlt")) & "</option>"
  rss.Movenext
Loop
rss.close
set rss=nothing
%>
</select>
<br/><anchor>发 言
<go method="post" href="talkcl.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">
<postfield name="talk" value="$(talk)"/>
<postfield name="idstt" value="<%=idlt%>"/>
<postfield name="about" value="$(about<%=minute(now)%><%=second(now)%>)"/>
</go>
</anchor><%
response.write "<a href='zx.asp?id=" & id & "&amp;SessionID=" & SessionID & "'>找人聊聊</a>"%>
<%end if%>

<br/>--------<br/>
<a href='room.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>'>[返回聊室]</a><br/>
<%end if%>
<a href='index.asp?SessionID=<%=SessionID%>'>[聊天广场]</a><br/>
<%=now%>
<%  
response.write "<br/>ET:"& FormatNumber((timer()-t1)*1000,3) & "MS</p></card></wml>"
conn.close
set conn=nothing
%>