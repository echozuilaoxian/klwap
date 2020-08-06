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
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ky=ky"
        response.redirect "/BBS/UseLogin.asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if

  iduse=Session("useid")
  btzz=Session("ltname")
   Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select usejf,myfq,fying,usesex from usereg where CStr(id)='" & iduse & "'"
    objgbrs.open sql,conn
if objgbrs("usejf")<99 then
     response.write "<card id='card1' title='妇产科'><p>你的金币不足99,无法进入.赶快想办法呀.汗...<br/>------------<br/><a href='/bbs/reg/dongf/yiyindex.asp?SessionID=" & SessionID & "'>返回社区医院</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if
if objgbrs("myfq")<15 then
     response.write "<card id='card1' title='妇产科'><p>15天的孕期还未过,你想早产啊??<br/>------------<br/><a href='/bbs/reg/dongf/yiyindex.asp?SessionID=" & SessionID & "'>返回社区医院</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if
if objgbrs("fying")=0 then
     response.write "<card id='card1' title='妇产科'><p>汗,没结婚也想生孩子??你还没有结婚.<br/>------------<br/><a href='/bbs/reg/dongf/yiyindex.asp?SessionID=" & SessionID & "'>返回社区医院</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
     response.end
    End if

dim sex
if objgbrs("usesex")="0" then
sex="老婆"
  elseif objgbrs("usesex")="1" then
sex="老公"
end if
tjhm=objgbrs("fying")
response.write "<card id='card1' title='妇产科'><p>发火速令<br/>--------<br/>发信给"&sex&"<b><u>" & converttowidebaiti(redtjname) & "ID:" & tjhm & "</u></b><br/>要说说什么吗：<br/><input type='text' name='ltlyuan' value='亲爱的,快来医院,咱们的宝宝要出生了'/><br/>注意:进行到这一步了不能退出,否则你的宝宝可能回夭折.<br/><anchor>马上发送<go method='post' href='/bbs/reg/dongf/shz.asp?SessionID=" & SessionID & "'><postfield name='reids' value='"&tjhm&"'/><postfield name='ltlyuan' value='$(ltlyuan)'/></go></anchor><br/>------------<br/><a href='/bbs/reg/dongf/yiyindex.asp?SessionID=" & SessionID & "'>返回社区医院</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"
objgbrs.close
Set objgbrs= Nothing
conn.close
set conn=nothing
%>