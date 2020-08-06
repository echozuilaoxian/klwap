<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
wap=request.querystring("wap")
if Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
  Response.write "<wml><card id='card1' title='发表文章'><p>对不起,您的发表权已被锁，请与管理员联系！</p></card></wml>" 
    response.end
End if
itid=request("itid")
iduse=Session("useid")
img=request("img")
imgs=request("imgs")
nais=request("nais")
wen=request("wen")
mon=request("mon")
lasttlls="520"
lasttls
set objgbrsy=Server.CreateObject("ADODB.Recordset")
rspl="select * from sclt where id="&itid
objgbrsy.open rspl,conn,1,2
if objgbrsy.eof then
dlname="无此论坛"
Else
dlname=objgbrsy("name")
end if
objgbrsy.close
Set objgbrsy= Nothing
 %>
<wml>
<card id="card1" title="<%=dlname%>-发表图片帖">
<p>
<%if itid="" then
itid="1"
end if
%>
请输入标题
<br/><input type="text" name="title" value="" maxlength="50"/>
<br/>请输入内容
<br/><input type="text" name="explain" value="" maxlength="1000"/>
<br/>请输入图片地址
<br/><input type="text" name="url" value="http://" maxlength="200"/>
<br/><anchor>提交
<go method="post" href="/bbs/wapcs/picl.asp?itid=<%=itid%>&amp;wap=<%=wap%>">
<postfield name="url" value="$(url)"/>
<postfield name="title" value="$(title)"/>
<postfield name="explain" value="$(explain)"/>
</go>
</anchor>
<br/>--------<br/>
<%
Response.write "<a href='/bbs/xcbgs/tjwz.asp?itid=" & itid & "&amp;wap=" & wap & "'>返回发普通贴</a><br/>"
Response.write "<a href='/bbs/xcbgs/zcww.asp?itid=" & itid & "&amp;wap=" & wap & "'>返回" & dlname & "</a><br/><a href='/bbs/index.asp?wap=" & wap & "'>返回社区首页</a>"
conn.close
set conn=nothing
%>
</p>
</card>
</wml> 
