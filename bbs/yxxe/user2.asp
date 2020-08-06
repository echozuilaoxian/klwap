<!--#include file="conn2.asp"-->
<%
sql="update usereg set usejf=usejf+"&num*5&" where cstr(id)="&session("useid")
  conn2.Execute(sql)
%>


