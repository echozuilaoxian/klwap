<% Response.ContentType="text/vnd.wap.wml" %><?xml version="1.0" encoding="GB2312"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/reg/useregs.asp"-->
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml><card id='card1' title="&#21608;&#20844;&#35299;&#26790;"><p>
<%
wap=request.querystring("wap")
ids=request("ids")
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from usereg Where CStr(id)='" & Session("useid") &"'"
  objgbrs.open ssql,conn
 if ids<>"" and objgbrs("usejf")>2 then
  set objgbrs=nothing
  set objgbrs=Server.CreateObject("ADODB.Recordset")
  ssql="select * from Zgjm Where CStr(id)='" & ids &"'"
  objgbrs.open ssql,conn
        response.write converttowide(objgbrs("c")) & "<br/>&#22075;&#22075;&#44;&#30427;&#24800;&#31215;&#20998;&#50;&#20998;&#33;"
  Application.Lock
  sql="update usereg set usejf=usejf-2 where CStr(id)='" & Session("useid") & "'"
  conn.execute sql
  Application.Unlock
 else
%>
&#21442;&#25968;&#38169;&#35823;&#44;&#25110;&#24744;&#30340;&#31215;&#20998;&#19981;&#22815;
<%
 end if
conn.close
set objgbrs=nothing
set conn=nothing
%>
<br/>-------------
<br/><a href='/bbs/scfu.asp?wap=<%=wap%>'>&#x670D;&#x52A1;&#x5E7F;&#x573A;</a>
<br/><a href='jmlb.asp?wap=<%=wap%>'>&#21608;&#20844;&#35299;&#26790;</a>
<br/><a href='/bbs/index.asp?wap=<%=wap%>'>社区首页</a>-<a href='/index.asp?wap=<%=wap%>'>首页</a>
</p>
</card>
</wml>



