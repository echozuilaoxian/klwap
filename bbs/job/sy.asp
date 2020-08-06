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
<card id="main" title="商业广场">
<p align="left">
<img src='logo.gif' alt='职业'/><br/>
<%
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
欢迎你:
<%
Server.ScriptTimeout=999
lasttlss="0"
lasttlls="0"
lasttls
Session("returnuppath")=""
gfdsa=Session("ltname")
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>" & converttowidebaiti(gfdsa) & "</a><br/>"
Response.write "<a href='/bbs/mysx.asp?SessionID=" & SessionID & "'>MY属性</a>|<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>留言(" & lycount & ")条</a>"
%>
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
Response.write "<br/>职业:"
if objgbrs("gongzuo")<0 then
Response.write "系统出错,请联系管理员"
end if
if objgbrs("gongzuo")=0 then
Response.write "失业中.."
Response.write "<br/><a href='/bbs/job/sycl1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|进入工作</a><br/>"
end if
if objgbrs("gongzuo")<>1 and objgbrs("gongzuo")<>0 then
Response.write "你不是本单位的工作人员"
Response.write "<br/><a href='/bbs/job/sycl1.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|进入工作</a><br/>"
end if
if objgbrs("gongzuo")=1 then
if objgbrs("zhiye")=1 then
Response.write "收发室职员<br/>"'7天后我要我要升职了!
if  objgbrs("tianshu")>=7 and objgbrs("tili")>=100 and objgbrs("caihua")>=5000 and objgbrs("ml")>=5000 and objgbrs("zhili")>=5000 then
Response.write "<a href='sysja.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>我要升职</a><br/>"
end if
end if
'------------------
if objgbrs("zhiye")=2 then
Response.write "行政助理<br/>"'14天后我要我要升职了!
if  objgbrs("tianshu")>=14 and objgbrs("tili")>=200 and objgbrs("caihua")>=10000 and objgbrs("ml")>=10000 and objgbrs("zhili")>=10000 and objgbrs("xl")>=1 then
Response.write "<a href='sysjb.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>我要升职</a><br/>"
end if
end if

'------------------
if objgbrs("zhiye")=3 then
Response.write "区域推销员<br/>"'30天后我要我要升职了!
if  objgbrs("tianshu")>=30 and objgbrs("tili")>=300 and objgbrs("caihua")>=25000 and objgbrs("ml")>=25000 and objgbrs("zhili")>=25000 and objgbrs("xl")>=2 then
Response.write "<a href='sysjc.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>我要升职</a><br/>"
end if
end if
'------------------
if  objgbrs("zhiye")=4 then
Response.write "低级主管<br/>"'50天后我要我要升职了!
if objgbrs("tianshu")>=50 and objgbrs("tili")>=400 and objgbrs("caihua")>=40000 and objgbrs("ml")>=40000 and objgbrs("zhili")>=40000 and objgbrs("xl")>=3 then
Response.write "<a href='sysjd.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>我要升职</a><br/>"
end if
end if
'------------------
if objgbrs("zhiye")=5 then
Response.write "项目经理<br/>"'80天后我要我要升职了!
if objgbrs("tianshu")>=80 and objgbrs("tili")>=500 and objgbrs("caihua")>=70000 and objgbrs("ml")>=70000 and objgbrs("zhili")>=70000 and objgbrs("xl")>=4 then
Response.write "<a href='sysje.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>我要升职</a><br/>"
end if
end if
'------------------
if objgbrs("zhiye")=6 then
Response.write "高级经理<br/>"'120天后我要我要升职了!
if  objgbrs("tianshu")>=120 and objgbrs("tili")>=600 and objgbrs("caihua")>=100000 and objgbrs("ml")>=100000 and objgbrs("zhili")>=100000 and objgbrs("xl")>=4 then
Response.write "<a href='sysjf.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>我要升职</a><br/>"
end if
end if
'------------------
if  objgbrs("zhiye")=7 then
Response.write "业务总监<br/>"'160天后我要我要升职了!
if objgbrs("tianshu")>=160 and objgbrs("tili")>=700 and objgbrs("caihua")>=150000 and objgbrs("ml")>=150000 and objgbrs("zhili")>=150000 and objgbrs("xl")>=5 then
Response.write "<a href='sysjg.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>我要升职</a><br/>"
end if
end if
'------------------
if objgbrs("zhiye")=8 then
Response.write "副总裁<br/>"'200天后我要我要升职了!
if objgbrs("tianshu")>=200 and objgbrs("tili")>=800 and objgbrs("caihua")>=220000 and objgbrs("ml")>=220000 and objgbrs("zhili")>=220000 and objgbrs("xl")>=5 then
Response.write "<a href='sysjh.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>我要升职</a><br/>"
end if
end if
'------------------
if objgbrs("zhiye")=9 then
Response.write "首席执行官<br/>"'300天后我要我要升职了!
if objgbrs("tianshu")>=300 and objgbrs("tili")>=900 and objgbrs("caihua")>=350000 and objgbrs("ml")>=350000 and objgbrs("zhili")>=350000 and objgbrs("xl")>=6 then
Response.write "<a href='sysji.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>我要升职</a><br/>"
end if
end if
'------------------
if objgbrs("zhiye")=10 then
Response.write "商业大亨<br/>"
end if
'------------------
Response.write "已工作:"&objgbrs("tianshu")&"天<br/>"
%>-------------
<br/>
<%
Response.write "<a href='sywork.asp?rd=1&amp;SessionID=" & SessionID & "'>+|每天工作</a><br/>"
Response.write "<a href='sysx.asp?SessionID=" & SessionID & "'>+|下级属性</a><br/>"
Response.write "<a href='/bbs/job/sysame.asp?SessionID=" & SessionID & "'>+|单位同事</a><br/>"
Response.write "<a href='sylist.asp?SessionID=" & SessionID & "'>+|各级属性</a><br/>"
Response.write "<a href='same.asp?idn="&objgbrs("zhiye")&"&amp;SessionID=" & SessionID & "'>+|同级同事</a><br/>"
Response.write "<a href='sytcq.asp?id=" & objgbrs("id") & "&amp;SessionID=" & SessionID & "'>+|我要辞职</a><br/>"
Response.write "<a href='ph.asp?SessionID=" & SessionID & "'>+|单位排行</a><br/>"
end if

Response.write "-------------<br/>"
Response.write "<a href='/bbs/school/school.asp?SessionID="&SessionID&"'>返回社区学校</a><br/>"
Response.write "<a href='/bbs/job.asp?SessionID="&SessionID&"'>返回工作单位</a><br/>"
Response.write "<a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>"
%>
报时:<%=time%>
</p></card></wml>
<%
conn.close
set objgbrs=nothing
set conn=nothing
%>