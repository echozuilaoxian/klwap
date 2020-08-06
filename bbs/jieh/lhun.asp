<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/redtjname.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<card id="card1" title="&#x79BB;&#x5A5A;&#x767B;&#x8BB0;">
<p>
<% 
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if Session("zh")="wap" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?ids=ids"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
      else
        Session("ltlybz")=""
    End if

   Set objgbrs=Server.CreateObject("ADODB.Recordset")
    sql="select * from usereg where CStr(id)='" & Session("useid") & "'"
    objgbrs.open sql,conn
if objgbrs("fying")=0 then
tjhm=objgbrs("fying")
%>
晕晕~_~ 你还有结婚呢怎么来离婚呢？<br/>----------
      <% else%>
&#x79BB;&#x5A5A;&#x53CC;&#x65B9;&#x53EA;&#x8981;&#x4E00;&#x65B9;&#x63D0;&#x51FA;&#x4E86;&#x79BB;&#x5A5A;&#x8BF7;&#x6C42;&#x3002;&#x79BB;&#x5A5A;&#x5C31;&#x901A;&#x8FC7;&#x3002;<br/>
离婚将扣您10000金币(同时给对方加10000金币)，魅力减100点，您确定要离婚吗？
<br/>----------<br/>
<% 
dim sex
if objgbrs("usesex")="0" then
sex="老婆"
  elseif objgbrs("usesex")="1" then
sex="老公"
end if
tjhm=objgbrs("fying")
gfdsa=Session("ltname")
Response.write "" & converttowidebaiti(gfdsa) & "你好!<br/>你确定要跟你"&sex&"[" & converttowidebaiti(redtjname) & "ID:" & tjhm & "]离婚吗?<br/>"
%>
您有什么要说:
<br/><input type="text" name="biao" value="我们离婚吧!"/>
<br/>
<anchor>确定<go method="post" href="/bbs/jieh/lhuncl.asp?SessionID=<%=SessionID%>">
<postfield name="biao" value="您的爱人在婚姻登记处强行跟你离婚!这是系统信息请不要转发\<%=gfdsa%>说:$(biao)"/>
<postfield name="ids" value="<%=objgbrs("fying")%>"/>
</go></anchor>
<anchor>取消<go method="post" href="/bbs/index.asp?SessionID=<%=SessionID%>"><postfield name="SessionID" value="<%=SessionID%>"/></go></anchor>
<br/>----------
      <%End if%>
<br/><a href='/bbs/jieh/index.asp?SessionID=<%=SessionID%>'>返回&#x5A5A;&#x59FB;&#x767B;&#x8BB0;</a>
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>返回我的地盘</a><br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p>
</card>
</wml>
    <%
  conn.close
 set objgbrs=nothing
  set conn=nothing
%>