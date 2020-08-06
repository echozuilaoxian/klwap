<!--#include file="conn2.asp"-->
<%sql="update usereg set usejf=usejf-100 where cstr(id)="&lid
  conn.Execute(sql)%>


