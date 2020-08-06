<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%
response.ContentType="text/vnd.wap.wml"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<%SessionID=request.querystring("SessionID")
itid=request("itid")
show=request("show")
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
response.write "<anchor><img src=""img/"&img&".gif"" alt="""&img&""" /><go method='post' href=""talk1.asp?itid="&itid&"&amp;show=1&amp;ids="&ids&"&amp;img="&img&"&amp;SessionID="&SessionID&"""><postfield name='up' value='图="&img&"'/></go></anchor>"
next
response.write "<br/>"
if b<95 then response.write "<a href=""reselimg1.asp?show="&request("show")&"&amp;itid="&itid&"&amp;ids="&ids&"&amp;b="&b+5&"&amp;SessionID="&SessionID&""">[下页]</a>"
if b>5 then response.write " <a href=""reselimg1.asp?show="&request("show")&"&amp;itid="&itid&"&amp;ids="&ids&"&amp;b="&b-5&"&amp;SessionID="&SessionID&""">[上页]</a> "
response.write "<br/>"
%>
<a href="chatroom.asp?itid=<%=itid%>&amp;show=<%=show%>&amp;SessionID=<%=SessionID%>">返回聊室</a><br/>
</p></card></wml>