<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/reg/ltonline.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="&#21457;&#35328;">
<p>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")

iduse=Session("useid")
dim show,itid,up
show=request("show")
itid=request("itid")
ids=request("ids")

set rse=Server.CreateObject("ADODB.Recordset")
rspple="select * from jzbl where id="&itid
rse.open rspple,conn,1,2
if rse.eof then
bkmc="无此帮派"
else
bkmc=converttowidebaiti(rse("biaoti"))
end if
rse.close
Set rse= Nothing
up=request("up")
img=request("img")
lasttlss=itid
lasttlls=itid
lasttls
%>
发言内容:
<br/><input type="text" name="talk" maxlength="50"/>
<br/>我要对<br/>
<%IF ids="" then %>
<select name="forname" value="&#22823;&#23478;"><option value="&#22823;&#23478;">&#22823;&#23478;</option>
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from SoftDown_online where CStr(lasttl)='" & lasttlss & "' order by id"
  objgbrs.open ssql,conn,1,3
 Do while not objgbrs.eof
  response.write "<option value='" & objgbrs("name") & "'>" & objgbrs("name") & "ID:" & objgbrs("ids") & "</option>"
objgbrs.Movenext
Loop
conn.close
set objgbrs=nothing
set conn=nothing
%>
</select>
<%else%>
<select name="forname" value="&#22823;&#23478;">
<%
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from SoftDown_online where CStr(lasttl)='" & lasttlss & "' and ids='" & ids & "' order by id"
  objgbrs.open ssql,conn,1,3
 Do while not objgbrs.eof
  response.write "<option value='" & objgbrs("name") & "'>" & objgbrs("name") & "ID:" & objgbrs("ids") & "</option>"
objgbrs.Movenext
Loop
conn.close
set objgbrs=nothing
set conn=nothing

%>
</select>
<%end if%>
<br/><anchor>[发言]
<go method="post" href='talkcl.asp?SessionID=<%=SessionID%>'>
<postfield name="talk" value="<%=up%>$(talk)"/>
<postfield name="forname" value="$(forname)"/>
<postfield name="show" value="<% =show %>"/>
<postfield name="itid" value="<% =itid %>"/>
<postfield name="ids" value="<% =ids%>"/>
</go>
</anchor>
<a href='reselimg1.asp?itid=<%=itid%>&amp;ids=<%=ids%>&amp;show=<%=show%>&amp;SessionID=<%=SessionID%>'><%
if request("img")="" then
	response.write "插入表情"
else
	response.write "<img src=""img/"&img&".gif"" alt="""&img&".gif"" />"
end if
%></a>
<br/>----------<br/>
<%
Response.write "<a href='chatroom.asp?show="&show&"&amp;itid="&itid&"&amp;SessionID=" & SessionID & "'>回" & bkmc & "聊室</a>"%>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a><br/>
</p>
</card>
</wml>



