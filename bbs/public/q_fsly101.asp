<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
Server.ScriptTimeout=999
 idd=request("bz")
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=id"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
iduse=Session("useid")
if Session("ltlybz")="dfg34fdf_dfg554ghy_3452" then
  Response.write "<card id='card1' title='群发信息'><p>你的发信权已被锁，请与管理员联系!</p></card></wml>"
    response.end
End if
set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from jzbl where id="&idd
rse.open rspple,conn,1,2
if rse.eof then
  Response.write "<card id='card1' title='系统提示'><p>无此帮派!</p></card></wml>"
    response.end
else
bkmc=rse("biaoti")
yxxse=rse("tjhm")
end if
rse.close
Set rse= Nothing

  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from guestbook where CStr(ids)='" & iduse & "' and biaozi='f'"
  objgbrr.open ssql,conn,1,1

if objgbrr.RecordCount>500 then
   Response.write "<card id='card1' title='"&converttowidebaiti(bkmc)&"-群发信息'><p>你保留的旧信息超过了500条,暂时不能发信或回复,请删除一些没用的信息!"
   Response.write "<br/><a href='ckly.asp?SessionID=" & SessionID & "'>回收件箱</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
conn.close
set objgbrr=nothing
set conn=nothing
   response.end
End if

lasttlls="55"
lasttls

conn.close
set objgbrr=nothing
set conn=nothing
Response.write "<card id='card1' title='"&converttowidebaiti(bkmc)&"-群发信息'><p>"
if Session("useid")=yxxse then
Response.write "收信:"&converttowidebaiti(bkmc)&"-帮派所有成员<br/>"
Response.write "内容:<input name='ltlyuan' maxlength='200' size='20'/><br/>"
Response.write "<anchor>确定发送<go method='post' href='/bbs/public/q_fsly101cl.asp?idd="&idd&"&amp;SessionID=" & SessionID & "'><postfield name='ltlyuan' value='$(ltlyuan)\(此信息为帮派《"&bkmc&"》群发)'/></go></anchor><br/>"
else
Response.write "身份错误！！！！<br/>"
End if
Response.write "-----------<br/><a href='/bbs/djcs.asp?id="&idd&"&amp;SessionID=" & SessionID & "'>返回" & converttowidebaiti(bkmc) & "</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID=" &SessionID& "'>返回社区首页</a><br/>*每个成员收取200金币</p></card></wml>"
%>