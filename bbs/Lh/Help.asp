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
管理帮助<br/>
-------------<br/>
说明,请不要随意开奖,否则造成很大的麻烦<br/><br/>

关于:<b><u>投注状态:开放|关闭</u></b><br/>
投注状态，如果是开奖日,请于晚上19:30左右进入后台点击关闭,这样网友就无法在19：30~22：00这个时段下注<br/>

只要过了这个时段就算你没有点击 开放 网友也可以正常下注... 有了这个功能你就可以在当晚的 22:00至次日19:30之前任何时段点开放按钮都可以<br/>



<br/>
关于:<b><u>开奖期数:</u></b>没特殊原因不要变动！<br/>

如果要开奖必须得到当期真实的开奖数据,并且认真填写开奖数据,确认无误后点击“<b><u>[-确定-]</u></b>”即开奖完毕！若点击“<b><u>[-确定-]</u></b>”长时间没反应,也不能再次点击,你必须返回博彩首页看当期的期数是否对应,如果期数不变那就证明刚才的操作无效,可返回继续操作, 尽量在最早时间(以现实六合开奖时间为准)内开奖<br/>

----------<br/>
<a href="/BBS/LHC/kjhm.Asp?SessionID=<%=SessionID%>">返回后台管理</a><br/>
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