<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%
response.ContentType="text/vnd.wap.wml"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<%wap=request.querystring("wap")
ids=request("ids")
pages=request("pages")
%>

<card id="main" title="表情选择">
<p><%
b=request("b")
if b<1 then b=1
for i=b to b+4
if i>96 then exit for
if i<10 then
	img="0"&i
else
	img=i
end if
img=img
response.write "<anchor><img src=""img/"&img&".gif"" alt="""&img&".gif"" /><go method='post' href=""fsly.asp?ids="&request("ids")&"&amp;img="&img&"&amp;pages="&pages&"&amp;wap="&wap&"""><postfield name='imgs' value='!"&img&"!'/></go></anchor>"

next
response.write "<br/>"
if b<95 then response.write "<a href=""fslyimg.asp?ids="&request("ids")&"&amp;pages="&pages&"&amp;b="&b+5&"&amp;wap="&wap&""">下页</a>"
if b>5 then response.write " <a href=""fslyimg.asp?ids="&request("ids")&"&amp;pages="&pages&"&amp;b="&b-5&"&amp;wap="&wap&""">上页</a> "
response.write "<br/>"
%>
<a href="ckly.asp?wap=<%=wap%>">回收件箱</a><br/>
<a href='srxx.asp?wap=<%=wap%>'>私人信箱</a><br/>
<a href="/bbs/index.asp?wap=<%=wap%>">社区首页</a>-<a href="/index.asp?wap=<%=wap%>">首页</a><br/>
</p></card></wml>