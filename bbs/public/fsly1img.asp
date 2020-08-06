<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%
response.ContentType="text/vnd.wap.wml"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<%SessionID=request.querystring("SessionID")
ids=request("ids")
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
response.write "<anchor><img src=""img/"&img&".gif"" alt="""&img&".gif"" /><go method='post' href=""fsly1.asp?ids="&request("ids")&"&amp;img="&img&"&amp;SessionID="&SessionID&"""><postfield name='imgs' value='!"&img&"!'/></go></anchor>"

next
response.write "<br/>"
if b<95 then response.write "<a href=""fsly1img.asp?ids="&request("ids")&"&amp;b="&b+5&"&amp;SessionID="&SessionID&""">下页</a>"
if b>5 then response.write " <a href=""fsly1img.asp?ids="&request("ids")&"&amp;b="&b-5&"&amp;SessionID="&SessionID&""">上页</a> "
response.write "<br/>"
%>
<a href="ckly.asp?SessionID=<%=SessionID%>">回收件箱</a><br/>
<a href='srxx.asp?SessionID=<%=SessionID%>'>我的信箱</a><br/>
<a href='/bbs/friandbook/myfriend.asp?SessionID=<%=SessionID%>'>回我的好友</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a>-<a href="index.asp?SessionID=<%=SessionID%>">首页</a><br/>
</p></card></wml>