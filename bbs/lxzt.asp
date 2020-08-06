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
<card id="main" title="安全退出">
<p align="left">
</p>
<p>
<%=WeekDayName(DatePart("w",Now))%>
<% If Time < #08:00:00# And Time >= #04:00:00# Then %>
      早上好 ！
<% ElseIf Time < #11:30:00# And Time >= #08:00:00# Then %>
      上午好 ！ 
<% ElseIf Time < #12:30:00# And Time >= #11:30:00# Then %>
      中午好 ！      
<% ElseIf Time < #18:00:00# And Time >= #12:30:00# Then %>
      下午好 ！
<% ElseIf Time < #23:00:00# And Time >= #18:00:00# Then %>
      晚上好 ！      
<% Else %>
      午夜好 ！
<% End If %><br/>
<%
Server.ScriptTimeout=999
wap=request.querystring("wap")
iduse=Session("useid")
lasttlss="110"
lasttlls="110"
lasttls
Session("returnuppath")=""
gfdsa=Session("ltname")
Response.write "<a href='/bbs/reg/useinfo.asp?id=" & iduse & "&amp;wap=" & wap & "'>" & converttowide(gfdsa) & "</a>你已成功离线"
if lycount>0 then
Response.write "<br/><a href='/bbs/public/ckly.asp?wap=" & wap & "'>" & lycount & "条新信息</a>"
Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?"
End if
%>
<br/>-------------
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>返回社区首页</a>
<br/><a href='/index.asp?wap=<%=wap%>'>返回首页</a><br/>
<% response.write now() 
response.write "<br/>执行用了"& FormatNumber((timer()-t1)*1000,3) & "毫秒</p></card></wml>"
conn.close
set conn=nothing
%>

