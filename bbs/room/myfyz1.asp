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
SessionID=request.querystring("SessionID")
iduse=Session("useid")
dim ids,name,objgbrss,sqls
ids=request("ids")
tjhm=ids
 set objgbrss=Server.CreateObject("ADODB.Recordset")
       sqls="select usesex,usename from usereg where CStr(id)='" & ids & "'"
       objgbrss.open sqls,conn

dim sex
if objgbrss("usesex")="男" then
sex="<img src='boy.gif' alt='G'/>"
  else if objgbrss("usesex")="女" then
sex="<img src='girl.gif' alt='M'/>"
end if
end if
response.write "<br/>" & sex & "<a href='/bbs/reg/useinfo.asp?id=" & ids & "&amp;SessionID=" & SessionID & "'>" & objgbrss("usename")& "ID:" & ids & "</a><br/>"
%>
动作:
<select name="talk" value="大家好">
<option value="瞪了一眼:切...">瞪眼</option>
<option value="哭泣的说:你伤害了我,还一笑而过...">哭泣</option>
<option value="愉快地向在场的所有人打招呼">打招呼</option>
<option value="和在场的每一个人踊跃握手致敬！">握手</option>
<option value="高叫道：我爱社区">爱</option>
<option value="很生气地撅了撅嘴。">生气</option>
<option value="吻别：咱们下次再叙...">再见</option>
<option value="本人表示歉意…">道歉</option>
<option value="鼓掌喝采！">鼓掌</option>
<option value="用手指弹了一下自己的脑门儿:我想到拉">手指</option>
<option value="脸都红了，恨不得有个地洞，好钻进去躲起来~~">脸红</option>
<option value="越想越伤心，瘪了瘪嘴，咚的一声就坐在地上哇啦大哭......">哭</option>
<option value="口吐白沫，昏了过去">晕</option>
<option value="张开双臂好像想拥抱某某">拥抱</option>
<option value="运起佛山无影脚,结果脚下一滑,摔了个大跟头.">踢</option>
<option value="不停地飞吻">吻</option>
<option value="深情地唱道：'我早已为你种下，九百九十九朵玫瑰'">玫瑰</option>
<option value="泪眼朦胧地，不知道怎么把求婚的话说出来">求婚</option>
<option value="连哭带喊地叫道：再原谅我一次吧！">原谅</option>
<option value="不知道想到什么诱人的东西，口水都流出来了……">美眉</option>
</select>
<br/>对象:<select name="about<%=minute(now)%><%=second(now)%>" value="<%=objgbrss("usename")%>">
<%
  response.write "<option value='" & objgbrss("usename")& "'>" & objgbrss("usename")& "</option>"
%>
</select>
<br/><anchor>发 言
<go method="post" href="save.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">
<postfield name="talk" value="$(talk)"/>
<postfield name="idstt" value="<%=idlt%>"/>
<postfield name="about" value="$(about<%=minute(now)%><%=second(now)%>)"/>
</go>
</anchor> 
<%
response.write "<br/><a href='myfy.asp?id=" & id & "&amp;ids=" & ids & "&amp;SessionID=" & SessionID & "'>切换至发言>></a><br/><a href='myfyb1.asp?id=" & id & "&amp;ids=" & ids & "&amp;SessionID=" & SessionID & "'>切换至贴图>></a>"
response.write "<br/>功能><a href='/bbs/public/fsly.asp?ids="& ids &"&amp;SessionID=" & SessionID & "'>发信</a>"
response.write "><a href='/bbs/friandbook/addcl.asp?frid=" & ids & "&amp;SessionID=" & SessionID & "'>加友</a>"
response.write "><a href='/bbs/jieh/jie1.asp?id=" & ids & "&amp;SessionID=" & SessionID & "'>求婚</a>"
if idlt=id then 
response.write "<br/>=管理操作=<br/>"
response.write "封锁><anchor>发言权"
response.write "<go method='post' href='roomgl.asp?ck=ok&amp;cz=jin&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>"
response.write "<postfield name='glcz' value='f'/>"
response.write "<postfield name='about' value='" & ids & "'/>"
response.write "</go></anchor><br/>"
response.write "封锁><anchor>进入权"
response.write "<go method='post' href='roomgl.asp?ck=ok&amp;cz=jin&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>"
response.write "<postfield name='glcz' value='i'/>"
response.write "<postfield name='about' value='" & ids & "'/>"
response.write "</go></anchor><br/>"
response.write "解开><anchor>发言"
response.write "<go method='post' href='roomgl.asp?ck=ok&amp;cz=jue&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>"
response.write "<postfield name='about' value='" & ids & "'/>"
response.write "</go></anchor>"
response.write "><anchor>进入权"
response.write "<go method='post' href='roomgl.asp?ck=ok&amp;cz=jue&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>"
response.write "<postfield name='about' value='" & ids & "'/>"
response.write "</go></anchor>"
 end if %>
<br/>--------<br/>
<a href="room.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">[返回聊室]</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">[聊天广场]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
<%
objgbrss.close
Set objgbrss= Nothing
conn.close
set conn=nothing%>
</p>
</card>
</wml>