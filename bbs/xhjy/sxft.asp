<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjnames.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="hk, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="开通家园">  
<p>
<%
if Session("zh")="wap" then
        response.redirect"/BBS/UseLogin.asp?SessionID="&SessionID&"&pkurl="&Request.ServerVariables("PATH_INFO")&"?"
    End if
Server.ScriptTimeout=999
iduse=Session("useid")
wapgywz="开通空间"
lasttls
yi=request("yi")
dim objgbrss
set objgbrss=Server.CreateObject("ADODB.Recordset")
ssql="select * from usereg where id=" & iduse&""
objgbrss.open ssql,conn,1,1
if yi="" then
dim rs3
response.write "<a href='sxft.asp?yi=jy&amp;SessionID=" & SessionID & "'>开通家园</a><br/>"
end if

if yi="hy" then
response.write "修复花园<br/><a href='sxft.asp?yi=hy1&amp;abcyi=" & abcyi & "&amp;sb=" & sb & "'>确定修复花园</a><br/>注意：2009年9月18日19:30分以后注册的家园不用修复，之前注册的易友需修复后才能正常使用花园。否则系统不计。<br/><br/>"
end if
if yi="hy1" then
 sql="update jyhome set times=now(),lx='0',sj='0',qt='0',f='0',xq='0',w='0',l='0',h='0',hy='0',jyml='0',jylx='0' Where jyid=" & iduse & ""
  conn.Execute(sql)
  Application.Unlock
response.write "修复成功..<br/><a href='/bbs/reg/useinfo.asp?id="&iduse&"&amp;SessionID="&SessionID&"'>返回我的资料</a>"
end if


if yi="jy" then
dim objgbr
set objgbr=Server.CreateObject("ADODB.Recordset")
ssql="select * from jyhome where jyid=" & iduse&""
objgbr.open ssql,conn,1,1
if objgbr.eof then
response.write "家园名称:<input type='text' name='abcyi8' title='家园名称' maxlength='120' /><br/>家园迎词:<input type='text' name='abcyi7' title='家园迎词' maxlength='120' /><br/>家园简介:<input type='text' name='abcyi6' title='家园简介' maxlength='120' /><br/><anchor>确定开通<go method='post' href='sxft.asp?yi=jy1&amp;SessionID=" & SessionID & "'><postfield name='abcyi8' value='$(abcyi8)'/><postfield name='abcyi7' value='$(abcyi7)'/><postfield name='abcyi6' value='$(abcyi6)'/></go></anchor><br/><br/>"
else
response.write "您已开通了家园.无需再开通.<br/><a href='/bbs/xhjy/home.asp?SessionID=" & SessionID & "'>返回我的家园</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a>"
end if
end if
if yi="jy1" then
abcyi8=request("abcyi8")
abcyi7=request("abcyi7")
abcyi6=request("abcyi6")
dim objgbr1
set objgbr1=Server.CreateObject("ADODB.Recordset")
ssql="select * from jyhome where jyid=" & iduse&""
objgbr1.open ssql,conn,1,1
if objgbr1.eof then
  sql="insert into jyhome(jyid,jyname,jyhy,jyjj)values("
  sql=sql & sqlstr(iduse) & ","
  sql=sql & sqlstr(abcyi8) & ","
  sql=sql & sqlstr(abcyi7) & ","
  sql=sql & sqlstr(abcyi6) & ")"
  Application.Lock
  conn.execute sql
  dim talk
talk="" & Session("ltname") & "开通了家园"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','525','0')"
  Application.Lock
  conn.execute sql
  Application.Unlock
response.write "开通家园成功.<br/><a href='/bbs/xhjy/home.asp?SessionID=" & SessionID & "'>返回我的家园</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a><br/>"
else
response.write "您已开通了家园.无需再开通.<br/><a href='/bbs/xhjy/home.asp?SessionID=" & SessionID & "'>返回我的家园</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a>"
end if
end if
%>

</p></card></wml>


