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
<p align='left'>=聊室发言=<br/>
<%if Session("useid")="4268" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if%> 
<%

 
dim rrss,sqlls
set rrss=server.createobject("ADODB.Recordset")
sqlls="select * from room where idd=" & id & " order by id desc"
rrss.open sqlls,myc,1,1
	if rrss.eof then
   response.write "该聊天室不存在!<br/><br/>"
	   else
dim rs,sql
set rs=server.createobject("ADODB.Recordset")
sql="select * from gl where idd=" & id & " and idlt=" & idlt & " and jz<>'0'"
rs.open sql,myc,1,1
if not rs.eof then
   response.write "你被禁言啦,请联系管理员<br/>"
    else
dim t
t=request("t")
%>
表情1:
<select name="talk" value="图=1">
<option value="图=1">电话中</option>
<option value="图=2">眨眼</option>
<option value="图=3">咧嘴</option>
<option value="图=4">拥抱</option>
<option value="图=5">郁闷</option>
<option value="图=6">爱你</option>
<option value="图=7">亲一个</option>
<option value="图=8">心碎</option>
<option value="图=9">清醒</option>
<option value="图=10">幻想</option>
<option value="图=11">拜拜</option>
<option value="图=12">听电话</option>
<option value="图=13">吹口哨</option>
<option value="图=14">生气</option>
<option value="图=15">感动</option>
</select>
<br/>对象:<select name="about<%=minute(now)%><%=second(now)%>" value="大家"><option value="大家">大家</option>
<%
dim rss,sqls
set rss=server.createobject("ADODB.Recordset")
sqls="select * from ooo where idd=" & id & " and DATEDIFF('s', times, now()) < 15*60 order by id desc"
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
<go method="post" href="save.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">
<postfield name="t" value="<%=t%>"/>
<postfield name="talk" value="$(talk)"/>
<postfield name="idst" value="<%=idlt%>"/>
<postfield name="about" value="$(about<%=minute(now)%><%=second(now)%>)"/>
</go>
</anchor> <%
response.write "|<a href='zxs.asp?id=" & id & "&amp;t=" & t & "&amp;SessionID=" & SessionID & "'>找人聊聊</a>"%>
<br/>
表情2:
<select name="talk" value="图=16">
<option value="图=16">酷</option>
<option value="图=17">无奈</option>
<option value="图=18">呼</option>
<option value="图=19">哈哈</option>
<option value="图=20">大哭</option>
<option value="图=21">大笑</option>
<option value="图=22">骗人</option>
<option value="图=23">晕</option>
<option value="图=24">鼓掌</option>
<option value="图=25">想想</option>
<option value="图=26">考虑</option>
<option value="图=27">留口水</option>
<option value="图=28">睡觉</option>
<option value="图=29">NO!</option>
<option value="图=30">去你的</option>
<option value="图=32">别串</option>
</select>
<br/>对象:<select name="about<%=minute(now)%><%=second(now)%>" value="大家"><option value="大家">大家</option>
<%
dim rss1,sqls1
set rss1=server.createobject("ADODB.Recordset")
sqls1="select * from ooo where idd=" & id & " and DATEDIFF('s', times, now()) < 15*60 order by id desc"
rss1.open sqls1,myc,1,1
 do while not rss1.eof
  response.write "<option value='" & ubb(rss1("name")) & "'>" & ubb(rss1("name")) & "ID:" & ubb(rss1("idlt")) & "</option>"
  rss1.Movenext
Loop
rss1.close
set rss1=nothing
%>
</select>
<br/><anchor>发 言
<go method="post" href="save.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">
<postfield name="t" value="<%=t%>"/>
<postfield name="talk" value="$(talk)"/>
<postfield name="idst" value="<%=idlt%>"/>
<postfield name="about" value="$(about<%=minute(now)%><%=second(now)%>)"/>
</go>
</anchor> <%
response.write "|<a href='zxs.asp?id=" & id & "&amp;t=" & t & "&amp;SessionID=" & SessionID & "'>找人聊聊</a>"%>
<%end if%>

<br/>--------<br/>
<a href="rooms.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">返回聊室</a><br/>
<%end if%>
<a href="index.asp?SessionID=<%=SessionID%>">回聊室列表</a><br/>
<a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>地盘</a>-
<!--#include file="aa.asp"-->
<%
myc.close
set myc=nothing
%>
</p>
</card>
</wml>