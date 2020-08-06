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

<%
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

内容:<input type="text" name="talk" maxlength="30" size='6'/>
<br/>对象:<select name="about<%=minute(now)%><%=second(now)%>" value="<%=objgbrss("usename")%>">
<%
  response.write "<option value='" & objgbrss("usename")& "'>" & objgbrss("usename")& "</option>"
%>
</select>
<br/><anchor>发 言
<go method="post" href="save.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">
<postfield name="talk" value="$(talk)"/>
<postfield name="idst" value="<%=idlt%>"/>
<postfield name="about" value="$(about<%=minute(now)%><%=second(now)%>)"/>
</go>
</anchor>
<%
response.write "<br/><a href='myfyb1.asp?id=" & id & "&amp;ids=" & ids & "&amp;SessionID=" & SessionID & "'>切换至贴图>></a><br/><a href='myfyz1.asp?id=" & id & "&amp;ids=" & ids & "&amp;SessionID=" & SessionID & "'>切换至动作>></a>"
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
response.write "<go method='post' href='roomgl.asp?ck=ok&amp;cz=jue&amp;id=" & id & "&amp;wap=" & wap & "'>"
response.write "<postfield name='about' value='" & ids & "'/>"
response.write "</go></anchor>"
response.write "><anchor>进入权"
response.write "<go method='post' href='roomgl.asp?ck=ok&amp;cz=jue&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>"
response.write "<postfield name='about' value='" & ids & "'/>"
response.write "</go></anchor>"
end if
end if
%>
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