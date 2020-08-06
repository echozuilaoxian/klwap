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
<card id="main" title="电子书分类列表">
<p>
<% 
format=request("format")
typee=request("type")
page=request("page")
 if page="" then page="1"
Dim Url,Html,start,over,body,wap,wstr,str
Url="http://waptt.com/list.asp?type="&typee&"&format="&format&"&page="&page&""
wstr=getHTTPPage(url)
start=Instr(wstr,"<p>")
over=Instr(wstr,"返回首页")-17
body=mid(wstr,start,over-start)
body = replace(body,"<p align=""left"">","")
body = replace(body,"<p align=""center"">","") 
body = replace(body,"</p>","")
body = replace(body,"<p>","")
body = replace(body,"http://waptt.com","")
body = replace(body,"<a href=""/","<a href=""")
body = replace(body,"","")
body = replace(body,"","")
body = replace(body,"","")
body = replace(body,"","")
body = replace(body,"","")
Response.write body
%><a href="/">返回网站首页</a><br/>
报时:<%=time%><br/>
</p>
</card>
</wml>