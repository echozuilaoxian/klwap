<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<card id="hotpk" title="发布广播">
<p>
<%
kd=request("kd")
kdkd=request("kdkd")
soid=request("soid")
id=request("soid")
memo=request("memo")
memo=untowide(memo)
id=request("id")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?id="&id&""
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
  	response.end
    End if

Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlls="132"
lasttls

if Session("ltlybz")="dfg34fdf_dfg554ghy_3452" then
  Response.write "对不起,您的发信权已被锁，请与管理员联系！</p></card></wml>" 
    response.end
End if
%>

<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
       ssql="select id from usereg where CStr(id)='" &iduse & "'"
       objgbrs.open ssql,conn
if objgbrs.eof then
Response.write "错误,该号不存在"
else
set objgbrsm=Server.CreateObject("ADODB.Recordset")
       ssql="select id,usejf,usename from usereg where CStr(id)='" &iduse & "'"
       objgbrsm.open ssql,conn
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from hua where CStr(ids)='" & iduse & "'"
       rs8.open ssql,conn,1,2
if rs8.recordcount<1 then
rs8.addnew
rs8("ids")=iduse
rs8.update
end if
end if
if lycount>0 then
    Response.write "<br/><a href='/bbs/public/ckly.asp?SessionID="&SessionID&"'>" & lycount & "条新信息</a><br/>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?kd=&amp;"
End if
if objgbrsm("usejf")<1000 then
%>
你的金币不够1000...不能广播<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<%
Response.Write "</p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
response.end
end if
%>
输入内容<br/><input name="memo" type="text" maxlength="30" value=""/>
<br/>
<anchor title="submit">我要广播<go href="ggbbcl.asp?SessionID=<%=SessionID%>" method="post">
<postfield name="memo" value="$(memo)"/>
<postfield name="kd" value="$(kd)"/>
<postfield name="kdkd" value="1"/>
</go></anchor><br/>
<b>注：广播收取100金币，</b>
<br/><a href="ggbbjl.asp?SessionID=<%=SessionID%>">更多广播记录</a><br/>
<a href="/BBS/index.asp?SessionID=<%=SessionID%>">返回社区首页</a>

</p></card></wml>


