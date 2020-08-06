<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%
response.ContentType="text/vnd.wap.wml"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<%SessionID=request.querystring("SessionID")
iduse=Session("useid")%>
<card id="main" title="男生形象秀">
<p><%
b=request("b")
if b<1 then b=1
for i=b to b+1
if i>30 then exit for
	img="mmm"&i
img=img&".gif"
response.write "<img src="""&img&""" alt="""&img&""" /><br/><a href='select.asp?id="&img&"&amp;SessionID="&SessionID&"'>&#36873;&#25321;</a> <a href='/bbs/skin/zs.asp?id="&img&"&amp;SessionID="&SessionID&"'>赠送</a><br/>"
next
response.write "<br/>"
if b<29 then response.write "<a href=""mmm.asp?id="&request("id")&"&amp;b="&b+2&"&amp;SessionID="&SessionID&""">下页</a>"
if b>2 then response.write " <a href=""mmm.asp?id="&request("id")&"&amp;b="&b-2&"&amp;SessionID="&SessionID&""">上页</a> "
response.write "<br/><a href='/bbs/reg/useinfo.asp?id="&iduse&"&amp;SessionID="&SessionID&"'>个人资料</a><br/><a href='/bbs/skin/ccx.asp?SessionID="&SessionID&"'>回社区秀</a><br/>------------<br/><a href='/bbs/public/gygl.asp?SessionID="&SessionID&"'>回我的地盘</a><br/><a href='/bbs/index.asp?SessionID="&SessionID&"'>返回社区首页</a><br/>注：更改形象需收取2000金币的手续费！"
%>
</p></card>
</wml>