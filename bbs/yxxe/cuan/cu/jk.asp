<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/BBS/yxxe/conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="我的金矿">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
Server.ScriptTimeout=999
%>

<%
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select j1,j2,j3,j4 from cuan where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
Response.Write "锡:(" & rs("j1") &")块<br/><a href='mai.asp?wpid=j1&amp;SessionID="&SessionID&"'>取出</a>|<a href='/BBS/yxxe/song.asp?wpid=j1&amp;SessionID="&SessionID&"'>送人</a><br/>铜:(" & rs("j2") &")块<br/><a href='mai.asp?wpid=j2&amp;SessionID="&SessionID&"'>取出</a>|<a href='/BBS/yxxe/song.asp?wpid=j2&amp;SessionID="&SessionID&"'>送人</a><br/>银:(" & rs("j3") &")块<br/><a href='mai.asp?wpid=j3&amp;SessionID="&SessionID&"'>取出</a>|<a href='/BBS/yxxe/song.asp?wpid=j3&amp;SessionID="&SessionID&"'>送人</a><br/>金:(" & rs("j4") &")块<br/><a href='mai.asp?wpid=j4&amp;SessionID="&SessionID&"'>取出</a>|<a href='/BBS/yxxe/song.asp?wpid=j4&amp;SessionID="&SessionID&"'>送人</a><br/>"
Response.Write "=========<br/>"
        rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>
<a href="/BBS/yxxe/index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>