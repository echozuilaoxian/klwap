<%
response.write"<br/><a href=""applemylist.asp?SessionID="&SessionID&""">我的投注</a>|"
response.write"<a href=""applelist.asp?SessionID="&SessionID&""">历史查询</a>"
Response.write "<br/><a href=""index.asp?SessionID="&SessionID&""">返回水果机首页</a>"
Response.write "<br/><a href=""../show.asp?SessionID="&SessionID&""">地盘</a>&gt;<a href=""/bbs/index.asp?SessionID="&SessionID&""">社区首页</a><br/>(c) "&Request.ServerVariables("SERVER_NAME")&"["&String(2-Len(hour(now)),"0") & hour(now) &":"&String(2-len(minute(now)),"0") & minute(now)&"]"
Response.write "" & chr(13)
'response.write "<br/>页面执行"& FormatNumber((timer()-tss)*1000,3) & "毫秒"

%>