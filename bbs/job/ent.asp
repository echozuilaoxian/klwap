<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="娱乐圈">
<p align="left">
<img src='logo.gif' alt='职业'/><br/>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
      else
        Session("ltlybz")=""
    End if
iduse=Session("useid")
%>
狂野娱乐圈<br/>
欢迎你:
<%
lasttlss="0"
lasttlls="0"
lasttls
Session("returnuppath")=""
gfdsa=Session("ltname")
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(gfdsa) & "</a><br/>"
Response.write "<a href='/bbs/mysx.asp?wap="&wap&"'>MY属性</a>|<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>留言(" & lycount & ")条</a>"
%>
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select gongzuo,zhiye,tianshu,tili,ml,caihua,zhili,xf,xl,id from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
Response.write "<br/>职业:"
if objgbrs("gongzuo")<0 then
Response.write "系统出错,请联系管理员"
end if

if objgbrs("gongzuo")=0 then
Response.write "失业中.."
Response.write "<br/><a href='entcl1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|进入工作</a><br/>"
end if

if objgbrs("gongzuo")<>2 and objgbrs("gongzuo")<>0 then
Response.write "你不是本单位的工作人员"
Response.write "<br/><a href='entcl1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|进入工作</a><br/>"
end if

if objgbrs("gongzuo")=2 then

if objgbrs("zhiye")=11 then
Response.write "侍者<br/>"'7天后我要我要升职了!
if  objgbrs("tianshu")>=7 and objgbrs("tili")>=100 and objgbrs("caihua")>=5000 and objgbrs("ml")>=5000 and objgbrs("zhili")>=5000 then
Response.write "<br/><a href='entsja.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|我要升职</a><br/>"
end if
end if
'------------------
if objgbrs("zhiye")=12 then
Response.write "群众演员<br/>"'14天后我要我要升职了!
if  objgbrs("tianshu")>=14 and objgbrs("tili")>=200 and objgbrs("caihua")>=10000 and objgbrs("ml")>=10000 and objgbrs("zhili")>=10000 and objgbrs("xl")>=1 then
Response.write "<a href='entsjb.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|我要升职</a><br/>"
end if
end if

'------------------
if objgbrs("zhiye")=13 then
Response.write "跑龙套演员<br/>"'30天后我要我要升职了!
if  objgbrs("tianshu")>=30 and objgbrs("tili")>=300 and objgbrs("caihua")>=25000 and objgbrs("ml")>=25000 and objgbrs("zhili")>=25000 and objgbrs("xl")>=2 then
Response.write "<a href='entsjc.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|我要升职</a><br/>"
end if
end if
'------------------
if  objgbrs("zhiye")=14 then
Response.write "主角替身<br/>"'50天后我要我要升职了!
if objgbrs("tianshu")>=50 and objgbrs("tili")>=400 and objgbrs("caihua")>=40000 and objgbrs("ml")>=40000 and objgbrs("zhili")>=40000 and objgbrs("xl")>=3 then
Response.write "<a href='entsjd.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|我要升职</a><br/>"
end if
end if
'------------------
if objgbrs("zhiye")=15 then
Response.write "新人影星<br/>"'80天后我要我要升职了!
if objgbrs("tianshu")>=80 and objgbrs("tili")>=500 and objgbrs("caihua")>=70000 and objgbrs("ml")>=70000 and objgbrs("zhili")>=70000 and objgbrs("xl")>=4 then
Response.write "<a href='entsje.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|我要升职</a><br/>"
end if
end if
'------------------
if objgbrs("zhiye")=16 then
Response.write "一般影星<br/>"'120天后我要我要升职了!
if  objgbrs("tianshu")>=120 and objgbrs("tili")>=600 and objgbrs("caihua")>=100000 and objgbrs("ml")>=100000 and objgbrs("zhili")>=100000 and objgbrs("xl")>=4 then
Response.write "<a href='entsjf.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|我要升职</a><br/>"
end if
end if
'------------------
if  objgbrs("zhiye")=17 then
Response.write "电视名星<br/>"'160天后我要我要升职了!
if objgbrs("tianshu")>=160 and objgbrs("tili")>=700 and objgbrs("caihua")>=150000 and objgbrs("ml")>=150000 and objgbrs("zhili")>=150000 and objgbrs("xl")>=5 then
Response.write "<a href='entsjg.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|我要升职</a><br/>"
end if
end if
'------------------
if objgbrs("zhiye")=18 then
Response.write "影视大腕<br/>"'200天后我要我要升职了!
if objgbrs("tianshu")>=200 and objgbrs("tili")>=800 and objgbrs("caihua")>=220000 and objgbrs("ml")>=220000 and objgbrs("zhili")>=220000 and objgbrs("xl")>=5 then
Response.write "<a href='entsjh.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|我要升职</a><br/>"
end if
end if
'------------------
if objgbrs("zhiye")=19 then
Response.write "演艺明星<br/>"'300天后我要我要升职了!
if objgbrs("tianshu")>=300 and objgbrs("tili")>=900 and objgbrs("caihua")>=350000 and objgbrs("ml")>=350000 and objgbrs("zhili")>=350000 and objgbrs("xl")>=6 then
Response.write "<a href='entsji.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|我要升职</a><br/>"
end if
end if
'------------------
if objgbrs("zhiye")=20 then
Response.write "超级巨星<br/>"
end if
'------------------
Response.write "已工作:"&objgbrs("tianshu")&"天"
%><br/>-------------
<br/>
<% 
Response.write "<a href='entwork.asp?rd=1&amp;SessionID=" & SessionID & "'>+|每天工作</a><br/>"
Response.write "<a href='entsx.asp?SessionID=" & SessionID & "'>+|下级属性</a><br/>"
Response.write "<a href='esame.asp?SessionID=" & SessionID & "'>+|单位同事</a><br/>"
Response.write "<a href='same.asp?idn=" & objgbrs("zhiye") & "&amp;SessionID=" & SessionID & "'>+|同级同事</a><br/>"
Response.write "<a href='entlist.asp?SessionID=" & SessionID & "'>+|各级属性</a><br/>"
Response.write "<a href='phe.asp?SessionID=" & SessionID & "'>+|单位排行</a><br/>"
Response.write "<a href='enttcq.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|我要辞职</a><br/>"
end if
%>-------------<br/><% 
Response.write "<a href='/bbs/school/school.asp?SessionID="&SessionID&"'>返回社区学校</a><br/>"%>

<a href='/bbs/job.asp?SessionID=<%=SessionID%>'>返回工作单位</a><br/>
<a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<br/>北京时间:<%=time%>
</p></card></wml>
<%
conn.close
set conn=nothing
%>