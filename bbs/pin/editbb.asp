<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/lt/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/lt/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<% wap=request.querystring("wap") %>
<card id="card1" title="编辑帖子">
<%
if Session("ltfsbz")="sdfghdfg_dfg45fg45_6554" then
  Response.write "<p>你的发表权已被锁，请联系版主。</p></card></wml>"
    response.end
End if
iduse=Session("useid")
lasttlls="180"
lasttls
dim itid,id,page,i
i=request("i")
id=request("id")
page=request("page")
itid=request("itid")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from wuza Where CStr(id)='" & id &"'"
  objgbrs.open ssql,conn,1,3
  if objgbrs.eof then
      response.write "<p>ID错误</p></card></wml>"
      conn.close
      set objgbrs=nothing
      set conn=nothing
      response.end
  end if
Content=objgbrs("naiyo")
pageWordNum=200
StartWord = 1
Length=len(Content)
PageAll=(Length+PageWordNum-1)\PageWordNum
i=request("i")
if isnull(i) or i="" then
i=0
end if
Content = mid(Content,StartWord+i*PageWordNum,PageWordNum)
%>
<onevent type="onenterforward">
<refresh>
<setvar name="name" value="<% =converttowidebaiti(objgbrs("biaoti")) %>"/>
<setvar name="memo" value="<% =converttowidebaiti(Content) %>"/>
</refresh>
</onevent>
<p align="center">
标题
<br/><input type="text" name="name" value="<% =converttowidebaiti(objgbrs("biaoti")) %>" maxlength="25"/>
<br/>内容
<br/><input type="text" name="memo" value="<% =converttowidebaiti(Content)%>"/>
<br/><anchor>改好了
<go method="post" href="editclbb.asp?wap=<%=wap%>">
<postfield name="name" value="$(name)"/>
<postfield name="memo" value="$(memo)"/>
<%
Response.write "<postfield name='itid' value='" & itid & "'/><postfield name='id' value='" & id & "'/><postfield name='page' value='" & page & "'/><postfield name='i' value='" & i & "'/>"
%>
</go>
</anchor>
<%
Response.write "<br/><a href='zcwwbb.asp?itid=" & itid & "&amp;wap=" & wap & "'>主题首页</a>"
conn.close
set conn=nothing
set objgbrs=nothing
%>
</p></card></wml>



