<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#include file="conn.inc"-->
<!--#include file="cnscucsb.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>

<%
  dim memo,ks,id,idc,cpkg

If cpkg<>"1" Then
  response.write "<card id='card1' title='停止下注' ontimer='/BBS/LHC/index.Asp?SessionID=" & SessionID & "'><timer value='300'/><p align='left'>系统提示.开奖日19:30至21:30时段 禁止下注,正在返回...<br/>-------------<br/><a href='/BBS/LHC/index.Asp?SessionID=" & SessionID & "'>返回虚拟博彩</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if

idc=Session("useid")
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
  response.write "<card id='card1' title='"&tip&"-购买错误' ontimer='/BBS/LHC/xz.Asp?ky=" & ky & "&amp;SessionID=" & SessionID & "'><timer value='20'/><p align='left'>各项不能为空,正在返回...<br/>-------------<br/><a href='/BBS/LHC/index.Asp?SessionID=" & SessionID & "'>返回虚拟博彩</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if

if clng(ks)<1 then
  response.write "<card id='card1' title='"&tip&"-购买错误' ontimer='/BBS/LHC/xz.Asp?ky=" & ky & "&amp;SessionID=" & SessionID & "'><timer value='20'/><p align='left'>下注金额不能低于1,正在返回...<br/>-------------<br/><a href='/BBS/LHC/index.Asp?SessionID=" & SessionID & "'>返回虚拟博彩</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if

if ky="1" then
if clng(memo)>49 or clng(memo)<1 then
  response.write "<card id='card1' title='"&tip&"-购买错误' ontimer='/BBS/LHC/xz.Asp?ky=" & ky & "&amp;SessionID=" & SessionID & "'><timer value='20'/><p align='left'>请填写1~49之间的数字,正在返回...<br/>-------------<br/><a href='/BBS/LHC/index.Asp?SessionID=" & SessionID & "'>返回虚拟博彩</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
response.end
end if
end if

Set rss=Server.CreateObject("ADODB.Recordset")
    sqlccs="select * from cpjf where CStr(ids)='"&iduse& "'"
    rss.open sqlccs,myc
  if clng(ks)>rss("usejf") then
 response.write "<card id='card1' title='"&tip&"-购买错误' ontimer='/BBS/LHC/xz.Asp?ky=" & ky & "&amp;SessionID=" & SessionID & "'><timer value='20'/><p align='left'>您的港币不够,你只有"&rss("usejf")&"枚港币。正在返回...<br/>-------------<br/><a href='/BBS/LHC/index.Asp?SessionID=" & SessionID & "'>返回虚拟博彩</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
  end if

  rss.close
Set rss= Nothing
ks=clng(ks)

if ky="1" then
memo=clng(memo)
sql="insert into ctm(ids,ks,idss,hm)values("
sql=sql & sqlstr(idc) & "," 
sql=sql & sqlstr(ks) & ","
sql=sql & sqlstr(idss) & ","
sql=sql & sqlstr(memo) & ")"
   myc.execute sql
sqlr="update cpjf set tmmrjf=tmmrjf+'" & ks & "' where CStr(ids)='"& iduse & "'"
myc.execute sqlr

elseif ky="2" then
sql="insert into csx(ids,ks,idss,hm)values("
sql=sql & sqlstr(idc) & "," 
sql=sql & sqlstr(ks) & "," 
sql=sql & sqlstr(idss) & ","
sql=sql & sqlstr(memo) & ")"
   myc.execute sql
sqlr="update cpjf set sxmrjf=sxmrjf+'" & ks & "' where CStr(ids)='"& iduse & "'"
myc.execute sqlr

elseif ky="3" then
sql="insert into cds(ids,ks,idss,hm)values("
sql=sql & sqlstr(idc) & "," 
sql=sql & sqlstr(ks) & "," 
sql=sql & sqlstr(idss) & ","
sql=sql & sqlstr(memo) & ")"
   myc.execute sql
sqlr="update cpjf set dsmrjf=dsmrjf+'" & ks & "' where CStr(ids)='"& iduse & "'"
myc.execute sqlr

elseif ky="4" then
sql="insert into cps(ids,ks,idss,hm)values("
sql=sql & sqlstr(idc) & "," 
sql=sql & sqlstr(ks) & "," 
sql=sql & sqlstr(idss) & ","
sql=sql & sqlstr(memo) & ")"
   myc.execute sql
sqlr="update cpjf set psmrjf=psmrjf+'" & ks & "' where CStr(ids)='"& iduse & "'"
myc.execute sqlr

elseif ky="5" then
sql="insert into cdx(ids,ks,idss,hm)values("
sql=sql & sqlstr(idc) & "," 
sql=sql & sqlstr(ks) & "," 
sql=sql & sqlstr(idss) & ","
sql=sql & sqlstr(memo) & ")"
  myc.execute sql
sqlr="update cpjf set dxmrjf=dxmrjf+'" & ks & "' where CStr(ids)='"& iduse & "'"
myc.execute sqlr

elseif ky="6" then
sql="insert into cwx(ids,ks,idss,hm)values("
sql=sql & sqlstr(idc) & "," 
sql=sql & sqlstr(ks) & "," 
sql=sql & sqlstr(idss) & ","
sql=sql & sqlstr(memo) & ")"
   myc.execute sql
sqlr="update cpjf set wxmrjf=wxmrjf+'" & ks & "' where CStr(ids)='"& iduse & "'"
myc.execute sqlr
end if

sqlc="update cpjf set usejf=usejf-'" & ks & "' where CStr(ids)='"& iduse & "'"
myc.execute sqlc

sqls="update cpjf set cmrjf=cmrjf+'" & ks & "' where CStr(ids)='"& iduse & "'"
myc.execute sqls
myc.close
  set myc=nothing

conn.close
  set conn=nothing

response.write "<card id='card1' title='"&tip&"' ontimer='/BBS/LHC/xz.Asp?ky=" & ky & "&amp;SessionID=" & SessionID & "'><timer value='18'/><p align='left'>"&tip&"-购买成功!<br/>号码已入库,扣除" & ks & "枚港币,恭喜中奖!正在返回...<br/><a href='/BBS/LHC/xz.Asp?ky=" & ky & "&amp;SessionID=" & SessionID & "'>继续购买</a><br/>-------------<br/><a href='/BBS/LHC/index.Asp?SessionID=" & SessionID & "'>返回虚拟博彩</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"

%>