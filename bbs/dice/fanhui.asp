<%
response.write"<br/><a href=""dicelist.asp?SessionID=" & SessionID &""">历史查询</a>|"
response.write"<a href=""dicemylist.asp?SessionID=" & SessionID &""">我的投注</a>"
Response.write "<br/><a href=""index.asp?SessionID=" & SessionID &""">返回幸运彩球</a>"
Response.write "<br/><a href=""/bbs/index.asp?SessionID=" & SessionID &""">社区首页</a><br/>"
Response.write "<a href=""/index.asp?SessionID=" & SessionID &""">网站首页</a><br/>"
Response.write "" & chr(13)
'response.write "<br/>页面执行"& FormatNumber((timer()-tss)*1000,3) & "毫秒"

%>