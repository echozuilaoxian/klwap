<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")
%>
<card id="main" title="升职成功">
<p align="left">
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select gongzuo,zhiye,tianshu,tili,ml,caihua,zhili,xf,xl,id from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
  if objgbrs("gongzuo")<>1 then
  Response.write "我晕,你原来不是在这里工作的,来这里升什么职!<br/><a href='/bbs/job/sy.asp?SessionID=" & SessionID & "'>商业广场</a><br/>"
    Response.end
  end if
  if objgbrs("zhiye")=0 or objgbrs("gongzuo")=0 then
  Response.write "还真服你,你还在失业呢,别想着这么快升职!<br/><a href='/bbs/job/sy.asp?SessionID=" & SessionID & "'>商业广场</a><br/>"
    Response.end
  end if
  
  '1
if objgbrs("tianshu")<160 or objgbrs("tili")<700 or objgbrs("caihua")<150000 or objgbrs("ml")<150000 or objgbrs("zhili")<150000 or objgbrs("xl")<5 then
Response.write "你的属性还不够,不可以升职!"
end if
if objgbrs("zhiye")=7 and objgbrs("tianshu")>=160 and objgbrs("tili")>=700 and objgbrs("caihua")>=150000 and objgbrs("ml")>=150000 and objgbrs("zhili")>=150000 and objgbrs("xl")>=5 then
sql="Delete DATEDIFF FROM gao WHERE Cstr(useid)='" & iduse & "'"
conn.Execute sql
sql="update usereg set zhiye=8 where CStr(id)='" & iduse & "'"
conn.execute sql
Response.write "恭喜!以后可以加工资了!继续努力,前途一片光明!!"
end if

Response.write "<br/>-------------<br/><a href='/bbs/job/sy.asp?SessionID="&SessionID&"'>返回商场广场</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>报时:"&time&"</p></card></wml>"
conn.close
set rec=nothing
set conn=nothing
%>
