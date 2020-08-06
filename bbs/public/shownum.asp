<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="个性设置"><p>
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
        response.redirect "/BBS/UseLogiN.Asp?SessionID=" & SessionID & ""
      else
        Session("ltlybz")=""
    End if
	iduse=Session("useid")
ForumID=request("ForumID")
sort=request("sort")
id=request("id")
spage=request("spage")
sspage=request("sspage")
page=request("page")

if lycount>0 then
Response.write "<a href='/bbs/public/ckly.asp?SessionID=" & SessionID & "'>" & converttowidebaiti("您有")& "(" & lycount & ")" & converttowidebaiti("条新信息")& "</a><br/>"
End if
%>
个性设置<br/>
------------<br/>

1、每页文章数:<input type="text" name="PerPageArticleCount" emptyok="true" value="10" format="*N" size="5" /><br />
设置范围为:1～30之间<br />
2、每文章字数:<input type="text" name="PerPageWordCount" emptyok="true" value="500" format="*N" size="5" /><br />
设置范围为:100～5000之间<br />
3、每页图片数:<input type="text" name="PerPagePhotoCount" emptyok="true" value="10" format="*N" size="5" /><br />
设置范围为:1～10之间<br />
<anchor>[设置]
<go method="post" href='/BBS/public/shownuncl.asp?sspage=<%=sspage%>&amp;SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;ForumID=<%=ForumID%>&amp;spage=<%=spage%>&amp;page=<%=page%>'>
<postfield name="PerPageArticleCount" value="$(PerPageArticleCount)"/>
<postfield name="PerPageWordCount" value="$(PerPageWordCount)"/>
<postfield name="PerPagePhotoCount" value="$(PerPagePhotoCount)"/>
</go>
</anchor><br/>
------------
<br/><a href='<%=sspage%>?SessionID=<%=SessionID%>&amp;id=<%=id%>&amp;ForumID=<%=ForumID%>&amp;spage=<%=spage%>&amp;page=<%=page%>'>返回上级面页</a>
<br/><a href='/BBS/public/gygl.asp?SessionID=<%=SessionID%>'>返回我的地盘</a><br/><a href='/BBS/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a></p></card></wml>
<%
conn.close
Set conn= Nothing
%>