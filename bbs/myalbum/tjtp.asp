<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %><% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="添加图片">
<p>
<%
if Session("zh")="wap" then
        response.redirect "/bbs/yksm.asp"
      else
        Session("ltlybz")=""
    End if
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
iduse=Session("useid")
  set objgbrr=Server.CreateObject("ADODB.Recordset")
  ssql="select * from myalbum where CStr(ids)='" & iduse & "'"
  objgbrr.open ssql,conn,1,1
if objgbrr.RecordCount>59 then
   Response.write "您的图片数量已达到最高上限60个,请删除一些再添加." 
   Response.write "<br/><a href='mybook.asp?SessionID=" & SessionID & "'>图片夹</a><br/><a href='/bbs/index.asp?SessionID=" & SessionID & "'>社区首页</a></p></card></wml>"
conn.close
set objgbrr=nothing
set conn=nothing
   response.end
End if
conn.close
set objgbrr=nothing
set conn=nothing
%>
图片介绍：
<br/><input type="text" name="xcname" maxlength="15"/>
<br/>图片地址：
<br/><input type="text" name="xclink" maxlength="200"/>
<br/><anchor>提 交
<go method="post" href='addbook.asp?SessionID=<%=SessionID%>'>
<postfield name="xcname" value="$(xcname)"/>
<postfield name="xclink" value="$(xclink)"/>
</go>
</anchor>
<br/>-----------
<br/><a href='mybook.asp?SessionID=<%=SessionID%>'>返回我的书包</a>
<br/><a href='/bbs/public/gygl.asp?SessionID=<%=SessionID%>'>返回我的地盘</a>
<br/><a href='/bbs/index.asp?SessionID=<%=SessionID%>'>返回社区首页</a>
</p>
</card>
</wml>



