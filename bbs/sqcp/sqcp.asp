<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/sqcp/bqzj.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="社区彩票">
<p align="left">
<img src='/bbs/sqcp/cp/logo.gif' alt='logo'/><br/>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")
lasttlls="321"
lasttls

if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x4FE1;&#x606F;!</a><br/><br/>"
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
End if
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

response.write "-------------<br/>"
response.write "<a href='/bbs/sqcp/txhm.asp?SessionID=" & SessionID & "'>+|购买彩票</a><br/>"
response.write "<a href='/bbs/sqcp/wdhm.asp?SessionID=" & SessionID & "'>+|我的号码</a><br/>"
response.write "<a href='/bbs/sqcp/qbhm.asp?SessionID=" & SessionID & "'>+|本期号码</a><br/>"
response.write "<a href='/bbs/sqcp/zjpx.asp?SessionID=" & SessionID & "'>+|幸运前十</a><br/>"
response.write "<a href='#card2'>+|彩票说明</a><br/>"
response.write "-------------<br/>"
response.write "<a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a><br/>"
response.write "<a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>系统自动开奖,如果中奖系统会发信通知你"
Response.write "</p></card>"%>

<card id="card2" title="彩票说明">
<p>
恭喜中奖!
<br/>----------<br/>
1.每张彩票50个金币,5分钟开奖一次.开奖号码随机产生的5个数字.<br/>
2.你可填入任意5位的数字(其它无效),如:12345,98765,等等<br/>
3.后两位数和开奖号码后两位数相同则为三等奖,后三位数和开奖号码的后三位数相同则为二等奖,以此类推,五位数全相同则中特等奖!<br/>
4.中奖的系统将自动发信通知并自动把奖金加到你的账户中。<br/>
中奖赔率如下<br/>
特等奖:奖金3000000 金币<br/>
一等奖:奖金300000 金币<br/>
二等奖:奖金30000 金币<br/>
三等奖:奖金3000 金币<br/>
----------<br/>  
<a href="sqcp.asp?SessionID=<%=SessionID%>">返回彩票中心</a>
<br/><a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
</p> 
</card>
</wml>



