<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<card id="card1" title="回复文章">
<p align="left">=发表回复=<br/>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
  Response.write "对不起，您的发表权已被锁，请与管理员联系!</p></card></wml>"
    response.end
End if
dim id,page
page=request("page")
id=request("id")
iduse=Session("useid")
lasttlls="134"
lasttls
dim itid
ForumID=request("ForumID")
up=request("up")
img=request("img")
%>
内容:<input type="text" name="name" value="" size="20"/>
<br/><anchor>提 交
<go method="post" href='forum_receipt.Asp?SessionID=<%=SessionID%>'>
<postfield name="name" value="<%=up%>$(name)"/>
<%
Response.write "<postfield name='id' value='" & id & "'/>"
Response.write "<postfield name='page' value='" & page & "'/>"
Response.write "<postfield name='ForumID' value='" & ForumID & "'/>"
%>
</go>
</anchor>
表情:<a href='reselimg.asp?ForumID=<%=ForumID%>&amp;id=<%=id%>&amp;page=<%=page%>&amp;SessionID=<%=SessionID%>'><%
if request("img")="" then
	response.write "选择表情"
else
	response.write "<img src=""/bbs/chatroom/img/"&img&".gif"" alt="""&img&".gif"" />"
end if
%></a>
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
<br/><a href='/BBS/Forum_content/BBs_receipt_ByContent.Asp?id=<%=id%>&amp;ForumID=<%=ForumID%>&amp;page=<%=page%>&amp;SessionID=<%=SessionID%>'>返回查看原文</a><br/>
<a href="/BBS/Forum_Content/ContentlisT.Asp?ForumID=<%=ForumID%>&amp;page=<%=page%>&amp;SessionID=<%=SessionID%>">返回<%=dlnamse%></a><br/></p></card></wml>
<%
conn.close
set conn=nothing
%>



