<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/BBS/yxxe/conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="回城卷">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
%>
<%
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select hcj from cuan where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
hcjnum=clng(rs("hcj"))
if hcjnum=0 then
Response.Write "你包袱里没有回城卷<br/>"
else
Response.Write "<img src='/BBS/yxxe/img/hcj.gif' alt='-klwll.cn-'/><br/>回城卷:(" & rs("hcj") &"个)<br/><a href='/BBS/yxxe/syhcj.asp?wpid=hcj&amp;SessionID="&SessionID&"'>使用</a>|<a href='/BBS/yxxe/song.asp?wpid=hcj&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=hcj&amp;SessionID="&SessionID&"'>取出</a><br/>"
end if
Response.Write "=========<br/>"
        rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>