<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml><head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="发送信息">
<p align="left">

<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then

       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=999
if Session("ltlybz")="dfg34fdf_dfg554ghy_3452" then
  Response.write "对不起!您的发信权已被锁，请与管理员联系!</p></card></wml>"
    response.end
End if
iduse=Session("useid")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from guestbook where CStr(ids)='" & iduse & "' and biaozi='f'"
  objgbrr.open ssql,conn,1,1
if objgbrr.RecordCount>500 then
   Response.write "您好，您保留的旧信息超过了500条,暂时不能发信或回复,请删除一些没用的留言！"
   Response.write "<br/><a href='ckly.asp?SessionID=" & SessionID & "'>回收件箱</a><br/><a href='srxx.asp?SessionID=" & SessionID & "'>私人信箱</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
objgbrr.close
conn2.close
set objgbrr=nothing
set conn2=nothing
   response.end
End if
lasttlls="167"
lasttls
dim ids,name,img,imgs
ids=request("ids")
img=request("img")
imgs=request("imgs")
tjhm=ids
Response.write "收信:<a href='/bbs/reg/useinfo.asp?id=" & ids & "&amp;SessionID=" & SessionID & "'>" & converttowide(redtjname) & "ID:" & ids & "</a><br/>内容:"
objgbrr.close
conn.close
set objgbrr=nothing
set conn=nothing
%><input name="ltlyuan" maxlength="200" size="20"/>
<br/><anchor>发送<go method="post" href='/bbs/public/fslycl.asp?SessionID=<%=SessionID%>'>
<postfield name="ltlyuan" value="<%=imgs%>$(ltlyuan)"/>
<%Response.write "<postfield name='ids' value='" & ids & "'/></go></anchor>|<a href='fsly1img.asp?ids="&ids&"&amp;SessionID="&SessionID&"'>"
if request("img")="" then
	response.write "插入表情"
else
	response.write "表情<img src='img/"&img&".gif' alt='"&img&".gif'/>"
end if
response.write "</a><br/><a href='/bbs/friandbook/hyfz/add.asp?useid=" & ids & "&amp;SessionID=" & SessionID & "'>移到分组</a>"
response.write "<br/><a href='/bbs/friandbook/hyfz/add8.asp?SessionID=" & SessionID & "'>分组管理</a>"
Response.write "<br/><a href='/bbs/friandbook/myfriend.asp?SessionID=" & SessionID & "'>返回我的好友</a>"%><br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<br/>时间:<%=time%>
</p></card></wml>



