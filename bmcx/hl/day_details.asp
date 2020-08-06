<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 
'============================================================
' 更新: 2007-10-15
' 主页: http://wap.twapp.cn
' 电邮: xivn@163.com
' Q Q : QQ:531233814
' 版权: 燃点真情All Rights Reserved.
'============================================================ 
%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>

<card title="当年今日">
<p>

<!--#include file="xt.asp"-->
<%
dim id
id=request.QueryString("id")
%>
<% 
Dim Url,Html,start,over,body,wap,wstr,str

Url="http://wap.moezu.com/c/day_details.asp?id="&id&"" 
wstr=getHTTPPage(url)            
start=Instr(wstr,"<p>")
over=Instr(wstr,"</p>")

body=mid(wstr,start,over-start)
'------------------------------------------------
body = replace(body,"<p align=""left"">","")'这是把<p align=""left"">替换成空
body = replace(body,"<p align=""center"">","")
body = replace(body,"</p>","")
body = replace(body,"<p>","")
body = replace(body,"返回上页","返回上页")
Response.write body
%>
<a href="/bm/bm.asp?sid=<%=sid%>">便民查询</a><br/>
<a href="/index.asp?sid=<%=sid%>">返回首页</a></p></card></wml>