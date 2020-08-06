<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%response.buffer=true%>
<%Response.ContentType = "text/vnd.wap.wml; charset=utf-8"%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<!--#INCLUDE VIRTUAL="/bbs/public/codeun.asp"-->
<wml>
<head>
<meta http-equiv="Cache-Control" content="no-Cache"/>
<meta http-equiv="Cache-Control" content="max-age=0"/>
</head>
<card title="江湖大厅">
<p>
<%
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
ids=session("useid")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
Server.ScriptTimeout=999
%>
<!--#include file="conn1.asp"-->
<%Set Rslp = Server.CreateObject("Adodb.Recordset")
			Sqll = "SELECT top 1 pk,ids,pk1 FROM sx order by pk desc"
			Rslp.Open Sqll,liao,1,1%>
PK王ID：<a href='dfzl.asp?id=<%=Rslp("ids")%>&amp;SessionID=<%=SessionID%>'><%=Rslp("ids")%></a>(胜<%=Rslp("pk")%>/败<%=Rslp("pk1")%>)<br/>
<a href='ffbb.asp?SessionID=<%=SessionID%>'>发布挑战</a>|<a href='qqxx.asp?SessionID=<%=SessionID%>'>取消发布</a><br/>

<%Set Rsl = Server.CreateObject("Adodb.Recordset")
			Sqll = "SELECT top 10 id,txt,lid,tm,yc,name,jg FROM tz order by tm desc"
			Rsl.Open Sqll,liao,1,1
			if not (rsl.bof and rsl.eof)  then 
				if rsl.RecordCount>10 then
					aaaaa=10
				else
					aaaaa=rsl.RecordCount
				end if%>

				==PK竞技场==<br/>

				<%For i=1 to aaaaa
					If Rsl.Eof Then
						exit For
					end if%>
<%if rsl("yc")=0 then%>
					<%=i%>.发布者：<a href="dfzl.asp?id=<%=rsl("lid")%>&amp;SessionID=<%=SessionID%>"><%=converttowidebaiti(rsl("name"))%></a><br/>挑战金额<%=rsl("txt")%>两银子|
<%if rsl("jg")=0 then%>
<anchor>接受<go href="jjss.asp?id=<%=rsl("id")%>&amp;SessionID=<%=SessionID%>&amp;lid=<%=rsl("lid")%>" method="post"><postfield name="je" value="<%=rsl("txt")%>" /></go></anchor><br/>
<%elseif rsl("jg")=1 then%>
[赢]<br/>
<%elseif rsl("jg")=2 then%>
[输]<br/>
<%elseif rsl("jg")=3 then%>
[平]<br/>
<%end if%>
[<%=rsl("tm")%>]<br/>

<%else%>
<%=i%>.发布者：[匿名]<br/>挑战金额<%=rsl("txt")%>两银子|<%if rsl("jg")=0 then%>
<anchor>接受<go href="jjss.asp?id=<%=rsl("id")%>&amp;SessionID=<%=SessionID%>&amp;lid=<%=rsl("lid")%>" method="post"><postfield name="je" value="<%=rsl("txt")%>" /></go></anchor><br/>
<%elseif rsl("jg")=1 then%>
[赢]<br/>
<%elseif rsl("jg")=2 then%>
[输]<br/>
<%elseif rsl("jg")=3 then%>
[平]<br/>
<%end if%>
[<%=rsl("tm")%>]<br/>
<%end if%>

				<%Rsl.MoveNext
				Next
			end if
			Rsl.close
			set rsl=nothing
                         liao.close
			set liao=nothing%>

----------<br/>
<a href="index.asp?SessionID=<%=SessionID%>">江湖首页</a><br/>
<a href="/bbs/index.asp?SessionID=<%=SessionID%>">社区首页</a><br/>
</p>
</card>
</wml>
