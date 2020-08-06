<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
 Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")
  btzz=Session("ltname")
   Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select usejf,fanj,myjy,fying,usesex from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
if objgbrs("usejf")<30 then
     response.write "<card id='card1' title='夫妻洞房'><p>你的金币不足30,无法进入邀请.<br/>-----------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if
if objgbrs("fanj")=0 then
     response.write "<card id='card1' title='夫妻洞房'><p>你没有房子,怎么会有钥匙呢?赶快去买套房子吧.<br/>-----------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if    
if objgbrs("myjy")>50 then
     response.write "<card id='card1' title='夫妻洞房'><p>你已经生了孩子了,国家提倡一对夫妻只能生一个孩子.<br/>-----------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if    
if objgbrs("fying")=0 then
     response.write "<card id='card1' title='夫妻洞房'><p>你还没有结婚，不能洞房。<br/>-----------<br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if

dim sex
if objgbrs("usesex")="0" then
sex="老婆"
  elseif objgbrs("usesex")="1" then
sex="老公"
end if
tjhm=objgbrs("fying")
response.write "<card id='card1' title='邀请洞房'><p>邀请你的"&sex&"<b><u>" & converttowidebaiti(redtjname) & "ID:" & tjhm & "</u></b>洞房<br/>说些什么：<br/><input type='text' name='ltlyuan' value='亲爱的,快来洞房,咱们生个宝宝'/><br/>注意:一定要写上你刚开设的房间名和密码<br/><anchor>提交<go method='post' href='/bbs/reg/dongf/zscl.asp?SessionID=" & SessionID & "'><postfield name='reids' value='"&tjhm&"'/><postfield name='ltlyuan' value='$(ltlyuan)'/></go></anchor><br/>---------<br/><a href='/bbs/public/gygl.asp?SessionID=" & SessionID & "'>返回我的地盘</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
 objgbrs.close
  set objgbrs=nothing
 conn.close
  set conn=nothing
%>