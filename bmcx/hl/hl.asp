<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>


<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?> 
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>

<card title="今日黄历">
<p>

<!--#include file="xt.asp"-->
<% 
Dim Url,Html,start,over,body,wap,wstr,str

Url="http://wap.moezu.com/hl.asp" 
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
body = replace(body,"http://wap.moezu.com/c","http://wap.twapp.cn/hl")
body = replace(body,"day_details.asp?","day_details.asp?sid="&sid&"&amp;")
body = replace(body,"c/","")
'--------------------------------------------------
Response.write body
%>
<a href="/bm/bm.asp?sid=<%=sid%>">便民查询</a><br/>
<a href="/index.asp?sid=<%=sid%>">返回首页</a>
</p></card></wml>
