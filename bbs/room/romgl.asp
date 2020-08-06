<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.inc"-->
<!--#include file="ubb.inc"-->

<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card title="聊室管理">
<p align='left'>
<%
dim rrs,sqls,t
t=request("t") 
set rrs=server.createobject("ADODB.Recordset")
sqls="select * from rom where idd=" & id & " order by id desc"
rrs.open sqls,myc,1,1
if rrs.eof then
response.write "该聊天室不存在!<br/><br/>"
response.write "<a href='index.asp?SessionID=" & SessionID & "'>聊室列表</a></p></card></wml>"
response.end
end if
%>
<!--#include file="admin.asp"-->
<%
Function AAA()
response.write "请选择你要进行的操作<br/>"
response.write "<a href='romgl.asp?id=" & id & "&amp;ck=bb&amp;t=" & t & "&amp;SessionID=" & SessionID & "'>禁止室员</a><br/>"
response.write "<a href='romgl.asp?id=" & id & "&amp;ck=cc&amp;t=" & t & "&amp;SessionID=" & SessionID & "'>解禁室员</a><br/>"
response.write "<a href='romgl.asp?id=" & id & "&amp;ck=ff&amp;t=" & t & "&amp;SessionID=" & SessionID & "'>添加主持人</a><br/>"
response.write "<a href='romgl.asp?id=" & id & "&amp;ck=hh&amp;t=" & t & "&amp;SessionID=" & SessionID & "'>删除主持人</a><br/>"
response.write "<a href='romgl.asp?id=" & id & "&amp;ck=dd&amp;t=" & t & "&amp;SessionID=" & SessionID & "'>清空发言</a><br/>"

End Function


Function BBB()
dim rs,sql
set rs=server.createobject("ADODB.Recordset")
sql="select * from ooo where iidd=" & id & " and idlt<>" & idlt & " and DATEDIFF('s', times, now()) < 15*60 order by id desc"
rs.open sql,myc,1,1
if rs.eof then
response.write "现在还没有人，不用担心会有人捣乱<br/>"
  else
response.write "禁止<br/>"
response.write "<select name='about'>"

 do while not rs.eof
  response.write "<option value='" & ubb(rs("idlt")) & "'>" & ubb(rs("name")) & "ID:" & ubb(rs("idlt")) & "</option>"
  rs.Movenext
Loop

response.write "</select><br/><select name='glcz'>"
response.write "<option value='f'>发言</option>"
response.write "<option value='i'>进入</option>"
response.write "</select><br/>"
response.write "理由:<input type='text' name='word1' size='12'/><br/>"
response.write "<anchor>确定封锁"
response.write "<go method='post' href='romgl.asp?ck=ok&amp;cz=jin&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>"
response.write "<postfield name='glcz' value='$(glcz)'/>"
response.write "<postfield name='about' value='$(about)'/>"
response.write "<postfield name='word1' value='$(word1)'/>"
response.write "</go></anchor><br/>"
end if
End Function


Function CCC()
dim rs,sql
set rs=server.createobject("ADODB.Recordset")
sql="select * from gd where idd=" & id & " and jz<>'0' order by id desc"
rs.open sql,myc,1,1
if rs.eof then
response.write "目前还没有被禁止的室员<br/>"
  else
response.write "解除禁止<br/>"
response.write "<select name='about'>"

 do while not rs.eof
dim objgbrss,ssqls
  set objgbrss=Server.CreateObject("ADODB.Recordset")
  ssqls="select usename from usereg where id=" & rs("idlt")
  objgbrss.open ssqls,conn,1,1
  response.write "<option value='" & ubb(rs("idlt")) & "'> " & ubb(objgbrss("usename")) & "ID:" & ubb(rs("idlt")) & "</option>"
  rs.Movenext
Loop


response.write "</select><br/>"
response.write "<anchor>确定"
response.write "<go method='post' href='romgl.asp?ck=ok&amp;cz=jue&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>"
response.write "<postfield name='about' value='$(about)'/>"
response.write "</go></anchor><br/>"
end if
End Function


Function DDD()
response.write "确定清空吗?<br/>"
response.write "<a href='romgl.asp?ck=ok&amp;cz=qk&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>确定</a><br/>"
End Function


Function GGG()
response.write "注意:系统会过滤一些特殊符号<br/>"
response.write "内容:<input type='text' name='keyword' size='12'/>"
response.write "<br/><anchor>提 交<go method='post' href='reformbwcl.asp?id=" & id & "&amp;t=" & t & "&amp;SessionID=" & SessionID & "'>"
response.write "<postfield name='idd' value='$(idd)'/>"
response.write "<postfield name='select' value='$(select)'/>"
response.write "<postfield name='keyword' value='$(keyword)'/></go></anchor><br/>"
End Function


Function FFF()
dim rs,sql
set rs=server.createobject("ADODB.Recordset")
sql="select * from ooo where iidd=" & id & " and idlt<>" & idlt & " and DATEDIFF('s', times, now()) < 15*60 order by id desc"
rs.open sql,myc,1,1
if rs.eof then
response.write "现在还没有人在聊天室<br/>"
  else
response.write "添加主持人<br/>"
response.write "<select name='about'>"

 do while not rs.eof
  response.write "<option value='" & ubb(rs("idlt")) & "'>" & ubb(rs("name")) & "ID:" & ubb(rs("idlt")) & "</option>"
  rs.Movenext
Loop
response.write "</select><br/><select name='glcz'>"
response.write "<option value='1'>正主持</option>"
response.write "<option value='2'>副主持</option>"
response.write "</select><br/>"
response.write "<anchor>确定"
response.write "<go method='post' href='romgl.asp?ck=ok&amp;cz=tian&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>"
response.write "<postfield name='glcz' value='$(glcz)'/>"
response.write "<postfield name='about' value='$(about)'/>"
response.write "</go></anchor><br/>"
end if
End Function


Function HHH()
dim rs,sql
set rs=server.createobject("ADODB.Recordset")
sql="select * from ltzc where idd=" & id & " and jz<>'0' order by id desc"
rs.open sql,myc,1,1
if rs.eof then
response.write "目前还没有主持人<br/>"
  else
response.write "解除主持人<br/>"
response.write "<select name='about'>"

 do while not rs.eof
 dim objgbrss,ssqls
  set objgbrss=Server.CreateObject("ADODB.Recordset")
  ssqls="select usename from usereg where id=" & rs("idlt")
  objgbrss.open ssqls,conn,1,1
  response.write "<option value='" & ubb(rs("idlt")) & "'>" & ubb(objgbrss("usename")) & "ID:" & ubb(rs("idlt")) & "</option>"
  rs.Movenext
Loop

response.write "</select><br/>"
response.write "<anchor>确定"
response.write "<go method='post' href='romgl.asp?ck=ok&amp;cz=shan&amp;id=" & id & "&amp;SessionID=" & SessionID & "'>"
response.write "<postfield name='about' value='$(about)'/>"
response.write "</go></anchor><br/>"
end if
End Function


Function OK()
dim t,cz
t=request("t")
cz=request("cz")
dim about,glcz,rs,sql

if cz="jin" then

about=request("about")
glcz=request("glcz")
word1=request("word1")
set rs=server.createobject("ADODB.Recordset")
sql="select * from gd where idd=" & id & " and idlt=" & about & " order by id desc"
rs.open sql,myc,1,2
   if not rs.eof then
if glcz<>"" then rs("jz")=glcz
if word1<>"" then rs("bz")=word1
rs.update
	else
rs.addnew
if id<>"" then rs("idd")=id
if about<>"" then rs("idlt")=about
if glcz<>"" then rs("jz")=glcz
if word1<>"" then rs("bz")=word1
rs.update
   end if

elseif cz="jue" then
about=request("about")

  sql="delete from gd Where idlt=" & about
  myc.Execute(sql)
  
elseif cz="shan" then
about=request("about")

  sql="delete from ltzc Where idlt=" & about
  myc.Execute(sql) 
   
elseif cz="qk" then

  sql="delete from roms Where idd=" & id
  myc.Execute(sql)

end if


if cz="tian" then

glcz=request("glcz")
about=request("about")
set rs=server.createobject("ADODB.Recordset")
sql="select * from ltzc where idd=" & id & " and idlt=" & about & " order by id desc"
rs.open sql,myc,1,2
   if not rs.eof then
  if glcz<>"" then rs("jz")=glcz
rs.update
	else
rs.addnew
if id<>"" then rs("idd")=id
if about<>"" then rs("idlt")=about
if glcz<>"" then rs("jz")=glcz
rs.update
   end if   
   
   
   


end if
response.write "操作成功!<br/>"
End Function

Function NNN()
	If Request.QueryString("ck") = "" Then
		AAA
	ElseIf Request.QueryString("ck") = "bb" Then
		BBB
	ElseIf Request.QueryString("ck") = "cc" Then
		CCC
	ElseIf Request.QueryString("ck") = "dd" Then
		DDD
	ElseIf Request.QueryString("ck") = "gg" Then
		GGG
	ElseIf Request.QueryString("ck") = "ff" Then
		FFF
	ElseIf Request.QueryString("ck") = "hh" Then
		HHH
	ElseIf Request.QueryString("ck") = "ok" Then
		OK
	End If
End Function
%>
<%=NNN%>
<%else%>
警告!!你不是管理员,无法进行操作!!!<br/>
<%end if%>
---------<br/>
<a href="romgl.asp?id=<%=id%>&amp;t=<%=t%>&amp;SessionID=<%=SessionID%>">管理页面</a><br/>
<a href="room.asp?id=<%=id%>&amp;SessionID=<%=SessionID%>">返回聊天室</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">返回聊天大厅</a><br/>
<!--#include file="aa.asp"-->
<%
myc.close
set myc=nothing
%>
</p>
</card>
</wml>