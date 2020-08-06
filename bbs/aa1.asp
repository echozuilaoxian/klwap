<a href="/bbs/index.asp?wap=<%=wap%>">&#x793E;&#x533A;&#x9996;&#x9875;</a><br/>
&#x62A5;&#x65F6;<%
dim distime
distime=""
if hour(now())<10 then distime=distime&"0"
distime=distime&hour(now())&":"
if minute(now())<10 then distime=distime&"0"
distime=distime&minute(now())
response.write distime
%>
