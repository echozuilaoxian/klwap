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
<card id="card1" title="金币过户"><p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
dim id
id=request("id")
lasttlls="157"
lasttls
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & iduse & "' and DATEDIFF('s', regtimes, now()) > 770*60"
    objgbrs.open sql,conn
if objgbrs.eof then
    response.write "你注册的时间还不满1天，暂时不能过户！"
   else
    response.write "你现有金币(" & objgbrs("usejf") & ")元(不包括银行)向"
    set objgbrs=nothing
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & id & "'"
    objgbrs.open sql,conn
   response.write converttowidebaiti(objgbrs("usename")) & "ID:" & objgbrs("id") & "金币(" & objgbrs("usejf") & ")过户:"
%>
<br/><input name="gfjf" value="100" format="*N" maxlength="5"/>
<br/><anchor>提 交
<go method="post" href='gfjfcl.asp?SessionID=<%=SessionID%>'>
<postfield name="gfjf" value="$(gfjf)"/>
<postfield name="id" value="<% =id %>"/>
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



