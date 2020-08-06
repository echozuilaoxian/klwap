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
  dim memo,ks,Systcpkg
If Systcpkg<>"1" and (time<#22:00:00# or Time>#19:30:00#) Then
  response.write "<card id='card1' title='已经停止下注' ontimer='/BBS/LHC/index.Asp?SessionID=" &SessionID & "'><timer value='300'/><p align='left'>系统提示.开奖日19:30至22:00时段 禁止下注,正在返回...<br/>-------------<br/><a href='/BBS/LHC/index.Asp?SessionID=" &SessionID & "'>返回虚拟博彩</a><br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if

id=Session("useid")
memo=request("memo")
ks=request("ks")
idss=request("id")
ky=request("ky")

if ky="1" then tip="特码投注"
if ky="2" then tip="生肖投注"
if ky="3" then tip="单双投注"
if ky="4" then tip="波色投注"
if ky="5" then tip="大小投注"
if ky="6" then tip="五行投注"

if memo="" or ks="" or idss="" then
  response.write "<card id='card1' title='购买错误' ontimer='/BBS/LHC/xz.Asp?ky=" & ky & "&amp;SessionID=" &SessionID & "'><timer value='20'/><p align='left'>各项不能为空,正在返回...<br/>-------------<br/><a href='/BBS/LHC/index.Asp?SessionID=" &SessionID & "'>返回虚拟博彩</a><br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if

if clng(ks)<100 then
  response.write "<card id='card1' title='购买错误' ontimer='/BBS/LHC/xz.Asp?ky=" & ky & "&amp;SessionID=" &SessionID & "'><timer value='20'/><p align='left'>下注金额不能低于100,正在返回...<br/>-------------<br/><a href='/BBS/LHC/index.Asp?SessionID=" &SessionID & "'>返回虚拟博彩</a><br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if

if ky="1" then
if clng(memo)>49 or clng(memo)<1 then
  response.write "<card id='card1' title='购买错误' ontimer='/BBS/LHC/xz.Asp?ky=" & ky & "&amp;SessionID=" &SessionID & "'><timer value='20'/><p align='left'>请填写1~49之间的数字,正在返回...<br/>-------------<br/><a href='/BBS/LHC/index.Asp?SessionID=" &SessionID & "'>返回虚拟博彩</a><br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if
end if

Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn

  if clng(ks)>objgbrs("usejf") then
 response.write "<card id='card1' title='购买错误' ontimer='/BBS/LHC/xz.Asp?ky=" & ky & "&amp;SessionID=" &SessionID & "'><timer value='20'/><p align='left'>您的金币不够,你只有"&objgbrs("usejf")&"枚金币。正在返回...<br/>-------------<br/><a href='/BBS/LHC/index.Asp?SessionID=" &SessionID & "'>返回虚拟博彩</a><br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>返回社区首页</a></p></card></wml>"
     conn.close
     set conn=nothing
     response.end
  end if

if ky="1" then
sql="insert into ctm(ids,ks,idss,hm)values("
sql=sql & sqlstr(id) & "," 
sql=sql & sqlstr(ks) & ","
sql=sql & sqlstr(idss) & ","
sql=sql & sqlstr(memo) & ")"
   conn.execute sql

elseif ky="2" then
sql="insert into csx(ids,ks,idss,hm)values("
sql=sql & sqlstr(id) & "," 
sql=sql & sqlstr(ks) & "," 
sql=sql & sqlstr(idss) & ","
sql=sql & sqlstr(memo) & ")"
   conn.execute sql

elseif ky="3" then
sql="insert into cds(ids,ks,idss,hm)values("
sql=sql & sqlstr(id) & "," 
sql=sql & sqlstr(ks) & "," 
sql=sql & sqlstr(idss) & ","
sql=sql & sqlstr(memo) & ")"
   conn.execute sql

elseif ky="4" then
sql="insert into cps(ids,ks,idss,hm)values("
sql=sql & sqlstr(id) & "," 
sql=sql & sqlstr(ks) & "," 
sql=sql & sqlstr(idss) & ","
sql=sql & sqlstr(memo) & ")"
   conn.execute sql

elseif ky="5" then
sql="insert into cdx(ids,ks,idss,hm)values("
sql=sql & sqlstr(id) & "," 
sql=sql & sqlstr(ks) & "," 
sql=sql & sqlstr(idss) & ","
sql=sql & sqlstr(memo) & ")"
   conn.execute sql

elseif ky="6" then
sql="insert into cwx(ids,ks,idss,hm)values("
sql=sql & sqlstr(id) & "," 
sql=sql & sqlstr(ks) & "," 
sql=sql & sqlstr(idss) & ","
sql=sql & sqlstr(memo) & ")"
   conn.execute sql

end if

sql="update usereg set usejf=usejf-'" & ks & "' where CStr(id)='" & id & "'"
conn.execute sql
application.unlock

sql="update cpjf set cmrjf=cmrjf+'" & ks & "' where CStr(ids)='" & id & "'"
conn.execute sql
application.unlock

  objgbrs.close
Set objgbrs= Nothing
conn.close
  set conn=nothing
response.write "<card id='card1' title='"&tip&"' ontimer='/BBS/LHC/xz.Asp?ky=" & ky & "&amp;SessionID=" &SessionID & "'><timer value='18'/><p align='left'>"&tip&"-购买成功!<br/>号码已入库,扣除" & ks & "枚金币,恭喜中奖!正在返回...<br/><a href='/BBS/LHC/xz.Asp?ky=" & ky & "&amp;SessionID=" &SessionID & "'>继续购买</a><br/>-------------<br/><a href='/BBS/LHC/index.Asp?SessionID=" &SessionID & "'>返回虚拟博彩</a><br/><a href='/bbs/index.asp?SessionID=" &SessionID & "'>返回社区首页</a></p></card></wml>"
%>