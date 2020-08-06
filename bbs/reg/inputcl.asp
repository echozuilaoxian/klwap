<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="社区银行"><p>
<%
if Session("zh")="sid" then
        response.redirect "/bbs/yksm.asp?SessionID=" & SessionID & "&pp=" & pp& "&pkurl="&Request.ServerVariables("PATH_INFO")&"?"
    End if
Server.ScriptTimeout=999
iduse=Session("useid")
mon=request("mon")
if mon="" then
input=clng(request("input"))
if input="" or input<="0" then
    response.write "请不要存空头支票."
else
dim objgbrs
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select usejf from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
     if input>objgbrs("usejf") then
 response.write "你没有那么多金币"
objgbrs.close
Set objgbrs= Nothing
         else
            sql="update usereg set bank=bank+" & input & ",usejf=usejf-" & input & ",banktime=now() Where CStr(id)='" & iduse & "'"
            Application.Lock
            conn.execute(sql)
            dim talk
talk="" & Session("ltname") & "在(url=/bbs/Reg/bank.asp)社区银行(/url)存了"& input &"金币"
sql="insert into sjzk(ids,dong,lasttlls,bu)values('"&iduse&"','"&talk&"','525','0')"
  Application.Lock
  conn.execute sql
  Application.Unlock
 response.write "存款成功"
end if
 end if
end if


response.write "<br/><a href='bank.asp?SessionID=" & SessionID & "'>返回社区银行</a>"
response.write "<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a>"
%>
</p></card></wml>



