<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="书写日记">
<p>
<%if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from my_mark_book where CStr(ids)='" & iduse & "'"
  objgbrr.open ssql,conn,1,1
if objgbrr.RecordCount>200 and Session("ltglzdl")="" then
   Response.write "您的日记已达到最高上限200条,请删除一些后再书写." 
   Response.write "<br/><a href='mybookmark1.asp?SessionID=" & SessionID & "'>私人日记</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
conn.close
set objgbrr=nothing
set conn=nothing
   response.end
End if
conn.close
set objgbrr=nothing
set conn=nothing
%>
日记标题：
<br/><input type="text" name="markname" maxlength="15"/>
<br/>日记内容：
<br/><input type="text" name="marklink" maxlength="200"/>
<br/><anchor>保 存
<go method="post" href='addmarkcl1.asp?SessionID=<%=SessionID%>'>
<postfield name="markname" value="$(markname)"/>
<postfield name="marklink" value="$(marklink)"/>
</go>
</anchor>
<br/>------------
<br/><a href='mybookmark1.asp?SessionID=<%=SessionID%>'>返回私人日记</a>
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>返回我的地盘</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p>
</card>
</wml>



