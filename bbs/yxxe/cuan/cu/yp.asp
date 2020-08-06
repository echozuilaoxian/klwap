<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<!--#INCLUDE VIRTUAL="/BBS/yxxe/conn.asp"-->
<wml>
<head><meta http-equiv='Cache-Control' content='no-cache'/>
</head>
<card title="我的药品">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ids=session("useid")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?wpid=wpid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
%>
<%
Server.ScriptTimeout=999
set rs=Server.CreateObject("ADODB.Recordset")
strsQL="select y1,y2,y3,y4,y5 from cuan where cstr(ids)='"&ids& "'"
rs.open strsQL,Conn,1,2
if rs.recordcount<1 then
rs.addnew
rs("ids")=ids
rs.update
end if
Response.Write "百草丹:(" & rs("y1") &"颗)<br/><a href='/BBS/yxxe/sy.asp?wpid=y1&amp;SessionID="&SessionID&"'>使用</a>|<a href='/BBS/yxxe/song.asp?wpid=y1&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=y1&amp;SessionID="&SessionID&"'>取出</a><br/>"
Response.Write "大力神丹:(" & rs("y2") &"颗)<br/><a href='/BBS/yxxe/sy.asp?wpid=y2&amp;SessionID="&SessionID&"'>使用</a>|<a href='/BBS/yxxe/song.asp?wpid=y2&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=y2&amp;SessionID="&SessionID&"'>取出</a><br/>"
Response.Write "九转还魂丹:(" & rs("y3") &"颗)<br/><a href='/BBS/yxxe/sy.asp?wpid=y3&amp;SessionID="&SessionID&"'>使用</a>|<a href='/BBS/yxxe/song.asp?wpid=y3&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=y3&amp;SessionID="&SessionID&"'>取出</a><br/>"
Response.Write "少林大还丹:(" & rs("y4") &"颗)<br/><a href='/BBS/yxxe/sy.asp?wpid=y4&amp;SessionID="&SessionID&"'>使用</a>|<a href='/BBS/yxxe/song.asp?wpid=y4&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=y4&amp;SessionID="&SessionID&"'>取出</a><br/>"
Response.Write "江湖强力魔水:(" & rs("y5") &"颗)<br/><a href='/BBS/yxxe/sy.asp?wpid=y5&amp;SessionID="&SessionID&"'>使用</a>|<a href='/BBS/yxxe/song.asp?wpid=y5&amp;SessionID="&SessionID&"'>送人</a>|<a href='mai.asp?wpid=y5&amp;SessionID="&SessionID&"'>取出</a><br/>"
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