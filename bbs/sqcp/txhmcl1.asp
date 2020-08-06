<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
  dim memo,ks
id=Session("useid")
memo=clng(request("memo"))
ks=clng(request("ks"))
if memo>49 or memo<1 then
  response.write "<card id='card1' title='购买错误' ontimer='/bbs/sqcp/txhm1.asp?SessionID=" &SessionID & "'><timer value='20'/><p align='left'>请填写1~49之间的数字,正在返回...<br/><br/><a href='/bbs/sqcp/sqcp.asp?SessionID=" &SessionID & "'>[社区彩票]</a><br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>[社区首页]</a></p></card></wml>"
response.end
end if

Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn
  if ks>objgbrs("usejf") then
 response.write "<card id='card1' title='购买错误' ontimer='/bbs/sqcp/sqcp.asp?SessionID=" &SessionID & "'><timer value='20'/><p align='left'>您的金币不够,正在返回...<br/><br/><a href='/bbs/sqcp/sqcp.asp?SessionID=" &SessionID & "'>[社区彩票]</a><br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>[社区首页]</a></p></card></wml>"
     conn.close
     set conn=nothing
     response.end
  end if

sql="insert into ctm(ids,ks,hm)values("
sql=sql & sqlstr(id) & "," 
sql=sql & sqlstr(ks) & "," 
sql=sql & sqlstr(memo) & ")"
   conn.execute sql
   sql="update usereg set usejf=usejf-'" & ks & "' where CStr(id)='" & id & "'"
conn.execute sql
application.unlock
  objgbrs.close
Set objgbrs= Nothing
conn.close
  set conn=nothing
 response.write "<card id='card1' title='购买成功' ontimer='txhm1.asp?SessionID=" &SessionID & "'><timer value='18'/><p align='left'>购买成功!<br/>号码已入库,扣除金币" & ks & "枚金币,恭喜中奖!正在返回...<br/><a href='txhm1.asp?SessionID=" &SessionID & "'>[继续购买]</a><br/><br/><a href='/bbs/sqcp/sqcp.asp?SessionID=" &SessionID & "'>[社区彩票]</a><br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>[社区首页]</a></p></card></wml>"
%>



