<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%><%
response.ContentType="text/vnd.wap.wml"%><?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<%SessionID=request.querystring("SessionID")
iduse=Session("useid")
ForumID=request("ForumID")
id=request("id")
page=request("page")
%>
<card id="main" title="表情选择">
<p>
也可以直接输入 !01!至!96!<br/>
<%
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
response.write "<anchor><img src=""/bbs/chatroom/img/"&img&".gif"" alt="""&img&""" /><go method='post' href=""Forum_lthf.asp?id="&request("id")&"&amp;ForumID="&ForumID&"&amp;page="&page&"&amp;img="&img&"&amp;SessionID="&SessionID&"""><postfield name='up' value='!"&img&"!'/><postfield name='name' value='!"&img&"!'/></go></anchor><br/>"
next
if b<95 then response.write "<a href=""reselimg.asp?id="&request("id")&"&amp;ForumID="&ForumID&"&amp;page="&page&"&amp;b="&b+5&"&amp;SessionID="&SessionID&""">下页</a>"
if b>5 then response.write " <a href=""reselimg.asp?id="&request("id")&"&amp;ForumID="&ForumID&"&amp;page="&page&"&amp;b="&b-5&"&amp;SessionID="&SessionID&""">上页</a> "
response.write "<br/>"
%>
<a href="/BBS/Forum_content/Receiptlist.asp?id=<%=id%>&amp;ForumID=<%=ForumID%>&amp;page=<%=page%>&amp;SessionID=<%=SessionID%>">回复列表</a><br/>
<a href='/BBS/Forum_content/BBs_receipt_ByContent.Asp?id=<%=id%>&amp;ForumID=<%=ForumID%>&amp;page=<%=page%>&amp;SessionID=<%=SessionID%>'>回看原文</a><br/>

<%
set objgbrssy=Server.CreateObject("ADODB.Recordset")
rspls="select * from sclt where id="&ForumID
objgbrssy.open rspls,conn,1,2
if objgbrssy.eof then
dlnamse="无此论坛"
Else
dlnamse=objgbrssy("name")
end if
objgbrssy.close
Set objgbrssy= Nothing
%>
<a href="/BBS/Forum_Content/ContentlisT.Asp?ForumID=<%=ForumID%>&amp;page=<%=page%>&amp;SessionID=<%=SessionID%>">返回<%=dlnamse%></a><br/>
<a href="/BBS/Index.Asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
</p></card></wml>