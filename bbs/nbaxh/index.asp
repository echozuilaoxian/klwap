<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
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
sql="select top 1 * from affiche order by AfficheId desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,myc,1,1
if rs.eof and rs.bof then
	'response.write "&#x6682;&#x65E0;&#x516C;&#x544A;<br/>"
else
   do while not rs.eof
    Response.write "[公告]<a href='affiche.asp?id=" & rs("AfficheId") & "&amp;kyzc=yxxe&amp;SessionID="&SessionID&"'>"&ubb(rs("AfficheName"))&"</a><br/>"
	rs.movenext
	loop
	end if
	rs.close
	set rs=nothing
Response.write "<img src='http://kong.net/nba/board.jsp' alt=''/><br/>"
set objgbrc=Server.CreateObject("ADODB.Recordset")
ssql6="select * from ckjhm where tm='t'  order by id desc"
  objgbrc.open ssql6,myc,1,1
if objgbrc.EOF then
Response.write "暂时没有未结束的球赛.<br/>"
else
objgbrc.PageSize=5
pages =CLng(Request("pages"))
if pages<1 then pages=1
if pages>objgbrc.PageCount then pages=objgbrc.PageCount
objgbrc.absolutepage=pages
if pages=1 then
bihao=0
else
bihao=pages*5-5
End if
For k=1 to objgbrc.PageSize 
 bihaocont=bihaocont+1
Response.write bihao+bihaocont & "." & "第" &objgbrc("id")& "场:<br/>球赛时间:" & objgbrc("kjtimes") & "<br/>" & objgbrc("ds") & "VS" & objgbrc("dx") & "<br/>说明:" & objgbrc("sx") & "<br/>赔率:1:" & objgbrc("jss") & "<br/>投注截止时间:" & objgbrc("kjtime") & ""
Response.write "<br/>==<a href='xz.Asp?kd=" & objgbrc("id") &"&amp;SessionID=" & SessionID & "'>我要投注</a>==<br/>"
objgbrc.Movenext
if objgbrc.EOF then Exit for
 Next
End if
If pages<objgbrc.PageCount then
Response.Write "<a href='index.asp?pages=" & (pages+1) & "&amp;SessionID=" & SessionID & "'>下页</a>"
End if
If pages>1 then
Response.Write "|" & "<a href='index.asp?pages=" & (pages-1) & "&amp;SessionID=" & SessionID & "'>上页</a>"
End if
if objgbrc.PageCount>1 then
response.write "(" & pages & "/" & objgbrc.PageCount & ")<br/>"

End if
objgbrc.close
Set objgbrc= Nothing

%>
---------------<br/>
<a href="TransferCenter.asp?SessionID=<%=SessionID%>">球币兑换</a>.<a href="tzjl.asp?SessionID=<%=SessionID%>">网友投注</a><br/>
<a href='TOP.Asp?kyzc=yxxe&amp;idsx=<%=iduse%>&amp;SessionID=<%=SessionID%>'>我的状态</a>.<a href="kjjl.asp?SessionID=<%=SessionID%>">开奖记录</a><br/>
<a href="mytz.asp?SessionID=<%=SessionID%>">我的投注</a><br/>


---------------<br/>
<a href="/BBS/public/gygl.asp?SessionID=<%=SessionID%>">我的地盘</a>|<a href="/BBS/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
<%
if Session("Counter")="pass_numbers_55556666" or Session("cg")<>"" or Session("yxxecp")<>"" then
Response.write "<a href='Admin.Asp?SessionID="&SessionID&"'>后台管理-开奖操作</a><br/>"
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