<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="发帖帮助">
<p  align="left">发贴帮助<br/>----------
<% 
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("bbslybz")=""
    End if

Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
iduse=Session("useid")
lasttlss="7"
lasttlls="7"
lasttls
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg where Cstr(id)='" & iduse & "'"
  objgbrs.open ssql,conn
     set zmyars=Server.CreateObject("ADODB.Recordset")
  zmyasql="select * from ltsy"
zmyars.open zmyasql,conn
%>
<br/>换行效果:在内容中加符号 \ 或者[br]会产生换行效果！<br/>
<br/>发连接帖:(url=连接地址)说明(/url),如(url=<%=zmyars("url")%>)社区论坛(/url)<br/>
<br/>贴图方法:(img)图片地址(/img)如:(img)<%=zmyars("url")%>/bbs/logo3.gif(/img)<br/>
<br/>贴图连接:(url=连接地址)(img)图片地址(/img)(/url)如:(url=<%=zmyars("url")%>)(img)<%=zmyars("url")%>/bbs/logo3.gif(/img)(/url)<br/>
<br/>发表卖帖:(my=要卖多少金币)内容(/s) 如(my=10)测试(/s)<br/>
<br/>发礼金帖:(so=要送多少金币)内容(/n) 如(so=10)测试(/n)<br/>
<br/>发表情帖:!加上表情号!比如<b><u>!01!</u></b>。表情序号跟聊天室是一样的。
<br/>[name]：显示会员名字效果！<br/>

<br/>[id] ：显示会员ID效果！<br/>

<br/>[date] ：显示日期效果！<br/>

<br/>[time] ：显示时间效果！<br/>

<br/>[now] ：显示日期加时间效果！
<br/>
<br/>[u]说明[/u]：显示下划线效果<u>说明</u><br/>

<br/>[b]说明[/b]：显示字体加粗效果<b>说明</b><br/>

<br/>[i]说明[/i]：显示字体斜体效果<i>说明</i>
<% dim itid
itid=request("itid")
%>
<br/>----------<br/>
<anchor>返回上级<prev/></anchor>
<%
Response.write "<br/>时间" & Hour(Time) & ":" & Minute(Time)
Response.write "</p></card></wml>"

%>

