<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="汇款转帐"><p>
<img src='money.gif' alt='人民银行'/><br/>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")

if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
      else
        Session("ltlybz")=""
    End if

Server.ScriptTimeout=999
iduse=Session("useid")
dim id
id=request("id")
lasttlls="60"
lasttls
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & iduse & "' and DATEDIFF('s', regtimes, now()) > 21600*60"
    objgbrs.open sql,conn
if objgbrs.eof then
    response.write "您注册的时间还不满半个月，暂时不能转帐！"
   else
    response.write "银行帐户余额:" & objgbrs("bank") & "金币,身上现有:" & objgbrs("usejf") & "金币"%>
<br/>ＩＤ帐号:<input type='text' format="*N" name='id' maxlength="9"/>
<br/>输入金额:<input name="gfjf" value="100" format="*N" maxlength="9"/>
<br/><anchor>确定转帐<%
 response.write "<go method='post' href='bankzzcl.asp?SessionID="& SessionID &"'>"%>
<postfield name="gfjf" value="$(gfjf)"/>
<postfield name="id" value="$(id)"/>
</go>
</anchor>
<% end if %>
<br/>-------------
<br/><a href='bank.asp?SessionID=<%=SessionID%>'>返回社区银行</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p></card>
<%
Set objgbrs= Nothing
conn.close
set conn=nothing
%>
</wml>



