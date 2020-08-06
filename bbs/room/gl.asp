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
<card title="管理员操作">
<p align='left'>
<!--#include file="admin.asp"-->
<%
If idlt=idroom Then

Function AAA()
dim rs,sql
set rs=server.createobject("ADODB.Recordset")
sql="select * from admin where idd<>" & idlt & " order by id desc"
rs.open sql,myc,1,2

response.write "你的下级管理员有<br/><br/>"

do while not rs.eof

  response.write "<a href='/bbs/reg/useinfo.asp?id=" & rs("idd") & "&amp;SessionID=" & SessionID & "'>ID:" & rs("idd") & "</a>|<a href='gl.asp?id=" & rs("idd") & "&amp;SessionID=" & SessionID & "&amp;ck=cc'> 免罢此管理员</a><br/>"

rs.movenext
loop
response.write "<br/><a href='gl.asp?ck=bb&amp;SessionID=" & SessionID & "'>添加管理员</a><br/>"
response.write "<a href='gl.asp?ck=dd&amp;SessionID=" & SessionID & "'>修改聊天室</a><br/>"
End Function


Function BBB()
response.write "请输入要添加的管理员的ID<br/>"

response.write "<input name='iid' title='不能为空!' format='*N' maxlength='10' emptyok='false'/><br/>"
response.write "<anchor>确定"
response.write "<go method='post' href='gl.asp?ck=ok&amp;cz=add&amp;SessionID=" & SessionID & "'>"
response.write "<postfield name='iid' value='$(iid)'/>"
response.write "</go></anchor><br/>"
End Function


Function CCC()
response.write "确定删除?<br/>"
  Response.write "<a href='gl.asp?id=" & id & "&amp;SessionID=" & SessionID & "&amp;ck=ok&amp;cz=del'>确定</a><br/><br/>"
End Function


Function DDD()
dim rs,sql
set rs=server.createobject("ADODB.Recordset")
sql="select * from admin where idd=1"
rs.open sql,myc,1,2

     response.write "聊室使用时长(小时)<br/>"
     response.write "<input name='over" & minute(now) & "" & second(now) & "' title='使用时长' format='*N' maxlength='10' value='" & rs("overtime") & "'/><br/>"
     response.write "发言保留时间(小时)<br/>"
     response.write "<input name='bl" & minute(now) & "" & second(now) & "' title='保留时间' format='*N' maxlength='10' value='" & rs("bl") & "'/><br/>"
     response.write "开设所需钻币<br/>"
     response.write "<input name='jf" & minute(now) & "" & second(now) & "' title='所需金币' format='*N' value='" & rs("jf")& "'/><br/>"
     response.write "开设所需等级<br/>"
     response.write "<input name='dj" & minute(now) & "" & second(now) & "' title='所需等级' format='*N' maxlength='10' value='" & rs("dj") & "'/><br/>"
     response.write "每页条数<br/>"
     response.write "<input name='paag" & minute(now) & "" & second(now) & "' title='每页条数' maxlength='2' value='" & rs("pag") & "'/><br/>"
     response.write "网站名称<br/>"
     response.write "<input name='title" & minute(now) & "" & second(now) & "' title='网站名称' maxlength='10' value='" & rs("title") & "'/><br/>"
     response.write "网站地址<br/>"
     response.write "<input name='url" & minute(now) & "" & second(now) & "' title='网站地址' maxlength='200' value='" & rs("url") & "'/><br/>"
     response.write "广告(支持UBB,不想显示留一个字符)<br/>"
     response.write "<input name='ad" & minute(now) & "" & second(now) & "' title='广告' value='" & rs("ad") & "'/><br/>未经大当家同意,严禁修改网站名称和网站地址及广告!<br/><br/>"

response.write "<anchor>确定"
response.write "<go method='post' href='gl.asp?ck=ok&amp;cz=up&amp;SessionID=" & SessionID & "'>"
response.write "<postfield name='over' value='$(over" & minute(now) & "" & second(now) & ")'/>"
response.write "<postfield name='bl' value='$(bl" & minute(now) & "" & second(now) & ")'/>"
response.write "<postfield name='jf' value='$(jf" & minute(now) & "" & second(now) & ")'/>"
response.write "<postfield name='dj' value='$(dj" & minute(now) & "" & second(now) & ")'/>"
response.write "<postfield name='paag' value='$(paag" & minute(now) & "" & second(now) & ")'/>"
response.write "<postfield name='title' value='$(title" & minute(now) & "" & second(now) & ")'/>"
response.write "<postfield name='url' value='$(url" & minute(now) & "" & second(now) & ")'/>"
response.write "<postfield name='ad' value='$(ad" & minute(now) & "" & second(now) & ")'/>"
response.write "</go></anchor><br/>"

End Function


Function OK()
dim iid,cz,over,bl,jf,dj,paag,title,url
iid=request("iid")
cz=request("cz")
over=request("over")
bl=request("bl")
jf=request("jf")
dj=request("dj")
paag=request("paag")
title=request("title")
url=request("url")
ad=request("ad")

if cz="add" then
dim rrs,sqlr
set rrs=server.createobject("ADODB.Recordset")
sqlr="select idd from admin where idd=" & iid
rrs.open sqlr,myc,1,2
   if not rrs.eof then
response.write "该ID已经是管理员了,请不要重复添加!<br/>"
	else
rrs.addnew
rrs("idd")=iid
rrs.update
response.write "添加成功!<br/>"
   end if
rrs.close
set rrs=nothing

elseif cz="del" then

  sql="delete from admin Where idd=" & id
  myc.Execute(sql)
response.write "删除成功!<br/>"

elseif cz="up" then

dim rs,sql
set rs=server.createobject("ADODB.Recordset")
sql="select * from admin where idd=1"
rs.open sql,myc,1,2

if over<>"" then rs("overtime")=over
if bl<>"" then rs("bl")=bl
if jf<>"" then rs("jf")=jf
if dj<>"" then rs("dj")=dj
if paag<>"" then rs("pag")=paag
if title<>"" then rs("title")=title
if url<>"" then rs("url")=url
if ad<>"" then rs("ad")=ad
rs.update
response.write "修改成功!<br/>"

end if
response.write "<br/><a href='gl.asp?SessionID=" & SessionID & "'>返回管理</a><br/>"
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
	ElseIf Request.QueryString("ck") = "ee" Then
		EEE
	ElseIf Request.QueryString("ck") = "ff" Then
		FFF
	ElseIf Request.QueryString("ck") = "ok" Then
		OK
	End If
End Function
End If
%>
<%=NNN%>
<%else%>
警告!!你不是站长,无法进行操作!!!<br/>
<%end if%>
<a href="adminltgform.asp?SessionID=<%=SessionID%>">公共聊室管理</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">回聊室列表</a><br/>
<!--#include file="aa.asp"-->
<%
myc.close
set myc=nothing
%>
</p>
</card>
</wml>