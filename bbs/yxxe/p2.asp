<% Response.ContentType="text/vnd.wap.wml; charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head>
<meta http-equiv="Cache-Control" content="max-age=0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="Mon, 1 Jan 1990 00:00:00 GMT"/>
</head>
<card id="card1" title="财富排行前三十"><p>
<%
Server.ScriptTimeout=999
SessionID=request.querystring("SessionID")
if SessionID="" then SessionID=Session("SessionID")
if session("useid")="" then
       Session("returnuppath")=Request.ServerVariables("PATH_INFO") & "?pid=pid"
        response.redirect "/BBS/UseLogin.asp?SessionID="&SessionID&""
    End if
ids=session("useid")
%>
<!--#INCLUDE file="conn1.asp"-->
<%Set Rsl = Server.CreateObject("Adodb.Recordset")
			Sqll = "SELECT top 30 yz,ids,jk FROM wupin order by yz desc"
			Rsl.Open Sqll,liao,1,1
			if not (rsl.bof and rsl.eof)  then 
				if rsl.RecordCount>5 then
					aaaaa=30
				else
					aaaaa=rsl.RecordCount
				end if%>

				财富排行前三十<br/>----------<br/>

				<%For i=1 to aaaaa
					If Rsl.Eof Then
						exit For
					end if%>
					<%=i%>.<a href='dfzl.asp?id=<%=Rsl("ids")%>&amp;SessionID=<%=SessionID%>'>ID:<%=Rsl("ids")%></a>[银两:<%=rsl("yz")%>存款:<%=rsl("jk")%>]<br/>

				<%Rsl.MoveNext
				Next
			end if
			Rsl.close
			set rsl=nothing
                         liao.close
			set liao=nothing%>

----------<br/>
<a href="ph.asp?SessionID=<%=SessionID%>">[江湖排行]</a><br/>
<a href="index.asp?SessionID=<%=SessionID%>">[江湖首页]</a><br/>
<a href="/index.asp?SessionID=<%=SessionID%>">[社区首页]</a><br/>
</p>
</card>
</wml>




