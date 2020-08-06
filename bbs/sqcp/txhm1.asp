<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<card id="card1" title="特码投注">
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

%>
特码投注.输入1至49之间的数字<br/>
<input  name="memo"  value="1" format="*N" maxlength="2"/>
<br/>购买金额:
<br/><input  name="ks"  value="100" format="*N" maxlength="10"/>
<br/><anchor>[-购买-]
<go method="post" href="/bbs/sqcp/txhmcl1.asp?SessionID=<%=SessionID%>">
<postfield name="memo" value="$(memo)"/>
<postfield name="ks" value="$(ks)"/>
</go>
</anchor><br/>
<%
dim idss,ckjhm
set objgbr=Server.CreateObject("ADODB.Recordset")
ssql="select * from ckjhm"
  objgbr.open ssql,conn,1,1

if objgbr.eof then
   'Response.write "晕晕的...还没开奖呢!<br/>"
else
objgbr.movelast
idss=objgbr("id")
kjtime=objgbr("kjtime")
idssl=objgbr("id")+1
response.write "本期是第<b>"&idssl&"</b>期<br/>"
end if
objgbr.close
Set objgbr= Nothing
%>
-------------
<br/><a href='/bbs/sqcp/sqcp.asp?SessionID=<%=SessionID%>'>返回社区彩票</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>

</p></card></wml>