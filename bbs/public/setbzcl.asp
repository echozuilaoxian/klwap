<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/conn.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
id=request("id")
idp=request("idp")
idp=clng(idp)
cz=request("bbzz")
%>
<card id="main" title="添加版主" >
<p>
<%if Cstr(Session("yxxezb"))<>"" or Session("Counter")="pass_numbers_55556666" then%>
<%if idp="" or cz="" then%>
各项不能留空
<%elseif cz="1" then%>
设置主版成功!
<%
set rs=Server.CreateObject("ADODB.Recordset")
rspl="select * from usereg where id="&id
rs.open rspl,conn,1,2
rs("gly")=idp
rs("bzbz")=idp
rs.update
'---关闭数据----
rs.close
set rs=nothing
%>
<%elseif cz="2" then%>
设置副版成功!
<%
sql="update usereg set gly='"&idp&"' where clng(id)="&id
  conn.Execute(sql)
%>
<%else%>
未知错误！
<%end if%>
<%end if%>
<br/>------------
<br/><a href="/bbs/reg/useinfo.asp?id=<%=request("id")%>&amp;SessionID=<%=SessionID%>">返回会员资料</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">返回社区首页</a><br/>
</p>
</card>
</wml>