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
<%
response.write "<card id='card1' title='"&converttowidebaiti(SystemSiteName)&"人民银行'><p>"
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
      else
        Session("ltlybz")=""
    End if
%>
<img src='money.gif' alt='人民银行'/><br/>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
mon=request("mon")
lasttlls="162"
lasttls
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
if mon="" or mon="1" then
 if Len(objgbrs("banktime"))>5 then
      if day(objgbrs("banktime"))<>day(now) then
          interest=ccur(objgbrs("bank"))*int(datediff("d",cdate(objgbrs("banktime")),cdate(now())))*0.001
          subinterest=ccur(objgbrs("subbank"))*int(datediff("d",cdate(objgbrs("banktime")),cdate(now())))*0.1
          sql="update usereg set bank=bank+" & interest & ",subbank=subbank+" & subinterest & ",banktime=now() Where CStr(id)='" & iduse & "'"
          Application.Lock
          conn.execute(sql)
          Application.Unlock
          objgbrs.close
          set objgbrs=nothing
          Set objgbrs=Server.CreateObject("ADODB.Recordset")
          sql="select * from usereg where CStr(id)='" & iduse & "'"
          objgbrs.open sql,conn
       end if
         response.write "客户:" & converttowidebaiti(Session("ltname")) & "您好!<br/>你要办什么事务呢?<br/><a href='bank.asp?mon=2&amp;SessionID="&SessionID&"'>+|我要存款</a><br/><a href='bank.asp?mon=3&amp;SessionID="&SessionID&"'>+|我要取款</a><br/><a href='bank.asp?mon=4&amp;SessionID="&SessionID&"'>+|我要贷款</a><br/><a href='bank.asp?mon=5&amp;SessionID="&SessionID&"'>+|我来还贷</a><br/><a href='bankzz.asp?SessionID="&SessionID&"'>+|我来转帐</a><br/><a href='bank.asp?mon=6&amp;SessionID="&SessionID&"'>+|账户查询</a><br/><a href='/bbs/public/zzjl.asp?SessionID="&SessionID&"'>+|转帐记录</a><br/>存款利率:0.001% <u>比如: 存款100000金币每天的利率是100</u><br/>贷款利率:10% <u>比如: 贷款1000金币每天的贷款利率是100</u><br/>过户,转帐手续:0.5%,200以下扣1元"
     else
         response.write "你还未开户,请问现在开户吗?手续费10元！<br/><a href='opbank.asp?SessionID="&SessionID&"'>+|我要开户</a>"
end if

else
if mon="2" then
response.write "你现有金币:"&objgbrs("usejf") &"<br/>存入金币:<br/><input name='input' value='100' format='*N' maxlength='10'/><br/><anchor>提 交<go method='post' href='inputcl.asp?SessionID="&SessionID&"'><postfield name='input' value='$(input)'/></go></anchor>"
else
if mon="3" then
response.write "你现有存款:"&objgbrs("bank")&"<br/>取出金币:<br/><input name='out' value='100' format='*N' maxlength='10'/><br/><anchor>提 交<go method='post' href='outcl.asp?SessionID="&SessionID&"'><postfield name='out' value='$(out)'/></go></anchor>"
else
if mon="4" then
response.write "您已贷款:"&objgbrs("subbank")&"<br/>(贷款最高限制2000金币！)<br/>现想贷款:<br/><input name='tan' value='500' format='*N'/><br/><anchor>提 交<go method='post' href='subbankcl.asp?SessionID="&SessionID&"'><postfield name='tan' value='$(tan)'/></go></anchor>"
else
if mon="5" then
response.write "您已贷款:"&objgbrs("subbank")&"<br/>现有金币:"&objgbrs("usejf")&"<br/>想还多少？<br/><input name='retan' value='100' format='*N'/><br/><anchor>提 交<go method='post' href='retan.asp?SessionID="&SessionID&"'><postfield name='retan' value='$(retan)'/></go></anchor>"
else
if mon="6" then
response.write "银行利息在你点进银行的同时系统自动给你加进了你的银行账户.<br/>共资产:"&objgbrs("usejf")+objgbrs("bank")&"<br/>银行贷款:"&objgbrs("subbank")&"<br/>银行存款:"&objgbrs("bank")&"<br/>你身上的金币:"&objgbrs("usejf") &"<br/>最近交易:"&objgbrs("banktime")
end if
end if
end if
end if
end if
end if
Set objgbrs= Nothing
conn.close
set conn=nothing
%>
<br/>------------
<%if mon<>"" then%>
<br/><a href='bank.asp?SessionID=<%=SessionID%>'>返回社区银行</a>
<%end if%>
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>返回我的地盘</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a></p></card></wml>