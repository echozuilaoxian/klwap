<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<% LANGUAGE="VBSCRIPT" %>
<!--#INCLUDE file="conn.asp"-->
<!--#INCLUDE file="conn1.asp"-->
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
txt=request("txt")
name=request("name")
lid=request("lid")
ids=session("useid")
yc=request("yc")
%>
<!--===以下为判定银子数量===-->
<%
set rspq=Server.CreateObject("ADODB.Recordset")
strSQL="select yz from wupin where cstr(ids)="&ids
rspq.open strSQL,liao,1,1
%>

<!--====[以下为银子足够]=====-->

<!--==开始读出资料==-->
<%
set rsp=Server.CreateObject("ADODB.Recordset")
strSQL="select dj,gj,fs,jy,tl,jj,xx,sd from sx where cstr(ids)="&ids
rsp.open strSQL,liao,1,1
dengji=clng(rsp("dj"))
mygj=rsp("gj")
myfs=rsp("fs")
myjy=rsp("jy")
mytl=rsp("tl")
myjj=rsp("jj")
myxx=rsp("xx")
mysd=rsp("sd")
rsp.close
set rsp=nothing
%>
<!--==开始储存资料==-->
<%
set rs=Server.CreateObject("ADODB.Recordset")
rsstr="select * from [tz] order by ID desc"
rs.open rsstr,liao,1,2
'----开始判断---
dim errr
errr=0
if rs.recordcount>0 then
	if rs("txt")=txt then errr=1
        if rspq("yz")<clng(txt) then errr=2
end if
'---表示输出---
if errr=1 then eer="请不要重复发布，<br/>正在返回江湖大厅！<br/>"
if errr=2 then eer="您的银子不够！<br/>正在返回江湖大厅！<br/>"
if errr<>1 and errr<>2 then
'---成功通过---
rs.addnew
'---开始储存---
if txt<>"" then rs("txt")=txt
rs("lid")=lid
rs("name")=name
rs("yc")=yc
rs("ids")=ids
rs("tl")=mytl
rs("jy")=myjy
rs("gj")=mygj
rs("fs")=myfs
rs("dj")=dengji
rs("jj")=myjj
rs("sd")=mysd
rs("xx")=myxx
rs.update

end if


if rs.recordcount=0 then
rs.addnew

if txt<>"" then rs("txt")=txt


rs("lid")=lid
rs("name")=name
rs("yc")=yc
rs("ids")=ids
rs("tl")=mytl
rs("jy")=myjy
rs("gj")=mygj
rs("fs")=myfs
rs("dj")=dengji
rs("jj")=myjj
rs("sd")=mysd
rs("xx")=myxx
rs.update
end if

rs.close
set rs=Nothing
liao.close
set liao=nothing
%>
<!--==开始输出结果==-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="发布成功">
<p>
<%if eer="" then%>
<%sql="update wupin set yz=yz-"&txt&" where cstr(ids)="&ids
  conn.Execute(sql)%>
挑战信息发布成功，<br/>
系统暂时扣除银子<%=txt%>两
<br/>
取消或结束挑战时候会返还
<br/>
<%else%>
<%=eer%>
<%end if%>
----------<br/>
<anchor><prev/>快速返回</anchor><br/>

</p>
</card>
</wml>