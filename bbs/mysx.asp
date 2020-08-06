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
<card id="main" title="MY属性">
<p align="left">
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
%>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
lasttlss="0"
lasttlls="0"
lasttls
Session("returnuppath")=""
gfdsa=Session("ltname")
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;SessionID=" & SessionID & "'>" & converttowide(gfdsa) & "</a>的属性"
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
  %>
<br/>---------
<br/>财富:<%=objgbrs("usejf")%>
<br/>体力:<%=objgbrs("tili")%>
<br/>魅力:<%=objgbrs("ml")%>
<br/>智力:<%=objgbrs("zhili")%>
<br/>爱心:<%=objgbrs("love")%>
<br/>情商:<%=objgbrs("qs")%>
<br/>才华:<%=objgbrs("caihua")%>
<%
Response.write "<br/>学历:"
if objgbrs("xl")=0 then
Response.write "无"
end if
if objgbrs("xl")=1 then
Response.write "小学毕业"
end if
if objgbrs("xl")=2 then
Response.write "初中毕业"
end if
if objgbrs("xl")=3 then
Response.write "高中毕业"
end if
if objgbrs("xl")=4 then
Response.write "大学毕业"
end if
if objgbrs("xl")=5 then
Response.write "硕士生"
end if
if objgbrs("xl")=6 then
Response.write "博士生"
end if
%>
<br/>---------
<br/><a href='/bbs/school/school.asp?SessionID=<%=SessionID%>'>返回社区学校</a>
<br/><a href='/bbs/job.asp?SessionID=<%=SessionID%>'>返回工作单位</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
<br/><%=now%>
<%  
response.write "<br/>执行用了"& FormatNumber((timer()-t1)*1000,3) & "毫秒</p></card></wml>"
conn.close
set conn=nothing
%>