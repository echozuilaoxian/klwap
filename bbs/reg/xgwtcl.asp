<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="修改资料">  
<p>

<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
    End if
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlls="327"
lasttls
yda=untowide(request("yda"))
xwt=untowide(request("xwt"))
xda=untowide(request("xda"))
if yda="" or xwt="" or xda="" then 
response.redirect "xgwt.asp?SessionID="&SessionID&"&cw=3"
else
set objgbrs=Server.CreateObject("ADODB.Recordset")
  sql="select * from usereg where CStr(id)='" & iduse & "'"
  objgbrs.open sql,conn,1,3
if yda<>objgbrs("wtda") and objgbrs("wtda")<>"" then response.redirect "xgwt.asp?SessionID="&SessionID&"&cw=1"
If not objgbrs.Eof Then
if xwt<>"" then objgbrs("mmwt")=xwt
if xda<>"" then objgbrs("wtda")=xda
objgbrs.update
else
cccww="修改失败！<br/>"
End if
%>
<%if cccww<>"" then%>
<%=cccwww%>
<%else%>
修改成功。。。<br/>
<%end if%>
<%end if%>
----------<br/>
<%
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>[我的资料]</a>"
Response.write "<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>[我的地盘]</a>"
Response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>[社区首页]</a><br/></p></card></wml>"
objgbrs.close
set objgbrs=nothing
set conn=nothing
%>