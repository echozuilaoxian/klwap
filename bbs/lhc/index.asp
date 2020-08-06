<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#include file="conn.inc"-->
<!--#include file="cnscucsb.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
set rxs=Server.CreateObject("ADODB.Recordset")
rsxQL="select * from cpjf where cstr(ids)='"&iduse& "'"
rxs.open rsxQL,myc,1,2
if rxs.recordcount<1 then
rxs.addnew
rxs("ids")=iduse
rxs.update
end if
        rxs.Close
	Set rxs=Nothing
%>
<card id='main' title='<%=ubb(title)%>'>
<p align='<%=duiji%>'>
<%

 if logo<>"" then 
    response.write "<img src='"&logo&"' alt='"&ubb(Url)&"'/><br/>"
end if

if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
End if

Response.write "欢迎您<b>"&ubb(gfdsa)&"</b>!<br/>"


set objgbrx=Server.CreateObject("ADODB.Recordset")
ssqlx="select * from ckjhm"
  objgbrx.open ssqlx,myc,1,1
if objgbrx.EOF then
idss="1"
idssl="1"
else
objgbrx.movelast
idss=objgbrx("idss")
tms=objgbrx("tm")
pms=objgbrx("pm")
dss=objgbrx("ds")
dxs=objgbrx("dx")
pss=objgbrx("ps")
sxs=objgbrx("sx")
wxs=objgbrx("wx")
idssl=objgbrx("idss")+1
end if


sql="select top 1 * from affiche order by AfficheId desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,myc,1,1
if rs.eof and rs.bof then
	'response.write "&#x6682;&#x65E0;&#x516C;&#x544A;<br/>"
else
   do while not rs.eof
    Response.write "<a href='/BBS/lhc/affiche.asp?id=" & rs("AfficheId") & "&amp;kyzc=yxxe&amp;SessionID="&SessionID&"'>[公告]"&ubb(rs("AfficheName"))&"</a><br/>"
	rs.movenext
	loop
	end if
	rs.close
	set rs=nothing

Response.write "<b>第"&idssl&"</b>期开奖时间:"&ubb(wel)&"<br/>"
if idss<>1 then
Response.write "<b>第"&idss&"</b>期"&pms&"<b>特:"&tms&"("&wxs&"/"&dss&"/"&dxs&"/"&pss&"/"&sxs&")</b><br/>"
end if

myc.close
set myc=nothing
%>
---------------<br/>
<a href="/BBS/LHC/xz.Asp?SessionID=<%=SessionID%>">我要投注</a>|<a href="/BBS/LHC/tzjl.Asp?SessionID=<%=SessionID%>">网友投注</a><br/>
<a href='/BBS/LHC/TOP.Asp?kyzc=yxxe&amp;idsx=<%=iduse%>&amp;SessionID=<%=SessionID%>'>我的状态</a>|<a href="/BBS/LHC/Kjjl.Asp?SessionID=<%=SessionID%>">开奖记录</a><br/>
<a href="/BBS/LHC/Mytz.Asp?SessionID=<%=SessionID%>">我的投注</a>|<a href="/BBS/LHC/Top.Asp?SessionID=<%=SessionID%>">中奖排行</a><br/>
<a href="/BBS/LHC/kyaa_cn.asp?SessionID=<%=SessionID%>">号码属性</a>|<a href="/BBS/LHC/TransferCenter.asp?SessionID=<%=SessionID%>">港币兑换</a><br/>
<% 
response.write"<a href='/BBS/Forum_Content/ContentlisT.asp?ForumID=27&amp;SessionID="&SessionID&"'>交流论坛</a>|<a href='/BBS/zhong/Index.asp?SessionID="&SessionID&"'>相关资料</a><br/>"
%>
---------------<br/>
<a href="/BBS/public/gygl.asp?SessionID=<%=SessionID%>">我的地盘</a>|<a href="/BBS/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
<%
if Session("Counter")="pass_numbers_55556666" or Session("cg")<>"" or Session("yxxecp")<>"" then

Response.write "<a href='/BBS/LHC/Admin.Asp?SessionID="&SessionID&"'>后台管理-开奖操作</a><br/>"
end if
%>
<% 
dim kkwap,distime
kkwap=""
if Month(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Month(date)&"&#x6708;"
if Day(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Day(date)
response.write kkwap
Response.write"&#x65E5;("
Response.write right(""&WeekDayName(DatePart("w",Now)),1)
Response.write")"
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%><br/>
</p></card></wml>