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
<card id="main" title="电子书">
<p>
<% 
mobile=request("mobile")
Dim Url,Html,start,over,body,wap,wstr,str
Url="http://waptt.com/ebook.asp"
wstr=getHTTPPage(url)
start=Instr(wstr,"WAPTT.com")+15
over=Instr(wstr,"手机游戏免费下载")-28
body=mid(wstr,start,over-start)
body = replace(body,"<p align=""left"">","")
body = replace(body,"<p align=""center"">","") 
body = replace(body,"</p>","")
body = replace(body,"<p>","")
body = replace(body,"<a href=""/book.asp","<a href=""book.asp")
body = replace(body,"<a href=""/list.asp","<a href=""list.asp")
body = replace(body,"<a href=""/booksort/","<a href=""arui.asp?url=")
body = replace(body,"<a href=""booksort/","<a href=""")
body = replace(body,"十万超清MP3铃声","")
body = replace(body,"<a href=""http://un.caishow.com/W/Y1P/1/383_2/free.asp?ADCID=104591""></a><br/>","")
Response.write body
%>-----------<br/>
<a href="/">返回网站首页</a><br/>
报时:<%=time%><br/>
</p>
</card>
</wml>