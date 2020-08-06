<!--#include file="conn.asp"-->
<%
'============================================================
' 更新: 2008-8-18
' 主站：xsdwap.com               更多免费程序
' 制作：吖锐                      尽在新时代    
' E-Mail: nihenghao@qq.com        欢迎光临
' 客服QQ:278470782
' QQ群:39836437
' 版权：新时代
'============================================================
%>
<% 
format=request("format")
typee=request("type")
urll=request("url")
if urll="" then urll="1-1.wml" 
page=request("page")
 if page="" then page="1"
Dim Url,Html,start,over,body,wap,wstr,str
Url="http://waptt.com/booksort/"&urll&"?type="&typee&"&format="&format&"&page="&page&""
wstr=getHTTPPage(url)
start=Instr(wstr,"<card title=""")
over=Instr(wstr,"返回首页")-17
body=mid(wstr,start,over-start)
body = replace(body,"<p align=""left"">","")
body = replace(body,"<p align=""center"">","")
body = replace(body,"http://waptt.com","")
body = replace(body,"<a href=""/","<a href=""")
body = replace(body,"<a href=""1","<a href=""arui.asp?url=1")
body = replace(body,"<a href=""2","<a href=""arui.asp?url=2")
body = replace(body,"<a href=""3","<a href=""arui.asp?url=3")
body = replace(body,"<a href=""4","<a href=""arui.asp?url=4")
body = replace(body,"<a href=""5","<a href=""arui.asp?url=5")
body = replace(body,"<a href=""6","<a href=""arui.asp?url=6")
body = replace(body,"<a href=""7","<a href=""ari.asp?url=7")
body = replace(body,"<a href=""8","<a href=""arui.asp?url=8")
body = replace(body,"<a href=""9","<a href=""arui.asp?url=9")
body = replace(body,"","")
body = replace(body,"","")
body = replace(body,"","")
Response.write body
%><a href="/">返回网站首页</a><br/>
报时:<%=time%><br/>
</p>
</card>
</wml>