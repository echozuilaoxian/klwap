<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%
response.ContentType="text/vnd.wap.wml"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<%SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")%>
<card id="main" title="表情选择">
<p><a href="re.asp?id=<%response.write request("id")%>&amp;action=post&amp;SessionID=<%=SessionID%>">返回留言</a><br/><%
b=request("b")
if b<1 then b=1
for i=b to b+4
if i>96 then exit for
if i<10 then
	img="0"&i
else
	img=i
end if
img=img&".gif"
response.write "<a href=""re.asp?id="&request("id")&"&amp;action=post&amp;img="&img&"&amp;SessionID="&SessionID&"""><img src=""img/"&img&""" alt="""&img&""" /></a>"
next
response.write "<br/>"
if b<95 then response.write "<a href=""reselimg.asp?id="&request("id")&"&amp;b="&b+5&"&amp;SessionID="&SessionID&""">下页</a>"
if b>5 then response.write " <a href=""reselimg.asp?id="&request("id")&"&amp;b="&b-5&"&amp;SessionID="&SessionID&""">上页</a> "
response.write "<br/>"
%>
</p></card>
</wml>