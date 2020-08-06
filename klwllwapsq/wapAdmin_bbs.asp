<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.asp"-->
<!--#include FILE="check.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="社区管理" >
<p align="center">
==社区管理==<br/>
<a href="yxxe_bbs_sz.asp?adminmid=<%=request("adminmid")%>">社区设置</a>◆<a href="yxxe_bbs_tjwp.asp?adminmid=<%=request("adminmid")%>">物品管理</a><br/>
<a href="BBSBoard.asp?adminmid=<%=request("adminmid")%>">版块管理</a>◆<a href="wap_admin_affiche.asp?adminmid=<%=request("adminmid")%>">公告管理</a><br/>
<a href="BBSBoard.asp?Action=BBSTopic&amp;adminmid=<%=request("adminmid")%>">贴子管理</a>◆<a href="BBSBoard.asp?Action=BBSReply&amp;adminmid=<%=request("adminmid")%>">回复管理</a><br/>
<a href="yxxe_bbs_bbzz.asp?adminmid=<%=request("adminmid")%>">版主管理</a>◆<a href="BBSBoard.asp?Action=BBSLog&amp;adminmid=<%=request("adminmid")%>">操作记录</a><br/>
<a href="Kyzc_Usegl.asp?Action=main&amp;adminmid=<%=request("adminmid")%>">会员管理</a>◆<a href="wapadmin_index.asp?kyzc=useaq&amp;adminmid=<%=request("adminmid")%>">帐号管理</a><br/>
<a href="yxxe_bbs_mes.asp?adminmid=<%=request("adminmid")%>">消息管理</a>◆<a href="wap_Admin_delzl.asp?adminmid=<%=request("adminmid")%>">帖子回收</a><br/>
------------<br/>
<a href="wapAdmin_index.asp?adminmid=<%=request("adminmid")%>">返回管理首页</a><br/>
<a href="/index.asp?adminmid=<%=request("adminmid")%>">返回网站首页</a>
<br/>
<small><% 
dim kkwap,distime
kkwap=""
if Month(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Month(date)&"月"
if Day(date)<10 then kkwap=kkwap&"0"
kkwap=kkwap&Day(date)
response.write kkwap
Response.write"日("
Response.write right(""&WeekDayName(DatePart("w",Now)),1)
Response.write")"
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%></small><br/>
</p></card>
</wml>