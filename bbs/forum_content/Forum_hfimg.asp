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
dim id,page,img,min,ForumID,imgs
page=request("page")
id=request("id")
ForumID=request("ForumID")
imgs=request("imgs")
img=request("img")
min=request("min")
%>
内容:<input type="text" name="name" value="" size="7"/>
<br/><anchor>提 交
<go method="post" href='forum_receipt.Asp?SessionID=<%=SessionID%>'>
<postfield name="name" value="$(name)<%=imgs%>"/>
<%
Response.write "<postfield name='id' value='" & id & "'/>"
Response.write "<postfield name='page' value='" & page & "'/>"
Response.write "<postfield name='ForumID' value='" & ForumID & "'/>"
%>
</go>
</anchor>
<a href='Forum_myimg.asp?ForumID=<%=ForumID%>&amp;id=<%=id%>&amp;page=<%=page%>&amp;SessionID=<%=SessionID%>'><%
if request("img")="" then
	response.write "图片回复"
else
	response.write "<img src="""&img&""" width='25' height='22' alt="""&min&""" />"
end if
Response.write "</a>"
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&ForumID
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing
%>
<br/><a href='/BBS/Forum_content/BBs_receipt_ByContent.Asp?id=<%=id%>&amp;ForumID=<%=ForumID%>&amp;page=<%=page%>&amp;SessionID=<%=SessionID%>'>返回查看原文</a><br/>
<a href="/BBS/Forum_Content/ContentlisT.Asp?ForumID=<%=ForumID%>&amp;page=<%=page%>&amp;SessionID=<%=SessionID%>">返回<%=dlname%></a><br/></p></card></wml>
