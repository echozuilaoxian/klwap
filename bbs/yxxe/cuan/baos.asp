<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="我的宝贝">
<p>
<!--#INCLUDE VIRTUAL="/BBS/yxxe/conn.asp"-->
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?did=did"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select bs,y6 from wupin where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
Response.Write "<img src='/BBS/yxxe/img/bs.gif' alt='-klwll.cn-'/><br/>宝石:(" & rs("bs") &"颗)<br/><a href='/BBS/yxxe/syboo.asp?wpid=bs&amp;SessionID="&SessionID&"'>应用宝石</a>|<a href='mai.asp?wpid=bs&amp;SessionID="&SessionID&"'>存放</a><br/>"
Response.Write "<img src='/BBS/yxxe/img/hua.gif' alt='-klwll.cn-'/><br/>情人花:(" & rs("y6") &"朵)<br/><a href='/BBS/yxxe/qrh.asp?wpid=y6&amp;SessionID="&SessionID&"'>应用情人花</a>|<a href='mai.asp?wpid=y6&amp;SessionID="&SessionID&"'>存放</a><br/>"
Response.Write "=========<br/>"
        rs.Close
	Set rs=Nothing
     Conn.Close
      Set Conn=Nothing
%>

<a href="/BBS/yxxe/index.asp?SessionID=<%=SessionID%>">[我的江湖]</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>