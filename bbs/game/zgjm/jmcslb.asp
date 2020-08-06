<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="main" title="周公解梦"><p>
<%
wap=request.querystring("wap")
iduse=Session("useid")
lasttlls="56"
lasttls
id=request("id")
 if id>0 and id<13 then
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from Zgjm Where CStr(a)='" & id &"'"
  objgbrs.open ssql,conn
    Do While Not objgbrs.eof
        response.write "<a href='jmview.asp?ids=" & objgbrs("id") & "&amp;wap=" & wap & "'>" & converttowide(objgbrs("b")) & "</a>|"
        objgbrs.MoveNext
    Loop
 else
%>
&#21442;&#25968;&#38169;&#35823;
<%
 end if
conn.close
set objgbrs=nothing
set conn=nothing
%>
<br/>--------
<br/><a href='jmlb.asp?wap=<%=wap%>'>&#21608;&#20844;&#35299;&#26790;</a>
<br/><a href='/bbs/scfu.asp?wap=<%=wap%>'>&#x670D;&#x52A1;&#x5E7F;&#x573A;</a>
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>社区首页</a>-<a href='/index.asp?wap=<%=wap%>'>首页</a>
</p>
</card>
</wml>



