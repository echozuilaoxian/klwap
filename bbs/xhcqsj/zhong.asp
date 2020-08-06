<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%response.buffer=true%><%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/></head>
<%
 SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?m=m"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ky=request.querystring("ky")
Server.ScriptTimeout=9999
iduse=Session("useid")
lasttlls=540
lasttls
if ky<>"" then
if ky="ok" then
set rs8=Server.CreateObject("ADODB.Recordset")
       ssql="select * from scsj where CStr(ids)='" & iduse & "'"
       rs8.open ssql,conn,1,1
if rs8.eof then
Response.write "<card id='hotpk' title='唇枪舌剑-种族更改'><p>"
  Call Error("你还没有加入游戏！")
  else
zhong=request.querystring("zhong")
if zhong="y" or zhong="x" or zhong="l" then
  conn.Execute("update scsj set zhong='"&zhong&"' where ids="&iduse)
%>
<card id="hotpk" title="唇枪舌剑-种族更改成功"  ontimer='index.asp?SessionID=<%=SessionID%>'><timer value='10'/><p>
正在返回我的游戏.........
<%
else
Response.write "<card id='hotpk' title='唇枪舌剑-种族更改'><p>"
 Call Error("出错了！参数错误.....")
  end if
end if
end if
if ky="cl" then
zhong=request.querystring("zhong")
if zhong="y" or zhong="x" or zhong="l" then
if zhong="y" then zhname="人族"
if zhong="x" then zhname="吸血鬼"
if zhong="l" then zhname="狼族"
Response.write "<card id='hotpk' title='唇枪舌剑-种族更改'><p>"
 Response.write "你确认要更改种族为:"&zhname&"<br/>"
Response.write "<a href='zhong.asp?ky=ok&amp;zhong="&zhong&"&amp;SessionID="&SessionID&"'>确认</a>|<a href='index.asp?SessionID="&SessionID&"'>返回游戏</a><br/>"
else
Response.write "<card id='hotpk' title='唇枪舌剑-种族更改'><p>"
 Call Error("出错了！参数错误.....")
  end if
 end if
else
Response.write "<card id='hotpk' title='唇枪舌剑-种族更改'><p>"
 Response.write "请选择你要加的种族<br/>"
Response.write "<a href='zhong.asp?ky=cl&amp;zhong=x&amp;SessionID="&SessionID&"'>吸血鬼</a><br/>"
Response.write "<a href='zhong.asp?ky=cl&amp;zhong=l&amp;SessionID="&SessionID&"'>狼族</a><br/>"
Response.write "<a href='zhong.asp?ky=cl&amp;zhong=y&amp;SessionID="&SessionID&"'>人族</a><br/>"
End if
rs8.close
Set rs8= Nothing
conn.close
set conn=nothing
%>
<!--#INCLUDE VIRTUAL="/bbs/klwll.asp"-->
</p></card></wml>


