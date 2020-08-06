<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="发送新短信">
<p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id=id"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
iduse=Session("useid")
lasttlls="167"
lasttls
if lycount>0 then
    Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>您有" & lycount & "条新信息</a><br/>"
End if
if ooo=1 then

set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select * from usereg where CStr(id)='" & iduse & "'"
       objgbrs.open ssql,conn
ltyuan=objgbrs("naiyo")
objgbrs.close
set objgbrs=nothing
conn.close
set conn=nothing
response.write "<setvar name='ltlyuan' value='" & ltyuan & " '/>"
else
dim ltlyuan
ltlyuan=Request("ltlyuan")
response.write "<setvar name='ltlyuan' value='" & ltlyuan & " '/>"
end if
%>
发给:<input type="text" name="ids" emptyok="true" format="*N" value="0" /><br />
请输入用户ＩＤ即可<br/>
内容:<input type="text" name="ltlyuan" maxlength="300" emptyok="true" /><br />
<anchor>发送<go method='post' href='/bbs/public/fslycl.asp?SessionID=<%=SessionID%>'>
<%
response.write "<postfield name='ids' value='$(ids)'/>"
response.write "<postfield name='ltlyuan' value='$(ltlyuan)'/>"
response.write "</go></anchor><br/>------------<br/>"

if Session("returnuppath")<>"" then
   Response.write "<a href='" & Session("returnuppath") & "&amp;SessionID=" & SessionID & "'>返回来源面页</a><br/>"
End if
   Response.write "<a href='/bbs/public/srxx.asp?SessionID=" & SessionID & "'>返回消息中心</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a>"
%>
</p>
</card>
</wml>


