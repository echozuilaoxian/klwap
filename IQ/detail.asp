<!--#include file="conn.asp"-->
<%
call closeconn()
response.write "<wml>"&vbnewline&"<card title=""脑筋急转弯"">"
response.write "<p>"
%>
<% 
page=server.urlencode(request("page"))
if page="" then page="1"
%>
<% 
Dim Url,Html,start,over,body,wap,wstr,str
Url="http://c.lxyes.com/iq/detail.aspx?id="&request("id")&"&CD=44300&backurl="&request("backurl")
'&orders="&request("id")&"
'&pn="&pn&"
wstr=getHTTPPage(url)
start=Instr(wstr,"<p>")
over=Instr(wstr,"返回便民服务")-57
body=mid(wstr,start,over-start)
'------------------------------------------------
body = replace(body,"<p align=""left"">","")
body = replace(body,"<p align=""center"">","")
body = replace(body,"</p>","")
body = replace(body,"<p>","")
body = replace(body,".aspx",".asp")
body = replace(body,"","")
body = replace(body,"","")
body = replace(body,"","")
body = replace(body,"","")
'--------------------------------------------------
Response.write body
%>
<a href="/index.asp">网站首页</a>

</p>
</card>
</wml>