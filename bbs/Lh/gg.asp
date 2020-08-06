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
<%
dim ky,kyzc
  ky=request.querystring("ky")
  kyzc=request.querystring("kyzc")
  if ky="" or ky>7 or ky<1 then
	ky=7
  end if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=" & ky & ""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
     response.end
    End if

iduse=Session("useid")
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
%>
标题:2008年-生肖-波色-五行表<br/>
-------------<br/>
生肖表：<br/>
  鼠:01-13-25-37-49<br/>
  猪:02-14-26-38<br/>
  狗:03-15-27-39<br/>
  鸡:04-16-28-40<br/>
  猴:05-17-29-41<br/>
  羊:06-18-30-42<br/>
  马:07-19-31-43<br/>
  蛇:08-20-32-44<br/>
  龙:09-21-33-45<br/>
  兔:10-22-34-46<br/>
  虎:11-23-35-47<br/>
  牛:02-14-26-38<br/>
  波色不变！<br/>
  五行表：<br/>
  金：08.09.16.17.24.25.38.39.46.47.<br/>
  木：06.07.20.21.28.29.36.37.<br/>
  水：04.05.12.13.26.27.34.35.42.43.<br/>
  火：01.14.15.22.23.30.31.44.45.<br/>
  土：02.03.10.11.18.19.32.33.40.41.48.49.<br/>
----------<br/>

<a href="/BBS/LHC/Index.Asp?SessionID=<%=SessionID%>">返回虚拟博彩</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
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