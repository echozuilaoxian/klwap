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
<%if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if%> 
<%
dim admin,adminsql
set admin=server.createobject("ADODB.Recordset")
adminsql="select * from admin where idd=" & idlt & " order by id desc"
admin.open adminsql,myc,1,1

  if not admin.eof then
dim idgl
idgl=admin("idd")
  end if
admin.close
set admin=nothing
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

<%
dim rss,sqls1
set rss=server.createobject("ADODB.Recordset")
sqls1="select * from roms where idd=" & id & " order by id desc"
rss.open sqls1,myc,1,1
myc.close
set myc=nothing
end if
wap=request.querystring("wap")
iduse=Session("useid")
dim ids,name,objgbrss,sqls
ids=request("ids")
tjhm=ids
 set objgbrss=Server.CreateObject("ADODB.Recordset")
       sqls="select usesex,usename from usereg where CStr(id)='" & ids & "'"
       objgbrss.open sqls,conn

dim sex
if objgbrss("usesex")="0" then
sex="<img src='boy.gif' alt='G'/>"
  else if objgbrss("usesex")="1" then
sex="<img src='girl.gif' alt='M'/>"
end if
end if
response.write "<br/>" & sex & "<a href='/bbs/reg/useinfo.asp?id=" & ids & "&amp;SessionID=" & SessionID & "'>" & ubb2(objgbrss("usename"))& "ID:" & ids & "</a><br/>"
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
<br/>对象:<select name="about<%=minute(now)%><%=second(now)%>" value="<%=ubb2(objgbrss("usename"))%>">
<%
  response.write "<option value='" & ubb2(objgbrss("usename"))& "'>" & ubb2(objgbrss("usename"))& "</option>"
%>
</select>
<br/><anchor>发 言
<go method="post" href="talkcl.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">
<postfield name="talk" value="$(talk)"/>
<postfield name="idstt" value="<%=idlt%>"/>
<postfield name="about" value="$(about<%=minute(now)%><%=second(now)%>)"/>
</go>
</anchor> <a href='t.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>&amp;oo=room'>对 照</a>
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
<br/>对象:<select name="about<%=minute(now)%><%=second(now)%>" value="<%=ubb2(objgbrss("usename"))%>">
<%
  response.write "<option value='" & ubb2(objgbrss("usename"))& "'>" & ubb2(objgbrss("usename"))& "</option>"
%>
</select>
<br/><anchor>发 言
<go method="post" href="talkcl.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">
<postfield name="talk" value="$(talk)"/>
<postfield name="idstt" value="<%=idlt%>"/>
<postfield name="about" value="$(about<%=minute(now)%><%=second(now)%>)"/>
</go>
</anchor> <a href='t.asp?id=<%=id%>&amp;t=<%=t%>&amp;SessionID=<%=SessionID%>&amp;oo=room'>对 照</a>
<%
response.write "<br/><a href='myfy1.asp?id=" & id & "&amp;ids=" & ids & "&amp;SessionID=" & SessionID & "'>切换至发言>></a><br/><a href='myfyz.asp?id=" & id & "&amp;ids=" & ids & "&amp;SessionID=" & SessionID & "'>切换至动作>></a>"
response.write "<br/>功能><a href='/bbs/public/fsly.asp?ids="& ids &"&amp;SessionID=" & SessionID & "'>发信</a>"
response.write "><a href='/bbs/friandbook/addcl.asp?frid=" & ids & "&amp;SessionID=" & SessionID & "'>加友</a>"
response.write "><a href='/bbs/jieh/jie1.asp?id=" & ids & "&amp;SessionID=" & SessionID & "'>求婚</a>"
if idlt=idgl and idgl<>"" then 
response.write "<br/>=管理操作=<br/>"
response.write "封锁><anchor>发言权"
response.write "<go method='post' href='romgl.asp?ck=ok&amp;cz=jin&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>"
response.write "<postfield name='glcz' value='f'/>"
response.write "<postfield name='about' value='" & ids & "'/>"
response.write "</go></anchor><br/>"
response.write "封锁><anchor>进入权"
response.write "<go method='post' href='romgl.asp?ck=ok&amp;cz=jin&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>"
response.write "<postfield name='glcz' value='i'/>"
response.write "<postfield name='about' value='" & ids & "'/>"
response.write "</go></anchor><br/>"
response.write "解开><anchor>发言"
response.write "<go method='post' href='romgl.asp?ck=ok&amp;cz=jue&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>"
response.write "<postfield name='about' value='" & ids & "'/>"
response.write "</go></anchor>"
response.write "><anchor>进入权"
response.write "<go method='post' href='romgl.asp?ck=ok&amp;cz=jue&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>"
response.write "<postfield name='about' value='" & ids & "'/>"
response.write "</go></anchor>"
 end if %>
<br/>--------<br/>
<a href="/bbs/room/room.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">[返回聊室]</a><br/>
<a href="/bbs/room/index.asp?SessionID=<%=SessionID%>">[聊天广场]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
<%
objgbrss.close
Set objgbrss= Nothing
conn.close
set conn=nothing%>
</p>
</card>
</wml>