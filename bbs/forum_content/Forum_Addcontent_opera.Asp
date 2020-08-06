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
wen=request("wen")
mon=request("mon")
if mon="" then mon="K"
lasttlls="139"
lasttls
 %>
<wml>
<card id="card1" title="<%=dlname%>-发表文章">
<p align="left">
<%
SessionID=request.querystring("SessionID")
Server.ScriptTimeout=999
iduse=Session("useid")
dim id
id=request("id")
lasttlls="326"
lasttls
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
    End if
    Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & iduse & "' and DATEDIFF('s', regtimes, now()) > 1440*60"
    objgbrs.open sql,conn
if objgbrs.eof then
    response.write "抱歉！您注册时间未满24小时，不能发表帖子"
   else
%>
<%
if mon="K" then%>
<%=dlname%>-发表新帖<br/>
标题:<input type="text" name="name" title="文章标题" maxlength="250" size="20"/><br/>
内容:<input type="text" name="memo" title="文章内容" maxlength="30000" cols="150" rows="20"/>
<br/><anchor>[发贴]
<go method="post" href='/BBS/Forum_content/Forum_AddcontentCl.Asp?SessionID=<%=SessionID%>'>
<postfield name="name" value="$(name)"/>
<%if imgs<>"" then%>
<postfield name="memo" value="$(memo)\<%=imgs%>"/>
<%else%>
<postfield name="memo" value="$(memo)"/>
<%end if%>
<postfield name="lzdname" value="d"/>
<%
Response.write "<postfield name='ForumID' value='" & ForumID & "'/></go></anchor> <a href='/bbs/myalbum/imgop.asp?ForumID=" & ForumID &"&amp;mon=" & mon & "&amp;SessionID=" & SessionID & "'>"
if request("img")="" then
	response.write "插入图片"
else
	response.write "<img src='"&img&"' width='25' height='22' alt='"&nais&"' />"
end if
Response.write "</a>"
end if
if mon="y" then%>
<%=dlname%>-发表隐藏贴<br/>
标题:<input type="text" name="name" title="文章标题" maxlength="250" size="20"/><br/>
内容:<input type="text" name="memo" title="文章内容" maxlength="30000" cols="150" rows="20"/>
<br/><anchor>[提交]
<go method="post" href='/BBS/Forum_content/Forum_AddcontentCl.Asp?SessionID=<%=SessionID%>'>
<postfield name="name" value="$(name)"/>
<%if imgs<>"" then%>
<postfield name="memo" value="$(memo)\<%=imgs%>"/>
<%else%>
<postfield name="memo" value="$(memo)"/>
<%end if%>
<postfield name="lzdname" value="y"/>
<%
Response.write "<postfield name='ForumID' value='" & ForumID & "'/></go></anchor> <a href='/bbs/myalbum/imgs.asp?ForumID=" & ForumID &"&amp;mon=" & mon & "&amp;SessionID=" & SessionID & "'>"
if request("img")="" then
	response.write "插入图片"
else
	response.write "<img src='"&img&"' width='25' height='22' alt='"&nais&"' />"
end if
Response.write "</a>"
end if
if mon="t" then%>
<%=dlname%>-发表投票贴<br/>
标题:<input type="text" name="name" title="文章标题" maxlength="250" size="20"/><br/>
内容:<input type="text" name="memo" title="文章内容" maxlength="30000" cols="150" rows="20"/>
<br/>
选项:<input type="text" name="tpxx" title="投票选项" maxlength="6000" size="20"/><br/>
<anchor>[提交]
<go method="post" href='/BBS/Forum_content/Forum_AddcontentCl.Asp?SessionID=<%=SessionID%>'>
<postfield name="name" value="$(name)"/>
<%if imgs<>"" then%>
<postfield name="memo" value="$(memo)\<%=imgs%>"/>
<%else%>
<postfield name="memo" value="$(memo)"/>
<%end if%>
<postfield name="vote" value="$(tpxx)"/>
<postfield name="bntjyy2" value="k"/>
<postfield name="lzdname" value="d"/>
<%
Response.write "<postfield name='ForumID' value='" & ForumID & "'/></go></anchor> <a href='/bbs/myalbum/imgs.asp?ForumID=" & ForumID &"&amp;mon=" & mon & "&amp;SessionID=" & SessionID & "'>"
if request("img")="" then
	response.write "插入图片"
else
	response.write "<img src='"&img&"' width='25' height='22' alt='"&nais&"' />"
end if
Response.write "</a>"

end if
if mon="m" then%>
<%=dlname%>-发表买卖贴<br/>
标题:<input type="text" name="name" title="文章标题" maxlength="250" size="20"/><br/>
内容:<input type="text" name="memo" title="文章内容" maxlength="30000" cols="150" rows="20"/>
<br/>价钱:<select name="zb" value="10">
<option value="10">10金币</option>
<option value="20">20金币</option>
<option value="50">50金币</option>
<option value="100">100金币</option>
<option value="200">200金币</option>
<option value="500">500金币</option>
<option value="1000">1000金币</option>
<option value="3000">3000金币</option>
<option value="5000">5000金币</option>
<option value="10000">10000金币</option>
<option value="30000">30000金币</option>
</select><br/>
<anchor>[提交]
<go method="post" href='/BBS/Forum_content/Forum_AddcontentCl.Asp?SessionID=<%=SessionID%>'>
<postfield name="name" value="$(name)"/>
<%if imgs<>"" then%>
<postfield name="memo" value="(my=$(zb))<%=imgs%>\$(memo)(/s)"/>
<%else%>
<postfield name="memo" value="(my=$(zb))$(memo)(/s)"/>
<%end if%>
<postfield name="maimai" value="k"/>
<postfield name="lzdname" value="d"/>
<%
Response.write "<postfield name='ForumID' value='" & ForumID & "'/></go></anchor> <a href='/bbs/myalbum/imgs.asp?ForumID=" & ForumID &"&amp;mon=" & mon & "&amp;SessionID=" & SessionID & "'>"
if request("img")="" then
	response.write "插入图片"
else
	response.write "<img src='"&img&"' width='25' height='22' alt='"&nais&"' />"
end if
Response.write "</a>"

end if
if mon="j" then%>
<%=dlname%>-发表派币贴<br/>
标题:<input type="text" name="name" title="文章标题" maxlength="250" size="20"/><br/>
内容:<input type="text" name="memo" title="文章内容" maxlength="30000" cols="150" rows="20"/>
<br/>派币:<select name="zb" value="10">
<option value="10">10金币</option>
<option value="20">20金币</option>
<option value="66">66金币</option>
<option value="88">88金币</option>
<option value="100">100金币</option>
<option value="200">200金币</option>
<option value="666">666金币</option>
<option value="888">888金币</option>
<option value="1000">1000金币</option>
<option value="8888">8888金币</option>
<option value="888888">888888金币</option>
</select>
<br/>
<anchor>[提交]
<go method="post" href='/BBS/Forum_content/Forum_AddcontentCl.Asp?SessionID=<%=SessionID%>'>
<postfield name="name" value="$(name)"/>
<%if imgs<>"" then%>
<postfield name="memo" value="(so=$(zb))<%=imgs%>\$(memo)(/n)"/>
<%else%>
<postfield name="memo" value="(so=$(zb))$(memo)(/n)"/>
<%end if%>
<postfield name="lijin" value="k"/>
<postfield name="lzdname" value="d"/>
<%
Response.write "<postfield name='ForumID' value='" & ForumID & "'/></go></anchor> <a href='/bbs/myalbum/imgs.asp?ForumID=" & ForumID &"&amp;mon=" & mon & "&amp;SessionID=" & SessionID & "'>"
if request("img")="" then
	response.write "插入图片"
else
	response.write "<img src='"&img&"' width='25' height='22' alt='"&nais&"' />"
end if
Response.write "</a>"
end if
Response.write "<br/>----------<br/>"
Response.write "★<a href='/BBS/Forum_content/Forum_Addcontent_opera.Asp?mon=y&amp;ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>发表隐藏贴</a><br/>"
Response.write "★<a href='/BBS/Forum_content/Forum_Addcontent_opera.Asp?mon=m&amp;ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>发表买卖贴</a><br/>"
Response.write "★<a href='/BBS/Forum_content/forum_pb.asp?mon=j&amp;ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>发表派币贴</a><br/>"
Response.write "★<a href='/BBS/Forum_content/Forum_Addcontent_opera.Asp?mon=t&amp;ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>发表投票贴</a><br/>"
Response.write "★<a href='/bbs/wapcs/tjwzimg.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>发表附件贴</a><br/>"
Response.write "★<a href='/BBS/Forum_content/Forum_Addcontent_opera.Asp?mon=K&amp;ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>发表普通贴</a><br/>"
%>
<%
end if
Set objgbrs= Nothing
conn.close
set conn=nothing
%>
<%
Response.write "<br/>----------<br/><a href='/BBS/forum_content/contentlist.asp?ForumID=" & ForumID & "&amp;SessionID=" & SessionID & "'>返回" & dlname & "</a><br/>"
Response.write "<a href='/BBS/index.asp?SessionID=" & SessionID & "'>返回社区首页</a></p></card></wml>" %>

