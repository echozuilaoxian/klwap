<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/sqcp/bqzj.asp"-->
<wml>
<card id="card1" title="购买号码">
<p align="left">
<%SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")
if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
End if
gmhm=int(rnd*90000)+10000
%>
购买号码.彩票每张50金币,
输入您幸运的5个数字吧
<br/><input  name="memo<%=minute(now)%><%=second(now)%>"  value="<%=gmhm%>" format="*N" maxlength="5"/>
<br/><anchor>[-购买-]
<go method="post" href="/bbs/sqcp/txhmcl.asp?SessionID=<%=SessionID%>">
<postfield name="memo" value="$(memo<%=minute(now)%><%=second(now)%>)"/>
</go>
</anchor><br/>

<%
dim idss,zjhm
set objgbr=Server.CreateObject("ADODB.Recordset")
ssql="select * from zjhm"
  objgbr.open ssql,conn,1,1

if objgbr.eof then
   'Response.write "晕晕的...还没开奖呢!<br/>"
else
objgbr.movelast
idss=objgbr("idss")
zjhm=objgbr("zjhm")
kjtime=objgbr("kjtime")
idssl=objgbr("idss")+1
response.write "本期是第<b>"&idssl&"</b>期<br/>"
kjtimes=times+10*0.0004
kjtimed=DateDiff("s",now(),kjtimes)
if kjtimed>1 then
response.write "开奖时间:"&kjtimes&"<br/>"
response.write "开奖倒计:"&kjtimed&"秒<br/>现在时间:"&now&"<br/>"
end if
response.write "-------------<br/>第<b>"&idss&"</b>期开奖号码:<b>"&zjhm&"</b><br/>开奖时间:"&kjtime&"<br/>"
end if
objgbr.close
Set objgbr= Nothing
%>
-------------
<br/><a href='/bbs/sqcp/sqcp.asp?SessionID=<%=SessionID%>'>返回社区彩票</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>

</p></card></wml>