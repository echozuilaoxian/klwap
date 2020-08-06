<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
ForumID=request("ForumID")
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ForumID="&ForumID&""
        response.redirect "/BBS/UseLogiN.Asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
if Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
  Response.write "<wml><card id='card1' title='发表文章'><p>对不起,您的发表权已被锁，请与管理员联系！</p></card></wml>" 
    response.end
End if
ForumID=request("ForumID")
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
iduse=Session("useid")
img=request("img")
imgs=request("imgs")
nais=request("nais")
mon=request("mon")
if mon="" then mon="K"
lasttlls="139"
lasttls
 %>
<wml>
<card id="card1" title="<%=dlname%>-发表文章">
<p align="left">
<%
if lycount>0 then
      Response.write "<a href='/BBS/public/ckly.asp?SessionID=" & SessionID & "'>&#x60A8;&#x6709;(" & lycount & ")&#x6761;&#x65B0;&#x7559;&#x8A00;</a><br/>"
	Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ForumID="&ForumID&""
End if

%>


<%=dlname%>-发表派币贴<br/>
文章标题:<br/><input type="text" name="name" title="文章标题" maxlength="30" size="20"/>
<br/>文章内容:<br/><input type="text" name="memo" title="文章内容" maxlength="50000" size="20"/>
<br/>要送的金币总数:<br/><input name="lj" maxlength="100" format="*N" size="20"/>
<br/>可以领取的金币数:<br/><input name="zb" maxlength="100" format="*N" size="20"/>
<br/>
<anchor>[提交]
<go method="post" href='/BBS/forum_content/Forum_pbCl.Asp?SessionID=<%=SessionID%>'>
<postfield name="name" value="$(name)"/>
<%if imgs<>"" then%>
<postfield name="memo" value="(so=$(zb))<%=imgs%>\$(memo)(/n)"/>
<%else%>
<postfield name="memo" value="(so=$(zb))【您已领取】(/n)$(memo)"/>
<%end if%>
<postfield name="lj" value="$(lj)"/>
<postfield name="lijin" value="k"/>
<postfield name="lzdname" value="d"/>
<%
Response.write "<postfield name='ForumID' value='" & ForumID & "'/></go></anchor> "


Response.write "<br/>----------<br/>"
Response.write "<a href='/BBS/forum_content/Forum_Addcontent.Asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>+发表普通贴</a><br/>"
Response.write "<a href='/BBS/forum_content/Forum_Addcontent.Asp?mon=t&amp;ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>+发表投票贴</a><br/>"
Response.write "<a href='/BBS/wapcs/tjwzimg.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>+发表附件贴</a><br/>"
Response.write "<a href='/BBS/forum_content/Forum_Addcontent.Asp?mon=y&amp;ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>+发表隐藏贴</a><br/>"
Response.write "<a href='/BBS/forum_content/Forum_Addcontent.Asp?mon=m&amp;ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>+发表买卖贴</a><br/>"


%>
<%
Response.write "----------<br/><a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/>"
Response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>"%> 
<%
conn.close
set conn=nothing%>