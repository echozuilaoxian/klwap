<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="六合虚拟博彩" >
<p>
<img src="http://iiwap.cn/logo0.gif" alt="kyaa.cn"/><br/>
<%
dim ky,kyzc
  ky=request.querystring("ky")
  kyzc=request.querystring("kyzc")
  if ky="" or ky>8 or ky<1 then
	ky=8
  end if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=" & ky & ""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
     response.end
    End if

iduse=Session("useid")
lasttlls="322"
lasttls
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=" & ky & ""
End if

iduse=Session("useid")
gfdsa=Session("ltname")

set rs=Server.CreateObject("ADODB.Recordset")
rsQL="select * from cpjf where cstr(ids)='"&iduse& "'"
rs.open rsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=iduse
rs.update
end if
        rs.Close
	Set rs=Nothing

set objgbrx=Server.CreateObject("ADODB.Recordset")
ssqlx="select * from ckjhm"
  objgbrx.open ssqlx,conn,1,1
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

Response.write "欢迎您<b>"&converttowidebaiti(gfdsa)&"</b>!<br/>"
Response.write "<a href='/BBS/lHc/GG.asp?SessionID="&SessionID&"'>2008年-生肖-波色-五行表</a><br/>"
Response.write "<b>第"&idssl&"</b>期开奖时间:"&converttowidebaiti(Systemhy)&"<br/>"
if idss<>1 then
Response.write "<b>第"&idss&"</b>期"&pms&"<b>特:"&tms&"("&wxs&"/"&dss&"/"&dxs&"/"&pss&"/"&sxs&")</b><br/>"
end if
%>
---------------<br/>

<a href="/BBS/LHC/xz.Asp?SessionID=<%=SessionID%>">我要投注</a>|<a href="/BBS/LHC/tzjl.Asp?SessionID=<%=SessionID%>">网友投注</a><br/>
<a href='/BBS/LHC/TOP.Asp?kyzc=yxxe&amp;idsx=<%=iduse%>&amp;SessionID=<%=SessionID%>'>我的状态</a>|<a href="/BBS/LHC/Kjjl.Asp?SessionID=<%=SessionID%>">开奖记录</a><br/>
<a href="/BBS/LHC/Mytz.Asp?SessionID=<%=SessionID%>">我的投注</a>|<a href="/BBS/LHC/Top.Asp?SessionID=<%=SessionID%>">中奖排行</a><br/>
<a href="/BBS/lHc/GG.asp?SessionID=<%=SessionID%>">号码属性</a>|随机选号<br/>
---------------<br/>
<a href="/BBS/public/gygl.asp?SessionID=<%=SessionID%>">我的地盘</a>|<a href="/BBS/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
<%
if Cstr(Session("yxxezb"))<>"" or Cstr(Session("yxxexc"))<>"" or Session("Counter")="pass_numbers_55556666" then
Response.write "<a href='/BBS/LHC/kjhm.Asp?SessionID="&SessionID&"'>后台管理-开奖操作</a><br/>"
end if
%>
<small><% 
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
%></small><br/>
</p></card></wml>
<%conn.close
set conn=nothing%>